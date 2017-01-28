include "std/console.e"
include "std/filesys.e"

procedure main()
	
	sequence library, class
	sequence cmd = command_line()
	
	if length( cmd ) < 3 then
		library = prompt_string( "library: " )
	else
		library = cmd[3]
	end if
	
	if length( cmd ) < 4 then
		class = prompt_string( "class: " )
	else
		class = cmd[4]
	end if
	
	sequence path = sprintf( "include/wx/%s/%s.e", {library,class} )
	if file_exists( path ) then
		printf( 2, "file already exists: %s\n", {path} )
		abort(1)
	end if
	
	integer fn = open( path, "w" )
	if fn = -1 then
		printf( 2, "could not write file: %s\n", {path} )
		abort(1)
	end if
	
	printf( fn, "\n" )
	printf( fn, "namespace %s\n", {class} )
	printf( fn, "\n" )
	printf( fn, "include \"wx/dll.e\"\n" )
	printf( fn, "include \"wx/%s.e\"\n", {library} )
	printf( fn, "include \"wx/base/wxClassInfo.e\"\n" )
	printf( fn, "\n" )
	printf( fn, "public include \"wx/base/wxObject.e\"\n" )
	printf( fn, "\n" )
	printf( fn, "constant %sInfo = wxClassInfo:FindClass( \"%s\" )\n", {class,class} )
	printf( fn, "\n" )
	printf( fn, "public type %s( object x )\n", {class} )
	printf( fn, "\tif equal( x, NULL ) then\n" )
	printf( fn, "\t\treturn 1\n" )
	printf( fn, "\tend if\n" )
	printf( fn, "\n" )
	printf( fn, "\treturn wxObject:IsKindOf( x, %sInfo )\n", {class} )
	printf( fn, "end type\n" )
	printf( fn, "\n" )
	
	close( fn )
	
	printf( 1, "%s\n", {path} )
	
end procedure

main()

