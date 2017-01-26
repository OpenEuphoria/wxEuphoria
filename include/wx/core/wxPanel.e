
namespace wxPanel

include "wx/dll.e"
include "wx/core.e"
include "wx/string.e"
include "wx/windowid.e"
include "wx/gdicmn.e"
include "wx/base/wxClassInfo.e"

public include "wx/core/wxWindow.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/base/wxObject.e"

constant wxPanelInfo = wxClassInfo:FindClass( "wxPanel" )

public type wxPanel( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wxObject:IsKindOf( x, wxPanelInfo )
end type

public function new( wxWindow parent, wxWindowID id, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXPANEL_NEW, {parent,id,pos,size,style,name} )
end function

public function Create( wxPanel self, wxWindow parent, wxWindowID id, wxPoint pos, wxSize size, atom style, wxString name )
	return wx_func( WXPANEL_CREATE, {self,parent,id,pos,size,style,name} )
end function

