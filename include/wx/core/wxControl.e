
namespace wxControl

include "wx/dll.e"
include "wx/core.e"
include "wx/base/wxClassInfo.e"

public include "wx/core/wxWindow.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

constant wxControlInfo = wxClassInfo:FindClass( "wxControl" )

public type wxControl( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxControlInfo )
end type

