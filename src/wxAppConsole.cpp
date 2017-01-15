
#include <wx/app.h>
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
	EuAppConsole* app = new EuAppConsole( (EuCallFunc)func, (EuCallProc)proc, rtfatal );
	
	wxInitialize();
	wxAppConsole::SetInstance( app );
	
	return BOX_INT( app );
}

object WXEUAPI_BASE wxAppConsole_Yield( object self, object onlyIfNeeded )
{
	return BOX_INT( ((wxAppConsole*)self)->Yield(onlyIfNeeded) );
}

void WXEUAPI_BASE wxAppConsole_SetCLocale( object self )
{
	((wxAppConsole*)self)->SetCLocale();
}

/* Event-handling */

object WXEUAPI_BASE wxAppConsole_MainLoop( object self )
{
	return BOX_INT( ((wxAppConsole*)self)->MainLoop() );
}

void WXEUAPI_BASE wxAppConsole_ExitMainLoop( object self )
{
	((wxAppConsole*)self)->ExitMainLoop();
}

object WXEUAPI_BASE wxAppConsole_GetMainLoop( object self )
{
	return BOX_INT( ((wxAppConsole*)self)->GetMainLoop() );
}

object WXEUAPI_BASE wxAppConsole_UsesEventLoop( object self )
{
	return BOX_INT( ((wxAppConsole*)self)->UsesEventLoop() );
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
	return BOX_INT( ((wxAppConsole*)self)->HasPendingEvents() );
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
	return BOX_INT( ((wxAppConsole*)self)->IsScheduledForDestruction( (wxObject*)obj ) );
}

/* Application information */

object WXEUAPI_BASE wxAppConsole_GetAppDisplayName( object self )
{
	return get_sequence( ((wxAppConsole*)self)->GetAppDisplayName() );
}

object WXEUAPI_BASE wxAppConsole_GetAppName( object self )
{
	return get_sequence( ((wxAppConsole*)self)->GetAppName() );
}

object WXEUAPI_BASE wxAppConsole_GetClassName( object self )
{
	return get_sequence( ((wxAppConsole*)self)->GetClassName() );
}

// TODO - implement wxAppTraits
//object WXEUAPI_BASE wxAppConsole_GetTraits( object self )
//{
//	return BOX_INT( ((wxAppConsole*)self)->GetTraits() );
//}

object WXEUAPI_BASE wxAppConsole_GetVendorDisplayName( object self )
{
	return get_sequence( ((wxAppConsole*)self)->GetVendorDisplayName() );
}

object WXEUAPI_BASE wxAppConsole_GetVendorName( object self )
{
	return get_sequence( ((wxAppConsole*)self)->GetVendorName() );
}

void WXEUAPI_BASE wxAppConsole_SetAppDisplayName( object self, object name )
{
	wxDeRefDS( name );
	((wxAppConsole*)self)->SetAppDisplayName( get_string(name) );
}

void WXEUAPI_BASE wxAppConsole_SetAppName( object self, object name )
{
	wxDeRefDS( name );
	((wxAppConsole*)self)->SetAppName( get_string(name) );
}

void WXEUAPI_BASE wxAppConsole_SetClassName( object self, object name )
{
	wxDeRefDS( name );
	((wxAppConsole*)self)->SetClassName( get_string(name) );
}

void WXEUAPI_BASE wxAppConsole_SetVendorDisplayName( object self, object name )
{
	wxDeRefDS( name );
	((wxAppConsole*)self)->SetVendorDisplayName( get_string(name) );
}

void WXEUAPI_BASE wxAppConsole_SetVendorName( object self, object name )
{
	wxDeRefDS( name );
	((wxAppConsole*)self)->SetVendorName( get_string(name) );
}

/* Static Public Member Functions */

object WXEUAPI_BASE wxAppConsole_SetInstance( object app )
{
	wxAppConsole::SetInstance( ((wxAppConsole*)app) );
}

object WXEUAPI_BASE wxAppConsole_GetInstance()
{
	return BOX_INT( wxAppConsole::GetInstance() );
}

object WXEUAPI_BASE wxAppConsole_IsMainLoopRunning()
{
	return BOX_INT( wxAppConsole::IsMainLoopRunning() );
}

};