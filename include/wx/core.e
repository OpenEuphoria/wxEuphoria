
include "wx/dll.e"

atom core = wx_library( "core" )

export constant
	WXAPP_NEW					= wx_define( core, "wxApp_new",                  3, TRUE  ),
	WXAPP_GETEXITONFRAMEDELETE	= wx_define( core, "wxApp_GetExitOnFrameDelete", 1, TRUE  ),
	WXAPP_GETLAYOUTDIRECTION	= wx_define( core, "wxApp_GetLayoutDirection",   1, TRUE  ),
	WXAPP_GETUSEBESTVISUAL		= wx_define( core, "wxApp_GetUseBestVisual",     1, TRUE  ),
	WXAPP_GETTOPWINDOW			= wx_define( core, "wxApp_GetTopWindow",         1, TRUE  ),
	WXAPP_ISACTIVE				= wx_define( core, "wxApp_IsActive",             1, TRUE  ),
	WXAPP_SAFEYIELD				= wx_define( core, "wxApp_SafeYield",            3, TRUE  ),
	WXAPP_SAFEYIELDFOR			= wx_define( core, "wxApp_SafeYieldFor",         3, TRUE  ),
	WXAPP_SETEXITONFRAMEDELETE	= wx_define( core, "wxApp_SetExitOnFrameDelete", 2, FALSE ),
	WXAPP_SETTOPWINDOW			= wx_define( core, "wxApp_SetTopWindow",         2, FALSE ),
	WXAPP_WXMESSAGEBOX			= wx_define( core, "wxApp_wxMessageBox",         6, TRUE  ),
	WXBUTTON_NEW				= wx_define( core, "wxButton_new",               8, TRUE  ),
	WXFRAME_NEW					= wx_define( core, "wxFrame_new",                7, TRUE  ),
	WXFRAME_CREATE				= wx_define( core, "wxFrame_Create",             8, TRUE  ),
	WXPANEL_NEW					= wx_define( core, "wxPanel_new",                6, TRUE  ),
	WXPANEL_CREATE				= wx_define( core, "wxPanel_Create",             7, TRUE  ),
	WXWINDOW_SHOW				= wx_define( core, "wxWindow_Show",              2, TRUE  ),
$

