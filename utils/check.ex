--
-- run sanity checks on source and wrapper files
--
-- - check for missing namespaces
-- - check for missing type names
-- - check for missing wrapper funcs
-- - check for mismatched parameters
--

include "std/convert.e"
include "std/filesys.e"
include "std/io.e"
include "std/pretty.e"
include "std/regex.e"
include "std/search.e"
include "std/sequence.e"
include "std/text.e"
include "std/types.e"
include "std/wildcard.e"

constant re_namespace = regex:new( `^namespace\s+(\w+)$` )
constant re_define    = regex:new( `^\s*([_A-Z][_A-Z0-9]*)\s*=\s*wx_define\(\s*(\w+),\s*\"([_a-zA-Z][_a-zA-Z0-9]*)\",\s*(\d+),\s*(\w+)\s*\),$` )
constant re_routine   = regex:new( `^(public|export)\s+(function|procedure)\s+(\w+)\s*\((.*)\)$` )
constant re_typename  = regex:new( `^public\s+type\s+(\w+)\s*\(.*\)$` )
constant re_wxeuapi   = regex:new( `^(\w+)\s+(WXEUAPI_\w+)\s+(\w+)\s*\((.*)\)$` )

procedure debugf( sequence msg, object data = {} )
ifdef DEBUG then
	printf( STDERR, msg, data )
end ifdef
end procedure

procedure print_var( sequence name, object value )

	printf( STDOUT, "%s = ", {name} )
	pretty_print( STDOUT, value, {2} )
	puts( STDOUT, "\n" )

end procedure

function startup_dir( sequence cmd = command_line() )
	return pathname( cmd[2] )
end function

function check_params( sequence file_path, sequence file_class, sequence func_info, sequence cpp_params, sequence eu_params )

	sequence func_type, func_macro, func_class, func_name, func_param
	integer func_line
	{func_type,func_macro,func_class,func_name,func_param,func_line} = func_info

	func_name = sprintf( "%s_%s", {file_class,func_name} )

	sequence macro_parts = stdseq:split( func_macro, '_' )
	sequence library_name = text:lower( macro_parts[2] )
	sequence include_path = canonical_path( file_path & SLASH &
		".." & SLASH & ".." & SLASH & "include" & SLASH & "wx" )
	sequence include_file = include_path & SLASH & library_name & ".e"

	integer fn = open( include_file, "r" )
	if fn = -1 then
		printf( STDERR, "could not read file: %s\n", {include_file} )
		abort(0)
	end if

	object line = gets( fn )
	integer line_no = 1

	integer param_count = -1
	integer returns_value = -1

	while sequence( line ) do

		line = text:trim( line )

		if regex:is_match( re_define, line ) then

			sequence matches = regex:matches( re_define, line )

			sequence def_constant = matches[2]
			sequence def_libname  = matches[3]
			sequence def_funcname = matches[4]
			sequence def_count    = matches[5]
			sequence def_return   = matches[6]

			if equal( def_funcname, func_name ) then
				param_count = to_integer( def_count )
				returns_value = equal( def_return, "TRUE" )
				break
			end if

		end if

		line = gets( fn )
		line_no += 1

	end while

	close( fn )

	sequence cpp_parts = stdseq:split( cpp_params, "," )
	sequence eu_parts = stdseq:split( eu_params, "," )

	for i = 1 to length( cpp_parts ) do
		cpp_parts[i] = stdseq:split( text:trim(cpp_parts[i]), " " )
	end for

	for i = 1 to length( eu_parts ) do

		sequence default_value = ""

		integer eq_pos = find( '=', eu_parts[i] )
		if eq_pos then
			default_value = eu_parts[i][eq_pos+1..$]
			eu_parts[i] = eu_parts[i][1..eq_pos-1]
		end if

		eu_parts[i] = stdseq:split( text:trim(eu_parts[i]), " " )

		if length( default_value ) then
			eu_parts[i] = append( eu_parts[i], text:trim(default_value) )
		end if

	end for

	if param_count = -1 then
		printf( STDERR, "%s\n", {include_file} )
		printf( STDERR, "  wrapper for %s not found\n", {func_name} )
		abort(0)
	end if

	if length( cpp_parts ) != length( eu_parts ) then
		printf( STDERR, "length( cpp_parts ) = %d\n", length(cpp_parts) )
		printf( STDERR, "length( eu_parts )  = %d\n", length(eu_parts) )
		return 0
	end if

	if param_count != length( eu_parts ) then
		printf( STDERR, "%s:%d\n", {include_file,line_no} )
		printf( STDERR, "  invalid parameter count for %s (%d != %d)\n", {func_name,param_count,length(eu_parts)} )
		abort(0)
	end if

	return 1
end function

