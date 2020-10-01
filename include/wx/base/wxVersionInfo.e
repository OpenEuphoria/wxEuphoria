
namespace wxVersionInfo

include "wx/dll.e"
include "wx/base.e"
include "wx/object.e"
include "wx/string.e"

public type wxVersionInfo( object x )
	return atom(x)
end type

public function new( wxString name = wxEmptyString, atom major = 0, atom minor = 0, atom micro = 0, wxString description = wxEmptyString, wxString copyright = wxEmptyString )
	return wx_func( WXVERSIONINFO_NEW, {name,major,minor,micro,description,copyright} )
end function

public function GetName( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETNAME, {self} )
end function

public function GetMajor( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETMAJOR, {self} )
end function

public function GetMinor( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETMINOR, {self} )
end function

public function GetMicro( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETMICRO, {self} )
end function

public function ToString( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_TOSTRING, {self} )
end function

public function GetVersionString( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETVERSIONSTRING, {self} )
end function

public function HasDescription( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_HASDESCRIPTION, {self} )
end function

public function GetDescription( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETDESCRIPTION, {self} )
end function

public function HasCopyright( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_HASCOPYRIGHT, {self} )
end function

public function GetCopyright( wxVersionInfo self )
	return wx_func( WXVERSIONINFO_GETCOPYRIGHT, {self} )
end function

