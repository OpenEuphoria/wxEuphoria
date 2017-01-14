
#include <wx/event.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

/* Connecting and disconnecting */

void WXEUAPI_BASE wxEvtHandler_Connect( object self, object window_id, object event_type, object routine_id )
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
			client_data->Add( self, (wxWindowID)window_id, (wxEventType)event_type, routine_id );
		}
		
		event_handler->Connect( (wxWindowID)first_id, (wxWindowID)last_id,
			(wxEventType)event_type, wxEventHandler(EuAppBase::Handler) );
	}
	else {
		client_data->Add( self, (wxWindowID)window_id, (wxEventType)event_type, routine_id );
		event_handler->Connect( window_id, event_type, wxEventHandler(EuAppBase::Handler) );
		
	}
	
}

object WXEUAPI_BASE wxEvtHandler_GetObject()
{
	return EuAppBase::s_TheObject;
}

};