
#include <wx/font.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxFont_new( object pointSize, object family, object style, object weight, object underline, object faceName, object encoding )
{
	wxFont* font = new wxFont( get_int(pointSize), (wxFontFamily)family, (wxFontStyle)style, (wxFontWeight)weight, get_int(underline), get_string(faceName), (wxFontEncoding)encoding );
	
	wxDeRef( faceName );
	
	return BOX_INT( font );
}

};