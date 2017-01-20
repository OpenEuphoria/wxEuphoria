--
-- run sanity checks on source and wrapper files
--
-- - check for missing namespaces
-- - check for missing type names
-- - check for missing wrapper funcs
-- - check for mismatched parameters (TODO)
--

include "std/filesys.e"
include "std/io.e"
include "std/regex.e"
include "std/search.e"
include "std/sequence.e"
include "std/text.e"
include "std/types.e"
include "std/wildcard.e"

constant re_namespace = regex:new( `^namespace\s+(\w+)$` )
constant re_routine   = regex:new( `^(public|export)\s+(function|procedure)\s+(\w+)\s*\((.*)\)$` )
constant re_typename  = regex:new( `^public\s+type\s+(\w+)\s*\(.*\)$` )
constant re_wxeuapi   = regex:new( `^(\w+)\s+(WXEUAPI_\w+)\s+(\w+)\s*\((.*)\)$` )

function startup_dir()
	sequence cmd = command_line()
	return pathname( cmd[2] )
end function

function check_eu( sequence file, sequence func_info )
	
	sequence file_class = filebase( file )
	
	sequence func_type  = func_info[1]
	sequence func_macro = func_info[2]
	sequence func_class = func_info[3]
	sequence func_name  = func_info[4]
	sequence func_param = func_info[5]
	
	integer fn = open( file, "r" )
	if fn = -1 then
		printf( STDERR, "could not read file: %s\n", {file} )
		abort(0)
	end if
	
	-- found flags
	integer f_namespace = 0
	integer f_typename  = 0
	integer f_routine   = 0
	
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
				
				printf( STDERR, "%s:%d\n", {file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    namespace does not match class '%s'\n", {file_class} )
				abort(0)
				
			end if
			
			f_namespace = 1
			
		elsif regex:is_match( re_typename, line ) then
			
			sequence matches = regex:matches( re_typename, line )
			if not equal( matches[2], file_class ) then
				
				printf( STDERR, "%s:%d\n", {file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    type name does not match class '%s'\n", {file_class} )
				abort(0)
				
			end if
			
			f_typename = 1
			
		elsif regex:is_match( re_routine, line ) then
			
			sequence matches = regex:matches( re_routine, line )
			if equal( matches[4], func_name ) and f_routine = 0 then
				f_routine = 1 -- found the routine we need
				exit
			end if
			
		end if
		
		line = gets( fn )
		line_no += 1
		
	end while
	
	close( fn )
	
	if not f_namespace then
		printf( STDERR, "%s\n", {file} )
		printf( STDERR, "  namespace '%s' not found\n", {file_class} )
		abort(0)
	end if
	
	if not f_typename then
		printf( STDERR, "%s\n", {file} )
		printf( STDERR, "  type name '%s' not found\n", {file_class} )
		abort(0)
	end if
	
	return f_routine
end function

function check_cpp( sequence file )
	
	sequence file_class = filebase( file )
	sequence file_path  = pathname( file )
	
	integer fn = open( file, "r" )
	if fn = -1 then
		printf( STDERR, "could not read file: %s\n", {file} )
		abort(0)
	end if
	
	sequence func_list = {}
	
	object line = gets( fn )
	integer line_no = 1
	
	while sequence( line ) do
		line = text:trim( line )
		
		if regex:is_match( re_wxeuapi, line ) then
			
			sequence matches = regex:matches( re_wxeuapi, line )
			
			sequence func_type  = matches[2]
			sequence func_macro = matches[3]
			sequence func_name  = matches[4]
			sequence func_param = matches[5]
			
			if not find( func_type, {"void","object"} ) then
				
				printf( STDERR, "%s:%d\n", {file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    function does not return a valid type\n" )
				abort(0)
				
			end if
			
			sequence func_parts = stdseq:split( func_name, '_' )
			if not equal( func_parts[1], file_class ) then
				
				printf( STDERR, "%s:%d\n", {file,line_no} )
				printf( STDERR, "%s\n", {line} )
				printf( STDERR, "    function does not match class '%s'\n", {file_class} )
				abort(0)
				
			end if
			
			func_list = append(func_list,{
				func_type,		-- return type
				func_macro,		-- library name
				func_parts[1],	-- class name
				func_parts[2],	-- function name
				func_param		-- parameters
			})
			
		end if
		
		line = gets( fn )
		line_no += 1
		
	end while
	
	close( fn )
	
	sequence not_found = {}
	
	for i = 1 to length( func_list ) do
		sequence func_info = func_list[i]
		
		sequence func_type  = func_info[1]
		sequence func_macro = func_info[2]
		sequence func_class = func_info[3]
		sequence func_name  = func_info[4]
		sequence func_param = func_info[5]
		
		sequence macro_parts = stdseq:split( func_macro, '_' )
		sequence library_name = text:lower( macro_parts[2] )
		sequence library_path = canonical_path( file_path & SLASH & ".."
			& SLASH & "include" & SLASH & "wx" & SLASH & library_name )
		sequence wrapper_file = library_path & SLASH & file_class & ".e"
		
		if not file_exists( wrapper_file ) then
			
			printf( STDERR, "%s\n", {wrapper_file} )
			printf( STDERR, "class wrapper '%s' not found:\n%s\n", {file_class,wrapper_file} )
			abort(0)
			
		end if
		
		integer found = check_eu( wrapper_file, func_info )
		if not found then
			not_found = append( not_found, {wrapper_file,func_name} )
		end if
		
	end for
	
	sequence last_file = ""
	
	for i = 1 to length( not_found ) do
		
		sequence wrapper_file = not_found[i][1]
		sequence func_name    = not_found[i][2]
		
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
		
--	elsif wildcard:is_match( "wx?*.e", item[D_NAME] ) then
--		return check_eu( path & SLASH & item[D_NAME] )
		
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
