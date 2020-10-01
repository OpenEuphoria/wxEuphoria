
namespace wxControl

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxControlInfo = wxClassInfo:FindClass( "wxControl" )

public type wxControl( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxControlInfo )
end type

