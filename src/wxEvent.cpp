
#include <wx/event.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxEvent_Clone( object self )
{
	wxEvent* clone = ((wxEvent*)self)->Clone();
	
	return BOX_INT( clone );
}

object WXEUAPI_BASE wxEvent_GetEventObject( object self )
{
	wxObject* eventObject = ((wxEvent*)self)->GetEventObject();
	
	return BOX_INT( eventObject );
}

object WXEUAPI_BASE wxEvent_GetEventType( object self )
{
	wxEventType eventType = ((wxEvent*)self)->GetEventType();
	
	return BOX_INT( eventType );
}

object WXEUAPI_BASE wxEvent_GetEventCategory( object self )
{
	wxEventCategory eventCategory = ((wxEvent*)self)->GetEventCategory();
	
	return BOX_INT( eventCategory );
}

object WXEUAPI_BASE wxEvent_GetId( object self )
{
	int id = ((wxEvent*)self)->GetId();
	
	return BOX_INT( id );
}

object WXEUAPI_BASE wxEvent_GetEventUserData( object self )
{
	wxObject* userData = ((wxEvent*)self)->GetEventUserData();
	
	return BOX_INT( userData );
}

object WXEUAPI_BASE wxEvent_GetSkipped( object self )
{
	bool result = ((wxEvent*)self)->GetSkipped();
	
	return BOX_INT( result );
}

object WXEUAPI_BASE wxEvent_GetTimestamp( object self )
{
	long timestamp = ((wxEvent*)self)->GetTimestamp();
	
	return BOX_INT( timestamp );
}

object WXEUAPI_BASE wxEvent_IsCommandEvent( object self )
{
	bool result = ((wxEvent*)self)->IsCommandEvent();
	
	return BOX_INT( result );
}

void WXEUAPI_BASE wxEvent_ResumePropagation( object self, object propagationLevel )
{
	((wxEvent*)self)->ResumePropagation( get_int(propagationLevel) );
}

void WXEUAPI_BASE wxEvent_SetEventObject( object self, object obj )
{
	((wxEvent*)self)->SetEventObject( (wxObject*)obj );
}

void WXEUAPI_BASE wxEvent_SetEventType( object self, object eventType )
{
	((wxEvent*)self)->SetEventType( (wxEventType)get_int(eventType) );
}

void WXEUAPI_BASE wxEvent_SetId( object self, object id )
{
	((wxEvent*)self)->SetId( get_int(id) );
}

void WXEUAPI_BASE wxEvent_SetTimestamp( object self, object timeStamp )
{
	((wxEvent*)self)->SetTimestamp( get_int(timeStamp) );
}

object WXEUAPI_BASE wxEvent_ShouldPropagate( object self )
{
	bool result = ((wxEvent*)self)->ShouldPropagate();
	
	return BOX_INT( result );
}

void WXEUAPI_BASE wxEvent_Skip( object self, object skip )
{
	((wxEvent*)self)->Skip( get_int(skip) );
}

object WXEUAPI_BASE wxEvent_StopPropagation( object self )
{
	int result = ((wxEvent*)self)->StopPropagation();
	
	return BOX_INT( result );
}

};