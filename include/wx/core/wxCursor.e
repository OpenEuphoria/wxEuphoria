
namespace wxCursor

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/gdicmn.e"

public type wxCursor( object x )
	return atom(x)
end type

public function new( wxStockCursor cursorId )
	return wx_func( WXCURSOR_NEW, {cursorId} )
end function
