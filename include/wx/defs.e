
include "std/dll.e"
include "std/math.e"

export constant
	CHAR_MIN  = -128,
	CHAR_MAX  = 127,
	UCHAR_MIN = 0,
	UCHAR_MAX = 255,
	SHRT_MIN  = -32768,
	SHRT_MAX  = 32767,
	USHRT_MIN = 0,
	USHRT_MAX = 65535,
	INT_MIN   = -2147483648,
	INT_MAX   = 2147483647,
	UINT_MIN  = 0,
	UINT_MAX  = 4294967295,
	LONG_MIN  = -9223372036854775808,
	LONG_MAX  = 9223372036854775807,
	ULONG_MIN = 0,
	ULONG_MAX = 18446744073709551615,
$



/*  ---------------------------------------------------------------------------- */
/*  wxWidgets version and compatibility defines */
/*  ---------------------------------------------------------------------------- */

public include "wx/version.e"



/*  ---------------------------------------------------------------------------- */
/*  check for native bool type and TRUE/FALSE constants */
/*  ---------------------------------------------------------------------------- */

public include "std/types.e"

public type WXTYPE( atom x )
	return (SHRT_MIN <= x) and (x <= SHRT_MAX)
end type

-- everybody gets the assert and other debug macros
public include "wx/debug.e"



/*  symbolic constant used by all Find()-like functions returning positive */
/*  integer on success as failure indicator */
public enum wxNOT_FOUND = -1

/* the default value for some length parameters meaning that the string is */
/* NUL-terminated */
public enum wxNO_LEN = -1



/*  ---------------------------------------------------------------------------- */
/*  standard wxWidgets types */
/*  ---------------------------------------------------------------------------- */

/*  the type for screen and DC coordinates */
public type wxCoord( atom x )
	return (INT_MIN <= x) and (x <= INT_MAX)
end type

public enum wxDefaultCoord = -1



/*  ---------------------------------------------------------------------------- */
/*  define fixed length types */
/*  ---------------------------------------------------------------------------- */

/*  chars are always one byte (by definition), shorts are always two (in */
/*  practice) */

/*  8bit */
public type wxInt8( atom x )
	return (CHAR_MIN <= x) and (x <= CHAR_MAX)
end type

public type wxUint8( atom x )
	return (UCHAR_MIN <= x) and (x <= UCHAR_MAX)
end type

public type wxByte( atom x )
	return wxUint8(x)
end type

/*  16bit */
public type wxInt16( atom x )
	return (SHRT_MIN <= x) and (x <= SHRT_MAX)
end type

public type wxUint16( atom x )
	return (USHRT_MIN <= x) and (x <= USHRT_MIN)
end type

public type wxWord( atom x )
	return wxUint16(x)
end type

/*  32bit */
public type wxInt32( atom x )
	return (INT_MIN <= x) and (x <= INT_MAX)
end type

public type wxUInt32( atom x )
	return (UINT_MIN <= x) and (x <= UINT_MAX)
end type

public type wxInt64( atom x )
	return (LONG_MIN <= x) and (x <= LONG_MAX)
end type

/*  64 bit */
public type wxUInt64( atom x )
	return (ULONG_MIN <= x) and (x <= ULONG_MAX)
end type

public type wxDword( atom x )
	return wxUInt32(x)
end type

/*
   Define signed and unsigned integral types big enough to contain all of long,
   size_t and void *.
 */

ifdef BITS64 then

public type wxIntPtr( atom x )
	return wxInt64(x)
end type

public type wxUIntPtr( atom x )
	return wxUInt64(x)
end type

elsedef -- !BITS64

public type wxIntPtr( atom x )
	return wxInt32(x)
end type

public type wxUIntPtr( atom x )
	return wxUInt32(x)
end type

end ifdef -- BITS64

/*  base floating point types */
public type wxFloat32( atom x )
	return atom(x)
end type

public type wxFloat64( atom x )
	return atom(x)
end type

public type wxDouble( atom x )
	return atom(x)
end type

public constant wxNullPtr = NULL

/* Define wxChar16 and wxChar32                                              */
public type wxChar16( atom x )
	return wxUint16(x)
end type

public type wxChar32( atom x )
	return wxUInt32(x)
end type



/*  ---------------------------------------------------------------------------- */
/*  Geometric flags */
/*  ---------------------------------------------------------------------------- */

public enum type wxGeometryCentre
	
	wxCENTRE = 0x0001,
	wxCENTER = wxCENTRE
	
end type

/*  centering into frame rather than screen (obsolete) */
public constant wxCENTER_FRAME = 0x0000

/*  centre on screen rather than parent */
public constant wxCENTRE_ON_SCREEN = 0x0002
public constant wxCENTER_ON_SCREEN = wxCENTRE_ON_SCREEN

public enum
	
	/* don't change the values of these elements, they are used elsewhere */
	wxHORIZONTAL        = 0x0004,
	wxVERTICAL          = 0x0008,
	
	wxBOTH              = 0x0012,
	
	/*  a mask to extract orientation from the combination of flags */
	wxORIENTATION_MASK  = wxBOTH,
	
$

public type wxOrientation( atom x )
	return and_bits( wxORIENTATION_MASK, x ) = x
end type

public enum
	
	wxLEFT              = 0x0010,
	wxRIGHT             = 0x0020,
	wxUP                = 0x0040,
	wxDOWN              = 0x0080,
	
	wxTOP               = wxUP,
	wxBOTTOM            = wxDOWN,
	
	wxNORTH             = wxUP,
	wxSOUTH             = wxDOWN,
	wxWEST              = wxLEFT,
	wxEAST              = wxRIGHT,
	
	wxALL               = 0x00F0,
	
	/*  a mask to extract direction from the combination of flags */
	wxDIRECTION_MASK = wxALL,
	
$

public type wxDirection( atom x )
	return and_bits( wxDIRECTION_MASK, x ) = x
end type

public enum
	
	/*
	    0 is a valid wxAlignment value (both wxALIGN_LEFT and wxALIGN_TOP
	    use it) so define a symbolic name for an invalid alignment value
	    which can be assumed to be different from anything else
	 */
	wxALIGN_INVALID             = -1,
	
	wxALIGN_NOT                 = 0x0000,
	wxALIGN_CENTER_HORIZONTAL   = 0x0100,
	wxALIGN_CENTRE_HORIZONTAL   = wxALIGN_CENTER_HORIZONTAL,
	wxALIGN_LEFT                = wxALIGN_NOT,
	wxALIGN_TOP                 = wxALIGN_NOT,
	wxALIGN_RIGHT               = 0x0200,
	wxALIGN_BOTTOM              = 0x0400,
	wxALIGN_CENTER_VERTICAL     = 0x0800,
	wxALIGN_CENTRE_VERTICAL     = wxALIGN_CENTER_VERTICAL,
	
	/*  a mask to extract alignment from the combination of flags */
	wxALIGN_MASK                = 0x0F00,
	
$

public constant
	
	wxALIGN_CENTER  = or_all({ wxALIGN_CENTER_HORIZONTAL, wxALIGN_CENTER_VERTICAL }),
	wxALIGN_CENTRE  = wxALIGN_CENTER,
	
$

public type wxAlignment( atom x )
	return and_bits( wxALIGN_MASK, x ) = x
end type

/* misc. flags for wxSizer items */
public enum
	
	/*
	    wxADJUST_MINSIZE doesn't do anything any more but we still define
	    it for compatibility.
	 */
	wxADJUST_MINSIZE               = 0,
	
	wxFIXED_MINSIZE                = 0x8000,
	wxRESERVE_SPACE_EVEN_IF_HIDDEN = 0x0002,
	
	/*  a mask to extract wxSizerFlagBits from combination of flags */
	wxSIZER_FLAG_BITS_MASK         = 0x8002,
	
$

