
namespace wxNonOwnedWindow

include "wx/dll.e"
include "wx/core.e"

public include "wx/core/wxWindow.e"

public type wxNonOwnedWindow( object x )
	return wxWindow(x)
end type

