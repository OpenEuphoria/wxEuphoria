
namespace wxFrame

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"

public include "wx/core/wxTopLevelWindow.e"

public type wxFrame( object x )
	return wxTopLevelWindow(x)
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXFRAME_NEW, {parent,id,title,pos,size,style,name} )
end function
