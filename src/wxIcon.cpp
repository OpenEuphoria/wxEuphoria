
#include <wx/icon.h>
#include <wx/bitmap.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object WXEUAPI_CORE wxIcon_new( object iconName, object iconType, object desiredWidth, object desiredHeight )
{
	wxIcon* icon = new wxIcon(
		get_string(iconName),
		(wxBitmapType)get_int(iconType),
		get_int(desiredWidth),
		get_int(desiredHeight)
	);
	
	wxDeRef( iconName );
	return BOX_INT( icon );
}

object WXEUAPI_CORE wxIcon_CreateFromHICON( object hicon )
{
	wxIcon* icon = NULL;
	
#ifdef WXEUMSW
	wxIcon* temp = new wxIcon();
	if ( temp->CreateFromHICON((WXHICON)hicon) ) {
		icon = temp;
	}
#endif

	return BOX_INT( icon );
}

object WXEUAPI_CORE wxIcon_CreateFromIcon( object orig )
{
	wxIcon* icon = new wxIcon( *(wxIcon*)orig );
	
	return BOX_INT( icon );
}

object WXEUAPI_CORE wxIcon_CreateFromXPM( object data )
{
	char** xpm = get_xpm( data );
	intptr_t len = LENGTH( data );
	
	wxIcon* icon = new wxIcon( xpm );
	
	wxDeRef( data );
	free_xpm( xpm, len );
	
	return BOX_INT( icon );
}

object WXEUAPI_CORE wxIcon_ConvertToDisabled( object self, object brightness )
{
	wxIcon* icon = NULL;
	
#ifdef WXEUMSW
	icon = new wxIcon();
	*icon = ((wxIcon*)self)->ConvertToDisabled( get_int(brightness) );
#endif
	
	return BOX_INT( icon );
}

void WXEUAPI_CORE wxIcon_CopyFromBitmap( object self, object bmp )
{
	((wxIcon*)self)->CopyFromBitmap( *(wxBitmap*)bmp );
}

object WXEUAPI_CORE wxIcon_GetDepth( object self )
{
	int depth = ((wxIcon*)self)->GetDepth();
	
	return BOX_INT( depth );
}

object WXEUAPI_CORE wxIcon_GetHeight( object self )
{
	int height = ((wxIcon*)self)->GetHeight();
	
	return BOX_INT( height );
}

object WXEUAPI_CORE wxIcon_GetWidth( object self )
{
	int width = ((wxIcon*)self)->GetWidth();
	
	return BOX_INT( width );
}

object WXEUAPI_CORE wxIcon_IsOk( object self )
{
	bool result = ((wxIcon*)self)->IsOk();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxIcon_LoadFile( object self, object name, object iconType, object desiredWidth, object desiredHeight )
{
	bool result = ((wxIcon*)self)->LoadFile(
		get_string(name),
		(wxBitmapType)get_int(iconType),
		get_int(desiredWidth),
		get_int(desiredHeight)
	);
	
	wxDeRef( name );
	
	return BOX_INT( result );
}

void WXEUAPI_CORE wxIcon_SetDepth( object self, object depth )
{
	((wxIcon*)self)->SetDepth( get_int(depth) );
}

void WXEUAPI_CORE wxIcon_SetHeight( object self, object height )
{
	((wxIcon*)self)->SetHeight( get_int(height) );
}

void WXEUAPI_CORE wxIcon_SetWidth( object self, object width )
{
	((wxIcon*)self)->SetWidth( get_int(width) );
}

};