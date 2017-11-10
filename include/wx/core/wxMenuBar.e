
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

public function Append( wxMenuBar self, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_APPEND, {self,menu,title} )
end function

public procedure Attach( wxMenuBar self, wxFrame frame )
	wx_proc( WXMENUBAR_ATTACH, {self,frame} )
end procedure

public procedure Check( wxMenuBar self, atom id, atom check )
	wx_proc( WXMENUBAR_CHECK, {self,id,check} )
end procedure

public procedure Detach( wxMenuBar self )
	wx_proc( WXMENUBAR_DETACH, {self} )
end procedure

public procedure Enable( wxMenuBar self, atom id, atom enable )
	wx_proc( WXMENUBAR_ENABLE, {self,id,enable} )
end procedure

public procedure EnableTop( wxMenuBar self, atom pos, atom enable )
	wx_proc( WXMENUBAR_ENABLETOP, {self,pos,enable} )
end procedure

public function FindItem( wxMenuBar self, atom id )
	return wx_func( WXMENUBAR_FINDITEM, {self,id} )
end function

public function FindMenu( wxMenuBar self, wxString title )
	return wx_func( WXMENUBAR_FINDMENU, {self,title} )
end function

public function FindMenuItem( wxMenuBar self, wxString menuString, wxString itemString )
	return wx_func( WXMENUBAR_FINDMENUITEM, {self,menuString,itemString} )
end function

public function GetFrame( wxMenuBar self )
	return wx_func( WXMENUBAR_GETFRAME, {self} )
end function

public function GetHelpString( wxMenuBar self, atom id )
	return wx_func( WXMENUBAR_GETHELPSTRING, {self,id} )
end function

public function GetLabel( wxMenuBar self, atom id )
	return wx_func( WXMENUBAR_GETLABEL, {self,id} )
end function

public function GetMenu( wxMenuBar self, atom menuIndex )
	return wx_func( WXMENUBAR_GETMENU, {self,menuIndex} )
end function

public function GetMenuCount( wxMenuBar self )
	return wx_func( WXMENUBAR_GETMENUCOUNT, {self} )
end function

public function GetMenuLabel( wxMenuBar self, atom pos )
	return wx_func( WXMENUBAR_GETMENULABEL, {self,pos} )
end function

public function GetMenuLabelText( wxMenuBar self, atom pos )
	return wx_func( WXMENUBAR_GETMENULABELTEXT, {self,pos} )
end function

public function Insert( wxMenuBar self, atom pos, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_INSERT, {self,pos,menu,title} )
end function

public function IsAttached( wxMenuBar self )
	return wx_func( WXMENUBAR_ISATTACHED, {self} )
end function

public function IsChecked( wxMenuBar self, atom id )
	return wx_func( WXMENUBAR_ISCHECKED, {self,id} )
end function

public function IsEnabled( wxMenuBar self, atom id )
	return wx_func( WXMENUBAR_ISENABLED, {self,id} )
end function

public function IsEnabledTop( wxMenuBar self, atom pos )
	return wx_func( WXMENUBAR_ISENABLEDTOP, {self,pos} )
end function

public procedure Refresh( wxMenuBar self, atom eraseBackground, wxRect rect )
	wx_proc( WXMENUBAR_REFRESH, {self,eraseBackground,rect} )
end procedure

public function Remove( wxMenuBar self, atom pos )
	return wx_func( WXMENUBAR_REMOVE, {self,pos} )
end function

public function Replace( wxMenuBar self, atom pos, wxMenu menu, wxString title )
	return wx_func( WXMENUBAR_REPLACE, {self,pos,menu,title} )
end function

public procedure SetHelpString( wxMenuBar self, atom id, wxString helpString )
	wx_proc( WXMENUBAR_SETHELPSTRING, {self,id,helpString} )
end procedure

public procedure SetLabel( wxMenuBar self, atom id, wxString _label )
	wx_proc( WXMENUBAR_SETLABEL, {self,id,_label} )
end procedure

public procedure SetMenuLabel( wxMenuBar self, atom pos, wxString _label )
	wx_proc( WXMENUBAR_SETMENULABEL, {self,pos,_label} )
end procedure

public function OSXGetAppleMenu( wxMenuBar self )
	return wx_func( WXMENUBAR_OSXGETAPPLEMENU, {self} )
end function

public function MacGetCommonMenuBar()
	return wx_func( WXMENUBAR_MACGETCOMMONMENUBAR, {} )
end function

public procedure MacSetCommonMenuBar( wxMenuBar menubar )
	wx_proc( WXMENUBAR_MACSETCOMMONMENUBAR, {menubar} )
end procedure
