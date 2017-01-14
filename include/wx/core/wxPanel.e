
namespace wxPanel

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"

public include "wx/core/wxWindow.e"

public type wxPanel( object x )
	return wxWindow(x)
end type

public function new( wxWindow parent, wxWindowID id, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXPANEL_NEW, {parent,id,pos,size,style,name} )
end function
