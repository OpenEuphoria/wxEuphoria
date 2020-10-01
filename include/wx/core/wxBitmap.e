
namespace wxBitmap

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/object.e"

constant wxBitmapInfo = wxClassInfo:FindClass( "wxBitmap" )

public type wxBitmap( object x )
	return wxObject:IsKindOf( x, wxBitmapInfo )
end type
