
#include <wx/menu.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_CORE wxMenuBar_new( object style )
{
	wxMenuBar* mbar = new wxMenuBar( get_int(style) );
	return BOX_INT( mbar );
}

object WXEUAPI_CORE wxMenuBar_Append( object mbar, object menu, object title )
{
	bool result = ((wxMenuBar*)mbar)->Append( (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenuBar_Attach( object mbar, object frame )
{
	((wxMenuBar*)mbar)->Attach( (wxFrame*)frame );
}

void WXEUAPI_CORE wxMenuBar_Check( object mbar, object id, object check )
{
	((wxMenuBar*)mbar)->Check( get_int(id), get_int(check) );
}

void WXEUAPI_CORE wxMenuBar_Detach( object mbar )
{
	((wxMenuBar*)mbar)->Detach();
}

void WXEUAPI_CORE wxMenuBar_Enable( object mbar, object id, object enable )
{
	((wxMenuBar*)mbar)->Enable( get_int(id), get_int(enable) );
}

void WXEUAPI_CORE wxMenuBar_EnableTop( object mbar, object pos, object enable )
{
	((wxMenuBar*)mbar)->EnableTop( get_int(pos), get_int(enable) );
}

object WXEUAPI_CORE wxMenuBar_FindItem( object mbar, object id )
{
	wxMenu* menu = NULL;
	wxMenuItem* item = ((wxMenuBar*)mbar)->FindItem( get_int(id), &menu );
	
	s1_ptr s = NewS1( 2 );
	s->base[1] = BOX_INT( item );
	s->base[2] = BOX_INT( menu );
	
	return MAKE_SEQ( s );
}

object WXEUAPI_CORE wxMenuBar_FindMenu( object mbar, object title )
{
	int index = ((wxMenuBar*)mbar)->FindMenu( get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( index );
}

object WXEUAPI_CORE wxMenuBar_FindMenuItem( object mbar, object menuString, object itemString )
{
	int id = ((wxMenuBar*)mbar)->FindMenuItem( get_string(menuString), get_string(itemString) );
	
	wxDeRef( menuString );
	wxDeRef( itemString );
	
	return BOX_INT( id );
}

object WXEUAPI_CORE wxMenuBar_GetFrame( object mbar )
{
	return BOX_INT( ((wxMenuBar*)mbar)->GetFrame() );
}

object WXEUAPI_CORE wxMenuBar_GetHelpString( object mbar, object id )
{
	return get_sequence( ((wxMenuBar*)mbar)->GetHelpString( get_int(id) ) );
}

object WXEUAPI_CORE wxMenuBar_GetLabel( object mbar, object id )
{
	return get_sequence( ((wxMenuBar*)mbar)->GetLabel( get_int(id) ) );
}

object WXEUAPI_CORE wxMenuBar_GetMenu( object mbar, object menuIndex )
{
	return BOX_INT( ((wxMenuBar*)mbar)->GetMenu( get_int(menuIndex) ) );
}

object WXEUAPI_CORE wxMenuBar_GetMenuCount( object mbar )
{
	return BOX_INT( ((wxMenuBar*)mbar)->GetMenuCount() );
}

object WXEUAPI_CORE wxMenuBar_GetMenuLabel( object mbar, object pos )
{
	return get_sequence( ((wxMenuBar*)mbar)->GetMenuLabel( get_int(pos) ) );
}

object WXEUAPI_CORE wxMenuBar_GetMenuLabelText( object mbar, object pos )
{
	return get_sequence( ((wxMenuBar*)mbar)->GetMenuLabelText( get_int(pos) ) );
}

object WXEUAPI_CORE wxMenuBar_Insert( object mbar, object pos, object menu, object title )
{
	bool result = ((wxMenuBar*)mbar)->Insert( get_int(pos), (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

object WXEUAPI_CORE wxMenuBar_IsAttached( object mbar )
{
	return BOX_INT( ((wxMenuBar*)mbar)->IsAttached() );
}

object WXEUAPI_CORE wxMenuBar_IsChecked( object mbar, object id )
{
	return BOX_INT( ((wxMenuBar*)mbar)->IsChecked( get_int(id) ) );
}

object WXEUAPI_CORE wxMenuBar_IsEnabled( object mbar, object id )
{
	return BOX_INT( ((wxMenuBar*)mbar)->IsEnabled( get_int(id) ) );
}

object WXEUAPI_CORE wxMenuBar_IsEnabledTop( object mbar, object pos )
{
	return ((wxMenuBar*)mbar)->IsEnabledTop( get_int(pos) );
}

void WXEUAPI_CORE wxMenuBar_Refresh( object mbar, object eraseBackground, object rect )
{
	wxRect rc = get_rect( rect );
	((wxMenuBar*)mbar)->Refresh( get_int(eraseBackground), &rc );
	
	wxDeRef( rect );
}

object WXEUAPI_CORE wxMenuBar_Remove( object mbar, object pos )
{
	return BOX_INT( ((wxMenuBar*)mbar)->Remove( get_int(pos) ) );
}

object WXEUAPI_CORE wxMenuBar_Replace( object mbar, object pos, object menu, object title )
{
	wxMenu* result = ((wxMenuBar*)mbar)->Replace( get_int(pos), (wxMenu*)menu, get_string(title) );
	
	wxDeRef( title );
	return BOX_INT( result );
}

void WXEUAPI_CORE wxMenuBar_SetHelpString( object mbar, object id, object helpString )
{
	((wxMenuBar*)mbar)->SetHelpString( get_int(id), get_string(helpString) );
	wxDeRef( helpString );
}

void WXEUAPI_CORE wxMenuBar_SetLabel( object mbar, object id, object label )
{
	((wxMenuBar*)mbar)->SetLabel( get_int(id), get_string(label) );
	wxDeRef( label );
}

void WXEUAPI_CORE wxMenuBar_SetMenuLabel( object mbar, object pos, object label )
{
	((wxMenuBar*)mbar)->SetMenuLabel( get_int(pos), get_string(label) );
	wxDeRef( label );
}

};