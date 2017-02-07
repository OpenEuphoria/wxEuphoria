
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
$

export constant
	WXBUTTON_NEW	= wx_define( core, "wxButton_new",      8, TRUE  ),
	WXBUTTON_CREATE	= wx_define( core, "wxButton_Create",   9, TRUE  ),
$

export constant
	WXFRAME_NEW					= wx_define( core, "wxFrame_new",                 7, TRUE  ),
	WXFRAME_CENTRE				= wx_define( core, "wxFrame_Centre",              2, FALSE ),
	WXFRAME_CENTER				= wx_define( core, "wxFrame_Center",              2, FALSE ),
	WXFRAME_CREATE				= wx_define( core, "wxFrame_Create",              8, TRUE  ),
	WXFRAME_CREATESTATUSBAR		= wx_define( core, "wxFrame_CreateStatusBar",     5, TRUE  ),
	WXFRAME_CREATETOOLBAR		= wx_define( core, "wxFrame_CreateToolBar",       4, TRUE  ),
	WXFRAME_GETCLIENTAREAORIGIN	= wx_define( core, "wxFrame_GetClientAreaOrigin", 1, TRUE  ),
	WXFRAME_GETMENUBAR			= wx_define( core, "wxFrame_GetMenuBar",          1, TRUE  ),
	WXFRAME_GETSTATUSBAR		= wx_define( core, "wxFrame_GetStatusBar",        1, TRUE  ),
	WXFRAME_GETSTATUSBARPANE	= wx_define( core, "wxFrame_GetStatusBarPane",    1, TRUE  ),
	WXFRAME_GETTOOLBAR			= wx_define( core, "wxFrame_GetToolBar",          1, TRUE  ),
	WXFRAME_PROCESSCOMMAND		= wx_define( core, "wxFrame_ProcessCommand",      2, TRUE  ),
	WXFRAME_SETMENUBAR			= wx_define( core, "wxFrame_SetMenuBar",          2, FALSE ),
	WXFRAME_SETSTATUSBAR		= wx_define( core, "wxFrame_SetStatusBar",        2, FALSE ),
	WXFRAME_SETSTATUSBARPANE	= wx_define( core, "wxFrame_SetStatusBarPane",    2, FALSE ),
	WXFRAME_SETSTATUSTEXT		= wx_define( core, "wxFrame_SetStatusText",       3, FALSE ),
	WXFRAME_SETSTATUSWIDTHS		= wx_define( core, "wxFrame_SetStatusWidths",     2, FALSE ),
	WXFRAME_SETTOOLBAR			= wx_define( core, "wxFrame_SetToolBar",          2, FALSE ),
	WXFRAME_MSWGETTASKBARBUTTON	= wx_define( core, "wxFrame_MSWGetTaskBarButton", 1, TRUE  ),
	WXFRAME_PUSHSTATUSTEXT		= wx_define( core, "wxFrame_PushStatusText",      3, FALSE ),
	WXFRAME_POPSTATUSTEXT		= wx_define( core, "wxFrame_PopStatusText",       2, FALSE ),
$

export constant
	WXICON_NEW	= wx_define( core, "wxIcon_new", 4, TRUE  ),
$

export constant
	WXPANEL_NEW		= wx_define( core, "wxPanel_new",       6, TRUE  ),
	WXPANEL_CREATE	= wx_define( core, "wxPanel_Create",    7, TRUE  ),
$

export constant
	WXTOPLEVELWINDOW_NEW				= wx_define( core, "wxTopLevelWindow_new",               7, TRUE  ),
	WXTOPLEVELWINDOW_CREATE				= wx_define( core, "wxTopLevelWindow_Create",            8, TRUE  ),
	WXTOPLEVELWINDOW_CANSETTRANSPARENT	= wx_define( core, "wxTopLevelWindow_CanSetTransparent", 1, TRUE  ),
	WXTOPLEVELWINDOW_CENTERONSCREEN		= wx_define( core, "wxTopLevelWindow_CenterOnScreen",    2, FALSE ),
	WXTOPLEVELWINDOW_CENTREONSCREEN		= wx_define( core, "wxTopLevelWindow_CentreOnScreen",    2, FALSE ),
	WXTOPLEVELWINDOW_ENABLECLOSEBUTTON	= wx_define( core, "wxTopLevelWindow_EnableCloseButton", 2, TRUE  ),
	WXTOPLEVELWINDOW_GETDEFAULTITEM		= wx_define( core, "wxTopLevelWindow_GetDefaultItem",    1, TRUE  ),
	WXTOPLEVELWINDOW_GETICON			= wx_define( core, "wxTopLevelWindow_GetIcon",           1, TRUE  ),
	WXTOPLEVELWINDOW_SETICON			= wx_define( core, "wxTopLevelWindow_SetIcon",           2, FALSE ),
$

export constant
	WXWINDOW_NEW			= wx_define( core, "wxWindow_new",          6, TRUE  ),
	WXWINDOW_CREATE			= wx_define( core, "wxWindow_Create",       7, TRUE  ),
	WXWINDOW_ACCEPTSFOCUS	= wx_define( core, "wxWindow_AcceptsFocus", 1, TRUE  ),
	WXWINDOW_SHOW			= wx_define( core, "wxWindow_Show",         2, TRUE  ),
$

