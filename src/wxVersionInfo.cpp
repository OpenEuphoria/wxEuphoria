
#include <wx/versioninfo.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxVersionInfo_new( object name, object major, object minor, object micro, object description, object copyright )
{
	wxVersionInfo* info = new wxVersionInfo( get_string(name),
		get_int(major), get_int(minor), get_int(micro),
		get_string(description), get_string(copyright) );
	
	wxDeRef( name );
	wxDeRef( description );
	wxDeRef( copyright );
	
	return BOX_INT( info );
}

object WXEUAPI_BASE wxVersionInfo_GetName( object self )
{
	wxString name = ((wxVersionInfo*)self)->GetName();
	
	return get_sequence( name );
}

object WXEUAPI_BASE wxVersionInfo_GetMajor( object self )
{
	int major = ((wxVersionInfo*)self)->GetMajor();
	
	return BOX_INT( major );
}

object WXEUAPI_BASE wxVersionInfo_GetMinor( object self )
{
	int minor = ((wxVersionInfo*)self)->GetMinor();
	
	return BOX_INT( minor );
}

object WXEUAPI_BASE wxVersionInfo_GetMicro( object self )
{
	int micro = ((wxVersionInfo*)self)->GetMicro();
	
	return BOX_INT( micro );
}

object WXEUAPI_BASE wxVersionInfo_ToString( object self )
{
	wxString string = ((wxVersionInfo*)self)->ToString();
	
	return get_sequence( string );
}

object WXEUAPI_BASE wxVersionInfo_GetVersionString( object self )
{
	wxString version = ((wxVersionInfo*)self)->GetVersionString();
	
	return get_sequence( version );
}

object WXEUAPI_BASE wxVersionInfo_HasDescription( object self )
{
	bool result = ((wxVersionInfo*)self)->HasDescription();
	
	return BOX_INT( result );
}

object WXEUAPI_BASE wxVersionInfo_GetDescription( object self )
{
	wxString description = ((wxVersionInfo*)self)->GetDescription();
	
	return get_sequence( description );
}

object WXEUAPI_BASE wxVersionInfo_HasCopyright( object self )
{
	bool result = ((wxVersionInfo*)self)->HasCopyright();
	
	return BOX_INT( result );
}

object WXEUAPI_BASE wxVersionInfo_GetCopyright( object self )
{
	wxString copyright = ((wxVersionInfo*)self)->GetCopyright();
	
	return get_sequence( copyright );
}

};