
include "wx/init.e"
include "wx/string.e"
include "wx/versioninfo.e"
include "wx/xml/xml.e"

sequence cmd = command_line()

wxXmlDocument doc = wxXmlDocument:new()
printf( 1, "doc = #%08x\n", {doc} )

atom load = wxXmlDocument:Load( doc, cmd[3] )
printf( 1, "load = %d\n", {load} )

wxXmlDoctype docType = wxXmlDocument:GetDoctype( doc )
printf( 1, "docType = #%08x\n", {docType} )

wxString rootName = wxXmlDoctype:GetRootName( docType )
printf( 1, "rootName = '%s'\n", {rootName} )

wxString systemId = wxXmlDoctype:GetSystemId( docType )
printf( 1, "systemId = '%s'\n", {systemId} )

wxString publicId = wxXmlDoctype:GetPublicId( docType )
printf( 1, "publicId = '%s'\n", {publicId} )

wxString fullString = wxXmlDoctype:GetFullString( docType )
printf( 1, "fullString = '%s'\n", {fullString} )

atom isValid = wxXmlDoctype:IsValid( docType )
printf( 1, "isValid = %d\n", {isValid} )

atom save = wxXmlDocument:Save( doc, "xml_temp.xml" )
printf( 1, "save = %d\n", {save} )

wxVersionInfo info = wxXmlDocument:GetLibraryVersionInfo()
printf( 1, "info = #%08x\n", {info} )

wxString version = wxVersionInfo:ToString( info )
printf( 1, "version = '%s'\n", {version} )
