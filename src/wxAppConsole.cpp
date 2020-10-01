
#include <wx/app.h>
#include <wx/image.h>
#include "wxEuphoria.h"

/* class for wxEuphoria console application */
class EuAppConsole : public EuAppBase, public wxAppConsole
{
public:
	EuAppConsole( EuCallFunc func, EuCallProc proc, object rtfatal )
		: EuAppBase( func, proc, rtfatal ) {}
	
	bool OnInit() {
		return true;
	}
	
	int OnExit() {
		wxUninitialize();
		return 0;
	}
};

extern "C" {

/* Public Member Functions */

object WXEUAPI_BASE wxAppConsole_new( object func, object proc, object rtfatal )
{
	EuAppConsole* app = (EuAppConsole*)wxAppConsole::GetInstance();
	
	if ( app == NULL ) {
		app = new EuAppConsole( (EuCallFunc)func, (EuCallProc)proc, rtfatal );
		
		wxInitialize();
		wxAppConsole::SetInstance( app );
	}
	
	return BOX_INT( app );
}

object WXEUAPI_BASE wxAppConsole_Yield( object self, object onlyIfNeeded )
{
	bool result = ((wxAppConsole*)self)->Yield( onlyIfNeeded );
	
	return BOX_INT( result );
}

void WXEUAPI_BASE wxAppConsole_SetCLocale( object self )
{
	((wxAppConsole*)self)->SetCLocale();
}

/* Event-handling */

object WXEUAPI_BASE wxAppConsole_MainLoop( object self )
{
	int result = ((wxAppConsole*)self)->MainLoop();
	
	return BOX_INT( result );
}

void WXEUAPI_BASE wxAppConsole_ExitMainLoop( object self )
{
	((wxAppConsole*)self)->ExitMainLoop();
}

object WXEUAPI_BASE wxAppConsole_GetMainLoop( object self )
{
	wxEventLoopBase* mainLoop = ((wxAppConsole*)self)->GetMainLoop();
	
	return BOX_INT( mainLoop );
}

object WXEUAPI_BASE wxAppConsole_UsesEventLoop( object self )
{
	bool result = ((wxAppConsole*)self)->UsesEventLoop();
	
	return BOX_INT( result );
}

/* Pending events */

void WXEUAPI_BASE wxAppConsole_ProcessPendingEvents( object self )
{
	((wxAppConsole*)self)->ProcessPendingEvents();
}

void WXEUAPI_BASE wxAppConsole_DeletePendingEvents( object self )
{
	((wxAppConsole*)self)->DeletePendingEvents();
}

object WXEUAPI_BASE wxAppConsole_HasPendingEvents( object self )
{
	bool result = ((wxAppConsole*)self)->HasPendingEvents();
	
	return BOX_INT( result );
}

void WXEUAPI_BASE wxAppConsole_SuspendProcessingOfPendingEvents( object self )
{
	((wxAppConsole*)self)->SuspendProcessingOfPendingEvents();
}

void WXEUAPI_BASE wxAppConsole_ResumeProcessingOfPendingEvents( object self )
{
	((wxAppConsole*)self)->ResumeProcessingOfPendingEvents();
}

void WXEUAPI_BASE wxAppConsole_ScheduleForDestruction( object self, object obj )
{
	((wxAppConsole*)self)->ScheduleForDestruction( (wxObject*)obj );
}

object WXEUAPI_BASE wxAppConsole_IsScheduledForDestruction( object self, object obj )
{
	bool result = ((wxAppConsole*)self)->IsScheduledForDestruction( (wxObject*)obj );
	
	return BOX_INT( result );
}

/* Application information */

object WXEUAPI_BASE wxAppConsole_GetAppDisplayName( object self )
{
	wxString displayName = ((wxAppConsole*)self)->GetAppDisplayName();
	
	return get_sequence( displayName );
}

object WXEUAPI_BASE wxAppConsole_GetAppName( object self )
{
	wxString appName = ((wxAppConsole*)self)->GetAppName();
	
	return get_sequence( appName );
}

object WXEUAPI_BASE wxAppConsole_GetClassName( object self )
{
	wxString className = ((wxAppConsole*)self)->GetClassName();
	
	return get_sequence( className );
}

object WXEUAPI_BASE wxAppConsole_GetTraits( object self )
{
	wxAppTraits* traits = ((wxAppConsole*)self)->GetTraits();
	
	return BOX_INT( traits );
}

object WXEUAPI_BASE wxAppConsole_GetVendorDisplayName( object self )
{
	wxString displayName = ((wxAppConsole*)self)->GetVendorDisplayName();
	
	return get_sequence( displayName );
}

object WXEUAPI_BASE wxAppConsole_GetVendorName( object self )
{
	wxString vendorName = ((wxAppConsole*)self)->GetVendorName();
	
	return get_sequence( vendorName );
}

void WXEUAPI_BASE wxAppConsole_SetAppDisplayName( object self, object name )
{
	((wxAppConsole*)self)->SetAppDisplayName( get_string(name) );
	wxDeRef( name );
}

void WXEUAPI_BASE wxAppConsole_SetAppName( object self, object name )
{
	((wxAppConsole*)self)->SetAppName( get_string(name) );
	wxDeRef( name );
}

void WXEUAPI_BASE wxAppConsole_SetClassName( object self, object name )
{
	((wxAppConsole*)self)->SetClassName( get_string(name) );
	wxDeRef( name );
}

void WXEUAPI_BASE wxAppConsole_SetVendorDisplayName( object self, object name )
{
	((wxAppConsole*)self)->SetVendorDisplayName( get_string(name) );
	wxDeRef( name );
}

void WXEUAPI_BASE wxAppConsole_SetVendorName( object self, object name )
{
	((wxAppConsole*)self)->SetVendorName( get_string(name) );
	wxDeRef( name );
}

/* Static Public Member Functions */

object WXEUAPI_BASE wxAppConsole_SetInstance( object app )
{
	wxAppConsole::SetInstance( ((wxAppConsole*)app) );
}

object WXEUAPI_BASE wxAppConsole_GetInstance()
{
	wxAppConsole* instance = wxAppConsole::GetInstance();
	
	return BOX_INT( instance );
}

object WXEUAPI_BASE wxAppConsole_IsMainLoopRunning()
{
	bool result = wxAppConsole::IsMainLoopRunning();
	
	return BOX_INT( result );
}

};