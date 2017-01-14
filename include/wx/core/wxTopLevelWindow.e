
namespace wxTopLevelWindow

include "wx/dll.e"
include "wx/core.e"

public include "wx/core/wxNonOwnedWindow.e"

public type wxTopLevelWindow( object x )
	return wxNonOwnedWindow(x)
end type

