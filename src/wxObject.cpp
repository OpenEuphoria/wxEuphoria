
#include <wx/object.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxObject_GetClassInfo( object self )
{
	return BOX_INT( ((wxObject*)self)->GetClassInfo() );
}

object WXEUAPI_BASE wxObject_GetRefData( object self )
{
	return BOX_INT( ((wxObject*)self)->GetRefData() );
}

object WXEUAPI_BASE wxObject_IsKindOf( object self, object info )
{
	return BOX_INT( ((wxObject*)self)->IsKindOf((wxClassInfo*)info) );
}

object WXEUAPI_BASE wxObject_IsSameAs( object self, object obj )
{
	return BOX_INT( ((wxObject*)self)->IsSameAs(*(wxObject*)obj) );
}

};