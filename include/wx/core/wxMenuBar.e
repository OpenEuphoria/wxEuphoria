
namespace wxMenuBar

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/object.e"

constant wxMenuBarInfo = wxClassInfo:FindClass( "wxMenuBar" )

public type wxMenuBar( object x )
	return wxObject:IsKindOf( x, wxMenuBarInfo )
end type
