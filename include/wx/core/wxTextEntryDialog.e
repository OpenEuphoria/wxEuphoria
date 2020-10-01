
namespace wxTextEntryDialog

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/string.e"

public include "wx/object.e"
public include "wx/window.e"

atom core = wx_library( "core" )

public constant wxGetTextFromUserPromptStr = wx_string( core, "wxGetTextFromUserPromptStr" )

constant wxTextEntryDialogInfo = wxClassInfo:FindClass( "wxTextEntryDialog" )

public type wxTextEntryDialog( object x )
	return wxObject:IsKindOf( x, wxTextEntryDialogInfo )
end type

public function wxGetTextFromUser( wxString message, wxString caption = wxGetTextFromUserPromptStr, wxString default_value = wxEmptyString, wxWindow parent = NULL, integer x = wxDefaultCoord, integer y = wxDefaultCoord, boolean centre = TRUE )
	return wx_func( WXTEXTENTRYDIALOG_WXGETTEXTFROMUSER, {message,caption,default_value,parent,x,y,centre} )
end function
