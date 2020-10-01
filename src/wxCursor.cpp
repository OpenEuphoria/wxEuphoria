
#include <wx/cursor.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxCursor_new( object cursorId )
{
	wxCursor* cursor = new wxCursor( (wxStockCursor)get_int(cursorId) );
	
	return BOX_INT( cursor );
}

};