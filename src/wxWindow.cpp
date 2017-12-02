
#include <wx/window.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object WXEUAPI_CORE wxWindow_new( object parent, object id, object pos, object size, object style, object name )
{
	wxWindow* window = new wxWindow( (wxWindow*)parent, (wxWindowID)id, get_point(pos), get_size(size), get_int(style), get_string(name) );

	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );

	return BOX_INT( window );
}

object WXEUAPI_CORE wxWindow_Create( intptr_t self, object parent, object id, object pos, object size, object style, object name )
{
	bool result = ((wxWindow*)self)->Create( (wxWindow*)parent, (wxWindowID)id, get_point(pos), get_size(size), get_int(style), get_string(name) );
//	bool result = wx_reinterpret_cast(wxWindow*, self)->Create( (wxWindow*)parent, (wxWindowID)id, get_point(pos), get_size(size), get_int(style), get_string(name) );

	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );

	return BOX_INT( result );
}

/* Sizing functions */

object WXEUAPI_CORE wxWindow_BeginRepositioningChildren( object self )
{
	bool result = ((wxWindow*)self)->BeginRepositioningChildren();

	return BOX_INT( result );
}

void WXEUAPI_CORE wxWindow_EndRepositioningChildren( object self )
{
	((wxWindow*)self)->EndRepositioningChildren();
}

void WXEUAPI_CORE wxWindow_CacheBestSize( object self, object size )
{
	((wxWindow*)self)->CacheBestSize( get_size(size) );

	wxDeRef( size );
}

object WXEUAPI_CORE wxWindow_ClientToWindowSize( object self, object size )
{
	wxSize result = ((wxWindow*)self)->ClientToWindowSize( get_size(size) );

	wxDeRef( size );
	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_WindowToClientSize( object self, object size )
{
	wxSize result = ((wxWindow*)self)->WindowToClientSize( get_size(size) );

	wxDeRef( size );
	return get_sequence( result );
}

void WXEUAPI_CORE wxWindow_Fit( object self )
{
	((wxWindow*)self)->Fit();
}

void WXEUAPI_CORE wxWindow_FitInside( object self )
{
	((wxWindow*)self)->FitInside();
}

object WXEUAPI_CORE wxWindow_FromDIP( object self, object d )
{
	int result = ((wxWindow*)self)->FromDIP( get_int(d) );

	return BOX_INT( result );
}


object WXEUAPI_CORE wxWindow_SizeFromDIP( object self, object size )
{
	wxSize result = ((wxWindow*)self)->FromDIP( get_size(size) );

	wxDeRef( size );
	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_PointFromDIP( object self, object point )
{
	wxPoint result = ((wxWindow*)self)->FromDIP( get_point(point) );

	wxDeRef( point );
	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_ToDIP( object self, object d )
{
	int result = ((wxWindow*)self)->ToDIP( get_int(d) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_SizeToDIP( object self, object size )
{
	wxSize result = ((wxWindow*)self)->ToDIP( get_size(size) );

	wxDeRef( size );
	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_PointToDIP( object self, object point )
{
	wxPoint result = ((wxWindow*)self)->ToDIP( get_point(point) );

	wxDeRef( point );
	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetBestSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetBestSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetBestHeight( object self, object height )
{
	int result = ((wxWindow*)self)->GetBestHeight( get_int(height) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetBestWidth( object self, object width )
{
	int result = ((wxWindow*)self)->GetBestWidth( get_int(width) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetClientSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetClientSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetEffectiveMinSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetEffectiveMinSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetMaxClientSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetMaxClientSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetMaxSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetMaxSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetMinClientSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetMinClientSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetMinSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetMinSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetMinWidth( object self )
{
	int result = ((wxWindow*)self)->GetMinWidth();

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetMinHeight( object self )
{
	int result = ((wxWindow*)self)->GetMinHeight();

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetMaxWidth( object self )
{
	int result = ((wxWindow*)self)->GetMaxWidth();

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetMaxHeight( object self )
{
	int result = ((wxWindow*)self)->GetMaxHeight();

	return BOX_INT( result );
}

object WXEUAPI_CORE wxWindow_GetSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetVirtualSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetVirtualSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetBestVirtualSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetBestVirtualSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_GetContentScaleFactor( object self )
{
	double result = ((wxWindow*)self)->GetContentScaleFactor();

	return get_atom( result );
}

object WXEUAPI_CORE wxWindow_GetWindowBorderSize( object self )
{
	wxSize result = ((wxWindow*)self)->GetWindowBorderSize();

	return get_sequence( result );
}

object WXEUAPI_CORE wxWindow_InformFirstDirection( object self, object direction, object size, object availableOtherDir )
{
	bool result = ((wxWindow*)self)->InformFirstDirection( get_int(direction), get_int(size), get_int(availableOtherDir) );

	return BOX_INT( result );
}

void WXEUAPI_CORE wxWindow_InvalidateBestSize( object self )
{
	((wxWindow*)self)->InvalidateBestSize();
}


/* Focus functions */

object WXEUAPI_CORE wxWindow_AcceptsFocus( object self )
{
	bool result = ((wxWindow*)self)->AcceptsFocus();

	return BOX_INT( result );
}

/* Child management functions */

/* Sibling and parent management functions */

/* Scrolling and scrollbars functions */

/* Positioning functions */

/* Coordinate conversion functions */

/* Drawing-related functions */

object WXEUAPI_CORE wxWindow_SetFont( object self, object font )
{
	bool result = ((wxWindow*)self)->SetFont( *(wxFont*)font );
	
	return BOX_INT( result );
}

/* Event-handling functions */

/* Window styles functions */

/* Tab order functions */

/* Z order functions */

/* Window status functions */

object WXEUAPI_CORE wxWindow_Show( object self, object show )
{
	bool result = ((wxWindow*)self)->Show( get_int(show) );

	return BOX_INT( result );
}

/* Context-sensitive help functions */

/* Popup/context menu functions */

/* wxWindow properties functions */

/* Window deletion functions */

object WXEUAPI_CORE wxWindow_Close( object self, object force )
{
	bool result = ((wxWindow*)self)->Close( get_int(force) );

	return BOX_INT( result );
}

/* Drag and drop functions */

/* Constraints, sizers and window layout functions */

/* Mouse functions */

/* Miscellaneous functions */



};
