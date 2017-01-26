
namespace wxAnyButton

include "wx/dll.e"
include "wx/core.e"
include "wx/base/wxClassInfo.e"

public include "wx/core/wxControl.e"
public include "wx/core/wxWindow.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

constant wxAnyButtonInfo = wxClassInfo:FindClass( "wxAnyButton" )

public type wxAnyButton( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxAnyButtonInfo )
end type

