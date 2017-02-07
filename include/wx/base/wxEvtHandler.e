
namespace wxEvtHandler

include "wx/dll.e"
include "wx/base.e"
include "wx/defs.e"
include "wx/event.e"

public include "wx/object.e"

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

public procedure QueueEvent( wxEvtHandler self, wxEvent event )
	wx_proc( WXEVTHANDLER_QUEUEEVENT, {self,event} )
end procedure

public procedure AddPendingEvent( wxEvtHandler self, wxEvent event )
	wx_proc( WXEVTHANDLER_ADDPENDINGEVENT, {self,event} )
end procedure

public procedure ProcessPendingEvents( wxEvtHandler self )
	wx_proc( WXEVTHANDLER_PROCESSPENDINGEVENTS, {self} )
end procedure

public procedure DeletePendingEvents( wxEvtHandler self )
	wx_proc( WXEVTHANDLER_DELETEPENDINGEVENTS, {self} )
end procedure

public procedure Connect( wxEvtHandler self, wxWindowID window_id, wxEventType event_type,
		sequence routine_name, atom _routine_id = routine_id(routine_name) )
	wx_proc( WXEVTHANDLER_CONNECT, {self,window_id,event_type,_routine_id} )
end procedure

public function Disconnect( wxEvtHandler self, wxWindowID window_id, wxEventType event_type )
	return wx_func( WXEVTHANDLER_DISCONNECT, {self,window_id,event_type} )
end function
