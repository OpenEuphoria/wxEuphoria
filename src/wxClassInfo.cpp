
#include "wx/object.h"
#include "wxEuphoria.h"

#ifdef WXEUMSW
// N.B. this undefs "GetClassInfo"
// http://trac.wxwidgets.org/ticket/2421
#include <wx/msw/winundef.h>
#endif

extern "C" {

/* Public Member Functions */

object WXEUAPI_BASE wxClassInfo_new( object className, object baseClass1, object baseClass2, object size, object fn )
{
	wxClassInfo* info = new wxClassInfo( get_string(className), (wxClassInfo*)baseClass1,
		(wxClassInfo*)baseClass2, get_int(size), (wxObjectConstructorFn)get_int(fn) );
	
	wxDeRef( className );
	wxDeRef( baseClass1 );
	wxDeRef( baseClass2 );
	
	return BOX_INT( info );
}

object WXEUAPI_BASE wxClassInfo_CreateObject( object self )
{
	wxClassInfo* info = NULL;
	
	if ( IS_SEQUENCE(self) ) {
		wxDeRef( self );
		info = wxClassInfo::FindClass( get_string(self) );
	}
	else {
		info = (wxClassInfo*)self;
	}
	
	return BOX_INT( info->CreateObject() );
}

object WXEUAPI_BASE wxClassInfo_GetBaseClassName1( object self )
{
	wxString className = ((wxClassInfo*)self)->GetBaseClassName1();
	
	return get_sequence( className );
}

object WXEUAPI_BASE wxClassInfo_GetBaseClassName2( object self )
{
	wxString className = ((wxClassInfo*)self)->GetBaseClassName2();
	
	return get_sequence( className );
}

object WXEUAPI_BASE wxClassInfo_GetClassName( object self )
{
	wxString className = ((wxClassInfo*)self)->GetClassName();
	
	return get_sequence( className );
}

/* Static Public Member Functions */

object WXEUAPI_BASE wxClassInfo_FindClass( object className )
{
	wxClassInfo* info = wxClassInfo::FindClass( get_string(className) );
	
	wxDeRef( className );
	return BOX_INT( info );
}

};