public type wxSizerFlagBits( atom x )
	return and_bits( wxSIZER_FLAG_BITS_MASK, x ) = x
end type

public enum
	
	wxSTRETCH_NOT             = 0x0000,
	wxSHRINK                  = 0x1000,
	wxGROW                    = 0x2000,
	wxEXPAND                  = wxGROW,
	wxSHAPED                  = 0x4000,
	wxTILE                    = 0x8000, -- wxSHAPED | wxFIXED_MINSIZE,
	
	/*  a mask to extract stretch from the combination of flags */
	wxSTRETCH_MASK            = 0x7000, /* sans wxTILE */
	
$

public type wxStretch( atom x )
	return and_bits( wxSTRETCH_MASK, x ) = x
end type

public enum
	
	/*  this is different from wxBORDER_NONE as by default the controls do have */
	/*  border */
	wxBORDER_DEFAULT = 0,
	
	wxBORDER_NONE   = 0x00200000,
	wxBORDER_STATIC = 0x01000000,
	wxBORDER_SIMPLE = 0x02000000,
	wxBORDER_RAISED = 0x04000000,
	wxBORDER_SUNKEN = 0x08000000,
	wxBORDER_DOUBLE = 0x10000000, /* deprecated */
	wxBORDER_THEME  = wxBORDER_DOUBLE,
	
	/*  a mask to extract border style from the combination of flags */
	wxBORDER_MASK   = 0x1f200000,
	
$

public type wxBorder( atom x )
	return and_bits( wxBORDER_MASK, x ) = x
end type

/* This makes it easier to specify a 'normal' border for a control */
public constant wxDEFAULT_CONTROL_BORDER = wxBORDER_SUNKEN



/*  ---------------------------------------------------------------------------- */
/*  Window style flags */
/*  ---------------------------------------------------------------------------- */

/*
 * Values are chosen so they can be or'd in a bit list.
 * Some styles are used across more than one group,
 * so the values mustn't clash with others in the group.
 * Otherwise, numbers can be reused across groups.
 */

/*
    Summary of the bits used by various styles.

    High word, containing styles which can be used with many windows:

    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    |31|30|29|28|27|26|25|24|23|22|21|20|19|18|17|16|
    +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \_ wxFULL_REPAINT_ON_RESIZE
      |  |  |  |  |  |  |  |  |  |  |  |  |  |  \____ wxPOPUP_WINDOW
      |  |  |  |  |  |  |  |  |  |  |  |  |  \_______ wxWANTS_CHARS
      |  |  |  |  |  |  |  |  |  |  |  |  \__________ wxTAB_TRAVERSAL
      |  |  |  |  |  |  |  |  |  |  |  \_____________ wxTRANSPARENT_WINDOW
      |  |  |  |  |  |  |  |  |  |  \________________ wxBORDER_NONE
      |  |  |  |  |  |  |  |  |  \___________________ wxCLIP_CHILDREN
      |  |  |  |  |  |  |  |  \______________________ wxALWAYS_SHOW_SB
      |  |  |  |  |  |  |  \_________________________ wxBORDER_STATIC
      |  |  |  |  |  |  \____________________________ wxBORDER_SIMPLE
      |  |  |  |  |  \_______________________________ wxBORDER_RAISED
      |  |  |  |  \__________________________________ wxBORDER_SUNKEN
      |  |  |  \_____________________________________ wxBORDER_{DOUBLE,THEME}
      |  |  \________________________________________ wxCAPTION/wxCLIP_SIBLINGS
      |  \___________________________________________ wxHSCROLL
      \______________________________________________ wxVSCROLL


    Low word style bits is class-specific meaning that the same bit can have
    different meanings for different controls (e.g. 0x10 is wxCB_READONLY
    meaning that the control can't be modified for wxComboBox but wxLB_SORT
    meaning that the control should be kept sorted for wxListBox, while
    wxLB_SORT has a different value -- and this is just fine).
 */

/*
 * Window (Frame/dialog/subwindow/panel item) style flags
 */
public constant
	
	wxVSCROLL   = 0x80000000,
	wxHSCROLL   = 0x40000000,
	wxCAPTION   = 0x20000000,
	
$

/*  New styles (border styles are now in their own enum) */
public constant
	
	wxDOUBLE_BORDER = wxBORDER_DOUBLE,
	wxSUNKEN_BORDER = wxBORDER_SUNKEN,
	wxRAISED_BORDER = wxBORDER_RAISED,
	wxBORDER        = wxBORDER_SIMPLE,
	wxSIMPLE_BORDER = wxBORDER_SIMPLE,
	wxSTATIC_BORDER = wxBORDER_STATIC,
	wxNO_BORDER     = wxBORDER_NONE,
	
$

/*  wxALWAYS_SHOW_SB: instead of hiding the scrollbar when it is not needed, */
/*  disable it - but still show (see also wxLB_ALWAYS_SB style) */
/*  */
/*  NB: as this style is only supported by wxUniversal and wxMSW so far */
public constant wxALWAYS_SHOW_SB = 0x00800000

/*  Clip children when painting, which reduces flicker in e.g. frames and */
/*  splitter windows, but can't be used in a panel where a static box must be */
/*  'transparent' (panel paints the background for it) */
public constant wxCLIP_CHILDREN = 0x00400000

/*  Note we're reusing the wxCAPTION style because we won't need captions */
/*  for subwindows/controls */
public constant wxCLIP_SIBLINGS = 0x20000000

public constant wxTRANSPARENT_WINDOW = 0x00100000

/*  Add this style to a panel to get tab traversal working outside of dialogs */
/*  (on by default for wxPanel, wxDialog, wxScrolledWindow) */
public constant wxTAB_TRAVERSAL = 0x00080000

/*  Add this style if the control wants to get all keyboard messages (under */
/*  Windows, it won't normally get the dialog navigation key events) */
public constant wxWANTS_CHARS = 0x00040000

/*  Make window retained (Motif only, see src/generic/scrolwing.cpp)
 *  This is non-zero only under wxMotif, to avoid a clash with wxPOPUP_WINDOW
 *  on other platforms
 */
ifdef __WXMOTIF__ then
public constant wxRETAINED = 0x00020000
elsedef
public constant wxRETAINED = 0x00000000
end ifdef
public constant wxBACKINGSTORE = wxRETAINED

/*  set this flag to create a special popup window: it will be always shown on */
/*  top of other windows, will capture the mouse and will be dismissed when the */
/*  mouse is clicked outside of it or if it loses focus in any other way */
public constant wxPOPUP_WINDOW = 0x00020000

/*  force a full repaint when the window is resized (instead of repainting just */
/*  the invalidated area) */
public constant wxFULL_REPAINT_ON_RESIZE = 0x00010000

/*  obsolete: now this is the default behaviour */
/*  */
/*  don't invalidate the whole window (resulting in a PAINT event) when the */
/*  window is resized (currently, makes sense for wxMSW only) */
public constant wxNO_FULL_REPAINT_ON_RESIZE = 0

/* A mask which can be used to filter (out) all wxWindow-specific styles.
 */
public constant wxWINDOW_STYLE_MASK = or_all({
	wxVSCROLL, wxHSCROLL, wxBORDER_MASK, wxALWAYS_SHOW_SB, wxCLIP_CHILDREN,
	wxCLIP_SIBLINGS, wxTRANSPARENT_WINDOW, wxTAB_TRAVERSAL, wxWANTS_CHARS,
	wxRETAINED, wxPOPUP_WINDOW, wxFULL_REPAINT_ON_RESIZE
})

/*
 * Extra window style flags (use wxWS_EX prefix to make it clear that they
 * should be passed to wxWindow::SetExtraStyle(), not SetWindowStyle())
 */

/* This flag is obsolete as recursive validation is now the default (and only
 * possible) behaviour. Simply don't use it any more in the new code. */
