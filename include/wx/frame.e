
include "wx/dll.e"

public include "wx/core/wxFrame.e"

atom core = wx_library( "core" )

public constant wxFrameNameStr = wx_string( core, "wxFrameNameStr" )

public constant
	wxEVT_CLOSE_WINDOW			= wx_event( core, "wxEVT_CLOSE_WINDOW" ),
	wxEVT_ICONIZE				= wx_event( core, "wxEVT_ICONIZE" ),
	wxEVT_MENU_OPEN				= wx_event( core, "wxEVT_MENU_OPEN" ),
	wxEVT_MENU_CLOSE			= wx_event( core, "wxEVT_MENU_CLOSE" ),
	wxEVT_MENU_HIGHLIGHT		= wx_event( core, "wxEVT_MENU_HIGHLIGHT" ),
$

public constant
	wxFRAME_NO_TASKBAR      = 0x0002,
	wxFRAME_TOOL_WINDOW     = 0x0004,
	wxFRAME_FLOAT_ON_PARENT = 0x0008,
$

