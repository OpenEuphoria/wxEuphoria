
namespace wxWindow

include "wx/dll.e"
include "wx/core.e"
include "wx/base/wxClassInfo.e"

public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

constant wxWindowInfo = wxClassInfo:FindClass( "wxWindow" )

public type wxWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxWindowInfo )
end type

public function Show( wxWindow self, atom show = TRUE )
	return wx_func( WXWINDOW_SHOW, {self,show} )
end function

