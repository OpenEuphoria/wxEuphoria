
namespace wxStandardPaths

include "wx/dll.e"
include "wx/base.e"
include "wx/string.e"

-- possible resources categories
public enum type ResourceCat
	
	ResourceCat_None = 0, -- no special category
	ResourceCat_Messages, -- message catalog resources
	ResourceCat_Max       -- end of enum marker
	
end type

-- what should we use to construct paths unique to this application:
-- (AppInfo_AppName and AppInfo_VendorName can be combined together)
public enum type AppInfo
	
	AppInfo_None = 0,  -- nothing
	AppInfo_AppName,   -- the application name
	AppInfo_VendorName -- the vendor name
	
end type

public enum type Dir
	
	Dir_Documents = 0,
	Dir_Desktop,
	Dir_Downloads,
	Dir_Music,
	Dir_Pictures,
	Dir_Videos
	
end type

public type wxStandardPaths( object x )
	return atom(x)
end type

public procedure DontIgnoreAppSubDir( wxStandardPaths self )
	wx_proc( WXSTANDARDPATHS_DONTIGNOREAPPSUBDIR, {self} )
end procedure

public function GetAppDocumentsDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETAPPDOCUMENTSDIR, {self} )
end function

public function GetConfigDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETCONFIGDIR, {self} )
end function

public function GetDataDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETDATADIR, {self} )
end function

public function GetDocumentsDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETDOCUMENTSDIR, {self} )
end function

public function GetExecutablePath( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETEXECUTABLEPATH, {self} )
end function

public function GetInstallPrefix( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETINSTALLPREFIX, {self} )
end function

public function GetLocalDataDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETLOCALDATADIR, {self} )
end function

public function GetLocalizedResourcesDir( wxStandardPaths self, wxString lang, ResourceCat category = ResourceCat_None )
	return wx_func( WXSTANDARDPATHS_GETLOCALIZEDRESOURCESDIR, {self,lang,category} )
end function

public function GetPluginsDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETPLUGINSDIR, {self} )
end function

public function GetResourcesDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETRESOURCESDIR, {self} )
end function

public function GetTempDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETTEMPDIR, {self} )
end function

public function GetUserConfigDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETUSERCONFIGDIR, {self} )
end function

public function GetUserDataDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETUSERDATADIR, {self} )
end function

public function GetUserDir( wxStandardPaths self, Dir userDir )
	return wx_func( WXSTANDARDPATHS_GETUSERDIR, {self,userDir} )
end function

public function GetUserLocalDataDir( wxStandardPaths self )
	return wx_func( WXSTANDARDPATHS_GETUSERLOCALDATADIR, {self} )
end function

public procedure IgnoreAppSubDir( wxStandardPaths self, wxString subdirPattern )
	wx_proc( WXSTANDARDPATHS_IGNOREAPPSUBDIR, {self,subdirPattern} )
end procedure

public procedure IgnoreAppBuildSubDirs( wxStandardPaths self )
	wx_proc( WXSTANDARDPATHS_IGNOREAPPBUILDSUBDIRS, {self} )
end procedure

public procedure SetInstallPrefix( wxStandardPaths self, wxString prefix )
	wx_proc( WXSTANDARDPATHS_SETINSTALLPREFIX, {self,prefix} )
end procedure

public procedure UseAppInfo( wxStandardPaths self, AppInfo info )
	wx_proc( WXSTANDARDPATHS_USEAPPINFO, {self,info} )
end procedure

public function Get()
	wxStandardPaths paths = wx_func( WXSTANDARDPATHS_GET, {} )
	return delete_routine( paths, cleanup_id )
end function

