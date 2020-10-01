
namespace wxSize

include "wx/dll.e"
include "wx/base.e"

public constant wxDefaultSize = {-1,-1}

public type wxSize( object x )
	return object(x)
end type

public function wxSIZE( atom w, atom h )
	return {w,h}
end function
