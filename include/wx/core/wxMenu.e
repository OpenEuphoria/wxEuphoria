
namespace wxMenu

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/menu.e"
include "wx/event.e"
include "wx/string.e"
include "wx/window.e"

public include "wx/object.e"

constant wxMenuInfo = wxClassInfo:FindClass( "wxMenu" )

public type wxMenu( object x )
	return wxObject:IsKindOf( x, wxMenuInfo )
end type

public function new( object title = 0, atom style = 0 )
	return wx_func( WXMENU_NEW, {title,style} )
end function

public function Append( wxMenu self, wxMenuItem menuItem )
	return wx_func( WXMENU_APPEND, {self,menuItem} )
end function

public function AppendItem( wxMenu self, atom id, wxString text = wxEmptyString, wxString help = wxEmptyString, wxItemKind item = wxITEM_NORMAL )
	return wx_func( WXMENU_APPENDITEM, {self,id,text,help,item} )
end function

public function AppendCheckItem( wxMenu self, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_APPENDCHECKITEM, {self,id,text,help} )
end function

public function AppendRadioItem( wxMenu self, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_APPENDRADIOITEM, {self,id,text,help} )
end function

public function AppendSeparator( wxMenu self )
	return wx_func( WXMENU_APPENDSEPARATOR, {self} )
end function

public function AppendSubMenu( wxMenu self, wxMenu subMenu, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_APPENDSUBMENU, {self,subMenu,text,help} )
end function

public procedure Break( wxMenu self )
	wx_proc( WXMENU_BREAK, {self} )
end procedure

public procedure Check( wxMenu self, atom id, atom check )
	wx_proc( WXMENU_CHECK, {self,id,check} )
end procedure

public function Delete( wxMenu self, atom id )
	return wx_func( WXMENU_DELETE, {self,id} )
end function

public function DeleteItem( wxMenu self, wxMenuItem item )
	return wx_func( WXMENU_DELETEITEM, {self,item} )
end function

public function Destroy( wxMenu self, atom id )
	return wx_func( WXMENU_DESTROY, {self,id} )
end function

public function DestroyItem( wxMenu self, wxMenuItem item )
	return wx_func( WXMENU_DESTROYITEM, {self,item} )
end function

public procedure Enable( wxMenu self, atom id, atom enable )
	wx_proc( WXMENU_ENABLE, {self,id,enable} )
end procedure

public function FindChildItem( wxMenu self, atom id )
	return wx_func( WXMENU_FINDCHILDITEM, {self,id} )
end function

public function FindChildItemWithPos( wxMenu self, atom id )
	return wx_func( WXMENU_FINDCHILDITEMWITHPOS, {self,id} )
end function

public function FindItem( wxMenu self, atom id )
	return wx_func( WXMENU_FINDITEM, {self,id} )
end function

public function FindItemByName( wxMenu self, wxString itemString )
	return wx_func( WXMENU_FINDITEMBYNAME, {self,itemString} )
end function

public function FindItemByPosition( wxMenu self, atom position )
	return wx_func( WXMENU_FINDITEMBYPOSITION, {self,position} )
end function

public function FindItemWithMenu( wxMenu self, atom id )
	return wx_func( WXMENU_FINDITEMWITHMENU, {self,id} )
end function

public function GetHelpString( wxMenu self, atom id )
	return wx_func( WXMENU_GETHELPSTRING, {self,id} )
end function

public function GetInvokingWindow( wxMenu self )
	return wx_func( WXMENU_GETINVOKINGWINDOW, {self} )
end function

public function GetLabel( wxMenu self, atom id )
	return wx_func( WXMENU_GETLABEL, {self,id} )
end function

public function GetLabelText( wxMenu self, atom id )
	return wx_func( WXMENU_GETLABELTEXT, {self,id} )
end function

public function GetMenuItemCount( wxMenu self )
	return wx_func( WXMENU_GETMENUITEMCOUNT, {self} )
end function

public function GetMenuItems( wxMenu self )
	return wx_func( WXMENU_GETMENUITEMS, {self} )
end function

