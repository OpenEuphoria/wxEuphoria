
#include <wx/panel.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxPanel_new( object parent, object id, object pos, object size, object style, object name )
{
	wxPanel* panel = new wxPanel( (wxWindow*)parent, get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( panel );
}

object WXEUAPI_CORE wxPanel_Create( object self, object parent, object id, object pos, object size, object style, object name )
{
	bool result = ((wxPanel*)self)->Create( (wxWindow*)parent, get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( result );
}

};