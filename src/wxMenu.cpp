
#include <wx/menu.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxMenu_new( object title, object style )
{
	wxMenu* menu;

	if ( !IS_SEQUENCE(title) )
	{
		menu = new wxMenu( get_int(style) );
	}
	else
	{
		wxDeRef( title );
		menu = new wxMenu( get_string(title), get_int(style) );
	}

	return BOX_INT( menu );
}

object WXEUAPI_CORE wxMenu_Append( object self, object id, object text, object help, object kind )
{
	wxMenuItem* item = ((wxMenu*)self)->Append( get_int(id), get_string(text), get_string(help), (wxItemKind)get_int(kind) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_AppendCheckItem( object self, object id, object text, object help )
{
	wxMenuItem* item = ((wxMenu*)self)->AppendCheckItem( get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_AppendMenuItem( object self, object menuItem )
{
	wxMenuItem* item = ((wxMenu*)self)->Append( (wxMenuItem*)menuItem );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_AppendRadioItem( object self, object id, object text, object help )
{
	wxMenuItem* item = ((wxMenu*)self)->AppendRadioItem( get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_AppendSeparator( object self )
{
	wxMenuItem* item = ((wxMenu*)self)->AppendSeparator();

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_AppendSubMenu( object self, object submenu, object text, object help )
{
	wxMenuItem* item = ((wxMenu*)self)->AppendSubMenu( (wxMenu*)submenu, get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( item );
}

void WXEUAPI_CORE wxMenu_Break( object self )
{
	((wxMenu*)self)->Break();
}

void WXEUAPI_CORE wxMenu_Check( object self, object id, object check )
{
	((wxMenu*)self)->Check( get_int(id), get_int(check) );
}

object WXEUAPI_CORE wxMenu_Delete( object self, object id )
{
	bool result = ((wxMenu*)self)->Delete( get_int(id) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_DeleteItem( object self, object item )
{
	bool result = ((wxMenu*)self)->Delete( (wxMenuItem*)item );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_Destroy( object self, object id )
{
	bool result = ((wxMenu*)self)->Destroy( get_int(id) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_DestroyItem( object self, object item )
{
	bool result = ((wxMenu*)self)->Destroy( (wxMenuItem*)item );

	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenu_Enable( object self, object id, object enable )
{
	((wxMenu*)self)->Enable( get_int(id), get_int(enable) );
}

object WXEUAPI_CORE wxMenu_FindChildItem( object self, object id )
{
	wxMenuItem* item = ((wxMenu*)self)->FindChildItem( get_int(id), NULL );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_FindChildItemWithPos( object self, object id )
{
	size_t pos;
	wxMenuItem* item = ((wxMenu*)self)->FindChildItem( get_int(id), &pos );

	s1_ptr s = NewS1( 2 );
	s->base[1] = BOX_INT( item );
	s->base[2] = BOX_INT( pos );

	return MAKE_SEQ( s );
}

object WXEUAPI_CORE wxMenu_FindItem( object self, object id )
{
	wxMenuItem* item = ((wxMenu*)self)->FindItem( get_int(id), NULL );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_FindItemByName( object self, object itemString )
{
	int id = ((wxMenu*)self)->FindItem( get_string(itemString) );

	wxDeRef( itemString );
	return BOX_INT( id );
}

object WXEUAPI_CORE wxMenu_FindItemByPosition( object self, object position )
{
	wxMenuItem* item = ((wxMenu*)self)->FindItemByPosition( get_int(position) );

	return BOX_INT( item );
}

object WXEUAPI_CORE wxMenu_FindItemWithMenu( object self, object id )
{
	wxMenu* menu = NULL;
	wxMenuItem* item = ((wxMenu*)self)->FindItem( get_int(id), &menu );

	s1_ptr s = NewS1( 2 );
	s->base[1] = BOX_INT( item );
	s->base[2] = BOX_INT( menu );

	return MAKE_SEQ( s );
}

object WXEUAPI_CORE wxMenu_GetHelpString( object self, object id )
{
	wxString helpString = ((wxMenu*)self)->GetHelpString( get_int(id) );

	return get_sequence( helpString );
}

object WXEUAPI_CORE wxMenu_GetInvokingWindow( object self )
{
	wxWindow* window = ((wxMenu*)self)->GetInvokingWindow();

	return BOX_INT( window );
}

object WXEUAPI_CORE wxMenu_GetLabel( object self, object id )
{
	wxString label = ((wxMenu*)self)->GetLabel( get_int(id) );

	return get_sequence( label );
}

object WXEUAPI_CORE wxMenu_GetLabelText( object self, object id )
{
	wxString labelText = ((wxMenu*)self)->GetLabelText( get_int(id) );

	return get_sequence( labelText );
}

object WXEUAPI_CORE wxMenu_GetMenuItemCount( object self )
{
	size_t count = ((wxMenu*)self)->GetMenuItemCount();

	return BOX_INT( count );
}

object WXEUAPI_CORE wxMenu_GetMenuItems( object self )
{
	wxMenuItemList menuItems = ((wxMenu*)self)->GetMenuItems();

	size_t count = menuItems.size();
	s1_ptr s = NewS1( count );

	for (int i = 0; i < count; i++) {
		s->base[i+1] = BOX_INT( menuItems[i] );
	}

	return MAKE_SEQ( s );
}

object WXEUAPI_CORE wxMenu_GetParent( object self )
{
	wxMenu* parent = ((wxMenu*)self)->GetParent();

	return BOX_INT( parent );
}

object WXEUAPI_CORE wxMenu_GetStyle( object self )
{
	long style = ((wxMenu*)self)->GetStyle();

	return BOX_INT( style );
}

object WXEUAPI_CORE wxMenu_GetTitle( object self )
{
	wxString title = ((wxMenu*)self)->GetTitle();

	return get_sequence( title );
}

object WXEUAPI_CORE wxMenu_GetWindow( object self )
{
	wxWindow* window = ((wxMenu*)self)->GetWindow();

	return BOX_INT( window );
}

object WXEUAPI_CORE wxMenu_Insert( object self, object pos, object menuItem )
{
	wxMenuItem* result = ((wxMenu*)self)->Insert( get_int(pos), (wxMenuItem*)menuItem );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_InsertItem( object self, object pos, object id, object item, object helpString, object kind )
{
	wxMenuItem* result = ((wxMenu*)self)->Insert( get_int(pos), get_int(id), get_string(item), get_string(helpString), (wxItemKind)kind );

	wxDeRef( helpString );
	wxDeRef( item );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_InsertCheckItem( object self, object pos, object id, object text, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->InsertCheckItem( get_int(pos), get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_InsertRadioItem( object self, object pos, object id, object text, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->InsertRadioItem( get_int(pos), get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_InsertSeparator( object self, object pos )
{
	wxMenuItem* result = ((wxMenu*)self)->InsertSeparator( get_int(pos) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_InsertSubMenu( object self, object pos, object id, object text, object submenu, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->Insert( get_int(pos), get_int(id), get_string(text), (wxMenu*)submenu, get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_IsChecked( object self, object id )
{
	bool result = ((wxMenu*)self)->IsChecked( get_int(id) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_IsEnabled( object self, object id )
{
	bool result = ((wxMenu*)self)->IsEnabled( get_int(id) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_Prepend( object self, object menuItem )
{
	wxMenuItem* result = ((wxMenu*)self)->Prepend( (wxMenuItem*)menuItem );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_PrependItem( object self, object id, object item, object helpString, object kind )
{
	wxMenuItem* result = ((wxMenu*)self)->Prepend( get_int(id), get_string(item), get_string(helpString), (wxItemKind)kind );

	wxDeRef( helpString );
	wxDeRef( item );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_PrependCheckItem( object self, object id, object text, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->PrependCheckItem( get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_PrependRadioItem( object self, object id, object text, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->PrependRadioItem( get_int(id), get_string(text), get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_PrependSeparator( object self )
{
	wxMenuItem* result = ((wxMenu*)self)->PrependSeparator();

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_PrependSubMenu( object self, object id, object text, object submenu, object help )
{
	wxMenuItem* result = ((wxMenu*)self)->Prepend( get_int(id), get_string(text), (wxMenu*)submenu, get_string(help) );

	wxDeRef( text );
	wxDeRef( help );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_Remove( object self, object id )
{
	wxMenuItem* result = ((wxMenu*)self)->Remove( get_int(id) );

	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenu_RemoveItem( object self, object item )
{
	wxMenuItem* result = ((wxMenu*)self)->Remove( (wxMenuItem*)item );

	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenu_SetHelpString( object self, object id, object help )
{
	((wxMenu*)self)->SetHelpString( get_int(id), get_string(help) );

	wxDeRef( help );
}

void WXEUAPI_CORE wxMenu_SetInvokingWindow( object self, object win )
{
	((wxMenu*)self)->SetInvokingWindow( (wxWindow*)win );
}

void WXEUAPI_CORE wxMenu_SetLabel( object self, object id, object text )
{
	((wxMenu*)self)->SetLabel( get_int(id), get_string(text) );

	wxDeRef( text );
}

void WXEUAPI_CORE wxMenu_SetParent( object self, object parent )
{
	((wxMenu*)self)->SetParent( (wxMenu*)parent );
}

void WXEUAPI_CORE wxMenu_SetTitle( object self, object title )
{
	((wxMenu*)self)->SetTitle( get_string(title) );

	wxDeRef( title );
}

void WXEUAPI_CORE wxMenu_UpdateUI( object self, object source )
{
	((wxMenu*)self)->UpdateUI( (wxEvtHandler*)source );
}

};
