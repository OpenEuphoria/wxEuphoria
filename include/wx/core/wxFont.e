
namespace wxFont

include "wx/dll.e"
include "wx/core.e"
include "wx/font.e"
include "wx/fontenc.e"
include "wx/string.e"

public include "wx/object.e"

constant wxFontInfo = wxClassInfo:FindClass( "wxFont" )

public type wxFont( object x )
	if equal( x, NULL ) then
		return 1
	end if

	return wxObject:IsKindOf( x, wxFontInfo )
end type

public function new( atom pointSize, wxFontFamily family = wxFONTFAMILY_DEFAULT, wxFontStyle style = wxFONTSTYLE_NORMAL, wxFontWeight weight = wxFONTWEIGHT_NORMAL, atom underline = FALSE, wxString faceName = wxEmptyString, wxFontEncoding encoding = wxFONTENCODING_DEFAULT )
	return wx_func( WXFONT_NEW, {pointSize,family,style,weight,underline,faceName,encoding} )
end function
