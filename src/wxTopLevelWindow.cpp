
#include <wx/toplevel.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxTopLevelWindow_new( object parent, object id, object title, object pos, object size, object style, object name )
{
	wxTopLevelWindow* window = new wxTopLevelWindow( (wxWindow*)parent, get_int(id), get_string(title), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( title );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( window );
}

object WXEUAPI_CORE wxTopLevelWindow_Create( object self, object parent, object id, object title, object pos, object size, object style, object name )
{
	bool result = ((wxTopLevelWindow*)self)->Create( (wxWindow*)parent, get_int(id), get_string(title), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( title );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxTopLevelWindow_CanSetTransparent( object self )
{
	return BOX_INT( ((wxTopLevelWindow*)self)->CanSetTransparent() );
}

void WXEUAPI_CORE wxTopLevelWindow_CenterOnScreen( object self, object direction )
{
	((wxTopLevelWindow*)self)->CenterOnScreen( get_int(direction) );
}

void WXEUAPI_CORE wxTopLevelWindow_CentreOnScreen( object self, object direction )
{
	((wxTopLevelWindow*)self)->CentreOnScreen( get_int(direction) );
}

object WXEUAPI_CORE wxTopLevelWindow_EnableCloseButton( object self, object enable )
{
	return BOX_INT( ((wxTopLevelWindow*)self)->EnableCloseButton( get_int(enable) ) );
}

object WXEUAPI_CORE wxTopLevelWindow_GetDefaultItem( object self )
{
	return BOX_INT( ((wxTopLevelWindow*)self)->GetDefaultItem() );
}

object WXEUAPI_CORE wxTopLevelWindow_GetIcon( object self )
{
	wxIcon* icon = new wxIcon();
	*icon = ((wxTopLevelWindow*)self)->GetIcon();
	
	return BOX_INT( icon );
}

void WXEUAPI_CORE wxTopLevelWindow_SetIcon( object self, object icon )
{
	((wxTopLevelWindow*)self)->SetIcon( *(wxIcon*)icon );
}

};