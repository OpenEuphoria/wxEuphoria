
namespace wxXmlDocument

include "wx/dll.e"
include "wx/xml.e"
include "wx/object.e"
include "wx/string.e"
include "wx/xml/wxXmlDoctype.e"
include "wx/xml/wxXmlNode.e"

public include "wx/base/wxObject.e"

-- flags for wxXmlDocument::Load
public enum type wxXmlDocumentLoadFlag
	wxXMLDOC_NONE = 0,
	wxXMLDOC_KEEP_WHITESPACE_NODES = 1
end type

public type wxXmlDocument( object x )
	return wxObject(x)
end type

public function new( wxString filename = wxEmptyString, wxString encoding = "UTF-8" )
	return wx_func( WXXMLDOCUMENT_NEW, {filename,encoding} )
end function

public procedure AppendToProlog( wxXmlDocument self, wxXmlNode node )
	wx_proc( WXXMLDOCUMENT_APPENDTOPROLOG, {self,node} )
end procedure

public function Copy( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_COPY, {self} )
end function

public function DetachDocumentNode( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_DETACHDOCUMENTNODE, {self} )
end function

public function DetachRoot( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_DETACHROOT, {self} )
end function

public function GetFileEncoding( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_GETFILEENCODING, {self} )
end function

public function GetDoctype( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_GETDOCTYPE, {self} )
end function

public function GetDocumentNode( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_GETDOCUMENTNODE, {self} )
end function

public function GetRoot( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_GETROOT, {self} )
end function

public function GetVersion( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_GETVERSION, {self} )
end function

public function IsOk( wxXmlDocument self )
	return wx_func( WXXMLDOCUMENT_ISOK, {self} )
end function

public function Load( wxXmlDocument self, wxString filename, wxString encoding = "UTF-8", wxXmlDocumentLoadFlag flags = wxXMLDOC_NONE )
	return wx_func( WXXMLDOCUMENT_LOAD, {self,filename,encoding,flags} )
end function

public function Save( wxXmlDocument self, wxString filename, atom indentstep = 2 )
	return wx_func( WXXMLDOCUMENT_SAVE, {self,filename,indentstep} )
end function

public procedure SetDocumentNode( wxXmlDocument self, wxXmlNode node )
	wx_proc( WXXMLDOCUMENT_SETDOCUMENTNODE, {self,node} )
end procedure

public procedure SetFileEncoding( wxXmlDocument self, wxString encoding )
	wx_proc( WXXMLDOCUMENT_SETFILEENCODING, {self,encoding} )
end procedure

public procedure SetDoctype( wxXmlDocument self, wxXmlDoctype doctype )
	wx_proc( WXXMLDOCUMENT_SETDOCTYPE, {self,doctype} )
end procedure

public procedure SetRoot( wxXmlDocument self, wxXmlNode node )
	wx_proc( WXXMLDOCUMENT_SETROOT, {self,node} )
end procedure

public procedure SetVersion( wxXmlDocument self, wxString version )
	wx_proc( WXXMLDOCUMENT_SETVERSION, {self,version} )
end procedure

