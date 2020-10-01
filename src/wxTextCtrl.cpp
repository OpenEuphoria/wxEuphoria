
#include <wx/textctrl.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxTextCtrl_new( object parent, object id, object value, object pos, object size, object style, object validator, object name )
{
	wxTextCtrl* textctrl = new wxTextCtrl( (wxWindow*)parent, get_int(id), get_string(value), get_point(pos), get_size(size), get_int(style), *(wxValidator*)validator, get_string(name) );
	
	wxDeRef( value );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( textctrl );
}

object WXEUAPI_CORE wxTextCtrl_Create( object self, object parent, object id, object value, object pos, object size, object style, object validator, object name )
{
	bool result = ((wxTextCtrl*)self)->Create( (wxWindow*)parent, get_int(id), get_string(value), get_point(pos), get_size(size), get_int(style), *(wxValidator*)validator, get_string(name) );
	
	wxDeRef( value );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( result );
}

};