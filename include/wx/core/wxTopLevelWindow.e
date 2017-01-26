
namespace wxTopLevelWindow

include "wx/dll.e"
include "wx/core.e"
include "wx/base/wxClassInfo.e"

public include "wx/core/wxNonOwnedWindow.e"
public include "wx/core/wxWindow.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

constant wxTopLevelWindowInfo = wxClassInfo:FindClass( "wxTopLevelWindow" )

public type wxTopLevelWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxTopLevelWindowInfo )
end type

