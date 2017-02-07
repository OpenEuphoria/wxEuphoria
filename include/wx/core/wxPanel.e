
namespace wxPanel

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"
include "wx/gdicmn.e"
include "wx/panel.e"

public include "wx/window.e"
public include "wx/event.e"
public include "wx/object.e"

constant wxPanelInfo = wxClassInfo:FindClass( "wxPanel" )

public type wxPanel( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxPanelInfo )
end type

public function new( wxWindow parent, wxWindowID id = wxID_ANY, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxTAB_TRAVERSAL, wxString name = wxPanelNameStr )
	return wx_func( WXPANEL_NEW, {parent,id,pos,size,style,name} )
end function

public function Create( wxPanel self, wxWindow parent, wxWindowID id = wxID_ANY, wxPoint pos = wxDefaultPosition, wxSize size = wxDefaultSize, atom style = wxTAB_TRAVERSAL, wxString name = wxPanelNameStr )
	return wx_func( WXPANEL_CREATE, {self,parent,id,pos,size,style,name} )
end function