public constant wxWS_EX_VALIDATE_RECURSIVELY = 0x00000000 /* used to be 1 */

/*  wxCommandEvents and the objects of the derived classes are forwarded to the */
/*  parent window and so on recursively by default. Using this flag for the */
/*  given window allows to block this propagation at this window, i.e. prevent */
/*  the events from being propagated further upwards. The dialogs have this */
/*  flag on by default. */
public constant wxWS_EX_BLOCK_EVENTS = 0x00000002

/*  don't use this window as an implicit parent for the other windows: this must */
/*  be used with transient windows as otherwise there is the risk of creating a */
/*  dialog/frame with this window as a parent which would lead to a crash if the */
/*  parent is destroyed before the child */
public constant wxWS_EX_TRANSIENT = 0x00000004

/*  don't paint the window background, we'll assume it will */
/*  be done by a theming engine. This is not yet used but could */
/*  possibly be made to work in the future, at least on Windows */
public constant wxWS_EX_THEMED_BACKGROUND = 0x00000008

/*  this window should always process idle events */
public constant wxWS_EX_PROCESS_IDLE = 0x00000010

/*  this window should always process UI update events */
public constant wxWS_EX_PROCESS_UI_UPDATES = 0x00000020

/*  Draw the window in a metal theme on Mac */
public constant wxFRAME_EX_METAL    = 0x00000040
public constant wxDIALOG_EX_METAL   = 0x00000040

/*  Use this style to add a context-sensitive help to the window (currently for */
/*  Win32 only and it doesn't work if wxMINIMIZE_BOX or wxMAXIMIZE_BOX are used) */
public constant wxWS_EX_CONTEXTHELP = 0x00000080

/* synonyms for wxWS_EX_CONTEXTHELP for compatibility */
public constant wxFRAME_EX_CONTEXTHELP  = wxWS_EX_CONTEXTHELP
public constant wxDIALOG_EX_CONTEXTHELP = wxWS_EX_CONTEXTHELP

/*  Create a window which is attachable to another top level window */
public constant wxFRAME_DRAWER = 0x0020

/*
 * MDI parent frame style flags
 * Can overlap with some of the above.
 */
public constant wxFRAME_NO_WINDOW_MENU = 0x0100

/*
 * wxMenuBar style flags
 */
/*  use native docking */
public constant wxMB_DOCKABLE = 0x0001

/*
 * wxMenu style flags
 */
public constant wxMENU_TEAROFF = 0x0001

/*
 * Apply to all panel items
 */
public constant wxCOLOURED      = 0x0800
public constant wxFIXED_LENGTH  = 0x0400

/*
 * Styles for wxListBox
 */
public constant
	
	wxLB_SORT       = 0x0010,
	wxLB_SINGLE     = 0x0020,
	wxLB_MULTIPLE   = 0x0040,
	wxLB_EXTENDED   = 0x0080,
/*  wxLB_OWNERDRAW is Windows-only */
	wxLB_NEEDED_SB  = 0x0000,
	wxLB_OWNERDRAW  = 0x0100,
	wxLB_ALWAYS_SB  = 0x0200,
	wxLB_NO_SB      = 0x0400,
	wxLB_HSCROLL    = wxHSCROLL,
/*  always show an entire number of rows */
	wxLB_INT_HEIGHT = 0x0800,
	
$

/*
 * wxComboBox style flags
 */
public constant
	
	wxCB_SIMPLE     = 0x0004,
	wxCB_SORT       = 0x0008,
	wxCB_READONLY   = 0x0010,
	wxCB_DROPDOWN   = 0x0020,
	
$

/*
 * wxRadioBox style flags
 */
/*  should we number the items from left to right or from top to bottom in a 2d */
/*  radiobox? */
public constant wxRA_LEFTTORIGHT    = 0x0001
public constant wxRA_TOPTOBOTTOM    = 0x0002

/*  New, more intuitive names to specify majorDim argument */
public constant wxRA_SPECIFY_COLS   = wxHORIZONTAL
public constant wxRA_SPECIFY_ROWS   = wxVERTICAL

/*  Old names for compatibility */
public constant wxRA_HORIZONTAL	= wxHORIZONTAL
public constant wxRA_VERTICAL   = wxVERTICAL

/*
 * wxRadioButton style flag
 */
public constant wxRB_GROUP  = 0x0004
public constant wxRB_SINGLE = 0x0008

/*
 * wxScrollBar flags
 */
public constant wxSB_HORIZONTAL     = wxHORIZONTAL
public constant wxSB_VERTICAL       = wxVERTICAL

/*
 * wxSpinButton flags.
 * Note that a wxSpinCtrl is sometimes defined as a wxTextCtrl, and so the
 * flags shouldn't overlap with wxTextCtrl flags that can be used for a single
 * line controls (currently we reuse wxTE_CHARWRAP and wxTE_RICH2 neither of
 * which makes sense for them).
 */
public constant
	
	wxSP_HORIZONTAL       = wxHORIZONTAL, /*  4 */
	wxSP_VERTICAL         = wxVERTICAL,   /*  8 */
	wxSP_ARROW_KEYS       = 0x4000,
	wxSP_WRAP             = 0x8000,
	
$

/*
 * wxTabCtrl flags
 */
public constant
	
	wxTC_RIGHTJUSTIFY   = 0x0010,
	wxTC_FIXEDWIDTH     = 0x0020,
	wxTC_TOP            = 0x0000,    /*  default */
	wxTC_LEFT           = 0x0020,
	wxTC_RIGHT          = 0x0040,
	wxTC_BOTTOM         = 0x0080,
	wxTC_MULTILINE      = 0x0200,    /* == wxNB_MULTILINE */
	wxTC_OWNERDRAW      = 0x0400,
	
$

/*
 * wxStaticBitmap flags
 */
public constant wxBI_EXPAND = wxEXPAND

/*
 * wxStaticLine flags
 */
public constant wxLI_HORIZONTAL = wxHORIZONTAL
public constant wxLI_VERTICAL   = wxVERTICAL

/*
 * extended dialog specifiers. these values are stored in a different
 * flag and thus do not overlap with other style flags. note that these
 * values do not correspond to the return values of the dialogs (for
 * those values, look at the wxID_XXX defines).
 */

/*  wxCENTRE already defined as  = 0x00000001 */
public constant
	
	wxYES               = 0x00000002,
	wxOK                = 0x00000004,
	wxNO                = 0x00000008,
	wxYES_NO            = or_bits(wxYES, wxNO),
	wxCANCEL            = 0x00000010,
	wxAPPLY             = 0x00000020,
	wxCLOSE             = 0x00000040,
	
	wxOK_DEFAULT        = 0x00000000,  /* has no effect (default) */
	wxYES_DEFAULT       = 0x00000000,  /* has no effect (default) */
	wxNO_DEFAULT        = 0x00000080,  /* only valid with wxYES_NO */
	wxCANCEL_DEFAULT    = 0x80000000,  /* only valid with wxCANCEL */
	
	wxICON_WARNING      = 0x00000100,
	wxICON_ERROR        = 0x00000200,
	wxICON_QUESTION     = 0x00000400,
	wxICON_INFORMATION  = 0x00000800,
	wxICON_EXCLAMATION  = wxICON_WARNING,
	wxICON_HAND         = wxICON_ERROR,
	wxICON_STOP         = wxICON_ERROR,
	wxICON_ASTERISK     = wxICON_INFORMATION,
	
	wxHELP              = 0x00001000,
	wxFORWARD           = 0x00002000,
	wxBACKWARD          = 0x00004000,
	wxRESET             = 0x00008000,
	wxMORE              = 0x00010000,
	wxSETUP             = 0x00020000,
	wxICON_NONE         = 0x00040000,
	wxICON_AUTH_NEEDED  = 0x00080000,
	
$

