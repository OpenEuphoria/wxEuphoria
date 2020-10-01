
#include <wx/event.h>
#include <wx/window.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

void WXEUAPI_CORE wxUpdateUIEvent_Check( object self, object check )
{
	((wxUpdateUIEvent*)self)->Check( get_int(check) );
}

void WXEUAPI_CORE wxUpdateUIEvent_Enable( object self, object enable )
{
	((wxUpdateUIEvent*)self)->Enable( enable );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetChecked( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetChecked();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetEnabled( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetEnabled();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetSetChecked( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetSetChecked();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetSetEnabled( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetSetEnabled();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetSetShown( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetSetShown();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetSetText( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetSetText();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetShown( object self )
{
	bool result = ((wxUpdateUIEvent*)self)->GetShown();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetText( object self )
{
	wxString text = ((wxUpdateUIEvent*)self)->GetText();
	
	return get_sequence( text );
}

void WXEUAPI_CORE wxUpdateUIEvent_SetText( object self, object text )
{
	wxDeRef( text );
	
	((wxUpdateUIEvent*)self)->SetText( get_string(text) );
}

void WXEUAPI_CORE wxUpdateUIEvent_Show( object self, object show )
{
	((wxUpdateUIEvent*)self)->Show( get_int(show) );
}

/* Static Public Member Functions */

object WXEUAPI_CORE wxUpdateUIEvent_CanUpdate( object window )
{
	bool result = wxUpdateUIEvent::CanUpdate( get_object<wxWindow*>(window) );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetMode()
{
	wxUpdateUIMode mode = wxUpdateUIEvent::GetMode();
	
	return BOX_INT( mode );
}

object WXEUAPI_CORE wxUpdateUIEvent_GetUpdateInterval()
{
	long interval = wxUpdateUIEvent::GetUpdateInterval();
	
	return BOX_INT( interval );
}

void WXEUAPI_CORE wxUpdateUIEvent_ResetUpdateTime()
{
	wxUpdateUIEvent::ResetUpdateTime();
}

void WXEUAPI_CORE wxUpdateUIEvent_SetMode( object mode )
{
	wxUpdateUIEvent::SetMode( (wxUpdateUIMode)get_int(mode) );
}

void WXEUAPI_CORE wxUpdateUIEvent_SetUpdateInterval( object interval )
{
	wxUpdateUIEvent::SetUpdateInterval( get_int(interval) );
}

};