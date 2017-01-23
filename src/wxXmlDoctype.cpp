
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
	return get_sequence( ((wxXmlDoctype*)self)->GetRootName() );
}

object WXEUAPI_XML wxXmlDoctype_GetSystemId( object self )
{
	return get_sequence( ((wxXmlDoctype*)self)->GetSystemId() );
}

object WXEUAPI_XML wxXmlDoctype_GetPublicId( object self )
{
	return get_sequence( ((wxXmlDoctype*)self)->GetPublicId() );
}

object WXEUAPI_XML wxXmlDoctype_GetFullString( object self )
{
	return get_sequence( ((wxXmlDoctype*)self)->GetFullString() );
}

object WXEUAPI_XML wxXmlDoctype_IsValid( object self )
{
	return BOX_INT( ((wxXmlDoctype*)self)->IsValid() );
}

};