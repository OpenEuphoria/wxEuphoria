
#include <wx/object.h>
#include "wxEuphoria.h"

#ifdef WXEUMSW
// N.B. this undefs "GetClassInfo"
// http://trac.wxwidgets.org/ticket/2421
#include <wx/msw/winundef.h>
#endif

extern "C" {

object WXEUAPI_BASE wxObject_GetClassInfo( object self )
{
	return BOX_INT( ((wxObject*)self)->GetClassInfo() );
}

// TODO - do we need ref data?
//object WXEUAPI_BASE wxObject_GetRefData( object self )
//{
//	return BOX_INT( ((wxObject*)self)->GetRefData() );
//}

object WXEUAPI_BASE wxObject_IsKindOf( object self, object info )
{
	return BOX_INT( ((wxObject*)self)->IsKindOf((wxClassInfo*)info) );
}

object WXEUAPI_BASE wxObject_IsSameAs( object self, object obj )
{
	return BOX_INT( ((wxObject*)self)->IsSameAs(*(wxObject*)obj) );
}

// TODO - do we need ref data?
//void WXEUAPI_BASE wxObject_SetRefData( object self, object data )
//{
//	((wxObject*)self)->SetRefData( (wxObjectRefData*)data );
//}

};