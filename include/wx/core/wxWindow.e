
namespace wxWindow

include "wx/dll.e"
include "wx/core.e"

public include "wx/base/wxEvtHandler.e"

public type wxWindow( object x )
	return wxEvtHandler(x)
end type

public function Show( wxWindow self, atom show = TRUE )
	return wx_func( WXWINDOW_SHOW, {self,show} )
end function

