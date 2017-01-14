
#include <wx/panel.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxPanel_new( object parent, object id, object pos, object size, object style, object name )
{
	wxPanel* panel = new wxPanel( (wxWindow*)parent, get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	return BOX_INT( panel );
}

};