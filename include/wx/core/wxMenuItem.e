
namespace wxMenuItem

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/object.e"

constant wxMenuItemInfo = wxClassInfo:FindClass( "wxMenuItem" )

public type wxMenuItem( object x )
	return wxObject:IsKindOf( x, wxMenuItemInfo )
end type
