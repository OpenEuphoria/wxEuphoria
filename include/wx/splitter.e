
include "wx/dll.e"
include "wx/defs.e"

public include "wx/core/wxSplitterWindow.e"

atom core = wx_library( "core" )

public constant
	wxSP_NOBORDER           = 0x0000,
	wxSP_THIN_SASH          = 0x0000,   -- NB: the default is 3D sash
	wxSP_NOSASH             = 0x0010,
	wxSP_PERMIT_UNSPLIT     = 0x0040,
	wxSP_LIVE_UPDATE        = 0x0080,
	wxSP_3DSASH             = 0x0100,
	wxSP_3DBORDER           = 0x0200,
	wxSP_NO_XP_THEME        = 0x0400,
	wxSP_BORDER             = wxSP_3DBORDER,
	wxSP_3D                 = or_bits(wxSP_3DBORDER, wxSP_3DSASH),
$

public constant
	wxEVT_SPLITTER_DOUBLECLICKED        = wx_event( core, "wxEVT_SPLITTER_DOUBLECLICKED" ),
	wxEVT_SPLITTER_SASH_POS_CHANGED     = wx_event( core, "wxEVT_SPLITTER_SASH_POS_CHANGED" ),
	wxEVT_SPLITTER_SASH_POS_CHANGING    = wx_event( core, "wxEVT_SPLITTER_SASH_POS_CHANGING" ),
	wxEVT_SPLITTER_UNSPLIT              = wx_event( core, "wxEVT_SPLITTER_UNSPLIT" ),
$

public constant wxEVT_SPLITTER_DCLICK = wxEVT_SPLITTER_DOUBLECLICKED

public enum type wxSplitMode
	wxSPLIT_HORIZONTAL,
	wxSPLIT_VERTICAL
end type

public enum
	wxSPLIT_DRAG_NONE,
	wxSPLIT_DRAG_DRAGGING,
	wxSPLIT_DRAG_LEFT_DOWN,
$
