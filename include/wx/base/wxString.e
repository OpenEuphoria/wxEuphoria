
namespace wxString

include "wx/dll.e"
include "wx/base.e"
include "std/types.e"

public constant wxEmptyString = ""

public type wxString( object x )
	return string(x)
end type

