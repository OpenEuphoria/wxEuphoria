
namespace wxStockGDI

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public enum type Item
	
	BRUSH_BLACK = 0,
	BRUSH_BLUE,
	BRUSH_CYAN,
	BRUSH_GREEN,
	BRUSH_YELLOW,
	BRUSH_GREY,
	BRUSH_LIGHTGREY,
	BRUSH_MEDIUMGREY,
	BRUSH_RED,
	BRUSH_TRANSPARENT,
	BRUSH_WHITE,
	COLOUR_BLACK,
	COLOUR_BLUE,
	COLOUR_CYAN,
	COLOUR_GREEN,
	COLOUR_YELLOW,
	COLOUR_LIGHTGREY,
	COLOUR_RED,
	COLOUR_WHITE,
	CURSOR_CROSS,
	CURSOR_HOURGLASS,
	CURSOR_STANDARD,
	FONT_ITALIC,
	FONT_NORMAL,
	FONT_SMALL,
	FONT_SWISS,
	PEN_BLACK,
	PEN_BLACKDASHED,
	PEN_BLUE,
	PEN_CYAN,
	PEN_GREEN,
	PEN_YELLOW,
	PEN_GREY,
	PEN_LIGHTGREY,
	PEN_MEDIUMGREY,
	PEN_RED,
	PEN_TRANSPARENT,
	PEN_WHITE,
	ITEMCOUNT
	
end type

public type wxStockGDI( object x )
	return atom( x )
end type

public function GetBrush( Item item )
	return wx_func( WXSTOCKGDI_GETBRUSH, {item} )
end function

public function GetColour( Item item )
	return wx_func( WXSTOCKGDI_GETCOLOUR, {item} )
end function

public function GetCursor( Item item )
	return wx_func( WXSTOCKGDI_GETCURSOR, {item} )
end function

public function GetFont( Item item )
	return wx_func( WXSTOCKGDI_GETFONT, {item} )
end function

public function GetPen( Item item )
	return wx_func( WXSTOCKGDI_GETPEN, {item} )
end function
