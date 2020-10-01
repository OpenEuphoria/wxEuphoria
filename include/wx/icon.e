
include "wx/gdicmn.e"

public include "wx/core/wxIcon.e"

ifdef WINDOWS then
	public constant wxICON_DEFAULT_TYPE = wxBITMAP_TYPE_ICO
elsedef
	public constant wxICON_DEFAULT_TYPE = wxBITMAP_TYPE_XPM
end ifdef
