
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
	return get_sequence( ((wxStandardPaths*)self)->GetAppDocumentsDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetConfigDir( object self )
{
	wxString configDir = ((wxStandardPaths*)self)->GetConfigDir();
	wxPrintf( "configDir = '%s'\n", configDir );
	
	return get_sequence( configDir );
}

object WXEUAPI_BASE wxStandardPaths_GetDataDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetDataDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetDocumentsDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetDocumentsDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetExecutablePath( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetExecutablePath() );
}

object WXEUAPI_BASE wxStandardPaths_GetInstallPrefix( object self )
{
#ifdef WXEUGTK
	return get_sequence( ((wxStandardPaths*)self)->GetInstallPrefix() );
#else
	return EMPTY_SEQUENCE;
#endif
}

object WXEUAPI_BASE wxStandardPaths_GetLocalDataDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetLocalDataDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetLocalizedResourcesDir( object self, object lang, object category )
{
	wxDeRef( lang );
	return get_sequence( ((wxStandardPaths*)self)->GetLocalizedResourcesDir(
		get_string(lang), (wxStandardPaths::ResourceCat)category ) );
}

object WXEUAPI_BASE wxStandardPaths_GetPluginsDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetPluginsDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetResourcesDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetResourcesDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetTempDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetTempDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetUserConfigDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetUserConfigDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetUserDataDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetUserDataDir() );
}

object WXEUAPI_BASE wxStandardPaths_GetUserDir( object self, object userDir )
{
	return get_sequence( ((wxStandardPaths*)self)->GetUserDir( (wxStandardPaths::Dir)userDir ) );
}

object WXEUAPI_BASE wxStandardPaths_GetUserLocalDataDir( object self )
{
	return get_sequence( ((wxStandardPaths*)self)->GetUserLocalDataDir() );
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