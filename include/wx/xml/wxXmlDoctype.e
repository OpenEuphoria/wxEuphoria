
namespace wxXmlDoctype

include "wx/dll.e"
include "wx/defs.e"
include "wx/xml.e"
include "wx/string.e"

public include "wx/object.e"

public type wxXmlDoctype( object x )
	return atom(x)
end type

public function new( wxString rootName = wxEmptyString, wxString systemId = wxEmptyString, wxString publicId = wxEmptyString )
	return wx_func( WXXMLDOCTYPE_NEW, {rootName,systemId,publicId} )
end function

public procedure Clear( wxXmlDoctype self )
	wx_proc( WXXMLDOCTYPE_CLEAR, {self} )
end procedure

public function GetRootName( wxXmlDoctype self )
	return wx_func( WXXMLDOCTYPE_GETROOTNAME, {self} )
end function

public function GetSystemId( wxXmlDoctype self )
	return wx_func( WXXMLDOCTYPE_GETSYSTEMID, {self} )
end function

public function GetPublicId( wxXmlDoctype self )
	return wx_func( WXXMLDOCTYPE_GETPUBLICID, {self} )
end function

public function GetFullString( wxXmlDoctype self )
	return wx_func( WXXMLDOCTYPE_GETFULLSTRING, {self} )
end function

public function IsValid( wxXmlDoctype self )
	return wx_func( WXXMLDOCTYPE_ISVALID, {self} )
end function