public constant wxICON_MASK = or_all({
    wxICON_EXCLAMATION, wxICON_HAND, wxICON_QUESTION,
	wxICON_INFORMATION, wxICON_NONE, wxICON_AUTH_NEEDED
})

/*
 * Background styles. See wxWindow::SetBackgroundStyle
 */
public enum type wxBackgroundStyle
	
	/*
		background is erased in the EVT_ERASE_BACKGROUND handler or using
		the system default background if no such handler is defined (this
		is the default style)
	 */
	wxBG_STYLE_ERASE = 0,
	
	/*
		background is erased by the system, no EVT_ERASE_BACKGROUND event
		is generated at all
	 */
	wxBG_STYLE_SYSTEM,
	
	/*
		background is erased in EVT_PAINT handler and not erased at all
		before it, this should be used if the paint handler paints over
		the entire window to avoid flicker
	 */
	wxBG_STYLE_PAINT,
	
	/*
		Indicates that the window background is not erased, letting the parent
		window show through.
	 */
	wxBG_STYLE_TRANSPARENT,
	
	/* this style is deprecated and doesn't do anything, don't use */
	wxBG_STYLE_COLOUR,
	
	/*
		this style is deprecated and is synonymous with
		wxBG_STYLE_PAINT, use the new name
	 */
	wxBG_STYLE_CUSTOM = wxBG_STYLE_PAINT
	
end type

/*
 * Key types used by (old style) lists and hashes.
 */
public enum type wxKeyType
	
	wxKEY_NONE = 0,
	wxKEY_INTEGER,
	wxKEY_STRING
	
end type



/*  ---------------------------------------------------------------------------- */
/*  standard IDs */
/*  ---------------------------------------------------------------------------- */

/*  Standard menu IDs */
public enum type wxStandardID
	
	/*
		These ids delimit the range used by automatically-generated ids
		(i.e. those used when wxID_ANY is specified during construction).
	 */
	
	/* no id matches this one when compared to it */
	wxID_NONE = -3,
	
	/*  id for a separator line in the menu (invalid for normal item) */
	wxID_SEPARATOR = -2,
	
	/* any id: means that we don't care about the id, whether when installing
	* an event handler or when creating a new window */
	wxID_ANY = -1,
	
	/* all predefined ids are between wxID_LOWEST and wxID_HIGHEST */
	wxID_LOWEST = 4999,
	
	wxID_OPEN,
	wxID_CLOSE,
	wxID_NEW,
	wxID_SAVE,
	wxID_SAVEAS,
	wxID_REVERT,
	wxID_EXIT,
	wxID_UNDO,
	wxID_REDO,
	wxID_HELP,
	wxID_PRINT,
	wxID_PRINT_SETUP,
	wxID_PAGE_SETUP,
	wxID_PREVIEW,
	wxID_ABOUT,
	wxID_HELP_CONTENTS,
	wxID_HELP_INDEX,
	wxID_HELP_SEARCH,
	wxID_HELP_COMMANDS,
	wxID_HELP_PROCEDURES,
	wxID_HELP_CONTEXT,
	wxID_CLOSE_ALL,
	wxID_PREFERENCES,
	
	wxID_EDIT = 5030,
	wxID_CUT,
	wxID_COPY,
	wxID_PASTE,
	wxID_CLEAR,
	wxID_FIND,
	wxID_DUPLICATE,
	wxID_SELECTALL,
	wxID_DELETE,
	wxID_REPLACE,
	wxID_REPLACE_ALL,
	wxID_PROPERTIES,
	
	wxID_VIEW_DETAILS,
	wxID_VIEW_LARGEICONS,
	wxID_VIEW_SMALLICONS,
	wxID_VIEW_LIST,
	wxID_VIEW_SORTDATE,
	wxID_VIEW_SORTNAME,
	wxID_VIEW_SORTSIZE,
	wxID_VIEW_SORTTYPE,
	
	wxID_FILE = 5050,
	wxID_FILE1,
	wxID_FILE2,
	wxID_FILE3,
	wxID_FILE4,
	wxID_FILE5,
	wxID_FILE6,
	wxID_FILE7,
	wxID_FILE8,
	wxID_FILE9,
	
	/*  Standard button and menu IDs */
	wxID_OK = 5100,
	wxID_CANCEL,
	wxID_APPLY,
	wxID_YES,
	wxID_NO,
	wxID_STATIC,
	wxID_FORWARD,
	wxID_BACKWARD,
	wxID_DEFAULT,
	wxID_MORE,
	wxID_SETUP,
	wxID_RESET,
	wxID_CONTEXT_HELP,
	wxID_YESTOALL,
	wxID_NOTOALL,
	wxID_ABORT,
	wxID_RETRY,
	wxID_IGNORE,
	wxID_ADD,
	wxID_REMOVE,
	
	wxID_UP,
	wxID_DOWN,
	wxID_HOME,
	wxID_REFRESH,
	wxID_STOP,
	wxID_INDEX,
	
	wxID_BOLD,
	wxID_ITALIC,
	wxID_JUSTIFY_CENTER,
	wxID_JUSTIFY_FILL,
	wxID_JUSTIFY_RIGHT,
	wxID_JUSTIFY_LEFT,
	wxID_UNDERLINE,
	wxID_INDENT,
	wxID_UNINDENT,
	wxID_ZOOM_100,
	wxID_ZOOM_FIT,
	wxID_ZOOM_IN,
	wxID_ZOOM_OUT,
	wxID_UNDELETE,
	wxID_REVERT_TO_SAVED,
	wxID_CDROM,
	wxID_CONVERT,
	wxID_EXECUTE,
	wxID_FLOPPY,
	wxID_HARDDISK,
	wxID_BOTTOM,
	wxID_FIRST,
	wxID_LAST,
	wxID_TOP,
	wxID_INFO,
	wxID_JUMP_TO,
	wxID_NETWORK,
	wxID_SELECT_COLOR,
	wxID_SELECT_FONT,
	wxID_SORT_ASCENDING,
	wxID_SORT_DESCENDING,
	wxID_SPELL_CHECK,
	wxID_STRIKETHROUGH,
	
	/*  System menu IDs (used by wxUniv): */
	wxID_SYSTEM_MENU = 5200,
	wxID_CLOSE_FRAME,
	wxID_MOVE_FRAME,
	wxID_RESIZE_FRAME,
	wxID_MAXIMIZE_FRAME,
	wxID_ICONIZE_FRAME,
	wxID_RESTORE_FRAME,
	
	/* MDI window menu ids */
	wxID_MDI_WINDOW_FIRST = 5230,
	wxID_MDI_WINDOW_CASCADE = wxID_MDI_WINDOW_FIRST,
	wxID_MDI_WINDOW_TILE_HORZ,
	wxID_MDI_WINDOW_TILE_VERT,
	wxID_MDI_WINDOW_ARRANGE_ICONS,
	wxID_MDI_WINDOW_PREV,
	wxID_MDI_WINDOW_NEXT,
	wxID_MDI_WINDOW_LAST = wxID_MDI_WINDOW_NEXT,
	
	/* OS X system menu ids */
	wxID_OSX_MENU_FIRST = 5250,
	wxID_OSX_HIDE = wxID_OSX_MENU_FIRST,
	wxID_OSX_HIDEOTHERS,
	wxID_OSX_SHOWALL,
	wxID_OSX_SERVICES,
	wxID_OSX_MENU_LAST = wxID_OSX_SERVICES,
	
	/*  IDs used by generic file dialog (13 consecutive starting from this value) */
	wxID_FILEDLGG = 5900,
	
	/*  IDs used by generic file ctrl (4 consecutive starting from this value) */
	wxID_FILECTRL = 5950,
	
	wxID_HIGHEST = 5999
	
end type

/*
	On MSW the range is always restricted no matter if id management
	is used or not because the native window ids are limited to short
	range.  On other platforms the range is only restricted if id
	management is used so the reference count buffer won't be so big.
 */
