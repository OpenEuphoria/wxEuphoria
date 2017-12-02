
include "wx/dll.e"

public include "wx/core/wxValidator.e"

atom core = wx_library( "core" )

public constant wxDefaultValidator = wx_define( core, "wxDefaultValidator" )
