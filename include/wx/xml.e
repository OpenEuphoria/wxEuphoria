
include "wx/dll.e"

atom xml = wx_library( "xml" )

export constant
	WXXMLDOCTYPE_NEW					= wx_define( xml, "wxXmlDoctype_new",                    3, TRUE  ),
	WXXMLDOCTYPE_CLEAR					= wx_define( xml, "wxXmlDoctype_Clear",                  1, FALSE ),
	WXXMLDOCTYPE_GETROOTNAME			= wx_define( xml, "wxXmlDoctype_GetRootName",            1, TRUE  ),
	WXXMLDOCTYPE_GETSYSTEMID			= wx_define( xml, "wxXmlDoctype_GetSystemId",            1, TRUE  ),
	WXXMLDOCTYPE_GETPUBLICID			= wx_define( xml, "wxXmlDoctype_GetPublicId",            1, TRUE  ),
	WXXMLDOCTYPE_GETFULLSTRING			= wx_define( xml, "wxXmlDoctype_GetFullString",          1, TRUE  ),
	WXXMLDOCTYPE_ISVALID				= wx_define( xml, "wxXmlDoctype_IsValid",                1, TRUE  ),
	WXXMLDOCUMENT_NEW					= wx_define( xml, "wxXmlDocument_new",                   2, TRUE  ),
	WXXMLDOCUMENT_APPENDTOPROLOG		= wx_define( xml, "wxXmlDocument_AppendToProlog",        1, FALSE ),
	WXXMLDOCUMENT_COPY					= wx_define( xml, "wxXmlDocument_Copy",                  1, TRUE  ),
	WXXMLDOCUMENT_DETACHDOCUMENTNODE	= wx_define( xml, "wxXmlDocument_DetachDocumentNode",    1, TRUE  ),
	WXXMLDOCUMENT_DETACHROOT			= wx_define( xml, "wxXmlDocument_DetachRoot",            1, TRUE  ),
	WXXMLDOCUMENT_GETFILEENCODING		= wx_define( xml, "wxXmlDocument_GetFileEncoding",       1, TRUE  ),
	WXXMLDOCUMENT_GETDOCTYPE			= wx_define( xml, "wxXmlDocument_GetDoctype",            1, TRUE  ),
	WXXMLDOCUMENT_GETDOCUMENTNODE		= wx_define( xml, "wxXmlDocument_GetDocumentNode",       1, TRUE  ),
	WXXMLDOCUMENT_GETROOT				= wx_define( xml, "wxXmlDocument_GetRoot",               1, TRUE  ),
	WXXMLDOCUMENT_GETVERSION			= wx_define( xml, "wxXmlDocument_GetVersion",            1, TRUE  ),
	WXXMLDOCUMENT_ISOK					= wx_define( xml, "wxXmlDocument_IsOk",                  1, TRUE  ),
	WXXMLDOCUMENT_LOAD					= wx_define( xml, "wxXmlDocument_Load",                  4, TRUE  ),
	WXXMLDOCUMENT_SAVE					= wx_define( xml, "wxXmlDocument_Save",                  3, TRUE  ),
	WXXMLDOCUMENT_SETDOCUMENTNODE		= wx_define( xml, "wxXmlDocument_SetDocumentNode",       2, FALSE ),
	WXXMLDOCUMENT_SETFILEENCODING		= wx_define( xml, "wxXmlDocument_SetFileEncoding",       2, FALSE ),
	WXXMLDOCUMENT_SETDOCTYPE			= wx_define( xml, "wxXmlDocument_SetDoctype",            2, FALSE ),
	WXXMLDOCUMENT_SETROOT				= wx_define( xml, "wxXmlDocument_SetRoot",               2, FALSE ),
	WXXMLDOCUMENT_SETVERSION			= wx_define( xml, "wxXmlDocument_SetVersion",            2, FALSE ),
	WXXMLDOCUMENT_GETLIBRARYVERSIONINFO	= wx_define( xml, "wxXmlDocument_GetLibraryVersionInfo", 0, TRUE  ),
$