ifdef WINDOWS or wxUSE_AUTOID_MANAGEMENT then
public constant wxID_AUTO_LOWEST    = -32000
public constant wxID_AUTO_HIGHEST   =  -2000
elsedef
public constant wxID_AUTO_LOWEST    = -1000000
public constant wxID_AUTO_HIGHEST   =    -2000
end ifdef



/*  ---------------------------------------------------------------------------- */
/*  wxWindowID type                                                              */
/*  ---------------------------------------------------------------------------- */

/*
 * wxWindowID used to be just a typedef defined here, now it's a class, but we
 * still continue to define it here for compatibility, so that the code using
 * it continues to compile even if it includes just wx/defs.h.
 *
 * Notice that wx/windowid.h can only be included after wxID_XYZ definitions
 * (as it uses them).
 */
public include "wx/windowid.e"



/*  ---------------------------------------------------------------------------- */
/*  other constants */
/*  ---------------------------------------------------------------------------- */

/*  menu and toolbar item kinds */
public enum type wxItemKind
	
	wxITEM_SEPARATOR = -1,
	wxITEM_NORMAL,
	wxITEM_CHECK,
	wxITEM_RADIO,
	wxITEM_DROPDOWN,
	wxITEM_MAX
	
end type

/*
 * The possible states of a 3-state checkbox (Compatible
 * with the 2-state checkbox).
 */
public enum type wxCheckBoxState
	
	wxCHK_UNCHECKED = 0,
	wxCHK_CHECKED,
	wxCHK_UNDETERMINED /* 3-state checkbox only */
	
end type

/*  hit test results */
public enum type wxHitTest
	
	wxHT_NOWHERE = 0,
	
	/*  scrollbar */
	wxHT_SCROLLBAR_FIRST = wxHT_NOWHERE,
	wxHT_SCROLLBAR_ARROW_LINE_1,    /*  left or upper arrow to scroll by line */
	wxHT_SCROLLBAR_ARROW_LINE_2,    /*  right or down */
	wxHT_SCROLLBAR_ARROW_PAGE_1,    /*  left or upper arrow to scroll by page */
	wxHT_SCROLLBAR_ARROW_PAGE_2,    /*  right or down */
	wxHT_SCROLLBAR_THUMB,           /*  on the thumb */
	wxHT_SCROLLBAR_BAR_1,           /*  bar to the left/above the thumb */
	wxHT_SCROLLBAR_BAR_2,           /*  bar to the right/below the thumb */
	wxHT_SCROLLBAR_LAST,
	
	/*  window */
	wxHT_WINDOW_OUTSIDE,            /*  not in this window at all */
	wxHT_WINDOW_INSIDE,             /*  in the client area */
	wxHT_WINDOW_VERT_SCROLLBAR,     /*  on the vertical scrollbar */
	wxHT_WINDOW_HORZ_SCROLLBAR,     /*  on the horizontal scrollbar */
	wxHT_WINDOW_CORNER,             /*  on the corner between 2 scrollbars */
	
	wxHT_MAX
	
end type



/*  ---------------------------------------------------------------------------- */
/*  Possible SetSize flags */
/*  ---------------------------------------------------------------------------- */

/*  Use internally-calculated width if -1 */
public constant wxSIZE_AUTO_WIDTH = 0x0001

/*  Use internally-calculated height if -1 */
public constant wxSIZE_AUTO_HEIGHT = 0x0002

/*  Use internally-calculated width and height if each is -1 */
public constant wxSIZE_AUTO = or_bits(wxSIZE_AUTO_WIDTH, wxSIZE_AUTO_HEIGHT)

/*  Ignore missing (-1) dimensions (use existing). */
/*  For readability only: test for wxSIZE_AUTO_WIDTH/HEIGHT in code. */
public constant wxSIZE_USE_EXISTING = 0x0000

/*  Allow -1 as a valid position */
public constant wxSIZE_ALLOW_MINUS_ONE = 0x0004

/*  Don't do parent client adjustments (for implementation only) */
public constant wxSIZE_NO_ADJUSTMENTS = 0x0008

/*  Change the window position even if it seems to be already correct */
public constant wxSIZE_FORCE = 0x0010

/*  Emit size event even if size didn't change */
public constant wxSIZE_FORCE_EVENT = 0x0020



/*  ---------------------------------------------------------------------------- */
/*  GDI descriptions */
/*  ---------------------------------------------------------------------------- */

-- Hatch styles used by both pen and brush styles.
--
-- NB: Do not use these constants directly, they're for internal use only, use
--     wxBRUSHSTYLE_XXX_HATCH and wxPENSTYLE_XXX_HATCH instead.
public enum type wxHatchStyle
	
	wxHATCHSTYLE_INVALID = -1,
	
	/*
		The value of the first style is chosen to fit with
		wxDeprecatedGUIConstants values below, don't change it.
	 */
	wxHATCHSTYLE_FIRST = 111,
	wxHATCHSTYLE_BDIAGONAL = wxHATCHSTYLE_FIRST,
	wxHATCHSTYLE_CROSSDIAG,
	wxHATCHSTYLE_FDIAGONAL,
	wxHATCHSTYLE_CROSS,
	wxHATCHSTYLE_HORIZONTAL,
	wxHATCHSTYLE_VERTICAL,
	wxHATCHSTYLE_LAST = wxHATCHSTYLE_VERTICAL
	
end type

/*
    WARNING: the following styles are deprecated; use the
    wxFontFamily, wxFontStyle, wxFontWeight, wxBrushStyle,
    wxPenStyle, wxPenCap, wxPenJoin enum values instead!
 */

/* don't use any elements of this enum in the new code */
public enum type wxDeprecatedGUIConstants
	
	/*  Text font families */
	wxDEFAULT = 70,
	wxDECORATIVE,
	wxROMAN,
	wxSCRIPT,
	wxSWISS,
	wxMODERN,
	wxTELETYPE,  /* @@@@ */
	
	/*  Proportional or Fixed width fonts (not yet used) */
	wxVARIABLE = 80,
	wxFIXED,
	
	wxNORMAL = 90,
	wxLIGHT,
	wxBOLD,
	/*  Also wxNORMAL for normal (non-italic text) */
	wxITALIC,
	wxSLANT,
	
	/*  Pen styles */
	wxSOLID =   100,
	wxDOT,
	wxLONG_DASH,
	wxSHORT_DASH,
	wxDOT_DASH,
	wxUSER_DASH,
	
	wxTRANSPARENT,
	
	/*  Brush & Pen Stippling. Note that a stippled pen cannot be dashed!! */
	/*  Note also that stippling a Pen IS meaningful, because a Line is */
	wxSTIPPLE_MASK_OPAQUE, /* mask is used for blitting monochrome using text fore and back ground colors */
	wxSTIPPLE_MASK,        /* mask is used for masking areas in the stipple bitmap (TO DO) */
	/*  drawn with a Pen, and without any Brush -- and it can be stippled. */
	wxSTIPPLE = 110,
	
	wxBDIAGONAL_HATCH   = wxHATCHSTYLE_BDIAGONAL,
	wxCROSSDIAG_HATCH   = wxHATCHSTYLE_CROSSDIAG,
	wxFDIAGONAL_HATCH   = wxHATCHSTYLE_FDIAGONAL,
	wxCROSS_HATCH       = wxHATCHSTYLE_CROSS,
	wxHORIZONTAL_HATCH  = wxHATCHSTYLE_HORIZONTAL,
	wxVERTICAL_HATCH    = wxHATCHSTYLE_VERTICAL,
	wxFIRST_HATCH       = wxHATCHSTYLE_FIRST,
	wxLAST_HATCH        = wxHATCHSTYLE_LAST
	
end type

