
namespace wxWindow

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"

public include "wx/event.e"
public include "wx/object.e"

constant wxWindowInfo = wxClassInfo:FindClass( "wxWindow" )

public type wxWindow( object x )
	if equal( x, NULL ) then
		return 1
	end if

	return wxObject:IsKindOf( x, wxWindowInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXWINDOW_NEW, {parent,id,pos,size,style,name} )
end function

public function Create( wxWindow self, wxWindow parent, wxWindowID id, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXWINDOW_CREATE, {self,parent,id,pos,size,style,name} )
end function

public function AcceptsFocus( wxWindow self )
	return wx_func( WXWINDOW_ACCEPTSFOCUS, {self} )
end function

public function Close( wxWindow self, atom force = FALSE )
	return wx_func( WXWINDOW_CLOSE, {self,force} )
end function

public function Show( wxWindow self, atom show = TRUE )
	return wx_func( WXWINDOW_SHOW, {self,show} )
end function

