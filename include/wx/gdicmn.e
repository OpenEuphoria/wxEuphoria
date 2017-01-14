
/* --------------------------------------------------------------------------- */
/* constants */
/* --------------------------------------------------------------------------- */

-- Bitmap flags
public enum type wxBitmapType
	
	wxBITMAP_TYPE_INVALID = 0, -- should be = 0 for compatibility!
	wxBITMAP_TYPE_BMP,
	wxBITMAP_TYPE_BMP_RESOURCE,
	wxBITMAP_TYPE_RESOURCE = wxBITMAP_TYPE_BMP_RESOURCE,
	wxBITMAP_TYPE_ICO,
	wxBITMAP_TYPE_ICO_RESOURCE,
	wxBITMAP_TYPE_CUR,
	wxBITMAP_TYPE_CUR_RESOURCE,
	wxBITMAP_TYPE_XBM,
	wxBITMAP_TYPE_XBM_DATA,
	wxBITMAP_TYPE_XPM,
	wxBITMAP_TYPE_XPM_DATA,
	wxBITMAP_TYPE_TIFF,
	wxBITMAP_TYPE_TIF = wxBITMAP_TYPE_TIFF,
	wxBITMAP_TYPE_TIFF_RESOURCE,
	wxBITMAP_TYPE_TIF_RESOURCE = wxBITMAP_TYPE_TIFF_RESOURCE,
	wxBITMAP_TYPE_GIF,
	wxBITMAP_TYPE_GIF_RESOURCE,
	wxBITMAP_TYPE_PNG,
	wxBITMAP_TYPE_PNG_RESOURCE,
	wxBITMAP_TYPE_JPEG,
	wxBITMAP_TYPE_JPEG_RESOURCE,
	wxBITMAP_TYPE_PNM,
	wxBITMAP_TYPE_PNM_RESOURCE,
	wxBITMAP_TYPE_PCX,
	wxBITMAP_TYPE_PCX_RESOURCE,
	wxBITMAP_TYPE_PICT,
	wxBITMAP_TYPE_PICT_RESOURCE,
	wxBITMAP_TYPE_ICON,
	wxBITMAP_TYPE_ICON_RESOURCE,
	wxBITMAP_TYPE_ANI,
	wxBITMAP_TYPE_IFF,
	wxBITMAP_TYPE_TGA,
	wxBITMAP_TYPE_MACCURSOR,
	wxBITMAP_TYPE_MACCURSOR_RESOURCE,
	
	wxBITMAP_TYPE_MAX,
	wxBITMAP_TYPE_ANY = 50
	
end type

-- Polygon filling mode
public enum type wxPolygonFillMode
	
	wxODDEVEN_RULE = 1,
	wxWINDING_RULE
	
end type

-- Standard cursors
public enum type wxStockCursor
	
	wxCURSOR_NONE = 0,  -- should be 0
	wxCURSOR_ARROW,
	wxCURSOR_RIGHT_ARROW,
	wxCURSOR_BULLSEYE,
	wxCURSOR_CHAR,
	wxCURSOR_CROSS,
	wxCURSOR_HAND,
	wxCURSOR_IBEAM,
	wxCURSOR_LEFT_BUTTON,
	wxCURSOR_MAGNIFIER,
	wxCURSOR_MIDDLE_BUTTON,
	wxCURSOR_NO_ENTRY,
	wxCURSOR_PAINT_BRUSH,
	wxCURSOR_PENCIL,
	wxCURSOR_POINT_LEFT,
	wxCURSOR_POINT_RIGHT,
	wxCURSOR_QUESTION_ARROW,
	wxCURSOR_RIGHT_BUTTON,
	wxCURSOR_SIZENESW,
	wxCURSOR_SIZENS,
	wxCURSOR_SIZENWSE,
	wxCURSOR_SIZEWE,
	wxCURSOR_SIZING,
	wxCURSOR_SPRAYCAN,
	wxCURSOR_WAIT,
	wxCURSOR_WATCH,
	wxCURSOR_BLANK,
	wxCURSOR_GTK_DEFAULT, -- standard X11 cursor
	wxCURSOR_ARROWWAIT,
	wxCURSOR_OSX_OPEN_HAND,
	wxCURSOR_OSX_CLOSED_HAND,
	
	wxCURSOR_MAX
	
end type

ifdef OSX then
public constant wxCURSOR_COPY_ARROW = wxCURSOR_GTK_DEFAULT -- MacOS Theme Plus arrow
end ifdef

ifdef LINUX then
public constant wxCURSOR_DEFAULT = wxCURSOR_GTK_DEFAULT
elsedef
public constant wxCURSOR_DEFAULT = wxCURSOR_ARROW
end ifdef

ifdef OSX then
public constant wxCURSOR_OPEN_HAND   = wxCURSOR_OSX_OPEN_HAND
public constant wxCURSOR_CLOSED_HAND = wxCURSOR_OSX_CLOSED_HAND
elsedef
public constant wxCURSOR_OPEN_HAND   = wxCURSOR_HAND
public constant wxCURSOR_CLOSED_HAND = wxCURSOR_HAND
end ifdef



/* ---------------------------------------------------------------------------- */
/* Ellipsize() constants */
/* ---------------------------------------------------------------------------- */

public enum type wxEllipsizeFlags
	
	wxELLIPSIZE_FLAGS_NONE = 0,
	wxELLIPSIZE_FLAGS_PROCESS_MNEMONICS = 1,
	wxELLIPSIZE_FLAGS_EXPAND_TABS = 2,
	
	wxELLIPSIZE_FLAGS_DEFAULT = 3
	
end type

-- NB: Don't change the order of these values, they're the same as in
--     PangoEllipsizeMode enum.
public enum type wxEllipsizeMode
	
	wxELLIPSIZE_NONE = 0,
	wxELLIPSIZE_START,
	wxELLIPSIZE_MIDDLE,
	wxELLIPSIZE_END
	
end type



/* --------------------------------------------------------------------------- */
/* macros */
/* --------------------------------------------------------------------------- */

-- TODO

/* =========================================================================== */
/* classes */
/* =========================================================================== */

/* --------------------------------------------------------------------------- */
/* wxSize */
/* --------------------------------------------------------------------------- */

public include "wx/base/wxSize.e"

/* --------------------------------------------------------------------------- */
/* Point classes: with real or integer coordinates */
/* --------------------------------------------------------------------------- */

public include "wx/base/wxRealPoint.e"

/* ---------------------------------------------------------------------------- */
/* wxPoint: 2D point with integer coordinates */
/* ---------------------------------------------------------------------------- */

public include "wx/base/wxPoint.e"

/* --------------------------------------------------------------------------- */
/* wxRect */
/* --------------------------------------------------------------------------- */

public include "wx/base/wxRect.e"