public function GetParent( wxMenu self )
	return wx_func( WXMENU_GETPARENT, {self} )
end function

public function GetStyle( wxMenu self )
	return wx_func( WXMENU_GETSTYLE, {self} )
end function

public function GetTitle( wxMenu self )
	return wx_func( WXMENU_GETTITLE, {self} )
end function

public function GetWindow( wxMenu self )
	return wx_func( WXMENU_GETWINDOW, {self} )
end function

public function Insert( wxMenu self, atom pos, wxMenuItem menuItem )
	return wx_func( WXMENU_INSERT, {self,pos,menuItem} )
end function

public function InsertItem( wxMenu self, atom pos, atom id, wxString item = wxEmptyString, wxString helpString = wxEmptyString, wxItemKind kind = wxITEM_NORMAL )
	return wx_func( WXMENU_INSERTITEM, {self,pos,id,item,helpString,kind} )
end function

public function InsertSubMenu( wxMenu self, atom pos, atom id, wxString text, wxMenu submenu, wxString help = wxEmptyString )
	return wx_func( WXMENU_INSERTSUBMENU, {self,pos,id,text,submenu,help} )
end function

public function InsertCheckItem( wxMenu self, atom pos, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_INSERTCHECKITEM, {self,pos,id,text,help} )
end function

public function InsertRadioItem( wxMenu self, atom pos, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_INSERTRADIOITEM, {self,pos,id,text,help} )
end function

public function InsertSeparator( wxMenu self, atom pos )
	return wx_func( WXMENU_INSERTSEPARATOR, {self,pos} )
end function

public function IsChecked( wxMenu self, atom id )
	return wx_func( WXMENU_ISCHECKED, {self,id} )
end function

public function IsEnabled( wxMenu self, atom id )
	return wx_func( WXMENU_ISENABLED, {self,id} )
end function

public function Prepend( wxMenu self, wxMenuItem item )
	return wx_func( WXMENU_PREPEND, {self,item} )
end function

public function PrependItem( wxMenu self, atom id, wxString text, wxString help = wxEmptyString, wxItemKind kind = wxITEM_NORMAL )
	return wx_func( WXMENU_PREPENDITEM, {self,id,text,help,kind} )
end function

public function PrependCheckItem( wxMenu self, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_PREPENDCHECKITEM, {self,id,text,help} )
end function

public function PrependRadioItem( wxMenu self, atom id, wxString text, wxString help = wxEmptyString )
	return wx_func( WXMENU_PREPENDRADIOITEM, {self,id,text,help} )
end function

public function PrependSeparator( wxMenu self )
	return wx_func( WXMENU_PREPENDSEPARATOR, {self} )
end function

public function PrependSubMenu( wxMenu self, atom id, wxString text, wxMenu submenu, wxString help = wxEmptyString )
	return wx_func( WXMENU_PREPENDSUBMENU, {self,id,text,submenu,help} )
end function

public function Remove( wxMenu self, atom id )
	return wx_func( WXMENU_REMOVE, {self,id} )
end function

public function RemoveItem( wxMenu self, wxMenuItem item )
	return wx_func( WXMENU_REMOVEITEM, {self,item} )
end function

public procedure SetHelpString( wxMenu self, atom id, wxString help )
	wx_proc( WXMENU_SETHELPSTRING, {self,id,help} )
end procedure

public procedure SetInvokingWindow( wxMenu self, wxWindow window )
	wx_proc( WXMENU_SETINVOKINGWINDOW, {self,window} )
end procedure

public procedure SetLabel( wxMenu self, atom id, wxString _label )
	wx_proc( WXMENU_SETLABEL, {self,id,_label} )
end procedure

public procedure SetParent( wxMenu self, wxMenu parent )
	wx_proc( WXMENU_SETPARENT, {self,parent} )
end procedure

public procedure SetTitle( wxMenu self, wxString title )
	wx_proc( WXMENU_SETTITLE, {self,title} )
end procedure

public procedure UpdateUI( wxMenu self, wxEvtHandler source )
	wx_proc( WXMENU_UPDATEUI, {self,source} )
end procedure
