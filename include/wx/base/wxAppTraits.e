
namespace wxAppTraits

include "wx/dll.e"
include "wx/base.e"
include "wx/string.e"
include "wx/stdpaths.e"

public type wxAppTraits( object x )
	return atom(x)
end type

public function GetDesktopEnvironment( wxAppTraits self )
	return wx_func( WXAPPTRAITS_GETDESKTOPENVIRONMENT, {self} )
end function

public function GetStandardPaths( wxAppTraits self )
	wxStandardPaths paths = wx_func( WXAPPTRAITS_GETSTANDARDPATHS, {self} )
	return delete_routine( paths, cleanup_id )
end function

public function GetToolkitVersion( wxAppTraits self )
	return wx_func( WXAPPTRAITS_GETTOOLKITVERSION, {self} )
end function

public function HasStderr( wxAppTraits self )
	return wx_func( WXAPPTRAITS_HASSTDERR, {self} )
end function

public function IsUsingUniversalWidgets( wxAppTraits self )
	return wx_func( WXAPPTRAITS_ISUSINGUNIVERSALWIDGETS, {self} )
end function

public function ShowAssertDialog( wxAppTraits self, wxString msg )
	return wx_func( WXAPPTRAITS_SHOWASSERTDIALOG, {self,msg} )
end function
