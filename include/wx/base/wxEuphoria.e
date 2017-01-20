namespace wxEuphoria

include "wx/dll.e"
include "wx/base.e"
include "std/machine.e"

function Malloc( atom size )
	return machine_func( M_ALLOC, size )
end function

public procedure Initialize()

	atom malloc_func = wx_callback( "Malloc" )
	wx_proc( WXEUPHORIA_INITIALIZE, {malloc_func} )

end procedure
