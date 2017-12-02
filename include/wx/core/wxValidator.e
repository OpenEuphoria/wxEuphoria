
namespace wxValidator

include "wx/dll.e"

public include "wx/event.e"
public include "wx/object.e"

constant wxValidatorInfo = wxClassInfo:FindClass( "wxValidator" )

public type wxValidator( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxValidatorInfo )
end type

