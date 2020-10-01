
#include <wx/gdicmn.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxStockGDI_GetBrush( object item )
{
	const wxBrush* brush = wxStockGDI::GetBrush( static_cast<wxStockGDI::Item>(get_int(item)) );
	
	return BOX_INT( brush );
}

object WXEUAPI_CORE wxStockGDI_GetColour( object item )
{
	const wxColour* colour = wxStockGDI::GetColour( static_cast<wxStockGDI::Item>(get_int(item)) );
	
	return BOX_INT( colour );
}

object WXEUAPI_CORE wxStockGDI_GetCursor( object item )
{
	const wxCursor* cursor = wxStockGDI::GetCursor( static_cast<wxStockGDI::Item>(get_int(item)) );
	
	return BOX_INT( cursor );
}

object WXEUAPI_CORE wxStockGDI_GetFont( object item )
{
	const wxFont* font = wxStockGDI::instance().GetFont( static_cast<wxStockGDI::Item>(get_int(item)) );
	
	return BOX_INT( font );
}

object WXEUAPI_CORE wxStockGDI_GetPen( object item )
{
	const wxPen* pen = wxStockGDI::GetPen( static_cast<wxStockGDI::Item>(get_int(item)) );
	
	return BOX_INT( pen );
}

};