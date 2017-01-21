
#include "wx/object.h"
#include "wxEuphoria.h"

#ifdef WXEUMSW
// N.B. this undefs "GetClassInfo"
// http://trac.wxwidgets.org/ticket/2421
#include <wx/msw/winundef.h>
#endif

extern "C" {

object WXEUAPI_BASE wxClassInfo_new( object className )
{
	wxDeRef( className );
	return BOX_INT( wxClassInfo::FindClass( get_string(className) ) );
}

object WXEUAPI_BASE wxClassInfo_CreateObject( object self )
{
	return BOX_INT( ((wxClassInfo*)self)->CreateObject() );
}

object WXEUAPI_BASE wxClassInfo_GetBaseClassName1( object self )
{
	return get_sequence( ((wxClassInfo*)self)->GetBaseClassName1() );
}

object WXEUAPI_BASE wxClassInfo_GetBaseClassName2( object self )
{
	return get_sequence( ((wxClassInfo*)self)->GetBaseClassName2() );
}

object WXEUAPI_BASE wxClassInfo_GetClassName( object self )
{
	return get_sequence( ((wxClassInfo*)self)->GetClassName() );
}

};