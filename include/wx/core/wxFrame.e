
namespace wxFrame

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/frame.e"
include "wx/menu.e"
include "wx/statusbr.e"
include "wx/toolbar.e"
--include "wx/app.e"

public include "wx/toplevel.e"
public include "wx/nonownedwnd.e"
public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxFrameInfo = wxClassInfo:FindClass( "wxFrame" )

public type wxFrame( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxFrameInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxDEFAULT_FRAME_STYLE, wxString name = wxFrameNameStr )
--	if wxApp:GetInstance() = NULL then wxApp:new() end if
	return wx_func( WXFRAME_NEW, {parent,id,title,pos,size,style,name} )
end function

public procedure Centre( wxFrame self, atom direction = wxBOTH )
	wx_proc( WXFRAME_CENTRE, {self,direction} )
end procedure

public procedure Center( wxFrame self, atom direction = wxBOTH )
	wx_proc( WXFRAME_CENTER, {self,direction} )
end procedure

public function Create( wxFrame self, wxWindow parent, wxWindowID id, wxString title, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxDEFAULT_FRAME_STYLE, wxString name = wxFrameNameStr )
--	if wxApp:GetInstance() = NULL then wxApp:new() end if
	return wx_func( WXFRAME_CREATE, {self,parent,id,title,pos,size,style,name} )
end function

public function CreateStatusBar( wxFrame self, atom number = 1, atom style = wxSTB_DEFAULT_STYLE, wxWindowID id = wxID_ANY, wxString name = wxStatusBarNameStr )
	return wx_func( WXFRAME_CREATESTATUSBAR, {self,number,style,id,name} )
end function

public function CreateToolBar( wxFrame self, atom style = wxTB_DEFAULT_STYLE, wxWindowID id = wxID_ANY, wxString name = wxToolBarNameStr )
	return wx_func( WXFRAME_CREATETOOLBAR, {self,style,id,name} )
end function

public function GetClientAreaOrigin( wxFrame self )
	return wx_func( WXFRAME_GETCLIENTAREAORIGIN, {self} )
end function

public function GetMenuBar( wxFrame self )
	return wx_func( WXFRAME_GETMENUBAR, {self} )
end function

public function GetStatusBar( wxFrame self )
	return wx_func( WXFRAME_GETSTATUSBAR, {self} )
end function

public function GetStatusBarPane( wxFrame self )
	return wx_func( WXFRAME_GETSTATUSBARPANE, {self} )
end function

public function GetToolBar( wxFrame self )
	return wx_func( WXFRAME_GETTOOLBAR, {self} )
end function

public function ProcessCommand( wxFrame self, atom id )
	return wx_func( WXFRAME_PROCESSCOMMAND, {self,id} )
end function

public procedure SetMenuBar( wxFrame self, wxMenuBar menuBar )
	wx_proc( WXFRAME_SETMENUBAR, {self,menuBar} )
end procedure

public procedure SetStatusBar( wxFrame self, wxStatusBar statusBar )
	wx_proc( WXFRAME_SETSTATUSBAR, {self,statusBar} )
end procedure

public procedure SetStatusBarPane( wxFrame self, atom n )
	wx_proc( WXFRAME_SETSTATUSBARPANE, {self,n} )
end procedure

public procedure SetStatusText( wxFrame self, wxString text, atom number = 0 )
	wx_proc( WXFRAME_SETSTATUSTEXT, {self,text,number} )
end procedure

public procedure SetStatusWidths( wxFrame self, sequence widths )
	wx_proc( WXFRAME_SETSTATUSWIDTHS, {self,widths} )
end procedure

public procedure SetToolBar( wxFrame self, wxToolBar toolBar )
	wx_proc( WXFRAME_SETTOOLBAR, {self,toolBar} )
end procedure

public function MSWGetTaskBarButton( wxFrame self )
	return wx_func( WXFRAME_MSWGETTASKBARBUTTON, {self} )
end function

public procedure PushStatusText( wxFrame self, wxString text, atom number = 0 )
	wx_proc( WXFRAME_PUSHSTATUSTEXT, {self,text,number} )
end procedure

public procedure PopStatusText( wxFrame self, atom number = 0 )
	wx_proc( WXFRAME_POPSTATUSTEXT, {self,number} )
end procedure
