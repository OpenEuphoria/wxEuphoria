namespace wxClassInfo

include "wx/dll.e"
include "wx/base.e"
include "wx/string.e"

public type wxClassInfo( object x )
	return 1
end type

public function new( wxString className )
	return wx_func( WXCLASSINFO_NEW, {className} )
end function

public function CreateObject( object self )
	return wx_func( WXCLASSINFO_CREATEOBJECT, {self} )
end function

public function GetBaseClassName1( wxClassInfo self )
	return wx_func( WXCLASSINFO_GETBASECLASSNAME1, {self} )
end function

public function GetBaseClassName2( wxClassInfo self )
	return wx_func( WXCLASSINFO_GETBASECLASSNAME2, {self} )
end function

public function GetClassName( wxClassInfo self )
	return wx_func( WXCLASSINFO_GETCLASSNAME, {self} )
end function

public function FindClass( wxString className )
	return wx_func( WXCLASSINFO_FINDCLASS, {className} )
end function
