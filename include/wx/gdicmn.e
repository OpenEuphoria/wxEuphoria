
include "wx/dll.e"

atom core = wx_library( "core" )

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

/* --------------------------------------------------------------------------- */
/* Management of pens, brushes and fonts */
/* --------------------------------------------------------------------------- */


/* --------------------------------------------------------------------------- */
/* global variables */
/* --------------------------------------------------------------------------- */

public include "wx/core/wxStockGDI.e"

public constant
	wxITALIC_FONT       = wxStockGDI:GetFont( wxStockGDI:FONT_ITALIC ),
	wxNORMAL_FONT       = wxStockGDI:GetFont( wxStockGDI:FONT_NORMAL ),
	wxSMALL_FONT        = wxStockGDI:GetFont( wxStockGDI:FONT_SMALL ),
	wxSWISS_FONT        = wxStockGDI:GetFont( wxStockGDI:FONT_SWISS ),
$

public constant
	wxBLACK_DASHED_PEN  = wxStockGDI:GetPen( wxStockGDI:PEN_BLACKDASHED ),
	wxBLACK_PEN         = wxStockGDI:GetPen( wxStockGDI:PEN_BLACK ),
	wxBLUE_PEN          = wxStockGDI:GetPen( wxStockGDI:PEN_BLUE ),
	wxCYAN_PEN          = wxStockGDI:GetPen( wxStockGDI:PEN_CYAN ),
	wxGREEN_PEN         = wxStockGDI:GetPen( wxStockGDI:PEN_GREEN ),
	wxYELLOW_PEN        = wxStockGDI:GetPen( wxStockGDI:PEN_YELLOW ),
	wxGREY_PEN          = wxStockGDI:GetPen( wxStockGDI:PEN_GREY ),
	wxLIGHT_GREY_PEN    = wxStockGDI:GetPen( wxStockGDI:PEN_LIGHTGREY ),
	wxMEDIUM_GREY_PEN   = wxStockGDI:GetPen( wxStockGDI:PEN_MEDIUMGREY ),
	wxRED_PEN           = wxStockGDI:GetPen( wxStockGDI:PEN_RED ),
	wxTRANSPARENT_PEN   = wxStockGDI:GetPen( wxStockGDI:PEN_TRANSPARENT ),
	wxWHITE_PEN         = wxStockGDI:GetPen( wxStockGDI:PEN_WHITE ),
$

public constant
	wxBLACK_BRUSH           = wxStockGDI:GetBrush( wxStockGDI:BRUSH_BLACK ),
	wxBLUE_BRUSH            = wxStockGDI:GetBrush( wxStockGDI:BRUSH_BLUE ),
	wxCYAN_BRUSH            = wxStockGDI:GetBrush( wxStockGDI:BRUSH_CYAN ),
	wxGREEN_BRUSH           = wxStockGDI:GetBrush( wxStockGDI:BRUSH_GREEN ),
	wxYELLOW_BRUSH          = wxStockGDI:GetBrush( wxStockGDI:BRUSH_YELLOW ),
	wxGREY_BRUSH            = wxStockGDI:GetBrush( wxStockGDI:BRUSH_GREY ),
	wxLIGHT_GREY_BRUSH      = wxStockGDI:GetBrush( wxStockGDI:BRUSH_LIGHTGREY ),
	wxMEDIUM_GREY_BRUSH     = wxStockGDI:GetBrush( wxStockGDI:BRUSH_MEDIUMGREY ),
	wxRED_BRUSH             = wxStockGDI:GetBrush( wxStockGDI:BRUSH_RED ),
	wxTRANSPARENT_BRUSH     = wxStockGDI:GetBrush( wxStockGDI:BRUSH_TRANSPARENT ),
	wxWHITE_BRUSH           = wxStockGDI:GetBrush( wxStockGDI:BRUSH_WHITE ),
$

public constant
	wxBLACK                 = wxStockGDI:GetColour( wxStockGDI:COLOUR_BLACK ),
	wxBLUE                  = wxStockGDI:GetColour( wxStockGDI:COLOUR_BLUE ),
	wxCYAN                  = wxStockGDI:GetColour( wxStockGDI:COLOUR_CYAN ),
	wxGREEN                 = wxStockGDI:GetColour( wxStockGDI:COLOUR_GREEN ),
	wxYELLOW                = wxStockGDI:GetColour( wxStockGDI:COLOUR_YELLOW ),
	wxLIGHT_GREY            = wxStockGDI:GetColour( wxStockGDI:COLOUR_LIGHTGREY ),
	wxRED                   = wxStockGDI:GetColour( wxStockGDI:COLOUR_RED ),
	wxWHITE                 = wxStockGDI:GetColour( wxStockGDI:COLOUR_WHITE ),
$

public constant
	wxCROSS_CURSOR          = wxStockGDI:GetCursor( wxStockGDI:CURSOR_CROSS ),
	wxHOURGLASS_CURSOR      = wxStockGDI:GetCursor( wxStockGDI:CURSOR_HOURGLASS ),
	wxSTANDARD_CURSOR       = wxStockGDI:GetCursor( wxStockGDI:CURSOR_STANDARD ),
$

-- 'Null' objects

public constant
	wxNullBitmap            = wx_define( core, "wxNullBitmap" ),
	wxNullIcon              = wx_define( core, "wxNullIcon" ),
	wxNullCursor            = wx_define( core, "wxNullCursor" ),
	wxNullPen               = wx_define( core, "wxNullPen" ),
	wxNullBrush             = wx_define( core, "wxNullBrush" ),
	wxNullPalette           = wx_define( core, "wxNullPalette" ),
	wxNullFont              = wx_define( core, "wxNullFont" ),
	wxNullColour            = wx_define( core, "wxNullColour" ),
	wxNullIconBundle        = wx_define( core, "wxNullIconBundle" ),
$

public constant
	wxTheColourDatabase     = wx_define( core, "wxTheColourDatabase" ),
$


