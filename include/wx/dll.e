
include "std/error.e"
include "std/machine.e"
include "std/map.e"
include "wx/debug.e"

public include "std/dll.e"
public include "std/types.e"

ifdef DEBUG then
constant WX_LIBRARY_NAME = "libwxeud_%s"
elsedef
constant WX_LIBRARY_NAME = "libwxeu_%s"
end ifdef

ifdef WINDOWS then
constant WX_LIBRARY_EXT = ".dll"
elsedef
constant WX_LIBRARY_EXT = ".so"
end ifdef

constant WX_LIBRARY_MASK = WX_LIBRARY_NAME & WX_LIBRARY_EXT

map m_libs = map:new()
map m_defs = map:new()

atom init_func, delete_func

/* external memory allocator */
public function wx_malloc( atom size )
	return machine_func( M_ALLOC, size )
end function

export constant malloc_id = routine_id( "wx_malloc" )
export constant malloc_cb = wx_callback( "wx_malloc" )

/* external memory freer */
public function wx_free( atom ptr )
	machine_proc( M_FREE, ptr )
	return NULL
end function

export constant free_id = routine_id( "wx_free" )
export constant free_cb = wx_callback( "wx_free" )

/* internal cleanup routine */
public procedure wx_cleanup( atom ptr )
	machine_proc( M_FREE, ptr )
end procedure

export constant cleanup_id = routine_id( "wx_cleanup" )

/* load an external library */
public function wx_library( sequence name )

	sequence list = name
	if types:string( list ) then
		list = {list}
	end if

	atom lib = map:get( m_libs, name, NULL )
	if lib != NULL then return lib end if

	for i = 1 to length( list ) do
		list[i] = sprintf( WX_LIBRARY_MASK, {list[i]} )

		lib = open_dll( list[i] )
		if lib = NULL then
			continue
		end if

		wxDebugf( "0x%08x %s\n", {lib,list[i]} )

		if equal( name, "base" ) then
			-- initialize the library

			init_func = wx_define( lib,
				"wxEuphoria_Initialize", 2, FALSE )
			delete_func = wx_define( lib,
				"wxEuphoria_DeleteObject", 1, FALSE )

			wx_proc( init_func, {malloc_cb,free_cb} )

		end if

		map:put( m_libs, name, lib )
		map:put( m_libs, lib, name )

	end for

	if lib = NULL then
		wxCrash( "library %s not found\n", {name} )
	end if

	return lib
end function

/* define an external var, func, or proc */
public function wx_define( atom lib, sequence name, object params = -1, atom return_type = FALSE )

	atom id = -1

	if atom( params ) and params != -1 then
		params = repeat( E_OBJECT, params )
	end if

	if equal( {params,return_type}, {-1,FALSE} ) then
		id = define_c_var( lib, name )
		if id != -1 then
			wxDebugf( "0x%08x %s\n", {id,name} )
		end if

	elsif return_type = FALSE then
		id = define_c_proc( lib, '+' & name, params )
		if id != -1 then
			wxDebugf( "%d %s\n", {id,name} )
		end if

	else
		id = define_c_func( lib, '+' & name, params, E_OBJECT )
		if id != -1 then
			wxDebugf( "%d %s\n", {id,name} )
		end if

	end if

	map:put( m_defs, id, name )
	map:put( m_defs, name, {id,lib,params,return_type} )

	sequence libname = map:get( m_libs, lib, "unknown" )
	wxAssert( (id > 0), "export '%s' not found in %s library", {name,libname} )

	return id
end function

/* get the value of an event type */
public function wx_event( atom lib, sequence name )
	return peek4s( wx_define(lib,name) )
end function

/* get the value of a global string */
public function wx_string( atom lib, sequence name )
	return peek_string( wx_define(lib,name) )
end function

/* delete a wxWidgets object (wxObject*) */
public procedure wx_delete( atom ptr )
	wx_proc( delete_func, {ptr} )
end procedure

/* register an external callback */
public function wx_callback( sequence name, atom id = routine_id(name) )
	return call_back( '+' & id )
end function

/* call an external function */
public function wx_func( atom id, sequence params )
	return c_func( id, params )
end function

/* call an external procedure */
public procedure wx_proc( atom id, sequence params )
	c_proc( id, params )
end procedure