/*  ToolPanel in wxFrame (VZ: unused?) */
public enum
	
	wxTOOL_TOP = 1,
	wxTOOL_BOTTOM,
	wxTOOL_LEFT,
	wxTOOL_RIGHT,
	
$

/*  the values of the format constants should be the same as corresponding */
/*  CF_XXX constants in Windows API */
public enum type wxDataFormatId
	
	wxDF_INVALID        =  0,
	wxDF_TEXT           =  1,  /* CF_TEXT */
	wxDF_BITMAP         =  2,  /* CF_BITMAP */
	wxDF_METAFILE       =  3,  /* CF_METAFILEPICT */
	wxDF_SYLK           =  4,
	wxDF_DIF            =  5,
	wxDF_TIFF           =  6,
	wxDF_OEMTEXT        =  7,  /* CF_OEMTEXT */
	wxDF_DIB            =  8,  /* CF_DIB */
	wxDF_PALETTE        =  9,
	wxDF_PENDATA        = 10,
	wxDF_RIFF           = 11,
	wxDF_WAVE           = 12,
	wxDF_UNICODETEXT    = 13,
	wxDF_ENHMETAFILE    = 14,
	wxDF_FILENAME       = 15, /* CF_HDROP */
	wxDF_LOCALE         = 16,
	wxDF_PRIVATE        = 20,
	wxDF_HTML           = 30, /* Note: does not correspond to CF_ constant */
	wxDF_MAX
	
end type

/* Key codes */
public enum type wxKeyCode
	
	WXK_NONE = 0,
	
	WXK_CONTROL_A = 1,
	WXK_CONTROL_B,
	WXK_CONTROL_C,
	WXK_CONTROL_D,
	WXK_CONTROL_E,
	WXK_CONTROL_F,
	WXK_CONTROL_G,
	WXK_CONTROL_H,
	WXK_CONTROL_I,
	WXK_CONTROL_J,
	WXK_CONTROL_K,
	WXK_CONTROL_L,
	WXK_CONTROL_M,
	WXK_CONTROL_N,
	WXK_CONTROL_O,
	WXK_CONTROL_P,
	WXK_CONTROL_Q,
	WXK_CONTROL_R,
	WXK_CONTROL_S,
	WXK_CONTROL_T,
	WXK_CONTROL_U,
	WXK_CONTROL_V,
	WXK_CONTROL_W,
	WXK_CONTROL_X,
	WXK_CONTROL_Y,
	WXK_CONTROL_Z,
	
	WXK_BACK    =  8, /* backspace */
	WXK_TAB     =  9,
	WXK_RETURN  = 13,
	WXK_ESCAPE  = 27,
	
	/* values from 33 to 126 are reserved for the standard ASCII characters */
	
	WXK_SPACE   =  32,
	WXK_DELETE  = 127,
	
	/* values from 128 to 255 are reserved for ASCII extended characters
	   (note that there isn't a single fixed standard for the meaning
	   of these values; avoid them in portable apps!) */
	
	/* These are not compatible with unicode characters.
	   If you want to get a unicode character from a key event, use
	   wxKeyEvent::GetUnicodeKey */
	WXK_START = 300,
	WXK_LBUTTON,
	WXK_RBUTTON,
	WXK_CANCEL,
	WXK_MBUTTON,
	WXK_CLEAR,
	WXK_SHIFT,
	WXK_ALT,
	WXK_CONTROL,
	WXK_MENU,
	WXK_PAUSE,
	WXK_CAPITAL,
	WXK_END,
	WXK_HOME,
	WXK_LEFT,
	WXK_UP,
	WXK_RIGHT,
	WXK_DOWN,
	WXK_SELECT,
	WXK_PRINT,
	WXK_EXECUTE,
	WXK_SNAPSHOT,
	WXK_INSERT,
	WXK_HELP,
	WXK_NUMPAD0,
	WXK_NUMPAD1,
	WXK_NUMPAD2,
	WXK_NUMPAD3,
	WXK_NUMPAD4,
	WXK_NUMPAD5,
	WXK_NUMPAD6,
	WXK_NUMPAD7,
	WXK_NUMPAD8,
	WXK_NUMPAD9,
	WXK_MULTIPLY,
	WXK_ADD,
	WXK_SEPARATOR,
	WXK_SUBTRACT,
	WXK_DECIMAL,
	WXK_DIVIDE,
	WXK_F1,
	WXK_F2,
	WXK_F3,
	WXK_F4,
	WXK_F5,
	WXK_F6,
	WXK_F7,
	WXK_F8,
	WXK_F9,
	WXK_F10,
	WXK_F11,
	WXK_F12,
	WXK_F13,
	WXK_F14,
	WXK_F15,
	WXK_F16,
	WXK_F17,
	WXK_F18,
	WXK_F19,
	WXK_F20,
	WXK_F21,
	WXK_F22,
	WXK_F23,
	WXK_F24,
	WXK_NUMLOCK,
	WXK_SCROLL,
	WXK_PAGEUP,
	WXK_PAGEDOWN,
	WXK_NUMPAD_SPACE,
	WXK_NUMPAD_TAB,
	WXK_NUMPAD_ENTER,
	WXK_NUMPAD_F1,
	WXK_NUMPAD_F2,
	WXK_NUMPAD_F3,
	WXK_NUMPAD_F4,
	WXK_NUMPAD_HOME,
	WXK_NUMPAD_LEFT,
	WXK_NUMPAD_UP,
	WXK_NUMPAD_RIGHT,
	WXK_NUMPAD_DOWN,
	WXK_NUMPAD_PAGEUP,
	WXK_NUMPAD_PAGEDOWN,
	WXK_NUMPAD_END,
	WXK_NUMPAD_BEGIN,
	WXK_NUMPAD_INSERT,
	WXK_NUMPAD_DELETE,
	WXK_NUMPAD_EQUAL,
	WXK_NUMPAD_MULTIPLY,
	WXK_NUMPAD_ADD,
	WXK_NUMPAD_SEPARATOR,
	WXK_NUMPAD_SUBTRACT,
	WXK_NUMPAD_DECIMAL,
	WXK_NUMPAD_DIVIDE,
	
	WXK_WINDOWS_LEFT,
	WXK_WINDOWS_RIGHT,
	WXK_WINDOWS_MENU,
	WXK_OSX_CONTROL,
	WXK_COMMAND = WXK_CONTROL,
	
	/* Hardware-specific buttons */
	WXK_RESERVED1 = WXK_WINDOWS_MENU,
	WXK_RESERVED2,
	WXK_SPECIAL1, /* Skip WXK_RAW_CONTROL if necessary */
	WXK_SPECIAL2,
	WXK_SPECIAL3,
	WXK_SPECIAL4,
	WXK_SPECIAL5,
	WXK_SPECIAL6,
	WXK_SPECIAL7,
	WXK_SPECIAL8,
	WXK_SPECIAL9,
	WXK_SPECIAL10,
	WXK_SPECIAL11,
	WXK_SPECIAL12,
	WXK_SPECIAL13,
	WXK_SPECIAL14,
	WXK_SPECIAL15,
	WXK_SPECIAL16,
	WXK_SPECIAL17,
	WXK_SPECIAL18,
	WXK_SPECIAL19,
	WXK_SPECIAL20,
	
	WXK_BROWSER_BACK,
	WXK_BROWSER_FORWARD,
	WXK_BROWSER_REFRESH,
	WXK_BROWSER_STOP,
	WXK_BROWSER_SEARCH,
	WXK_BROWSER_FAVORITES,
	WXK_BROWSER_HOME,
	WXK_VOLUME_MUTE,
	WXK_VOLUME_DOWN,
	WXK_VOLUME_UP,
	WXK_MEDIA_NEXT_TRACK,
	WXK_MEDIA_PREV_TRACK,
	WXK_MEDIA_STOP,
	WXK_MEDIA_PLAY_PAUSE,
	WXK_LAUNCH_MAIL,
	WXK_LAUNCH_APP1,
	WXK_LAUNCH_APP2
	
