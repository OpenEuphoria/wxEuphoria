
namespace wxStatusBar

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/object.e"

constant wxStatusBarInfo = wxClassInfo:FindClass( "wxStatusBar" )

public type wxStatusBar( object x )
	return wxObject:IsKindOf( x, wxStatusBarInfo )
end type
