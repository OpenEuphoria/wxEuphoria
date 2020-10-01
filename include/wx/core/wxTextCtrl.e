
namespace wxTextCtrl

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/textctrl.e"
include "wx/validate.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxTextCtrlInfo = wxClassInfo:FindClass( "wxTextCtrl" )

public type wxTextCtrl( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxTextCtrlInfo )
end type

public function new( wxWindow parent, wxWindowID id = wxID_ANY, wxString value = wxEmptyString, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = 0, wxValidator validator = wxDefaultValidator, wxString name = wxTextCtrlNameStr )
	return wx_func( WXTEXTCTRL_NEW, {parent,id,value,pos,size,style,validator,name} )
end function

public function Create( wxTextCtrl self, wxWindow parent, wxWindowID id = wxID_ANY, wxString value = wxEmptyString, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = 0, wxValidator validator = wxDefaultValidator, wxString name = wxTextCtrlNameStr )
	return wx_func( WXTEXTCTRL_CREATE, {self,parent,id,value,pos,size,style,validator,name} )
end function