end type

ifdef OSX then
public constant WXK_RAW_CONTROL = WXK_OSX_CONTROL
elsedef
public constant WXK_RAW_CONTROL = WXK_CONTROL
end ifdef

/* This enum contains bit mask constants used in wxKeyEvent */
public enum type wxKeyModifier
	
	wxMOD_NONE      = 0x0000,
	wxMOD_ALT       = 0x0001,
	wxMOD_CONTROL   = 0x0002,
	wxMOD_ALTGR     = 0x0003, -- wxMOD_ALT | wxMOD_CONTROL,
	wxMOD_SHIFT     = 0x0004,
	wxMOD_META      = 0x0008,
	wxMOD_WIN       = wxMOD_META,
	wxMOD_OSX_CONTROL = 0x0010,
	wxMOD_CMD       = wxMOD_CONTROL,
	wxMOD_ALL       = 0xffff
	
end type

ifdef OSX then
public constant wxMOD_RAW_CONTROL = wxMOD_OSX_CONTROL
elsedef
public constant wxMOD_RAW_CONTROL = wxMOD_CONTROL
end ifdef

/* Paper types */
public enum type wxPaperSize
	
	wxPAPER_NONE = 0,           /*  Use specific dimensions */
	wxPAPER_LETTER,             /*  Letter, 8 1/2 by 11 inches */
	wxPAPER_LEGAL,              /*  Legal, 8 1/2 by 14 inches */
	wxPAPER_A4,                 /*  A4 Sheet, 210 by 297 millimeters */
	wxPAPER_CSHEET,             /*  C Sheet, 17 by 22 inches */
	wxPAPER_DSHEET,             /*  D Sheet, 22 by 34 inches */
	wxPAPER_ESHEET,             /*  E Sheet, 34 by 44 inches */
	wxPAPER_LETTERSMALL,        /*  Letter Small, 8 1/2 by 11 inches */
	wxPAPER_TABLOID,            /*  Tabloid, 11 by 17 inches */
	wxPAPER_LEDGER,             /*  Ledger, 17 by 11 inches */
	wxPAPER_STATEMENT,          /*  Statement, 5 1/2 by 8 1/2 inches */
	wxPAPER_EXECUTIVE,          /*  Executive, 7 1/4 by 10 1/2 inches */
	wxPAPER_A3,                 /*  A3 sheet, 297 by 420 millimeters */
	wxPAPER_A4SMALL,            /*  A4 small sheet, 210 by 297 millimeters */
	wxPAPER_A5,                 /*  A5 sheet, 148 by 210 millimeters */
	wxPAPER_B4,                 /*  B4 sheet, 250 by 354 millimeters */
	wxPAPER_B5,                 /*  B5 sheet, 182-by-257-millimeter paper */
	wxPAPER_FOLIO,              /*  Folio, 8-1/2-by-13-inch paper */
	wxPAPER_QUARTO,             /*  Quarto, 215-by-275-millimeter paper */
	wxPAPER_10X14,              /*  10-by-14-inch sheet */
	wxPAPER_11X17,              /*  11-by-17-inch sheet */
	wxPAPER_NOTE,               /*  Note, 8 1/2 by 11 inches */
	wxPAPER_ENV_9,              /*  #9 Envelope, 3 7/8 by 8 7/8 inches */
	wxPAPER_ENV_10,             /*  #10 Envelope, 4 1/8 by 9 1/2 inches */
	wxPAPER_ENV_11,             /*  #11 Envelope, 4 1/2 by 10 3/8 inches */
	wxPAPER_ENV_12,             /*  #12 Envelope, 4 3/4 by 11 inches */
	wxPAPER_ENV_14,             /*  #14 Envelope, 5 by 11 1/2 inches */
	wxPAPER_ENV_DL,             /*  DL Envelope, 110 by 220 millimeters */
	wxPAPER_ENV_C5,             /*  C5 Envelope, 162 by 229 millimeters */
	wxPAPER_ENV_C3,             /*  C3 Envelope, 324 by 458 millimeters */
	wxPAPER_ENV_C4,             /*  C4 Envelope, 229 by 324 millimeters */
	wxPAPER_ENV_C6,             /*  C6 Envelope, 114 by 162 millimeters */
	wxPAPER_ENV_C65,            /*  C65 Envelope, 114 by 229 millimeters */
	wxPAPER_ENV_B4,             /*  B4 Envelope, 250 by 353 millimeters */
	wxPAPER_ENV_B5,             /*  B5 Envelope, 176 by 250 millimeters */
	wxPAPER_ENV_B6,             /*  B6 Envelope, 176 by 125 millimeters */
	wxPAPER_ENV_ITALY,          /*  Italy Envelope, 110 by 230 millimeters */
	wxPAPER_ENV_MONARCH,        /*  Monarch Envelope, 3 7/8 by 7 1/2 inches */
	wxPAPER_ENV_PERSONAL,       /*  6 3/4 Envelope, 3 5/8 by 6 1/2 inches */
	wxPAPER_FANFOLD_US,         /*  US Std Fanfold, 14 7/8 by 11 inches */
	wxPAPER_FANFOLD_STD_GERMAN, /*  German Std Fanfold, 8 1/2 by 12 inches */
	wxPAPER_FANFOLD_LGL_GERMAN, /*  German Legal Fanfold, 8 1/2 by 13 inches */
	
	wxPAPER_ISO_B4,             /*  B4 (ISO) 250 x 353 mm */
	wxPAPER_JAPANESE_POSTCARD,  /*  Japanese Postcard 100 x 148 mm */
	wxPAPER_9X11,               /*  9 x 11 in */
	wxPAPER_10X11,              /*  10 x 11 in */
	wxPAPER_15X11,              /*  15 x 11 in */
	wxPAPER_ENV_INVITE,         /*  Envelope Invite 220 x 220 mm */
	wxPAPER_LETTER_EXTRA,       /*  Letter Extra 9 \275 x 12 in */
	wxPAPER_LEGAL_EXTRA,        /*  Legal Extra 9 \275 x 15 in */
	wxPAPER_TABLOID_EXTRA,      /*  Tabloid Extra 11.69 x 18 in */
	wxPAPER_A4_EXTRA,           /*  A4 Extra 9.27 x 12.69 in */
	wxPAPER_LETTER_TRANSVERSE,  /*  Letter Transverse 8 \275 x 11 in */
	wxPAPER_A4_TRANSVERSE,      /*  A4 Transverse 210 x 297 mm */
	wxPAPER_LETTER_EXTRA_TRANSVERSE, /*  Letter Extra Transverse 9\275 x 12 in */
	wxPAPER_A_PLUS,             /*  SuperA/SuperA/A4 227 x 356 mm */
	wxPAPER_B_PLUS,             /*  SuperB/SuperB/A3 305 x 487 mm */
	wxPAPER_LETTER_PLUS,        /*  Letter Plus 8.5 x 12.69 in */
	wxPAPER_A4_PLUS,            /*  A4 Plus 210 x 330 mm */
	wxPAPER_A5_TRANSVERSE,      /*  A5 Transverse 148 x 210 mm */
	wxPAPER_B5_TRANSVERSE,      /*  B5 (JIS) Transverse 182 x 257 mm */
	wxPAPER_A3_EXTRA,           /*  A3 Extra 322 x 445 mm */
	wxPAPER_A5_EXTRA,           /*  A5 Extra 174 x 235 mm */
	wxPAPER_B5_EXTRA,           /*  B5 (ISO) Extra 201 x 276 mm */
	wxPAPER_A2,                 /*  A2 420 x 594 mm */
	wxPAPER_A3_TRANSVERSE,      /*  A3 Transverse 297 x 420 mm */
	wxPAPER_A3_EXTRA_TRANSVERSE, /*  A3 Extra Transverse 322 x 445 mm */
	
	wxPAPER_DBL_JAPANESE_POSTCARD,/* Japanese Double Postcard 200 x 148 mm */
	wxPAPER_A6,                 /* A6 105 x 148 mm */
	wxPAPER_JENV_KAKU2,         /* Japanese Envelope Kaku #2 */
	wxPAPER_JENV_KAKU3,         /* Japanese Envelope Kaku #3 */
	wxPAPER_JENV_CHOU3,         /* Japanese Envelope Chou #3 */
	wxPAPER_JENV_CHOU4,         /* Japanese Envelope Chou #4 */
	wxPAPER_LETTER_ROTATED,     /* Letter Rotated 11 x 8 1/2 in */
	wxPAPER_A3_ROTATED,         /* A3 Rotated 420 x 297 mm */
	wxPAPER_A4_ROTATED,         /* A4 Rotated 297 x 210 mm */
	wxPAPER_A5_ROTATED,         /* A5 Rotated 210 x 148 mm */
	wxPAPER_B4_JIS_ROTATED,     /* B4 (JIS) Rotated 364 x 257 mm */
	wxPAPER_B5_JIS_ROTATED,     /* B5 (JIS) Rotated 257 x 182 mm */
	wxPAPER_JAPANESE_POSTCARD_ROTATED,/* Japanese Postcard Rotated 148 x 100 mm */
	wxPAPER_DBL_JAPANESE_POSTCARD_ROTATED,/* Double Japanese Postcard Rotated 148 x 200 mm */
	wxPAPER_A6_ROTATED,         /* A6 Rotated 148 x 105 mm */
	wxPAPER_JENV_KAKU2_ROTATED, /* Japanese Envelope Kaku #2 Rotated */
	wxPAPER_JENV_KAKU3_ROTATED, /* Japanese Envelope Kaku #3 Rotated */
	wxPAPER_JENV_CHOU3_ROTATED, /* Japanese Envelope Chou #3 Rotated */
	wxPAPER_JENV_CHOU4_ROTATED, /* Japanese Envelope Chou #4 Rotated */
	wxPAPER_B6_JIS,             /* B6 (JIS) 128 x 182 mm */
	wxPAPER_B6_JIS_ROTATED,     /* B6 (JIS) Rotated 182 x 128 mm */
	wxPAPER_12X11,              /* 12 x 11 in */
	wxPAPER_JENV_YOU4,          /* Japanese Envelope You #4 */
	wxPAPER_JENV_YOU4_ROTATED,  /* Japanese Envelope You #4 Rotated */
	wxPAPER_P16K,               /* PRC 16K 146 x 215 mm */
	wxPAPER_P32K,               /* PRC 32K 97 x 151 mm */
	wxPAPER_P32KBIG,            /* PRC 32K(Big) 97 x 151 mm */
	wxPAPER_PENV_1,             /* PRC Envelope #1 102 x 165 mm */
	wxPAPER_PENV_2,             /* PRC Envelope #2 102 x 176 mm */
	wxPAPER_PENV_3,             /* PRC Envelope #3 125 x 176 mm */
	wxPAPER_PENV_4,             /* PRC Envelope #4 110 x 208 mm */
	wxPAPER_PENV_5,             /* PRC Envelope #5 110 x 220 mm */
	wxPAPER_PENV_6,             /* PRC Envelope #6 120 x 230 mm */
	wxPAPER_PENV_7,             /* PRC Envelope #7 160 x 230 mm */
	wxPAPER_PENV_8,             /* PRC Envelope #8 120 x 309 mm */
	wxPAPER_PENV_9,             /* PRC Envelope #9 229 x 324 mm */
	wxPAPER_PENV_10,            /* PRC Envelope #10 324 x 458 mm */
	wxPAPER_P16K_ROTATED,       /* PRC 16K Rotated */
	wxPAPER_P32K_ROTATED,       /* PRC 32K Rotated */
	wxPAPER_P32KBIG_ROTATED,    /* PRC 32K(Big) Rotated */
	wxPAPER_PENV_1_ROTATED,     /* PRC Envelope #1 Rotated 165 x 102 mm */
	wxPAPER_PENV_2_ROTATED,     /* PRC Envelope #2 Rotated 176 x 102 mm */
	wxPAPER_PENV_3_ROTATED,     /* PRC Envelope #3 Rotated 176 x 125 mm */
	wxPAPER_PENV_4_ROTATED,     /* PRC Envelope #4 Rotated 208 x 110 mm */
	wxPAPER_PENV_5_ROTATED,     /* PRC Envelope #5 Rotated 220 x 110 mm */
	wxPAPER_PENV_6_ROTATED,     /* PRC Envelope #6 Rotated 230 x 120 mm */
	wxPAPER_PENV_7_ROTATED,     /* PRC Envelope #7 Rotated 230 x 160 mm */
	wxPAPER_PENV_8_ROTATED,     /* PRC Envelope #8 Rotated 309 x 120 mm */
	wxPAPER_PENV_9_ROTATED,     /* PRC Envelope #9 Rotated 324 x 229 mm */
	wxPAPER_PENV_10_ROTATED,    /* PRC Envelope #10 Rotated 458 x 324 m */
	wxPAPER_A0,                 /* A0 Sheet 841 x 1189 mm */
	wxPAPER_A1                  /* A1 Sheet 594 x 841 mm */
	
