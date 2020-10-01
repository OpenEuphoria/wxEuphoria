
include "wx/dll.e"
include "wx/defs.e"

public include "wx/core/wxTextCtrl.e"

atom core = wx_library( "core" )

public constant wxTextCtrlNameStr = wx_string( core, "wxTextCtrlNameStr" )

public constant
	wxEVT_TEXT			= wx_event( core, "wxEVT_TEXT" ),
	wxEVT_TEXT_ENTER	= wx_event( core, "wxEVT_TEXT_ENTER" ),
	wxEVT_TEXT_URL		= wx_event( core, "wxEVT_TEXT_URL" ),
	wxEVT_TEXT_MAXLEN	= wx_event( core, "wxEVT_TEXT_MAXLEN" ),
$

-- ----------------------------------------------------------------------------
-- wxTextCtrl style flags
-- ----------------------------------------------------------------------------

public constant

	wxTE_NO_VSCROLL		= 0x0002,
	wxTE_READONLY		= 0x0010,
	wxTE_MULTILINE		= 0x0020,
	wxTE_PROCESS_TAB	= 0x0040,

-- alignment flags
	wxTE_LEFT			= 0x0000,					-- 0x0000
	wxTE_CENTER			= wxALIGN_CENTER_HORIZONTAL,-- 0x0100
	wxTE_RIGHT			= wxALIGN_RIGHT,			-- 0x0200
	wxTE_CENTRE			= wxTE_CENTER,

-- this style means to use RICHEDIT control and does something only under wxMSW
-- and Win32 and is silently ignored under all other platforms
	wxTE_RICH			= 0x0080,

	wxTE_PROCESS_ENTER	= 0x0400,
	wxTE_PASSWORD		= 0x0800,

-- automatically detect the URLs and generate the events when mouse is
-- moved/clicked over an URL
--
-- this is for Win32 richedit and wxGTK2 multiline controls only so far
	wxTE_AUTO_URL		= 0x1000,

-- by default, the Windows text control doesn't show the selection when it
-- doesn't have focus - use this style to force it to always show it
	wxTE_NOHIDESEL		= 0x2000,

-- use wxHSCROLL to not wrap text at all, wxTE_CHARWRAP to wrap it at any
-- position and wxTE_WORDWRAP to wrap at words boundary
--
-- if no wrapping style is given at all, the control wraps at word boundary
	wxTE_DONTWRAP		= wxHSCROLL,
	wxTE_CHARWRAP		= 0x4000,	-- wrap at any position
	wxTE_WORDWRAP		= 0x0001,	-- wrap only at words boundaries
	wxTE_BESTWRAP		= 0x0000,	-- this is the default

-- force using RichEdit version 2.0 or 3.0 instead of 1.0 (default) for
-- wxTE_RICH controls - can be used together with or instead of wxTE_RICH
	wxTE_RICH2			= 0x8000,

	wxTE_CAPITALIZE		= 0x0000,

$