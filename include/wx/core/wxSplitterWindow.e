
namespace wxSplitterWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/splitter.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxSplitterWindowInfo = wxClassInfo:FindClass( "wxSplitterWindow" )

public type wxSplitterWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxSplitterWindowInfo )
end type

public function new( wxWindow parent, wxWindowID id = wxID_ANY, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxSP_3D, wxString name = "splitterWindow" )
	return wx_func( WXSPLITTERWINDOW_NEW, {parent,id,pos,size,style,name} )
end function

public function Create( wxSplitterWindow self, wxWindow parent, wxWindowID id = wxID_ANY, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxSP_3D, wxString name = "splitterWindow" )
	return wx_func( WXSPLITTERWINDOW_CREATE, {self,parent,id,pos,size,style,name} )
end function

public function GetMinimumPaneSize( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETMINIMUMPANESIZE, {self} )
end function

public function GetSashGravity( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETSASHGRAVITY, {self} )
end function

public function GetSashPosition( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETSASHPOSITION, {self} )
end function

public function GetSashSize( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETSASHSIZE, {self} )
end function

public function GetDefaultSashSize( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETDEFAULTSASHSIZE, {self} )
end function

public function GetSplitMode( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETSPLITMODE, {self} )
end function

public function GetWindow1( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETWINDOW1, {self} )
end function

public function GetWindow2( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_GETWINDOW2, {self} )
end function

public procedure Initialize( wxSplitterWindow self, wxWindow window )
	wx_proc( WXSPLITTERWINDOW_INITIALIZE, {self,window} )
end procedure

public function IsSashInvisible( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_ISSASHINVISIBLE, {self} )
end function

public function IsSplit( wxSplitterWindow self )
	return wx_func( WXSPLITTERWINDOW_ISSPLIT, {self} )
end function

public function ReplaceWindow( wxSplitterWindow self, wxWindow oldWin, wxWindow newWin )
	return wx_func( WXSPLITTERWINDOW_REPLACEWINDOW, {self,oldWin,newWin} )
end function

public procedure SetMinimumPaneSize( wxSplitterWindow self, integer paneSize )
	wx_proc( WXSPLITTERWINDOW_SETMINIMUMPANESIZE, {self,paneSize} )
end procedure

public procedure SetSashGravity( wxSplitterWindow self, atom gravity )
	wx_proc( WXSPLITTERWINDOW_SETSASHGRAVITY, {self,gravity} )
end procedure

public procedure SetSashPosition( wxSplitterWindow self, integer position, boolean redraw = TRUE )
	wx_proc( WXSPLITTERWINDOW_SETSASHPOSITION, {self,position,redraw} )
end procedure

public procedure SetSplitMode( wxSplitterWindow self, wxSplitMode mode )
	wx_proc( WXSPLITTERWINDOW_SETSPLITMODE, {self,mode} )
end procedure

public procedure SetSashInvisible( wxSplitterWindow self, boolean invisible = TRUE )
	wx_proc( WXSPLITTERWINDOW_SETSASHINVISIBLE, {self,invisible} )
end procedure

public function SplitHorizontally( wxSplitterWindow self, wxWindow window1, wxWindow window2, integer sashPosition = 0 )
	return wx_func( WXSPLITTERWINDOW_SPLITHORIZONTALLY, {self,window1,window2,sashPosition} )
end function

public function SplitVertically( wxSplitterWindow self, wxWindow window1, wxWindow window2, integer sashPosition = 0 )
	return wx_func( WXSPLITTERWINDOW_SPLITVERTICALLY, {self,window1,window2,sashPosition} )
end function

public function Unsplit( wxSplitterWindow self, wxWindow toRemove = NULL )
	return wx_func( WXSPLITTERWINDOW_UNSPLIT, {self,toRemove} )
end function

public procedure UpdateSize( wxSplitterWindow self )
	wx_proc( WXSPLITTERWINDOW_UPDATESIZE, {self} )
end procedure
