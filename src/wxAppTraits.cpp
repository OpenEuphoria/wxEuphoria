
#include <wx/apptrait.h>
#include <wx/stdpaths.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxAppTraits_GetDesktopEnvironment( object self )
{
	return get_sequence( ((wxAppTraits*)self)->GetDesktopEnvironment() );
}

object WXEUAPI_BASE wxAppTraits_GetStandardPaths( object self )
{
	wxStandardPaths* paths = &((wxAppTraits*)self)->GetStandardPaths();
	
	return BOX_INT( paths );
}

object WXEUAPI_BASE wxAppTraits_GetToolkitVersion( object self )
{
	int major, minor;
	wxPortId port = ((wxAppTraits*)self)->GetToolkitVersion( &major, &minor );
	
	s1_ptr s = NewS1( 3 );
	s->base[1] = port;
	s->base[2] = major;
	s->base[3] = minor;
	
	return MAKE_SEQ( s );
}

object WXEUAPI_BASE wxAppTraits_HasStderr( object self )
{
	return BOX_INT( ((wxAppTraits*)self)->HasStderr() );
}

object WXEUAPI_BASE wxAppTraits_IsUsingUniversalWidgets( object self )
{
	return BOX_INT( ((wxAppTraits*)self)->IsUsingUniversalWidgets() );
}

object WXEUAPI_BASE wxAppTraits_ShowAssertDialog( object self, object msg )
{
	wxDeRefDS( msg );
	return BOX_INT( ((wxAppTraits*)self)->ShowAssertDialog(get_string(msg)) );
}

};