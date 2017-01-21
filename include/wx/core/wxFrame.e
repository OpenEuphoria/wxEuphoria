
namespace wxFrame

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"
include "wx/app.e"

public include "wx/core/wxTopLevelWindow.e"

public type wxFrame( object x )
	return wxTopLevelWindow(x)
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, wxString name )
	if wxApp:GetInstance() = NULL then wxApp:new() end if
	return wx_func( WXFRAME_NEW, {parent,id,title,pos,size,style,name} )
end function

public function Create( wxFrame self, wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, wxString name )
	if wxApp:GetInstance() = NULL then wxApp:new() end if
	return wx_func( WXFRAME_CREATE, {self,parent,id,title,pos,size,style,name} )
end function
