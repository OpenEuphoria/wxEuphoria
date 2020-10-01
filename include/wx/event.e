
include "wx/dll.e"

public include "wx/base/wxEvent.e"
public include "wx/base/wxEventType.e"
public include "wx/base/wxEvtHandler.e"
public include "wx/core/wxUpdateUIEvent.e"

atom core = wx_library( "core" )

public constant wxEVT_UPDATE_UI = wx_event( core, "wxEVT_UPDATE_UI" )

public enum type wxEventPropagation
	
	wxEVENT_PROPAGATE_NONE = 0,
	wxEVENT_PROPAGATE_MAX = 2147483647 -- INT_MAX
	
end type

public enum type wxEventCategory
	
	wxEVT_CATEGORY_UI         =  1,
	wxEVT_CATEGORY_USER_INPUT =  2,
	wxEVT_CATEGORY_SOCKET     =  4,
	wxEVT_CATEGORY_TIMER      =  8,
	wxEVT_CATEGORY_THREAD     = 16,
	wxEVT_CATEGORY_ALL        = 31
	
end type

public enum type wxKeyCategoryFlags
	
	WXK_CATEGORY_ARROW = 0,
	WXK_CATEGORY_PAGING,
	WXK_CATEGORY_JUMP,
	WXK_CATEGORY_TAB,
	WXK_CATEGORY_CUT,
	WXK_CATEGORY_NAVIGATION
	
end type

public enum
	wxJOYSTICK1 = 0,
	wxJOYSTICK2

public enum
	wxJOY_BUTTON_ANY = -1,
	wxJOY_BUTTON1    =  1,
	wxJOY_BUTTON2    =  2,
	wxJOY_BUTTON3    =  4,
	wxJOY_BUTTON4    =  8

public enum type wxUpdateUIMode
	
	wxUPDATE_UI_PROCESS_ALL = 0,
	wxUPDATE_UI_PROCESS_SPECIFIED
	
end type

public enum type wxMouseWheelAxis
	
	wxMOUSE_WHEEL_VERTICAL = 0,
	wxMOUSE_WHEEL_HORIZONTAL
	
end type

public enum type wxIdleMode
	
	wxIDLE_PROCESS_ALL = 0,
	wxIDLE_PROCESS_SPECIFIED
	
end type
