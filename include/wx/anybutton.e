
include "std/math.e"

public constant
	wxBU_LEFT		= 0x0040,
	wxBU_TOP		= 0x0080,
	wxBU_RIGHT		= 0x0100,
	wxBU_BOTTOM		= 0x0200,
	wxBU_ALIGN_MASK	= or_all({
		wxBU_LEFT,
		wxBU_TOP,
		wxBU_RIGHT,
		wxBU_BOTTOM
	}),
	wxBU_EXACTFIT	= 0x0001,
	wxBU_NOTEXT		= 0x0002,
$

public include "wx/core/wxAnyButton.e"
