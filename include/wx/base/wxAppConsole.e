
namespace wxAppConsole

include "wx/dll.e"
include "wx/base.e"
include "wx/defs.e"
include "wx/string.e"

public include "wx/event.e"
public include "wx/object.e"

atom base = wx_library( "base" )

public constant wxEVT_IDLE = wx_event( base, "wxEVT_IDLE" )

constant wxAppConsoleInfo = wxClassInfo:FindClass( "wxAppConsole" )

public type wxAppConsole( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxAppConsoleInfo )
end type

public function new()
	atom func = wx_callback( "wxEvtHandler:CallFunc" )
	atom proc = wx_callback( "wxEvtHandler:CallProc" )
	atom rtfatal = routine_id( "RTFatal" )
	return wx_func( WXAPPCONSOLE_NEW, {func,proc,rtfatal} )
end function

public function Yield( wxAppConsole self, boolean onlyIfNeeded = FALSE )
	return wx_func( WXAPPCONSOLE_YIELD, {self} )
end function

public procedure SetCLocale( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_SETCLOCALE, {self} )
end procedure

public function MainLoop( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_MAINLOOP, {self} )
end function

public procedure ExitMainLoop( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_EXITMAINLOOP, {self} )
end procedure

public function GetMainLoop( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETMAINLOOP, {self} )
end function

public function UsesEventLoop( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_USESEVENTLOOP, {self} )
end function

public procedure ProcessPendingEvents( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_PROCESSPENDINGEVENTS, {self} )
end procedure

public procedure DeletePendingEvents( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_DELETEPENDINGEVENTS, {self} )
end procedure

public function HasPendingEvents( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_HASPENDINGEVENTS, {self} )
end function

public procedure SuspendProcessingOfPendingEvents( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_SUSPENDPROCESSINGOFPENDINGEVENTS, {self} )
end procedure

public procedure ResumeProcessingOfPendingEvents( wxAppConsole self )
	wx_proc( WXAPPCONSOLE_RESUMEPROCESSINGOFPENDINGEVENTS, {self} )
end procedure

public procedure ScheduleForDestruction( wxAppConsole self, wxObject obj )
	wx_proc( WXAPPCONSOLE_SCHEDULEFORDESTRUCTION, {self,obj} )
end procedure

public function IsScheduledForDestruction( wxAppConsole self, wxObject obj )
	return wx_func( WXAPPCONSOLE_ISSCHEDULEDFORDESTRUCTION, {self,obj} )
end function

public function GetAppDisplayName( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETAPPDISPLAYNAME, {self} )
end function

public function GetAppName( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETAPPNAME, {self} )
end function

public function GetClassName( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETCLASSNAME, {self} )
end function

public function GetTraits( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETTRAITS, {self} )
end function

public function GetVendorDisplayName( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETVENDORDISPLAYNAME, {self} )
end function

public function GetVendorName( wxAppConsole self )
	return wx_func( WXAPPCONSOLE_GETVENDORNAME, {self} )
end function

public procedure SetAppDisplayName( wxAppConsole self, wxString name )
	wx_proc( WXAPPCONSOLE_SETAPPDISPLAYNAME, {self,name} )
end procedure

public procedure SetAppName( wxAppConsole self, wxString name )
	wx_proc( WXAPPCONSOLE_SETAPPNAME, {self,name} )
end procedure

public procedure SetClassName( wxAppConsole self, wxString name )
	wx_proc( WXAPPCONSOLE_SETCLASSNAME, {self,name} )
end procedure

public procedure SetVendorDisplayName( wxAppConsole self, wxString name )
	wx_proc( WXAPPCONSOLE_SETVENDORDISPLAYNAME, {self,name} )
end procedure

public procedure SetVendorName( wxAppConsole self, wxString name )
	wx_proc( WXAPPCONSOLE_SETVENDORNAME, {self,name} )
end procedure

public procedure SetInstance( wxAppConsole app )
	wx_proc( WXAPPCONSOLE_SETINSTANCE, {app} )
end procedure

public function IsMainLoopRunning()
	return wx_func( WXAPPCONSOLE_ISMAINLOOPRUNNING, {} )
end function

public function GetInstance()
	return wx_func( WXAPPCONSOLE_GETINSTANCE, {} )
end function

