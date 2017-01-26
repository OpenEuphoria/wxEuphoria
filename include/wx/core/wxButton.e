
namespace wxButton

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"
include "wx/base/wxClassInfo.e"

public include "wx/core/wxAnyButton.e"
public include "wx/core/wxControl.e"
public include "wx/core/wxWindow.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

atom core = wx_library( "core" )
public constant wxEVT_BUTTON = wx_event( core, "wxEVT_BUTTON" )

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

