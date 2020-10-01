
namespace wxButton

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/button.e"

public include "wx/anybutton.e"
public include "wx/control.e"
public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxButtonInfo = wxClassInfo:FindClass( "wxButton" )

public type wxButton( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxButtonInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, atom validator, wxString name )
	return wx_func( WXBUTTON_NEW, {parent,id,title,pos,size,style,validator,name} )
end function

public function Create( wxButton self, wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, atom validator, wxString name )
	return wx_func( WXBUTTON_CREATE, {self,parent,id,title,pos,size,style,validator,name} )
end function

