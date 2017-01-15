
namespace wxApp

include "wx/dll.e"
include "wx/base.e"
include "wx/core.e"
include "wx/defs.e"
include "wx/string.e"
include "wx/window.e"

public include "wx/base/wxAppConsole.e"
public include "wx/base/wxEvtHandler.e"

atom core = wx_library( "core" )

public constant
	wxEVT_QUERY_END_SESSION		= wx_event( core, "wxEVT_QUERY_END_SESSION" ),
	wxEVT_END_SESSION			= wx_event( core, "wxEVT_END_SESSION" ),
	wxEVT_ACTIVATE_APP			= wx_event( core, "wxEVT_ACTIVATE_APP" ),
	wxEVT_HIBERNATE				= wx_event( core, "wxEVT_HIBERNATE" ),
	wxEVT_DIALUP_CONNECTED		= wx_event( core, "wxEVT_DIALUP_CONNECTED" ),
	wxEVT_DIALUP_DISCONNECTED	= wx_event( core, "wxEVT_DIALUP_DISCONNECTED" ),
$

public type wxApp( object x )
	return wxAppConsole(x)
end type

public function new()
	atom func = wx_callback( "wxEvtHandler:CallFunc" )
	atom proc = wx_callback( "wxEvtHandler:CallProc" )
	atom rtfatal = routine_id( "RTFatal" )
	return wx_func( WXAPP_NEW, {func,proc,rtfatal} )
end function

public function GetExitOnFrameDelete( wxApp self )
	return wx_func( WXAPP_GETEXITONFRAMEDELETE, {self} )
end function

public function GetLayoutDirection( wxApp self )
	return wx_func( WXAPP_GETLAYOUTDIRECTION, {self} )
end function

public function GetUseBestVisual( wxApp self )
	return wx_func( WXAPP_GETUSEBESTVISUAL, {self} )
end function

public function GetTopWindow( wxApp self )
	return wx_func( WXAPP_GETTOPWINDOW, {self} )
end function

public function IsActive( wxApp self )
	return wx_func( WXAPP_ISACTIVE, {self} )
end function

public function SafeYield( wxApp self, wxWindow window, atom onlyIfNeeded )
	return wx_func( WXAPP_SAFEYIELD, {self,window,onlyIfNeeded} )
end function

public function SafeYieldFor( wxApp self, wxWindow window, atom eventsToProcess )
	return wx_func( WXAPP_SAFEYIELDFOR, {self,window,eventsToProcess} )
end function

public procedure SetExitOnFrameDelete( wxApp self, atom flag )
	wx_proc( WXAPP_SETEXITONFRAMEDELETE, {self,flag} )
end procedure

public procedure SetTopWindow( wxApp self, wxWindow window )
	wx_proc( WXAPP_SETTOPWINDOW, {self,window} )
end procedure

public procedure wxMain( wxWindow window, wxApp app = NULL )
	
	if app = NULL then
		app = wxApp:new()
	end if

	wxApp:SetTopWindow( app, window )
	
	wxWindow:Show( window )
	wxApp:MainLoop( app )
	
end procedure

public function wxMessageBox( wxString message, wxString caption = wxEmptyString, atom style = wxOK+wxCENTRE, wxWindow parent = NULL, atom x = -1, atom y = -1 )
	return wx_func( WXAPP_WXMESSAGEBOX, {message,caption,style,parent,x,y} )
end function

