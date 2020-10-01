
namespace wxWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/colour.e"
include "wx/font.e"
include "wx/cursor.e"
include "wx/panel.e"

public include "wx/event.e"
public include "wx/object.e"

constant wxWindowInfo = wxClassInfo:FindClass( "wxWindow" )

public type wxWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if

	return wxObject:IsKindOf( x, wxWindowInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = 0, wxString name = wxPanelNameStr )
	return wx_func( WXWINDOW_NEW, {parent,id,pos,size,style,name} )
end function

public function Create( wxWindow self, wxWindow parent, wxWindowID id, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = 0, wxString name = wxPanelNameStr )
	return wx_func( WXWINDOW_CREATE, {self,parent,id,pos,size,style,name} )
end function

public function BeginRepositioningChildren( wxWindow self )
	return wx_func( WXWINDOW_BEGINREPOSITIONINGCHILDREN, {self} )
end function

public function EndRepositioningChildren( wxWindow self )
	return wx_func( WXWINDOW_ENDREPOSITIONINGCHILDREN, {self} )
end function

public procedure CacheBestSize( wxWindow self, wxSize size )
	wx_proc( WXWINDOW_CACHEBESTSIZE, {self,size} )
end procedure

public function ClientToWindowSize( wxWindow self, wxSize size )
	return wx_func( WXWINDOW_CLIENTTOWINDOWSIZE, {self,size} )
end function

public function WindowToClientSize( wxWindow self, wxSize size )
	return wx_func( WXWINDOW_WINDOWTOCLIENTSIZE, {self,size} )
end function

public procedure Fit( wxWindow self )
	wx_proc( WXWINDOW_FIT, {self} )
end procedure

public procedure FitInside( wxWindow self )
	wx_proc( WXWINDOW_FITINSIDE, {self} )
end procedure

public function FromDIP( wxWindow self, integer d )
	return wx_func( WXWINDOW_FROMDIP, {self,d} )
end function

public function SizeFromDIP( wxWindow self, wxSize size )
	return wx_func( WXWINDOW_SIZEFROMDIP, {self,size} )
end function

public function PointFromDIP( wxWindow self, wxPoint point )
	return wx_func( WXWINDOW_POINTFROMDIP, {self,point} )
end function

public function ToDIP( wxWindow self, integer d )
	return wx_func( WXWINDOW_TODIP, {self,d} )
end function

public function SizeToDIP( wxWindow self, wxSize size )
	return wx_func( WXWINDOW_SIZETODIP, {self,size} )
end function

public function PointToDIP( wxWindow self, wxPoint point )
	return wx_func( WXWINDOW_POINTTODIP, {self,point} )
end function

public function GetBestSize( wxWindow self )
	return wx_func( WXWINDOW_GETBESTSIZE, {self} )
end function

public function GetBestHeight( wxWindow self, integer height )
	return wx_func( WXWINDOW_GETBESTHEIGHT, {self,height} )
end function

public function GetBestWidth( wxWindow self, integer height )
	return wx_func( WXWINDOW_GETBESTWIDTH, {self,height} )
end function

public function GetClientSize( wxWindow self )
	return wx_func( WXWINDOW_GETCLIENTSIZE, {self} )
end function

public function GetEffectiveMinSize( wxWindow self )
	return wx_func( WXWINDOW_GETEFFECTIVEMINSIZE, {self} )
end function

public function GetMaxClientSize( wxWindow self )
	return wx_func( WXWINDOW_GETMAXCLIENTSIZE, {self} )
end function

public function GetMaxSize( wxWindow self )
	return wx_func( WXWINDOW_GETMAXSIZE, {self} )
end function

public function GetMinClientSize( wxWindow self )
	return wx_func( WXWINDOW_GETMINCLIENTSIZE, {self} )
end function

public function GetMinSize( wxWindow self )
	return wx_func( WXWINDOW_GETMINSIZE, {self} )
end function

public function GetMinWidth( wxWindow self )
	return wx_func( WXWINDOW_GETMINWIDTH, {self} )
end function

public function GetMinHeight( wxWindow self )
	return wx_func( WXWINDOW_GETMINHEIGHT, {self} )
end function

public function GetMaxWidth( wxWindow self )
	return wx_func( WXWINDOW_GETMAXWIDTH, {self} )
end function

public function GetMaxHeight( wxWindow self )
	return wx_func( WXWINDOW_GETMAXHEIGHT, {self} )
end function

public function GetSize( wxWindow self )
	return wx_func( WXWINDOW_GETSIZE, {self} )
end function

public function GetVirtualSize( wxWindow self )
	return wx_func( WXWINDOW_GETVIRTUALSIZE, {self} )
end function

public function GetBestVirtualSize( wxWindow self )
	return wx_func( WXWINDOW_GETBESTVIRTUALSIZE, {self} )
end function

public function GetContentScaleFactor( wxWindow self )
	return wx_func( WXWINDOW_GETCONTENTSCALEFACTOR, {self} )
end function

public function GetWindowBorderSize( wxWindow self )
	return wx_func( WXWINDOW_GETWINDOWBORDERSIZE, {self} )
end function

public function InformFirstDirection( wxWindow self, integer direction, integer size, integer availableOtherDir )
	return wx_func( WXWINDOW_INFORMFIRSTDIRECTION, {self,direction,size,availableOtherDir} )
end function

public procedure InvalidateBestSize( wxWindow self )
	wx_proc( WXWINDOW_INVALIDATEBESTSIZE, {self} )
end procedure

public procedure SetSize( wxWindow self, wxSize size )
	wx_proc( WXWINDOW_SETSIZE, {self,size} )
end procedure

public function AcceptsFocus( wxWindow self )
	return wx_func( WXWINDOW_ACCEPTSFOCUS, {self} )
end function

public function Close( wxWindow self, atom force = FALSE )
	return wx_func( WXWINDOW_CLOSE, {self,force} )
end function

public function Destroy( wxWindow self )
	return wx_func( WXWINDOW_DESTROY, {self} )
end function

public function GetWindowStyleFlag( wxWindow self )
	return wx_func( WXWINDOW_GETWINDOWSTYLEFLAG, {self} )
end function

public function Hide( wxWindow self )
	return wx_func( WXWINDOW_HIDE, {self} )
end function

public function SetBackgroundColour( wxWindow self, wxColour colour )
	return wx_func( WXWINDOW_SETBACKGROUNDCOLOUR, {self,colour} )
end function

public function SetFont( wxWindow self, wxFont font )
	return wx_func( WXWINDOW_SETFONT, {self,font} )
end function

public function Show( wxWindow self, atom show = TRUE )
	return wx_func( WXWINDOW_SHOW, {self,show} )
end function

public function SetCursor( wxWindow self, wxCursor cursor )
	return wx_func( WXWINDOW_SETCURSOR, {self,cursor} )
end function

public function SetStockCursor( wxWindow self, wxStockCursor cursorId )
	return wx_func( WXWINDOW_SETSTOCKCURSOR, {self,cursorId} )
end function

public procedure SetWindowStyleFlag( wxWindow self, atom style )
	wx_proc( WXWINDOW_SETWINDOWSTYLEFLAG, {self,style} )
end procedure
