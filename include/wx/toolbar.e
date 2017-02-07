
include "wx/dll.e"
include "wx/defs.e"
include "std/math.e"

public include "wx/core/wxToolBar.e"

public constant
	wxTB_HORIZONTAL		= wxHORIZONTAL,   -- == 0x0004
	wxTB_TOP			= wxTB_HORIZONTAL,
	wxTB_VERTICAL		= wxVERTICAL,     -- == 0x0008
	wxTB_LEFT			= wxTB_VERTICAL,
	wxTB_3DBUTTONS		= 0x0010,
	wxTB_FLAT			= 0x0020,
	wxTB_DOCKABLE		= 0x0040,
	wxTB_NOICONS		= 0x0080,
	wxTB_TEXT			= 0x0100,
	wxTB_NODIVIDER		= 0x0200,
	wxTB_NOALIGN		= 0x0400,
	wxTB_HORZ_LAYOUT	= 0x0800,
	wxTB_HORZ_TEXT		= or_all({ wxTB_HORZ_LAYOUT, wxTB_TEXT }),
	wxTB_NO_TOOLTIPS	= 0x1000,
	wxTB_BOTTOM			= 0x2000,
	wxTB_RIGHT			= 0x4000,
	wxTB_DEFAULT_STYLE	= wxTB_HORIZONTAL,
$

atom core = wx_library( "core" )

public constant wxToolBarNameStr = wx_string( core, "wxToolBarNameStr" )

