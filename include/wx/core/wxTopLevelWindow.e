
namespace wxTopLevelWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/frame.e"
include "wx/icon.e"

public include "wx/nonownedwnd.e"
public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxTopLevelWindowInfo = wxClassInfo:FindClass( "wxTopLevelWindow" )

public type wxTopLevelWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxTopLevelWindowInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxDEFAULT_FRAME_STYLE, wxString name = wxFrameNameStr )
	return wx_func( WXTOPLEVELWINDOW_NEW, {parent,id,title,pos,size,style,name} )
end function

public function Create( wxTopLevelWindow self, wxWindow parent, wxWindowID id, wxString title, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxDEFAULT_FRAME_STYLE, wxString name = wxFrameNameStr )
	return wx_func( WXTOPLEVELWINDOW_CREATE, {self,parent,id,title,pos,size,style,name} )
end function

public function CanSetTransparent( wxTopLevelWindow self )
	return wx_func( WXTOPLEVELWINDOW_CANSETTRANSPARENT, {self} )
end function

public procedure CenterOnScreen( wxTopLevelWindow self, atom direction = wxBOTH )
	wx_proc( WXTOPLEVELWINDOW_CENTERONSCREEN, {self,direction} )
end procedure

public procedure CentreOnScreen( wxTopLevelWindow self, atom direction = wxBOTH )
	wx_proc( WXTOPLEVELWINDOW_CENTREONSCREEN, {self,direction} )
end procedure

public function EnableCloseButton( wxTopLevelWindow self, atom enable = TRUE )
	return wx_func( WXTOPLEVELWINDOW_ENABLECLOSEBUTTON, {self,enable} )
end function

public function GetDefaultItem( wxTopLevelWindow self )
	return wx_func( WXTOPLEVELWINDOW_GETDEFAULTITEM, {self} )
end function

public function GetIcon( wxTopLevelWindow self )
	return wx_func( WXTOPLEVELWINDOW_GETICON, {self} )
end function

public procedure SetIcon( wxTopLevelWindow self, object icon )
	wx_proc( WXTOPLEVELWINDOW_SETICON, {self,icon} )
end procedure
