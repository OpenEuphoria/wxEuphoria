
#include <wx/button.h>
#include "WxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxButton_new( object parent, object id, object title, object pos, object size, object style, object validator, object name )
{
	wxButton* button = new wxButton( (wxWindow*)parent, get_int(id), get_string(title), get_point(pos), get_size(size), get_int(style), wxDefaultValidator, get_string(name) );
	
	return BOX_INT( button );
}

};