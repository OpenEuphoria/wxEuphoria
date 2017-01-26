
namespace wxEvtHandler

include "wx/dll.e"
include "wx/base.e"
include "wx/defs.e"
include "wx/event.e"
include "wx/base/wxClassInfo.e"

public include "wx/base/wxObject.e"

constant wxEvtHandlerInfo = wxClassInfo:FindClass( "wxEvtHandler" )

public type wxEvtHandler( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxEvtHandlerInfo )
end type

export function GetObject()
	return wx_func( WXEVTHANDLER_GETOBJECT, {} )
end function

export function CallFunc( atom id )
	return call_func( id, GetObject() )
end function

export function CallProc( atom id )
	call_proc( id, GetObject() )
	return NULL
end function

public procedure Connect( wxEvtHandler self, wxWindowID window_id, wxEventType event_type,
		sequence routine_name, atom _routine_id = routine_id(routine_name) )
	wx_proc( WXEVTHANDLER_CONNECT, {self,window_id,event_type,_routine_id} )
end procedure

