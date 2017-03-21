
include "wx/dll.e"

atom core = wx_library( "core" )

export constant
	WXAPP_NEW					= wx_define( core, "wxApp_new",                     3, TRUE  ),
	WXAPP_GETEXITONFRAMEDELETE	= wx_define( core, "wxApp_GetExitOnFrameDelete",    1, TRUE  ),
	WXAPP_GETLAYOUTDIRECTION	= wx_define( core, "wxApp_GetLayoutDirection",      1, TRUE  ),
	WXAPP_GETUSEBESTVISUAL		= wx_define( core, "wxApp_GetUseBestVisual",        1, TRUE  ),
	WXAPP_GETTOPWINDOW			= wx_define( core, "wxApp_GetTopWindow",            1, TRUE  ),
	WXAPP_ISACTIVE				= wx_define( core, "wxApp_IsActive",                1, TRUE  ),
	WXAPP_SAFEYIELD				= wx_define( core, "wxApp_SafeYield",               3, TRUE  ),
	WXAPP_SAFEYIELDFOR			= wx_define( core, "wxApp_SafeYieldFor",            3, TRUE  ),
	WXAPP_SETEXITONFRAMEDELETE	= wx_define( core, "wxApp_SetExitOnFrameDelete",    2, FALSE ),
	WXAPP_SETTOPWINDOW			= wx_define( core, "wxApp_SetTopWindow",            2, FALSE ),
	WXAPP_WXMESSAGEBOX			= wx_define( core, "wxApp_wxMessageBox",            6, TRUE  ),
$

export constant
	WXBUTTON_NEW	= wx_define( core, "wxButton_new",      8, TRUE  ),
	WXBUTTON_CREATE	= wx_define( core, "wxButton_Create",   9, TRUE  ),
$

export constant
	WXFRAME_NEW					= wx_define( core, "wxFrame_new",                   7, TRUE  ),
	WXFRAME_CENTRE				= wx_define( core, "wxFrame_Centre",                2, FALSE ),
	WXFRAME_CENTER				= wx_define( core, "wxFrame_Center",                2, FALSE ),
	WXFRAME_CREATE				= wx_define( core, "wxFrame_Create",                8, TRUE  ),
	WXFRAME_CREATESTATUSBAR		= wx_define( core, "wxFrame_CreateStatusBar",       5, TRUE  ),
	WXFRAME_CREATETOOLBAR		= wx_define( core, "wxFrame_CreateToolBar",         4, TRUE  ),
	WXFRAME_GETCLIENTAREAORIGIN	= wx_define( core, "wxFrame_GetClientAreaOrigin",   1, TRUE  ),
	WXFRAME_GETMENUBAR			= wx_define( core, "wxFrame_GetMenuBar",            1, TRUE  ),
	WXFRAME_GETSTATUSBAR		= wx_define( core, "wxFrame_GetStatusBar",          1, TRUE  ),
	WXFRAME_GETSTATUSBARPANE	= wx_define( core, "wxFrame_GetStatusBarPane",      1, TRUE  ),
	WXFRAME_GETTOOLBAR			= wx_define( core, "wxFrame_GetToolBar",            1, TRUE  ),
	WXFRAME_PROCESSCOMMAND		= wx_define( core, "wxFrame_ProcessCommand",        2, TRUE  ),
	WXFRAME_SETMENUBAR			= wx_define( core, "wxFrame_SetMenuBar",            2, FALSE ),
	WXFRAME_SETSTATUSBAR		= wx_define( core, "wxFrame_SetStatusBar",          2, FALSE ),
	WXFRAME_SETSTATUSBARPANE	= wx_define( core, "wxFrame_SetStatusBarPane",      2, FALSE ),
	WXFRAME_SETSTATUSTEXT		= wx_define( core, "wxFrame_SetStatusText",         3, FALSE ),
	WXFRAME_SETSTATUSWIDTHS		= wx_define( core, "wxFrame_SetStatusWidths",       2, FALSE ),
	WXFRAME_SETTOOLBAR			= wx_define( core, "wxFrame_SetToolBar",            2, FALSE ),
	WXFRAME_MSWGETTASKBARBUTTON	= wx_define( core, "wxFrame_MSWGetTaskBarButton",   1, TRUE  ),
	WXFRAME_PUSHSTATUSTEXT		= wx_define( core, "wxFrame_PushStatusText",        3, FALSE ),
	WXFRAME_POPSTATUSTEXT		= wx_define( core, "wxFrame_PopStatusText",         2, FALSE ),
$

