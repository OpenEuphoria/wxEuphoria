
include "wx/dll.e"
include "wx/defs.e"

public include "wx/core/wxScrolledWindow.e"

atom core = wx_library( "core" )

public constant
	wxEVT_SCROLLWIN_TOP                 = wx_event( core, "wxEVT_SCROLLWIN_TOP" ),
	wxEVT_SCROLLWIN_BOTTOM              = wx_event( core, "wxEVT_SCROLLWIN_BOTTOM" ),
	wxEVT_SCROLLWIN_LINEUP              = wx_event( core, "wxEVT_SCROLLWIN_LINEUP" ),
	wxEVT_SCROLLWIN_LINEDOWN            = wx_event( core, "wxEVT_SCROLLWIN_LINEDOWN" ),
	wxEVT_SCROLLWIN_PAGEUP              = wx_event( core, "wxEVT_SCROLLWIN_PAGEUP" ),
	wxEVT_SCROLLWIN_PAGEDOWN            = wx_event( core, "wxEVT_SCROLLWIN_PAGEDOWN" ),
	wxEVT_SCROLLWIN_THUMBTRACK          = wx_event( core, "wxEVT_SCROLLWIN_THUMBTRACK" ),
	wxEVT_SCROLLWIN_THUMBRELEASE        = wx_event( core, "wxEVT_SCROLLWIN_THUMBRELEASE" ),
$

public enum type wxScrollbarVisibility
	
	wxSHOW_SB_NEVER = -1,
	wxSHOW_SB_DEFAULT,
	wxSHOW_SB_ALWAYS
	
end type

