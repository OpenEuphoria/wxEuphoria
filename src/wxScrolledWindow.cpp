
#include <wx/scrolwin.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxScrolledWindow_new( object parent, object id, object pos, object size, object style, object name )
{
	wxScrolledWindow* scrolwin = new wxScrolledWindow( get_object<wxWindow*>(parent), get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( scrolwin );
}

};