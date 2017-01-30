
namespace wxObject

include "wx/dll.e"
include "wx/base.e"
include "wx/object.e"

constant wxObjectInfo = wxClassInfo:FindClass( "wxObject" )

public type wxObject( object x )
	if equal( x, NULL ) then
		return 1
	end if
	
	return wx_func( WXOBJECT_ISKINDOF, {x,wxObjectInfo} )
end type

public function GetClassInfo( wxObject self )
	return wx_func( WXOBJECT_GETCLASSINFO, {self} )
end function

public function IsKindOf( wxObject self, wxClassInfo info )
	return wx_func( WXOBJECT_ISKINDOF, {self,info} )
end function

public function IsSameAs( wxObject self, wxObject obj )
	return wx_func( WXOBJECT_ISSAMEAS, {self,obj} )
end function

