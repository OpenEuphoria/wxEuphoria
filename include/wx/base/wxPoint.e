
namespace wxPoint

include "wx/dll.e"
include "wx/base.e"

public constant wxDefaultPosition = {-1,-1}

public type wxPoint( object x )
	return object(x)
end type

public function wxPOINT( atom x, atom y )
	return {x,y}
end function
