
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
	return get_sequence( ((wxVersionInfo*)self)->GetName() );
}

object WXEUAPI_BASE wxVersionInfo_GetMajor( object self )
{
	return BOX_INT( ((wxVersionInfo*)self)->GetMajor() );
}

object WXEUAPI_BASE wxVersionInfo_GetMinor( object self )
{
	return BOX_INT( ((wxVersionInfo*)self)->GetMinor() );
}

object WXEUAPI_BASE wxVersionInfo_GetMicro( object self )
{
	return BOX_INT( ((wxVersionInfo*)self)->GetMicro() );
}

object WXEUAPI_BASE wxVersionInfo_ToString( object self )
{
	return get_sequence( ((wxVersionInfo*)self)->ToString() );
}

object WXEUAPI_BASE wxVersionInfo_GetVersionString( object self )
{
	return get_sequence( ((wxVersionInfo*)self)->GetVersionString() );
}

object WXEUAPI_BASE wxVersionInfo_HasDescription( object self )
{
	return BOX_INT( ((wxVersionInfo*)self)->HasDescription() );
}

object WXEUAPI_BASE wxVersionInfo_GetDescription( object self )
{
	return get_sequence( ((wxVersionInfo*)self)->GetDescription() );
}

object WXEUAPI_BASE wxVersionInfo_HasCopyright( object self )
{
	return BOX_INT( ((wxVersionInfo*)self)->HasCopyright() );
}

object WXEUAPI_BASE wxVersionInfo_GetCopyright( object self )
{
	return get_sequence( ((wxVersionInfo*)self)->GetCopyright() );
}

};