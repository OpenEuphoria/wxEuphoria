
include "std/cmdline.e"
include "std/console.e"
include "std/filesys.e"
include "std/io.e"
include "std/map.e"
include "std/search.e"
include "std/text.e"

constant OPTIONS = {
	{ "c", "class",   "Class name to use",       {MANDATORY,HAS_PARAMETER,ONCE} },
	{ "l", "library", "Library name to use",     {MANDATORY,HAS_PARAMETER,ONCE} },
	{ "o", "output",  "Output file to use",      {HAS_PARAMETER,ONCE}           },
	{ "s", "simple",  "Create simple object",    {NO_PARAMETER,ONCE}            },
	{ "f", "force",   "Overwrite existing file", {NO_PARAMETER,ONCE}            },
	{ "v", "verbose", "Show verbose output",     {NO_PARAMETER,ONCE}            }
}

constant HELPTEXT = """
NOTES
- Default output file is 'include/wx/[library]/[class].e'
- A 'simple' class is just an atom and does not inheirt
  from wxObject or perform any additional type checking.
- You can specify 'STDOUT' to write output to console.
"""

constant SIMPLE_TEMPLATE = """

namespace {class}

include "wx/dll.e"
include "wx/{library}.e"

public type {class}( object x )
	return atom(x)
end type

"""

constant OBJECT_TEMPLATE = """

namespace {class}

include "wx/dll.e"
include "wx/{library}.e"
include "wx/base/wxClassInfo.e"

public include "wx/base/wxObject.e"

constant {class}Info = wxClassInfo:FindClass( "{class}" )

public type {class}( object x )
	return wxObject:IsKindOf( x, {class}Info )
end type

"""

procedure main()
	
	sequence class, library, output, template
	integer simple, force, verbose, exists, fn
	
	map options = cmd_parse( OPTIONS, {HELP_RID,HELPTEXT} )
	class   = map:get( options, "class",   "" )
	library = map:get( options, "library", "" )
	output  = map:get( options, "output",  "" )
	simple  = map:get( options, "simple",   0 )
	force   = map:get( options, "force",    0 )
	verbose = map:get( options, "verbose",  0 )
	
	if length( output ) = 0 then
		output = sprintf( "include/wx/%s/%s.e", {library,class} )
	end if
	
	if not equal( output, "-" ) then
		exists = file_exists( output )
	else
		exists = 0
	end if
	
	if verbose then
		printf( STDOUT, "simple = %d",       {simple } )
		printf( STDOUT, ", force = %d",      {force  } )
		printf( STDOUT, ", exists = %d",     {exists } )
		printf( STDOUT, ", verbose = %d",    {verbose} )
		printf( STDOUT, ", class = '%s'",    {class  } )
		printf( STDOUT, ", library = '%s'",  {library} )
		printf( STDOUT, ", output = '%s'\n", {output } )
	end if
	
	if exists and not force then
		printf( STDERR, "file already exists: %s\n", {output} )
		abort(1)
	end if
	
	if find( text:lower(output), {"-","stdout"} ) then
		fn = STDOUT
	else
		fn = open( output, "w" )
	end if
	
	if simple then
		template = SIMPLE_TEMPLATE
	else
		template = OBJECT_TEMPLATE
	end if
	
	template = match_replace( "{class}",   template, class )
	template = match_replace( "{library}", template, library )
	
	if verbose and fn != STDOUT then
		printf( STDOUT, template )
	end if
	
	printf( fn, template )
	
	if not equal( output, "-" ) then
		close( fn )
	end if
	
end procedure

main()
