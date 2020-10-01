
#include <wx/splitter.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxSplitterWindow_new( object parent, object id, object pos, object size, object style, object name )
{
	wxSplitterWindow* splitter = new wxSplitterWindow( get_object<wxWindow*>(parent), get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( splitter );
}

object WXEUAPI_CORE wxSplitterWindow_Create( object self, object parent, object id, object pos, object size, object style, object name )
{
	bool result = ((wxSplitterWindow*)self)->Create( get_object<wxWindow*>(parent), get_int(id), get_point(pos), get_size(size), get_int(style), get_string(name) );
	
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxSplitterWindow_GetMinimumPaneSize( object self )
{
	int size = ((wxSplitterWindow*)self)->GetMinimumPaneSize();
	
	return BOX_INT( size );
}

object WXEUAPI_CORE wxSplitterWindow_GetSashGravity( object self )
{
	double gravity = ((wxSplitterWindow*)self)->GetSashGravity();
	
	return NewDouble( gravity );
}

object WXEUAPI_CORE wxSplitterWindow_GetSashPosition( object self )
{
	int pos = ((wxSplitterWindow*)self)->GetSashPosition();
	
	return BOX_INT( pos );
}

object WXEUAPI_CORE wxSplitterWindow_GetSashSize( object self )
{
	int size = ((wxSplitterWindow*)self)->GetSashSize();
	
	return BOX_INT( size );
}

object WXEUAPI_CORE wxSplitterWindow_GetDefaultSashSize( object self )
{
	int size = ((wxSplitterWindow*)self)->GetDefaultSashSize();
	
	return BOX_INT( size );
}

object WXEUAPI_CORE wxSplitterWindow_GetSplitMode( object self )
{
	wxSplitMode mode = ((wxSplitterWindow*)self)->GetSplitMode();
	
	return BOX_INT( mode );
}

object WXEUAPI_CORE wxSplitterWindow_GetWindow1( object self )
{
	wxWindow* window = ((wxSplitterWindow*)self)->GetWindow1();
	
	return BOX_INT( window );
}

object WXEUAPI_CORE wxSplitterWindow_GetWindow2( object self )
{
	wxWindow* window = ((wxSplitterWindow*)self)->GetWindow2();
	
	return BOX_INT( window );
}

void WXEUAPI_CORE wxSplitterWindow_Initialize( object self, object window )
{
	((wxSplitterWindow*)self)->Initialize( get_object<wxWindow*>(window) );
}

object WXEUAPI_CORE wxSplitterWindow_IsSashInvisible( object self )
{
	bool result = ((wxSplitterWindow*)self)->IsSashInvisible();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxSplitterWindow_IsSplit( object self )
{
	bool result = ((wxSplitterWindow*)self)->IsSplit();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxSplitterWindow_ReplaceWindow( object self, object oldWin, object newWin )
{
	bool result = ((wxSplitterWindow*)self)->ReplaceWindow( get_object<wxWindow*>(oldWin), get_object<wxWindow*>(newWin) );
	
	return BOX_INT( result );
}

void WXEUAPI_CORE wxSplitterWindow_SetMinimumPaneSize( object self, object paneSize )
{
	((wxSplitterWindow*)self)->SetMinimumPaneSize( get_int(paneSize) );
}

void WXEUAPI_CORE wxSplitterWindow_SetSashGravity( object self, object gravity )
{
	((wxSplitterWindow*)self)->SetSashGravity( get_double(gravity) );
}

void WXEUAPI_CORE wxSplitterWindow_SetSashPosition( object self, object position, object redraw )
{
	((wxSplitterWindow*)self)->SetSashPosition( get_int(position), get_int(redraw) );
}

void WXEUAPI_CORE wxSplitterWindow_SetSplitMode( object self, object mode )
{
	((wxSplitterWindow*)self)->SetSplitMode( get_int(mode) );
}

void WXEUAPI_CORE wxSplitterWindow_SetSashInvisible( object self, object invisible )
{
	((wxSplitterWindow*)self)->SetSashInvisible( get_int(invisible) );
}

object WXEUAPI_CORE wxSplitterWindow_SplitHorizontally( object self, object window1, object window2, object sashPosition )
{
	bool result = ((wxSplitterWindow*)self)->SplitHorizontally( get_object<wxWindow*>(window1), get_object<wxWindow*>(window2), get_int(sashPosition) );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxSplitterWindow_SplitVertically( object self, object window1, object window2, object sashPosition )
{
	bool result = ((wxSplitterWindow*)self)->SplitVertically( get_object<wxWindow*>(window1), get_object<wxWindow*>(window2), get_int(sashPosition) );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxSplitterWindow_Unsplit( object self, object toRemove )
{
	bool result = ((wxSplitterWindow*)self)->Unsplit( get_object<wxWindow*>(toRemove) );
	
	return BOX_INT( result );
}

void WXEUAPI_CORE wxSplitterWindow_UpdateSize( object self )
{
	((wxSplitterWindow*)self)->UpdateSize();
}

};