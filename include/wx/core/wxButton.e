
namespace wxButton

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"

public include "wx/core/wxAnyButton.e"
public include "wx/base/wxEvtHandler.e"

atom core = wx_library( "core" )
public constant wxEVT_BUTTON = wx_event( core, "wxEVT_BUTTON" )

public type wxButton( object x )
	return wxAnyButton(x)
end type

public function new( wxWindow parent, wxWindowID id, wxString title, wxPoint pos, wxSize size, atom style, atom validator, wxString name )
	return wx_func( WXBUTTON_NEW, {parent,id,title,pos,size,style,validator,name} )
end function
