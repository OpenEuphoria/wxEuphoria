
namespace wxIcon

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/icon.e"
include "wx/gdicmn.e"

public include "wx/object.e"

constant wxIconInfo = wxClassInfo:FindClass( "wxIcon" )

public type wxIcon( object x )
	return wxObject:IsKindOf( x, wxIconInfo )
end type

public function new( object iconData, wxBitmapType iconType = wxBITMAP_TYPE_ANY, atom desiredWidth = -1, atom desiredHeight = -1 )
	return wx_func( WXICON_NEW, {iconData,iconType,desiredWidth,desiredHeight} )
end function

