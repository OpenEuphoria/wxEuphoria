
#include <wx/window.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object WXEUAPI_CORE wxWindow_new( object parent, object id, object pos, object size, object style, object name )
{
	wxWindow* window = new wxWindow( (wxWindow*)parent, (wxWindowID)id, get_point(pos), get_size(size), get_int(style), get_string(name) );

	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );

	return BOX_INT( window );
}

object WXEUAPI_CORE wxWindow_Create( object self, object parent, object id, object pos, object size, object style, object name )
{
	bool result = ((wxWindow*)self)->Create( (wxWindow*)parent, (wxWindowID)id, get_point(pos), get_size(size), get_int(style), get_string(name) );

	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );

	return BOX_INT( result );
}

/* Focus functions */

object WXEUAPI_CORE wxWindow_AcceptsFocus( object self )
{
	bool result = ((wxWindow*)self)->AcceptsFocus();

	return BOX_INT( result );
}

/* Window status functions */

object WXEUAPI_CORE wxWindow_Show( object self, object show )
{
	bool result = ((wxWindow*)self)->Show( get_int(show) );

	return BOX_INT( result );
}

/* Window deletion functions */

object WXEUAPI_CORE wxWindow_Close( object self, object force )
{
	bool result = ((wxWindow*)self)->Close( get_int(force) );

	return BOX_INT( result );
}

};
