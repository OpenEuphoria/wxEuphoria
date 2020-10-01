
namespace wxUpdateUIEvent

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/window.e"

public include "wx/event.e"
public include "wx/object.e"

constant wxUpdateUIEventInfo = wxClassInfo:FindClass( "wxUpdateUIEvent" )

public type wxUpdateUIEvent( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxUpdateUIEventInfo )
end type

public procedure Check( wxUpdateUIEvent self, integer check )
	wx_proc( WXUPDATEUIEVENT_CHECK, {self,check} )
end procedure

public procedure Enable( wxUpdateUIEvent self, integer enable )
	wx_proc( WXUPDATEUIEVENT_ENABLE, {self,enable} )
end procedure

public function GetChecked( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETCHECKED, {self} )
end function

public function GetEnabled( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETENABLED, {self} )
end function

public function GetSetChecked( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETSETCHECKED, {self} )
end function

public function GetSetEnabled( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETSETENABLED, {self} )
end function

public function GetSetShown( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETSETSHOWN, {self} )
end function

public function GetSetText( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETSETTEXT, {self} )
end function

public function GetShown( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETSHOWN, {self} )
end function

public function GetText( wxUpdateUIEvent self )
	return wx_func( WXUPDATEUIEVENT_GETTEXT, {self} )
end function

public procedure SetText( wxUpdateUIEvent self, wxString text )
	wx_proc( WXUPDATEUIEVENT_SETTEXT, {self,text} )
end procedure

public procedure Show( wxUpdateUIEvent self, integer show )
	wx_proc( WXUPDATEUIEVENT_SHOW, {self,show} )
end procedure

public function CanUpdate( wxWindow window )
	return wx_func( WXUPDATEUIEVENT_CANUPDATE, {window} )
end function

public function GetMode()
	return wx_func( WXUPDATEUIEVENT_GETMODE, {} )
end function

public function GetUpdateInterval()
	return wx_func( WXUPDATEUIEVENT_GETUPDATEINTERVAL, {} )
end function

public procedure ResetUpdateTime()
	wx_proc( WXUPDATEUIEVENT_RESETUPDATETIME, {} )
end procedure

public procedure SetMode( wxUpdateUIMode mode )
	wx_proc( WXUPDATEUIEVENT_SETMODE, {mode} )
end procedure

public procedure SetUpdateInterval( atom interval )
	wx_proc( WXUPDATEUIEVENT_SETUPDATEINTERVAL, {interval} )
end procedure
