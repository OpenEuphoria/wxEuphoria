
include "std/math.e"
include "wx/defs.e"

/* ---------------------------------------------------------------------------- */
/* constants */
/* ---------------------------------------------------------------------------- */

/*
    Summary of the bits used (some of them are defined in wx/frame.h and
    wx/dialog.h and not here):

    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |15|14|13|12|11|10| 9| 8| 7| 6| 5| 4| 3| 2| 1| 0|
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \_ wxCENTRE
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  \____ wxFRAME_NO_TASKBAR
      |  |  |  |  |  |  |  |  |  |  |  |  |  \_______ wxFRAME_TOOL_WINDOW
      |  |  |  |  |  |  |  |  |  |  |  |  \__________ wxFRAME_FLOAT_ON_PARENT
      |  |  |  |  |  |  |  |  |  |  |  \_____________ wxFRAME_SHAPED
      |  |  |  |  |  |  |  |  |  |  \________________ wxDIALOG_NO_PARENT
      |  |  |  |  |  |  |  |  |  \___________________ wxRESIZE_BORDER
      |  |  |  |  |  |  |  |  \______________________ wxTINY_CAPTION_VERT
      |  |  |  |  |  |  |  \_________________________
      |  |  |  |  |  |  \____________________________ wxMAXIMIZE_BOX
      |  |  |  |  |  \_______________________________ wxMINIMIZE_BOX
      |  |  |  |  \__________________________________ wxSYSTEM_MENU
      |  |  |  \_____________________________________ wxCLOSE_BOX
      |  |  \________________________________________ wxMAXIMIZE
      |  \___________________________________________ wxMINIMIZE
      \______________________________________________ wxSTAY_ON_TOP


    Notice that the 8 lower bits overlap with wxCENTRE and the button selection
    bits (wxYES, wxOK wxNO, wxCANCEL, wxAPPLY, wxCLOSE and wxNO_DEFAULT) which
    can be combined with the dialog style for several standard dialogs and
    hence shouldn't overlap with any styles which can be used for the dialogs.
    Additionally, wxCENTRE can be used with frames also.
 */

-- style common to both wxFrame and wxDialog
public constant
	wxSTAY_ON_TOP   = 0x00008000,
	wxICONIZE       = 0x00004000,
	wxMINIMIZE      = wxICONIZE,
	wxMAXIMIZE      = 0x00002000,
	wxCLOSE_BOX     = 0x00001000,  -- = wxHELP so can't be used with it
$

public constant
	wxSYSTEM_MENU   = 0x00000800,
	wxMINIMIZE_BOX  = 0x00000400,
	wxMAXIMIZE_BOX  = 0x00000200,
$

public constant
	wxTINY_CAPTION  = 0x00000080,  -- clashes with wxNO_DEFAULT
	wxRESIZE_BORDER = 0x00000040,  -- = wxCLOSE
$

-- default style
public constant wxDEFAULT_FRAME_STYLE = or_all({
	wxSYSTEM_MENU, wxRESIZE_BORDER, wxMINIMIZE_BOX,
	wxMAXIMIZE_BOX, wxCLOSE_BOX, wxCAPTION, wxCLIP_CHILDREN
})

-- Dialogs are created in a special way
public constant wxTOPLEVEL_EX_DIALOG = 0x00000008

-- Styles for ShowFullScreen
-- (note that wxTopLevelWindow only handles wxFULLSCREEN_NOBORDER and
--  wxFULLSCREEN_NOCAPTION; the rest is handled by wxTopLevelWindow)
public enum
	wxFULLSCREEN_NOMENUBAR   = 0x0001,
	wxFULLSCREEN_NOTOOLBAR   = 0x0002,
	wxFULLSCREEN_NOSTATUSBAR = 0x0004,
	wxFULLSCREEN_NOBORDER    = 0x0008,
	wxFULLSCREEN_NOCAPTION   = 0x0010,
	
	wxFULLSCREEN_ALL         = 0x0019,
	-- wxFULLSCREEN_NOMENUBAR | wxFULLSCREEN_NOTOOLBAR |
	-- wxFULLSCREEN_NOSTATUSBAR | wxFULLSCREEN_NOBORDER |
	-- wxFULLSCREEN_NOCAPTION
$

-- Styles for RequestUserAttention
public enum
	wxUSER_ATTENTION_INFO = 1,
	wxUSER_ATTENTION_ERROR = 2,
$

public include "wx/core/wxTopLevelWindow.e"
