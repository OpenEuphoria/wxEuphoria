
include "wx/dll.e"

atom core = wx_library( "core" )

public constant wxEVT_MENU = wx_event( core, "wxEVT_MENU" )

public include "wx/core/wxMenuBar.e"
public include "wx/core/wxMenu.e"
public include "wx/core/wxMenuItem.e"
