
include "wx/dll.e"
include "wx/defs.e"
include "std/math.e"

public include "wx/core/wxStatusBar.e"

public constant
	wxSB_NORMAL				= 0x0000,
	wxSB_FLAT				= 0x0001,
	wxSB_RAISED				= 0x0002,
	wxSB_SUNKEN				= 0x0003,
	wxSTB_SIZEGRIP			= 0x0010,
	wxSTB_SHOW_TIPS			= 0x0020,
	wxSTB_ELLIPSIZE_START	= 0x0040,
	wxSTB_ELLIPSIZE_MIDDLE	= 0x0080,
	wxSTB_ELLIPSIZE_END		= 0x0100,
	wxSTB_DEFAULT_STYLE		= or_all({
		wxSTB_SIZEGRIP,
		wxSTB_ELLIPSIZE_END,
		wxSTB_SHOW_TIPS,
		wxFULL_REPAINT_ON_RESIZE
	}),
$

atom core = wx_library( "core" )

public constant wxStatusBarNameStr = wx_string( core, "wxStatusBarNameStr" )

