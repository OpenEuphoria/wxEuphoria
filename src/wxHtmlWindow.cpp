
#include <wx/html/htmlwin.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object wxHtmlWindow_new( object parent, object id, object pos, object size, object style, object validator, object name )
{
	wxHtmlWindow* htmlwin = new wxHtmlWindow( (wxWindow*)parent, get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( htmlwin );
}

};