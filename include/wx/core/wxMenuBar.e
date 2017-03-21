
namespace wxMenuBar

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/frame.e"
include "wx/menu.e"
include "wx/gdicmn.e"

public include "wx/object.e"

constant wxMenuBarInfo = wxClassInfo:FindClass( "wxMenuBar" )

public type wxMenuBar( object x )
	return wxObject:IsKindOf( x, wxMenuBarInfo )
end type

public function new( atom style )
	return wx_func( WXMENUBAR_NEW, {style} )
end function

public function Append( wxMenuBar mbar, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_APPEND, {mbar,menu,title} )
end function

public procedure Attach( wxMenuBar mbar, wxFrame frame )
	wx_proc( WXMENUBAR_ATTACH, {mbar,frame} )
end procedure

public procedure Check( wxMenuBar mbar, atom id, atom check )
	wx_proc( WXMENUBAR_CHECK, {mbar,id,check} )
end procedure

public procedure Detach( wxMenuBar mbar )
	wx_proc( WXMENUBAR_DETACH, {mbar} )
end procedure

public procedure Enable( wxMenuBar mbar, atom id, atom enable )
	wx_proc( WXMENUBAR_ENABLE, {mbar,id,enable} )
end procedure

public procedure EnableTop( wxMenuBar mbar, atom pos, atom enable )
	wx_proc( WXMENUBAR_ENABLETOP, {mbar,pos,enable} )
end procedure

public function FindItem( wxMenuBar mbar, atom id )
	return wx_func( WXMENUBAR_FINDITEM, {mbar,id} )
end function

public function FindMenu( wxMenuBar mbar, wxString title )
	return wx_func( WXMENUBAR_FINDMENU, {mbar,title} )
end function

public function FindMenuItem( wxMenuBar mbar, wxString menuString, wxString itemString )
	return wx_func( WXMENUBAR_FINDMENUITEM, {mbar,menuString,itemString} )
end function

public function GetFrame( wxMenuBar mbar )
	return wx_func( WXMENUBAR_GETFRAME, {mbar} )
end function

public function GetHelpString( wxMenuBar mbar, atom id )
	return wx_func( WXMENUBAR_GETHELPSTRING, {mbar,id} )
end function

public function GetLabel( wxMenuBar mbar, atom id )
	return wx_func( WXMENUBAR_GETLABEL, {mbar,id} )
end function

public function GetMenu( wxMenuBar mbar, atom menuIndex )
	return wx_func( WXMENUBAR_GETMENU, {mbar,menuIndex} )
end function

public function GetMenuCount( wxMenuBar mbar )
	return wx_func( WXMENUBAR_GETMENUCOUNT, {mbar} )
end function

public function GetMenuLabel( wxMenuBar mbar, atom pos )
	return wx_func( WXMENUBAR_GETMENULABEL, {mbar,pos} )
end function

public function GetMenuLabelText( wxMenuBar mbar, atom pos )
	return wx_func( WXMENUBAR_GETMENULABELTEXT, {mbar,pos} )
end function

public function Insert( wxMenuBar mbar, atom pos, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_INSERT, {mbar,pos,menu,title} )
end function

public function IsAttached( wxMenuBar mbar )
	return wx_func( WXMENUBAR_ISATTACHED, {mbar} )
end function

public function IsChecked( wxMenuBar mbar, atom id )
	return wx_func( WXMENUBAR_ISCHECKED, {mbar,id} )
end function

public function IsEnabled( wxMenuBar mbar, atom id )
	return wx_func( WXMENUBAR_ISENABLED, {mbar,id} )
end function

public function IsEnabledTop( wxMenuBar mbar, atom pos )
	return wx_func( WXMENUBAR_ISENABLEDTOP, {mbar,pos} )
end function

public procedure Refresh( wxMenuBar mbar, atom eraseBackground, wxRect rect )
	wx_proc( WXMENUBAR_REFRESH, {mbar,eraseBackground,rect} )
end procedure

public function Remove( wxMenuBar mbar, atom pos )
	return wx_func( WXMENUBAR_REMOVE, {mbar,pos} )
end function

public function Replace( wxMenuBar mbar, atom pos, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_REPLACE, {mbar,pos,menu,title} )
end function

public procedure SetHelpString( wxMenuBar mbar, atom id, wxString helpString )
	wx_proc( WXMENUBAR_SETHELPSTRING, {mbar,id,helpString} )
end procedure

public procedure SetLabel( wxMenuBar mbar, atom id, wxString _label )
	wx_proc( WXMENUBAR_SETLABEL, {mbar,id,_label} )
end procedure

public procedure SetMenuLabel( wxMenuBar mbar, atom pos, wxString _label )
	wx_proc( WXMENUBAR_SETMENULABEL, {mbar,pos,_label} )
end procedure


