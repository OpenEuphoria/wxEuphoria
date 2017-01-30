
namespace wxEvent

include "wx/dll.e"
include "wx/base.e"
include "wx/object.e"
include "wx/event.e"

public include "wx/base/wxObject.e"

constant wxEventInfo = wxClassInfo:FindClass( "wxEvent" )

public type wxEvent( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxEventInfo )
end type

public function Clone( wxEvent self )
	return wx_func( WXEVENT_CLONE, {self} )
end function

public function GetEventObject( wxEvent self )
	return wx_func( WXEVENT_GETEVENTOBJECT, {self} )
end function

public function GetEventType( wxEvent self )
	return wx_func( WXEVENT_GETEVENTTYPE, {self} )
end function

public function GetEventCategory( wxEvent self )
	return wx_func( WXEVENT_GETEVENTCATEGORY, {self} )
end function

public function GetId( wxEvent self )
	return wx_func( WXEVENT_GETID, {self} )
end function

public function GetEventUserData( wxEvent self )
	return wx_func( WXEVENT_GETEVENTUSERDATA, {self} )
end function

public function GetSkipped( wxEvent self )
	return wx_func( WXEVENT_GETSKIPPED, {self} )
end function

public function GetTimestamp( wxEvent self )
	return wx_func( WXEVENT_GETTIMESTAMP, {self} )
end function

public function IsCommandEvent( wxEvent self )
	return wx_func( WXEVENT_ISCOMMANDEVENT, {self} )
end function

public procedure ResumePropagation( wxEvent self, atom propagationLevel )
	wx_proc( WXEVENT_RESUMEPROPAGATION, {self,propagationLevel} )
end procedure

public procedure SetEventObject( wxEvent self, wxObject obj )
	wx_proc( WXEVENT_SETEVENTOBJECT, {self,obj} )
end procedure

public procedure SetEventType( wxEvent self, wxEventType eventType )
	wx_proc( WXEVENT_SETEVENTTYPE, {self,eventType} )
end procedure

public procedure SetId( wxEvent self, atom id )
	wx_proc( WXEVENT_SETID, {self,id} )
end procedure

public procedure SetTimestamp( wxEvent self, atom timeStamp = 0 )
	wx_proc( WXEVENT_SETTIMESTAMP, {self,timeStamp} )
end procedure

public function ShouldPropagate( wxEvent self )
	return wx_func( WXEVENT_SHOULDPROPAGATE, {self} )
end function

public procedure Skip( wxEvent self, atom skip = TRUE )
	wx_proc( WXEVENT_SKIP, {self,skip} )
end procedure

public function StopPropagation( wxEvent self )
	return wx_func( WXEVENT_STOPPROPAGATION, {self} )
end function

