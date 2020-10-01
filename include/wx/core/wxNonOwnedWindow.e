
namespace wxNonOwnedWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxNonOwnedWindowInfo = wxClassInfo:FindClass( "wxNonOwnedWindow" )
constant wxWindowInfo = wxClassInfo:FindClass( "wxWindow" )

public type wxNonOwnedWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if

	return wxObject:IsKindOf( x, wxNonOwnedWindowInfo )
	    or wxObject:IsKindOf( x, wxWindowInfo )
end type

