
namespace wxAnyButton

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/control.e"
public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxAnyButtonInfo = wxClassInfo:FindClass( "wxAnyButton" )

public type wxAnyButton( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxAnyButtonInfo )
end type

