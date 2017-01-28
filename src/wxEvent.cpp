
#include <wx/event.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxEvent_Clone( object self )
{
	return BOX_INT( ((wxEvent*)self)->Clone() );
}

object WXEUAPI_BASE wxEvent_GetEventObject( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetEventObject() );
}

object WXEUAPI_BASE wxEvent_GetEventType( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetEventType() );
}

object WXEUAPI_BASE wxEvent_GetEventCategory( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetEventCategory() );
}

object WXEUAPI_BASE wxEvent_GetId( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetId() );
}

object WXEUAPI_BASE wxEvent_GetEventUserData( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetEventUserData() );
}

object WXEUAPI_BASE wxEvent_GetSkipped( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetSkipped() );
}

object WXEUAPI_BASE wxEvent_GetTimestamp( object self )
{
	return BOX_INT( ((wxEvent*)self)->GetTimestamp() );
}

object WXEUAPI_BASE wxEvent_IsCommandEvent( object self )
{
	return BOX_INT( ((wxEvent*)self)->IsCommandEvent() );
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
	return BOX_INT( ((wxEvent*)self)->ShouldPropagate() );
}

void WXEUAPI_BASE wxEvent_Skip( object self, object skip )
{
	((wxEvent*)self)->Skip( get_int(skip) );
}

object WXEUAPI_BASE wxEvent_StopPropagation( object self )
{
	return BOX_INT( ((wxEvent*)self)->StopPropagation() );
}

};