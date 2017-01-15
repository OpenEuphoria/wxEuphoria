
include "std/error.e"
include "std/machine.e"
include "std/map.e"
include "wx/debug.e"

public include "std/dll.e"
public include "std/types.e"

--export constant NULL = dll:NULL
--export enum TRUE = 1, FALSE = 0

public type var( object x )
	return 1
end type

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
	
	atom result
	
	if atom( params ) and params != -1 then
		params = repeat( E_OBJECT, params )
	end if
	
	if equal( {params,return_type}, {-1,FALSE} ) then
		result = define_c_var( lib, name )
		if result != -1 then
			wxDebugf( "%5d %s\n", {peek4s(result),name} )
		end if
		
	elsif return_type = FALSE then
		result = define_c_proc( lib, '+' & name, params )
		if result != -1 then
			wxDebugf( "%5d %s\n", {result,name} )
		end if
		
	else
		result = define_c_func( lib, '+' & name, params, E_OBJECT )
		if result != -1 then
			wxDebugf( "%5d %s\n", {result,name} )
		end if
		
	end if
	
	sequence libname = map:get( m_libs, lib, "unknown" )
	wxAssert( (result > 0), "export '%s' not found in %s library", {name,libname} )
	
	return result
end function

/* get the value of an event type */
public function wx_event( atom lib, sequence name )
	return peek4s( wx_define(lib,name) )
end function

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