end type

/* Printing orientation */
public enum type wxPrintOrientation
	
	wxPORTRAIT = 1,
	wxLANDSCAPE
	
end type

/* Duplex printing modes */
public enum type wxDuplexMode
	
	wxDUPLEX_SIMPLEX = 0, /*  Non-duplex */
	wxDUPLEX_HORIZONTAL,
	wxDUPLEX_VERTICAL
	
end type

/* Print quality. */
public constant
	wxPRINT_QUALITY_HIGH    = -1,
	wxPRINT_QUALITY_MEDIUM  = -2,
	wxPRINT_QUALITY_LOW     = -3,
	wxPRINT_QUALITY_DRAFT   = -4,
$

public type wxPrintQuality( atom x )
	return wxInt32(x)
end type

/* Print mode (currently PostScript only) */
public enum type wxPrintMode
	
	wxPRINT_MODE_NONE =    0,
	wxPRINT_MODE_PREVIEW = 1,   /*  Preview in external application */
	wxPRINT_MODE_FILE =    2,   /*  Print to file */
	wxPRINT_MODE_PRINTER = 3,   /*  Send to printer */
	wxPRINT_MODE_STREAM =  4    /*  Send postscript data into a stream */
	
end type



/*  ---------------------------------------------------------------------------- */
/*  UpdateWindowUI flags */
/*  ---------------------------------------------------------------------------- */
public enum type wxUpdateUI
	
	wxUPDATE_UI_NONE          = 0x0000,
	wxUPDATE_UI_RECURSE       = 0x0001,
	wxUPDATE_UI_FROMIDLE      = 0x0002 /*  Invoked from On(Internal)Idle */
	
end type



/*  ---------------------------------------------------------------------------- */
/*  miscellaneous */
/*  ---------------------------------------------------------------------------- */

/*  constants to specify "All Files" on different platforms */
ifdef WINDOWS then
public constant wxALL_FILES_PATTERN = "*.*"
public constant wxALL_FILES         = "All files (*.*)|*.*"
elsedef
public constant wxALL_FILES_PATTERN = "*"
public constant wxALL_FILES         = "All files (*)|*"
end ifdef

/* wxThread and wxProcess priorities */
public enum
	
	wxPRIORITY_MIN     =   0,  /* lowest possible priority */
	wxPRIORITY_DEFAULT =  50,  /* normal priority */
	wxPRIORITY_MAX     = 100,  /* highest possible priority */
	
$
