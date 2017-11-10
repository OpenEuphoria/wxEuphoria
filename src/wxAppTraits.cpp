
#include <wx/apptrait.h>
#include <wx/stdpaths.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_BASE wxAppTraits_GetDesktopEnvironment( object self )
{
	wxString desktop = ((wxAppTraits*)self)->GetDesktopEnvironment();
	
	return get_sequence( desktop );
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
	bool result = ((wxAppTraits*)self)->HasStderr();
	
	return BOX_INT( result );
}

object WXEUAPI_BASE wxAppTraits_IsUsingUniversalWidgets( object self )
{
	bool result = ((wxAppTraits*)self)->IsUsingUniversalWidgets();
	
	return BOX_INT( result );
}

object WXEUAPI_BASE wxAppTraits_ShowAssertDialog( object self, object msg )
{
	bool result = ((wxAppTraits*)self)->ShowAssertDialog( get_string(msg) );
	
	wxDeRef( msg );
	return BOX_INT( result );
}

};