function check_eu( sequence source_file, sequence wrapper_file, sequence func_info )

	sequence file_class = filebase( wrapper_file )

	sequence func_type, func_macro, func_class, func_name, func_param
	integer func_line
	{func_type,func_macro,func_class,func_name,func_param,func_line} = func_info

	integer fn = open( wrapper_file, "r" )
	if fn = -1 then
		printf( STDERR, "could not read file: %s\n", {wrapper_file} )
		abort(0)
	end if

	-- found flags
	integer f_namespace  = 0
	integer f_typename   = 0
	integer f_routine    = 0

	if equal( file_class, "wxEuphoria" ) then
		-- type name not required
		f_typename = 1
	end if

	object line = gets( fn )
	integer line_no = 1

	while sequence( line ) do
		line = text:trim( line )

		while search:ends( ",", line ) do
			line &= " " & text:trim( gets(fn) )
		end while

		if regex:is_match( re_namespace, line ) then

			sequence matches = regex:matches( re_namespace, line )

			if not equal( matches[2], file_class ) then

				printf( STDERR, "%s:%d\n", {wrapper_file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    namespace does not match class '%s'\n", {file_class} )
				abort(0)

			end if

			f_namespace = 1

		elsif regex:is_match( re_typename, line ) then

			sequence matches = regex:matches( re_typename, line )

			if not equal( matches[2], file_class ) then

				printf( STDERR, "%s:%d\n", {wrapper_file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    type name does not match class '%s'\n", {file_class} )
				abort(0)

			end if

			f_typename = 1

		elsif regex:is_match( re_routine, line ) then

			sequence matches = regex:matches( re_routine, line )

			if equal( matches[4], func_name ) and f_routine = 0 then

				-- found the routine we need
				f_routine = 1

				sequence eu_param = text:trim( matches[5] )
				integer f_parameters = check_params( source_file, file_class, func_info, func_param, eu_param )

				if not f_parameters then
					printf( STDERR, "%s:%d\n", {wrapper_file,line_no} )
					printf( STDERR, "  %s\n", {line} )
					printf( STDERR, "  parameters for %s:%s() do not match!\n", {func_class,func_name} )
					printf( STDERR, "> %s:%d\n", {source_file,func_line} )
					abort(0)
				end if

				exit
			end if

		end if

		line = gets( fn )
		line_no += 1

	end while

	close( fn )

	if not f_namespace then
		printf( STDERR, "%s\n", {wrapper_file} )
		printf( STDERR, "  namespace '%s' not found\n", {file_class} )
		abort(0)
	end if

	if not f_typename then
		printf( STDERR, "%s\n", {wrapper_file} )
		printf( STDERR, "  type name '%s' not found\n", {file_class} )
		abort(0)
	end if

	return f_routine
end function

function check_cpp( sequence source_file )

	sequence file_class = filebase( source_file )
	sequence file_path  = pathname( source_file )

	integer fn = open( source_file, "r" )
	if fn = -1 then
		printf( STDERR, "could not read file: %s\n", {source_file} )
		abort(0)
	end if

	sequence func_list = {}

	object line = gets( fn )
	integer func_line = 1

	while sequence( line ) do
		line = text:trim( line )

		if regex:is_match( re_wxeuapi, line ) then

			sequence matches = regex:matches( re_wxeuapi, line )

			sequence func_type, func_macro, func_name, func_param
			{func_type,func_macro,func_name,func_param} = matches[2..5]

			if not find( func_type, {"void","object"} ) then

				printf( STDERR, "%s:%d\n", {source_file,func_line} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    function does not return a valid type\n" )
				abort(0)

			end if

			sequence func_parts = stdseq:split( func_name, '_' )

			if not equal( func_parts[1], file_class ) then

				printf( STDERR, "%s:%d\n", {source_file,func_line} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    function does not match class '%s'\n", {file_class} )
				abort(0)

			end if

			func_param = text:trim( func_param )

			func_list = append( func_list, {
				func_type,		-- return type
				func_macro,		-- library name
				func_parts[1],	-- class name
				func_parts[2],	-- function name
				func_param,		-- parameters
				func_line		-- line number
			})

		end if

		line = gets( fn )
		func_line += 1

	end while

	close( fn )

	sequence not_found = {}

	for i = 1 to length( func_list ) do

		sequence func_type, func_macro, func_class, func_name, func_param
		{func_type,func_macro,func_class,func_name,func_param,func_line} = func_list[i]

		sequence macro_parts = stdseq:split( func_macro, '_' )
		sequence library_name = text:lower( macro_parts[2] )
		sequence library_path = canonical_path( file_path & SLASH & ".."
			& SLASH & "include" & SLASH & "wx" & SLASH & library_name )
		sequence wrapper_file = library_path & SLASH & file_class & ".e"

		if not equal( file_class, "wxEuphoria" ) then

			if not file_exists( wrapper_file ) then

				printf( STDERR, "class wrapper '%s' not found:\n%s\n", {file_class,wrapper_file} )
				abort(0)

			end if

			integer found = check_eu( source_file, wrapper_file, func_list[i] )
			if not found then
				not_found = append( not_found, {wrapper_file,func_name} )
			end if

		end if

	end for

	sequence last_file = ""

	for i = 1 to length( not_found ) do

		sequence wrapper_file, func_name
		{wrapper_file,func_name} = not_found[i]

		if not equal( last_file, wrapper_file ) then
			printf( STDERR, "%s\n", {wrapper_file} )
			last_file = wrapper_file
		end if

		printf( STDERR, "  wrapper for '%s' not found\n", {func_name} )

	end for

	return 0
end function

function look_at( sequence path, sequence item )

	if find( 'd', item[D_ATTRIBUTES] ) then
		return 0
	end if

	if wildcard:is_match( "wx?*.cpp", item[D_NAME] ) then
		return check_cpp( path & SLASH & item[D_NAME] )
	end if

	return 0
end function

procedure main()

	sequence path = current_dir()
	integer func = routine_id( "look_at" )

	integer exit_code = walk_dir( path, func, TRUE )
	if exit_code != 0 then abort( exit_code ) end if

end procedure

main()
