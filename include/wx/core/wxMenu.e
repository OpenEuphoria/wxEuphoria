
namespace wxMenu

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/object.e"

constant wxMenuInfo = wxClassInfo:FindClass( "wxMenu" )

public type wxMenu( object x )
	return wxObject:IsKindOf( x, wxMenuInfo )
end type
