
namespace wxToolBar

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"

public include "wx/control.e"
public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxToolBarInfo = wxClassInfo:FindClass( "wxToolBar" )

public type wxToolBar( object x )
	return wxObject:IsKindOf( x, wxToolBarInfo )
end type
