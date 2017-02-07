
include "wx/dll.e"

atom core = wx_library( "core" )

public constant wxEVT_BUTTON = wx_event( core, "wxEVT_BUTTON" )

public include "wx/core/wxButton.e"
