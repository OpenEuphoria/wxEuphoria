
#include <wx/xml/xml.h>
#include "wxEuphoria.h"

extern "C" {

object WXEUAPI_XML wxXmlDocument_new( object filename, object encoding )
{
	wxXmlDocument* doc = NULL;
	
	wxString fn = get_string( filename );
	wxString enc = get_string( encoding );
	
	if ( fn.length() == 0 ) { // Default constructor
		doc = new wxXmlDocument();
	}
	else { // Loads the given filename using the given encoding.
		doc = new wxXmlDocument( fn, enc );
	}
	
	wxDeRef( filename );
	wxDeRef( encoding );
	
	return BOX_INT( doc );
}

void WXEUAPI_XML wxXmlDocument_AppendToProlog( object self, object node )
{
	((wxXmlDocument*)self)->AppendToProlog( (wxXmlNode*)node );
}

object WXEUAPI_XML wxXmlDocument_Copy( object self )
{
	wxXmlDocument doc = *(wxXmlDocument*)self;
	return BOX_INT( new wxXmlDocument(doc) );
}

object WXEUAPI_XML wxXmlDocument_DetachDocumentNode( object self )
{
	return BOX_INT( ((wxXmlDocument*)self)->DetachDocumentNode() );
}

object WXEUAPI_XML wxXmlDocument_DetachRoot( object self )
{
	return BOX_INT( ((wxXmlDocument*)self)->DetachRoot() );
}

// this is meaningless in Unicode build where data are stored as wchar_t*.
// http://docs.wxwidgets.org/3.1.0/classwx_xml_document.html#a8bfe22961e0bd50124bcbd2fa3cd4dfd
//object WXEUAPI_XML wxXmlDocument_GetEncoding( object self )
//{
//    return get_sequence( ((wxXmlDocument*)self)->GetEncoding() );
//}

object WXEUAPI_XML wxXmlDocument_GetFileEncoding( object self )
{
	return get_sequence( ((wxXmlDocument*)self)->GetFileEncoding() );
}

object WXEUAPI_XML wxXmlDocument_GetDoctype( object self )
{
	wxXmlDoctype* doctype = new wxXmlDoctype();
	*doctype = ((wxXmlDocument*)self)->GetDoctype();
	
	return BOX_INT( doctype );
}

object WXEUAPI_XML wxXmlDocument_GetDocumentNode( object self )
{
	return BOX_INT( ((wxXmlDocument*)self)->GetDocumentNode() );
}

object WXEUAPI_XML wxXmlDocument_GetRoot( object self )
{
	return BOX_INT( ((wxXmlDocument*)self)->GetRoot() );
}

object WXEUAPI_XML wxXmlDocument_GetVersion( object self )
{
	return get_sequence( ((wxXmlDocument*)self)->GetVersion() );
}

object WXEUAPI_XML wxXmlDocument_IsOk( object self )
{
	return BOX_INT( ((wxXmlDocument*)self)->IsOk() );
}

object WXEUAPI_XML wxXmlDocument_Load( object self, object filename, object encoding, object flags )
{
	bool result = ((wxXmlDocument*)self)->Load( get_string(filename), get_string(encoding), get_int(flags) );
	
	wxDeRef( filename );
	wxDeRef( encoding );
	
	return BOX_INT( result );
}

object WXEUAPI_XML wxXmlDocument_Save( object self, object filename, object indentstep )
{
	bool result = ((wxXmlDocument*)self)->Save( get_string(filename), get_int(indentstep) );
	
	wxDeRef( filename );
	
	return BOX_INT( result );
}

void WXEUAPI_XML wxXmlDocument_SetDocumentNode( object self, object node )
{
	((wxXmlDocument*)self)->SetDocumentNode( (wxXmlNode*)node );
}

// this is meaningless in Unicode build where data are stored as wchar_t*.
// http://docs.wxwidgets.org/3.1.0/classwx_xml_document.html#a8bfe22961e0bd50124bcbd2fa3cd4dfd
//void WXEUAPI_XML wxXmlDocument_SetEncoding( object self, object encoding )
//{
//    wxDeRef( encoding );
//    ((wxXmlDocument*)self)->SetEncoding( get_string(encoding) );
//}

void WXEUAPI_XML wxXmlDocument_SetFileEncoding( object self, object encoding )
{
	wxDeRef( encoding );
	((wxXmlDocument*)self)->SetFileEncoding( get_string(encoding) );
}

void WXEUAPI_XML wxXmlDocument_SetDoctype( object self, object doctype )
{
	((wxXmlDocument*)self)->SetDoctype( *(wxXmlDoctype*)doctype );
}

void WXEUAPI_XML wxXmlDocument_SetRoot( object self, object node )
{
	((wxXmlDocument*)self)->SetRoot( (wxXmlNode*)node );
}

void WXEUAPI_XML wxXmlDocument_SetVersion( object self, object version )
{
	wxDeRef( version );
	((wxXmlDocument*)self)->SetVersion( get_string(version) );
}

};