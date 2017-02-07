
#include <wx/icon.h>
#include <wx/bitmap.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxIcon_new( object iconData, object iconType, object desiredWidth, object desiredHeight )
{
	wxIcon* icon = NULL;
	
	if ( IS_SEQUENCE(iconData) )
	{
		s1_ptr s = SEQ_PTR( iconData );
		if ( IS_SEQUENCE(s->base[1]) )
		{
			char** xpm = get_xpm( iconData );
			intptr_t len = s->length;
			
			icon = new wxIcon( xpm );
			
			free_xpm( xpm, len );
		}
		else
		{
			icon = new wxIcon( get_string(iconData),
				(wxBitmapType)get_int(iconType),
				get_int(desiredWidth),
				get_int(desiredHeight)
			);
		}
		
		wxDeRef( iconData );
	}
	else
	{
		icon = new wxIcon( (char*)iconData, get_int(desiredWidth), get_int(desiredHeight) );
	}
	
	return BOX_INT( icon );
}

};