export constant
	WXICON_NEW					= wx_define( core, "wxIcon_new",                4, TRUE  ),
	WXICON_CREATEFROMHICON		= wx_define( core, "wxIcon_CreateFromHICON",    2, TRUE  ),
	WXICON_CREATEFROMICON		= wx_define( core, "wxIcon_CreateFromIcon",     1, TRUE  ),
	WXICON_CREATEFROMXPM		= wx_define( core, "wxIcon_CreateFromXPM",      1, TRUE  ),
	WXICON_CONVERTTODISABLED	= wx_define( core, "wxIcon_ConvertToDisabled",  2, TRUE  ),
	WXICON_COPYFROMBITMAP		= wx_define( core, "wxIcon_CopyFromBitmap",     2, FALSE ),
	WXICON_GETDEPTH				= wx_define( core, "wxIcon_GetDepth",           1, TRUE  ),
	WXICON_GETWIDTH				= wx_define( core, "wxIcon_GetWidth",           1, TRUE  ),
	WXICON_GETHEIGHT			= wx_define( core, "wxIcon_GetHeight",          1, TRUE  ),
	WXICON_ISOK					= wx_define( core, "wxIcon_IsOk",               1, TRUE  ),
	WXICON_LOADFILE				= wx_define( core, "wxIcon_LoadFile",           5, TRUE  ),
	WXICON_SETDEPTH				= wx_define( core, "wxIcon_SetDepth",           2, FALSE ),
	WXICON_SETHEIGHT			= wx_define( core, "wxIcon_SetHeight",          2, FALSE ),
	WXICON_SETWIDTH				= wx_define( core, "wxIcon_SetWidth",           2, FALSE ),
$

export constant
	WXMENUBAR_NEW				= wx_define( core, "wxMenuBar_new",                 1, TRUE  ),
	WXMENUBAR_APPEND			= wx_define( core, "wxMenuBar_Append",              3, TRUE  ),
	WXMENUBAR_ATTACH			= wx_define( core, "wxMenuBar_Attach",              2, FALSE ),
	WXMENUBAR_CHECK				= wx_define( core, "wxMenuBar_Check",               3, FALSE ),
	WXMENUBAR_DETACH			= wx_define( core, "wxMenuBar_Detach",              1, FALSE ),
	WXMENUBAR_ENABLE			= wx_define( core, "wxMenuBar_Enable",              3, FALSE ),
	WXMENUBAR_ENABLETOP			= wx_define( core, "wxMenuBar_EnableTop",           3, FALSE ),
	WXMENUBAR_FINDITEM			= wx_define( core, "wxMenuBar_FindItem",            2, TRUE  ),
	WXMENUBAR_FINDMENU			= wx_define( core, "wxMenuBar_FindMenu",            2, TRUE  ),
	WXMENUBAR_FINDMENUITEM		= wx_define( core, "wxMenuBar_FindMenuItem",        3, TRUE  ),
	WXMENUBAR_GETFRAME			= wx_define( core, "wxMenuBar_GetFrame",            1, TRUE  ),
	WXMENUBAR_GETHELPSTRING		= wx_define( core, "wxMenuBar_GetHelpString",       2, TRUE  ),
	WXMENUBAR_GETLABEL			= wx_define( core, "wxMenuBar_GetLabel",            2, TRUE  ),
	WXMENUBAR_GETMENU			= wx_define( core, "wxMenuBar_GetMenu",             2, TRUE  ),
	WXMENUBAR_GETMENUCOUNT		= wx_define( core, "wxMenuBar_GetMenuCount",        1, TRUE  ),
	WXMENUBAR_GETMENULABEL		= wx_define( core, "wxMenuBar_GetMenuLabel",        2, TRUE  ),
	WXMENUBAR_GETMENULABELTEXT	= wx_define( core, "wxMenuBar_GetMenuLabelText",    2, TRUE  ),
	WXMENUBAR_INSERT			= wx_define( core, "wxMenuBar_Insert",              4, TRUE  ),
	WXMENUBAR_ISATTACHED		= wx_define( core, "wxMenuBar_IsAttached",          1, TRUE  ),
	WXMENUBAR_ISCHECKED			= wx_define( core, "wxMenuBar_IsChecked",           2, TRUE  ),
	WXMENUBAR_ISENABLED			= wx_define( core, "wxMenuBar_IsEnabled",           2, TRUE  ),
	WXMENUBAR_ISENABLEDTOP		= wx_define( core, "wxMenuBar_IsEnabledTop",        2, TRUE  ),
	WXMENUBAR_REFRESH			= wx_define( core, "wxMenuBar_Refresh",             3, FALSE ),
	WXMENUBAR_REMOVE			= wx_define( core, "wxMenuBar_Remove",              2, TRUE  ),
	WXMENUBAR_REPLACE			= wx_define( core, "wxMenuBar_Replace",             4, TRUE  ),
	WXMENUBAR_SETHELPSTRING		= wx_define( core, "wxMenuBar_SetHelpString",       3, FALSE ),
	WXMENUBAR_SETLABEL			= wx_define( core, "wxMenuBar_SetLabel",            3, FALSE ),
	WXMENUBAR_SETMENULABEL		= wx_define( core, "wxMenuBar_SetMenuLabel",        3, FALSE ),
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

