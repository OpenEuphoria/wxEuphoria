namespace wxClassInfo

include "wx/dll.e"
include "wx/base.e"
include "wx/string.e"
include "wx/debug.e"
include "std/types.e"

public type wxClassInfo( object x )
	return atom(x) or string(x)
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

	wxClassInfo info = wx_func( WXCLASSINFO_FINDCLASS, {className} )
	wxDebugf( "0x%08x %s\n", {info,className} )

	return info
end function
