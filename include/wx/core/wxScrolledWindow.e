
namespace wxScrolledWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/scrolwin.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

include "std/math.e"

constant wxScrolledWindowInfo = wxClassInfo:FindClass( "wxScrolledWindow" )

constant wxSCROLLED_WINDOW_DEFAULT_STYLE = or_bits( wxHSCROLL, wxVSCROLL )

public type wxScrolledWindow( object x )
	return wxObject:IsKindOf( x, wxScrolledWindowInfo )
end type

public function new( wxWindow parent, wxWindowID id = wxID_ANY, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxSCROLLED_WINDOW_DEFAULT_STYLE, wxString name = "scrolledWindow" )
	return wx_func( WXSCROLLEDWINDOW_NEW, {parent,id,pos,size,style,name} )
end function

public procedure Show( wxScrolledWindow self, integer show )
	wxWindow:Show( self, show )
end procedure
