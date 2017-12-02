
#include <wx/event.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object WXEUAPI_BASE wxEvtHandler_GetObject()
{
	return EuAppBase::s_TheObject;
}

/* Event queuing and processing */

void WXEUAPI_BASE wxEvtHandler_QueueEvent( object self, object event )
{
	((wxEvtHandler*)self)->QueueEvent( (wxEvent*)event );
}

void WXEUAPI_BASE wxEvtHandler_AddPendingEvent( object self, object event )
{
	((wxEvtHandler*)self)->AddPendingEvent( *(wxEvent*)event );
}

void WXEUAPI_BASE wxEvtHandler_ProcessPendingEvents( object self )
{
	((wxEvtHandler*)self)->ProcessPendingEvents();
}

void WXEUAPI_BASE wxEvtHandler_DeletePendingEvents( object self )
{
	((wxEvtHandler*)self)->DeletePendingEvents();
}


/* Connecting and disconnecting */

//void WXEUAPI_BASE wxEvtHandler_Connect( object self, object window_id, object event_type, object routine_name, object _routine_id )
void WXEUAPI_BASE wxEvtHandler_Connect( object self, object window_id, object event_type, object _routine_id )
{
	wxEvtHandler* event_handler = (wxEvtHandler*)self;

	EuClientData* client_data = (EuClientData*)event_handler->GetClientObject();
	if ( client_data == NULL ) {
		client_data = new EuClientData();
		event_handler->SetClientObject( client_data );
	}

	if ( IS_SEQUENCE(window_id) ) {

		s1_ptr s = SEQ_PTR( window_id );
		wxDeRef( window_id );

		intptr_t first_id = s->base[1];
		intptr_t last_id  = s->base[2];

		for ( window_id = first_id; window_id <= last_id; window_id++ ) {
			client_data->Add( self, (wxWindowID)window_id, (wxEventType)event_type, _routine_id );
		}

		event_handler->Connect( (wxWindowID)first_id, (wxWindowID)last_id,
			(wxEventType)event_type, wxEventHandler(EuAppBase::Handler) );
	}
	else {
		client_data->Add( self, (wxWindowID)window_id, (wxEventType)event_type, _routine_id );
		event_handler->Connect( (wxWindowID)window_id, (wxEventType)event_type,
			wxEventHandler(EuAppBase::Handler) );

	}

//	wxDeRef( routine_name );
}

object WXEUAPI_BASE wxEvtHandler_Disconnect( object self, object window_id, object event_type )
{
	wxEvtHandler* event_handler = (wxEvtHandler*)self;

	EuClientData* client_data = (EuClientData*)event_handler->GetClientObject();
	if ( client_data == NULL ) {
		client_data = new EuClientData();
		event_handler->SetClientObject( client_data );
	}

	if ( IS_SEQUENCE(window_id) ) {

		s1_ptr s = SEQ_PTR( window_id );
		wxDeRef( window_id );

		intptr_t first_id = s->base[1];
		intptr_t last_id  = s->base[2];

		for ( window_id = first_id; window_id <= last_id; window_id++ ) {
			client_data->Del( (wxWindowID)window_id, (wxEventType)event_type );
		}

		event_handler->Disconnect( (wxWindowID)first_id, (wxWindowID)last_id,
			(wxEventType)event_type, wxEventHandler(EuAppBase::Handler) );
	}
	else {
		client_data->Del( (wxWindowID)window_id, (wxEventType)event_type );
		event_handler->Disconnect( (wxWindowID)window_id, (wxEventType)event_type,
			wxEventHandler(EuAppBase::Handler) );

	}

}

};
