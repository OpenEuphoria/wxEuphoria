
#include <wx/stdpaths.h>
#include "wxEuphoria.h"

extern "C" {

/* Public Member Functions */

void WXEUAPI_BASE wxStandardPaths_DontIgnoreAppSubDir( object self )
{
#ifdef WXEUMSW
	((wxStandardPaths*)self)->DontIgnoreAppSubDir();
#endif
}

object WXEUAPI_BASE wxStandardPaths_GetAppDocumentsDir( object self )
{
	wxString documentsDir =((wxStandardPaths*)self)->GetAppDocumentsDir();
	
	return get_sequence( documentsDir );
}

object WXEUAPI_BASE wxStandardPaths_GetConfigDir( object self )
{
	wxString configDir = ((wxStandardPaths*)self)->GetConfigDir();
	
	return get_sequence( configDir );
}

object WXEUAPI_BASE wxStandardPaths_GetDataDir( object self )
{
	wxString dataDir = ((wxStandardPaths*)self)->GetDataDir();
	
	return get_sequence( dataDir );
}

object WXEUAPI_BASE wxStandardPaths_GetDocumentsDir( object self )
{
	wxString documentsDir = ((wxStandardPaths*)self)->GetDocumentsDir();
	
	return get_sequence( documentsDir );
}

object WXEUAPI_BASE wxStandardPaths_GetExecutablePath( object self )
{
	wxString executablePath = ((wxStandardPaths*)self)->GetExecutablePath();
	
	return get_sequence( executablePath );
}

object WXEUAPI_BASE wxStandardPaths_GetInstallPrefix( object self )
{
#ifdef WXEUGTK
	wxString prefix = ((wxStandardPaths*)self)->GetInstallPrefix();
	
	return get_sequence( prefix );
#else
	return EMPTY_SEQUENCE;
#endif
}

object WXEUAPI_BASE wxStandardPaths_GetLocalDataDir( object self )
{
	wxString dataDir = ((wxStandardPaths*)self)->GetLocalDataDir();
	
	return get_sequence( dataDir );
}

object WXEUAPI_BASE wxStandardPaths_GetLocalizedResourcesDir( object self, object lang, object category )
{
	wxString resourcesDir = ((wxStandardPaths*)self)->GetLocalizedResourcesDir(
		get_string(lang), (wxStandardPaths::ResourceCat)category );
	
	wxDeRef( lang );
	return get_sequence( resourcesDir );
}

object WXEUAPI_BASE wxStandardPaths_GetPluginsDir( object self )
{
	wxString pluginsDir = ((wxStandardPaths*)self)->GetPluginsDir();
	
	return get_sequence( pluginsDir );
}

object WXEUAPI_BASE wxStandardPaths_GetResourcesDir( object self )
{
	wxString resourcesDir = ((wxStandardPaths*)self)->GetResourcesDir();
	
	return get_sequence( resourcesDir );
}

object WXEUAPI_BASE wxStandardPaths_GetTempDir( object self )
{
	wxString tempDir = ((wxStandardPaths*)self)->GetTempDir();
	
	return get_sequence( tempDir );
}

object WXEUAPI_BASE wxStandardPaths_GetUserConfigDir( object self )
{
	wxString configDir = ((wxStandardPaths*)self)->GetUserConfigDir();
	
	return get_sequence( configDir );
}

object WXEUAPI_BASE wxStandardPaths_GetUserDataDir( object self )
{
	wxString dataDir = ((wxStandardPaths*)self)->GetUserDataDir();
	
	return get_sequence( dataDir );
}

object WXEUAPI_BASE wxStandardPaths_GetUserDir( object self, object userDir )
{
	wxString value = ((wxStandardPaths*)self)->GetUserDir( (wxStandardPaths::Dir)userDir );
	
	return get_sequence( value );
}

object WXEUAPI_BASE wxStandardPaths_GetUserLocalDataDir( object self )
{
	wxString dataDir = ((wxStandardPaths*)self)->GetUserLocalDataDir();
	
	return get_sequence( dataDir );
}

void WXEUAPI_BASE wxStandardPaths_IgnoreAppSubDir( object self, object subdirPattern )
{
	wxDeRef( subdirPattern );
#ifdef WXEUMSW
	((wxStandardPaths*)self)->IgnoreAppSubDir( get_string(subdirPattern) );
#endif
}

void WXEUAPI_BASE wxStandardPaths_IgnoreAppBuildSubDirs( object self )
{
#ifdef WXEUMSW
	((wxStandardPaths*)self)->IgnoreAppBuildSubDirs();
#endif
}

void WXEUAPI_BASE wxStandardPaths_SetInstallPrefix( object self, object prefix )
{
	wxDeRef( prefix );
#ifdef WXEUGTK
	((wxStandardPaths*)self)->SetInstallPrefix( get_string(prefix) );
#endif
}

void WXEUAPI_BASE wxStandardPaths_UseAppInfo( object self, object info )
{
	((wxStandardPaths*)self)->UseAppInfo( get_int(info) );
}

/* Static Public Member Functions */

object WXEUAPI_BASE wxStandardPaths_Get()
{
	wxStandardPaths* paths = &wxStandardPaths::Get();
	
	return BOX_INT( paths );
}

};