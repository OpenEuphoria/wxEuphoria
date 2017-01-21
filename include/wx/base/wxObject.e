
namespace wxObject

include "wx/dll.e"
include "wx/base.e"

include "wx/base/wxClassInfo.e"

public type wxObject( object x )
	return 1
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

