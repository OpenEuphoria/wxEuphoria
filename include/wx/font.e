
include "wx/dll.e"
include "wx/defs.e"

public include "wx/core/wxFont.e"

atom core = wx_library( "core" )

-- ----------------------------------------------------------------------------
-- font constants
-- ----------------------------------------------------------------------------

-- standard font families: these may be used only for the font creation, it
-- doesn't make sense to query an existing font for its font family as,
-- especially if the font had been created from a native font description, it
-- may be unknown
public enum type wxFontFamily

	wxFONTFAMILY_DEFAULT = 70,	-- = wxDEFAULT,
	wxFONTFAMILY_DECORATIVE,	-- = wxDECORATIVE,
	wxFONTFAMILY_ROMAN,			-- = wxROMAN,
	wxFONTFAMILY_SCRIPT,		-- = wxSCRIPT,
	wxFONTFAMILY_SWISS,			-- = wxSWISS,
	wxFONTFAMILY_MODERN,		-- = wxMODERN,
	wxFONTFAMILY_TELETYPE,		-- = wxTELETYPE,
	wxFONTFAMILY_MAX,
	wxFONTFAMILY_UNKNOWN		-- = wxFONTFAMILY_MAX

end type

-- font styles
public enum type wxFontStyle

	wxFONTSTYLE_NORMAL = 90,	-- = wxNORMAL,
	wxFONTSTYLE_ITALIC,			-- = wxITALIC,
	wxFONTSTYLE_SLANT,			-- = wxSLANT,
	wxFONTSTYLE_MAX

end type

-- font weights
public enum type wxFontWeight

	wxFONTWEIGHT_NORMAL = 90,	-- = wxNORMAL,
	wxFONTWEIGHT_LIGHT,			-- = wxLIGHT,
	wxFONTWEIGHT_BOLD,			-- = wxBOLD,
	wxFONTWEIGHT_MAX

end type

-- Symbolic font sizes as defined in CSS specification.
public enum type wxFontSymbolicSize

	wxFONTSIZE_XX_SMALL = -3,
	wxFONTSIZE_X_SMALL,
	wxFONTSIZE_SMALL,
	wxFONTSIZE_MEDIUM,
	wxFONTSIZE_LARGE,
	wxFONTSIZE_X_LARGE,
	wxFONTSIZE_XX_LARGE

end type

-- the font flag bits for the new font ctor accepting one combined flags word
public enum type wxFontFlag

	-- no special flags: font with default weight/slant/anti-aliasing
	wxFONTFLAG_DEFAULT			=   0,

	-- slant flags (default: no slant)
	wxFONTFLAG_ITALIC			=   1, -- 1 << 0,
	wxFONTFLAG_SLANT			=   2, -- 1 << 1,

	-- weight flags (default: medium)
	wxFONTFLAG_LIGHT			=   4, -- 1 << 2,
	wxFONTFLAG_BOLD				=   8, -- 1 << 3,

	-- anti-aliasing flag: force on or off (default: the current system default)
	wxFONTFLAG_ANTIALIASED		=  16, -- 1 << 4,
	wxFONTFLAG_NOT_ANTIALIASED	=  32, -- 1 << 5,

	-- underlined/strikethrough flags (default: no lines)
	wxFONTFLAG_UNDERLINED		=  64, -- 1 << 6,
	wxFONTFLAG_STRIKETHROUGH	= 128  -- 1 << 7

--	-- the mask of all currently used flags
--	wxFONTFLAG_MASK = wxFONTFLAG_ITALIC				|
--					  wxFONTFLAG_SLANT				|
--					  wxFONTFLAG_LIGHT				|
--					  wxFONTFLAG_BOLD				|
--					  wxFONTFLAG_ANTIALIASED		|
--					  wxFONTFLAG_NOT_ANTIALIASED	|
--					  wxFONTFLAG_UNDERLINED			|
--					  wxFONTFLAG_STRIKETHROUGH

end type

