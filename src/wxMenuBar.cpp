
#include <wx/menu.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

object WXEUAPI_CORE wxMenuBar_new( object style )
{
	wxMenuBar* mbar = new wxMenuBar( get_int(style) );
	
	return BOX_INT( mbar );
}

object WXEUAPI_CORE wxMenuBar_Append( object self, object menu, object title )
{
	bool result = ((wxMenuBar*)self)->Append( (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenuBar_Attach( object self, object frame )
{
	((wxMenuBar*)self)->Attach( (wxFrame*)frame );
}

void WXEUAPI_CORE wxMenuBar_Check( object self, object id, object check )
{
	((wxMenuBar*)self)->Check( get_int(id), get_int(check) );
}

void WXEUAPI_CORE wxMenuBar_Detach( object self )
{
	((wxMenuBar*)self)->Detach();
}

void WXEUAPI_CORE wxMenuBar_Enable( object self, object id, object enable )
{
	((wxMenuBar*)self)->Enable( get_int(id), get_int(enable) );
}

void WXEUAPI_CORE wxMenuBar_EnableTop( object self, object pos, object enable )
{
	((wxMenuBar*)self)->EnableTop( get_int(pos), get_int(enable) );
}

object WXEUAPI_CORE wxMenuBar_FindItem( object self, object id )
{
	wxMenu* menu = NULL;
	wxMenuItem* item = ((wxMenuBar*)self)->FindItem( get_int(id), &menu );
	
	s1_ptr s = NewS1( 2 );
	s->base[1] = BOX_INT( item );
	s->base[2] = BOX_INT( menu );
	
	return MAKE_SEQ( s );
}

object WXEUAPI_CORE wxMenuBar_FindMenu( object self, object title )
{
	int index = ((wxMenuBar*)self)->FindMenu( get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( index );
}

object WXEUAPI_CORE wxMenuBar_FindMenuItem( object self, object menuString, object itemString )
{
	int id = ((wxMenuBar*)self)->FindMenuItem( get_string(menuString), get_string(itemString) );
	
	wxDeRef( menuString );
	wxDeRef( itemString );
	
	return BOX_INT( id );
}

object WXEUAPI_CORE wxMenuBar_GetFrame( object self )
{
	wxFrame* frame = ((wxMenuBar*)self)->GetFrame();
	
	return BOX_INT( frame );
}

object WXEUAPI_CORE wxMenuBar_GetHelpString( object self, object id )
{
	wxString helpString = ((wxMenuBar*)self)->GetHelpString( get_int(id) );
	
	return get_sequence( helpString );
}

object WXEUAPI_CORE wxMenuBar_GetLabel( object self, object id )
{
	wxString label = ((wxMenuBar*)self)->GetLabel( get_int(id) );
	
	return get_sequence( label );
}

object WXEUAPI_CORE wxMenuBar_GetMenu( object self, object menuIndex )
{
	wxMenu* menu = ((wxMenuBar*)self)->GetMenu( get_int(menuIndex) );
	
	return BOX_INT( menu );
}

object WXEUAPI_CORE wxMenuBar_GetMenuCount( object self )
{
	int count = ((wxMenuBar*)self)->GetMenuCount();
	
	return BOX_INT( count );
}

object WXEUAPI_CORE wxMenuBar_GetMenuLabel( object self, object pos )
{
	wxString label = ((wxMenuBar*)self)->GetMenuLabel( get_int(pos) );
	
	return get_sequence( label );
}

object WXEUAPI_CORE wxMenuBar_GetMenuLabelText( object self, object pos )
{
	wxString labelText = ((wxMenuBar*)self)->GetMenuLabelText( get_int(pos) );
	
	return get_sequence( labelText );
}

object WXEUAPI_CORE wxMenuBar_Insert( object self, object pos, object menu, object title )
{
	bool result = ((wxMenuBar*)self)->Insert( get_int(pos), (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenuBar_IsAttached( object self )
{
	bool result = ((wxMenuBar*)self)->IsAttached();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenuBar_IsChecked( object self, object id )
{
	bool result = ((wxMenuBar*)self)->IsChecked( get_int(id) );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenuBar_IsEnabled( object self, object id )
{
	bool result = ((wxMenuBar*)self)->IsEnabled( get_int(id) );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenuBar_IsEnabledTop( object self, object pos )
{
	bool result = ((wxMenuBar*)self)->IsEnabledTop( get_int(pos) );
	
	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenuBar_Refresh( object self, object eraseBackground, object rect )
{
	wxRect rc = get_rect( rect );
	((wxMenuBar*)self)->Refresh( get_int(eraseBackground), &rc );
	
	wxDeRef( rect );
}

object WXEUAPI_CORE wxMenuBar_Remove( object self, object pos )
{
	wxMenu* menu = ((wxMenuBar*)self)->Remove( get_int(pos) );
	
	return BOX_INT( menu );
}

object WXEUAPI_CORE wxMenuBar_Replace( object self, object pos, object menu, object title )
{
	wxMenu* result = ((wxMenuBar*)self)->Replace( get_int(pos), (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenuBar_SetHelpString( object self, object id, object helpString )
{
	((wxMenuBar*)self)->SetHelpString( get_int(id), get_string(helpString) );
	wxDeRef( helpString );
}

void WXEUAPI_CORE wxMenuBar_SetLabel( object self, object id, object label )
{
	((wxMenuBar*)self)->SetLabel( get_int(id), get_string(label) );
	wxDeRef( label );
}

void WXEUAPI_CORE wxMenuBar_SetMenuLabel( object self, object pos, object label )
{
	((wxMenuBar*)self)->SetMenuLabel( get_int(pos), get_string(label) );
	wxDeRef( label );
}

object WXEUAPI_CORE wxMenuBar_OSXGetAppleMenu( object self )
{
	wxMenu* menu = NULL;
#ifdef WXEUMAC
	menu = ((wxMenu*)self)->OSXGetAppleMenu();
#endif
	return BOX_INT( menu );
}

/* Static Public Member Functions */

void WXEUAPI_CORE wxMenuBar_MacSetCommonMenuBar( object menubar )
{
#ifdef WXEUMAC
	wxMenuBar::MacSetCommonMenuBar( (wxMenuBar*)menubar );
#endif
}

object WXEUAPI_CORE wxMenuBar_MacGetCommonMenuBar()
{
	wxMenuBar* menuBar = NULL;
#ifdef WXEUMAC
	menuBar = wxMenuBar::MacGetCommonMenuBar();
#endif
	return BOX_INT( menuBar );
}

};