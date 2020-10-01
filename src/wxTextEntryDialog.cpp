
#include <wx/textdlg.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxTextEntryDialog_wxGetTextFromUser( object message, object caption, object default_value, object parent, object x, object y, object centre )
{
	wxString result = wxGetTextFromUser( get_string(message), get_string(caption), get_string(default_value), get_object<wxWindow*>(parent), get_int(x), get_int(y), get_int(centre) );
	
	wxDeRef( message );
	wxDeRef( caption );
	wxDeRef( default_value );
	
	return get_sequence( result );
}

};