
#include <wx/xml/xml.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_XML wxXmlDoctype_new( object rootName, object systemId, object publicId )
{
	wxXmlDoctype* doctype = new wxXmlDoctype( get_string(rootName), get_string(systemId), get_string(publicId) );
	
	wxDeRef( rootName );
	wxDeRef( systemId );
	wxDeRef( publicId );
	
	return BOX_INT( doctype );
}

void WXEUAPI_XML wxXmlDoctype_Clear( object self )
{
	((wxXmlDoctype*)self)->Clear();
}

object WXEUAPI_XML wxXmlDoctype_GetRootName( object self )
{
	wxString rootName = ((wxXmlDoctype*)self)->GetRootName();
	
	return get_sequence( rootName );
}

object WXEUAPI_XML wxXmlDoctype_GetSystemId( object self )
{
	wxString systemId = ((wxXmlDoctype*)self)->GetSystemId();
	
	return get_sequence( systemId );
}

object WXEUAPI_XML wxXmlDoctype_GetPublicId( object self )
{
	wxString publicId = ((wxXmlDoctype*)self)->GetPublicId();
	
	return get_sequence( publicId );
}

object WXEUAPI_XML wxXmlDoctype_GetFullString( object self )
{
	wxString fullString = ((wxXmlDoctype*)self)->GetFullString();
	
	return get_sequence( fullString );
}

object WXEUAPI_XML wxXmlDoctype_IsValid( object self )
{
	bool result = ((wxXmlDoctype*)self)->IsValid();
	
	return BOX_INT( result );
}

};