
include "wx/dll.e"

atom base = wx_library( "base" )

export constant
	WXAPPCONSOLE_NEW								= wx_define( base, "wxAppConsole_new",                              3, TRUE  ),
	WXAPPCONSOLE_YIELD								= wx_define( base, "wxAppConsole_Yield",                            1, TRUE  ),
	WXAPPCONSOLE_SETCLOCALE							= wx_define( base, "wxAppConsole_SetCLocale",                       1, FALSE ),
	WXAPPCONSOLE_MAINLOOP							= wx_define( base, "wxAppConsole_MainLoop",                         1, TRUE  ),
	WXAPPCONSOLE_EXITMAINLOOP						= wx_define( base, "wxAppConsole_ExitMainLoop",                     1, FALSE ),
	WXAPPCONSOLE_GETMAINLOOP						= wx_define( base, "wxAppConsole_GetMainLoop",                      1, TRUE  ),
	WXAPPCONSOLE_USESEVENTLOOP						= wx_define( base, "wxAppConsole_UsesEventLoop",                    1, TRUE  ),
	WXAPPCONSOLE_PROCESSPENDINGEVENTS				= wx_define( base, "wxAppConsole_ProcessPendingEvents",             1, FALSE ),
	WXAPPCONSOLE_DELETEPENDINGEVENTS				= wx_define( base, "wxAppConsole_DeletePendingEvents",              1, FALSE ),
	WXAPPCONSOLE_HASPENDINGEVENTS					= wx_define( base, "wxAppConsole_HasPendingEvents",                 1, TRUE  ),
	WXAPPCONSOLE_SUSPENDPROCESSINGOFPENDINGEVENTS	= wx_define( base, "wxAppConsole_SuspendProcessingOfPendingEvents", 1, FALSE ),
	WXAPPCONSOLE_RESUMEPROCESSINGOFPENDINGEVENTS	= wx_define( base, "wxAppConsole_ResumeProcessingOfPendingEvents",  1, FALSE ),
	WXAPPCONSOLE_SCHEDULEFORDESTRUCTION				= wx_define( base, "wxAppConsole_ScheduleForDestruction",           2, FALSE ),
	WXAPPCONSOLE_ISSCHEDULEDFORDESTRUCTION			= wx_define( base, "wxAppConsole_IsScheduledForDestruction",        2, TRUE  ),
	WXAPPCONSOLE_GETAPPDISPLAYNAME					= wx_define( base, "wxAppConsole_GetAppDisplayName",                1, TRUE  ),
	WXAPPCONSOLE_GETAPPNAME							= wx_define( base, "wxAppConsole_GetAppName",                       1, TRUE  ),
	WXAPPCONSOLE_GETCLASSNAME						= wx_define( base, "wxAppConsole_GetClassName",                     1, TRUE  ),
	WXAPPCONSOLE_GETVENDORDISPLAYNAME				= wx_define( base, "wxAppConsole_GetVendorDisplayName",             1, TRUE  ),
	WXAPPCONSOLE_GETVENDORNAME						= wx_define( base, "wxAppConsole_GetVendorName",                    1, TRUE  ),
	WXAPPCONSOLE_SETAPPDISPLAYNAME					= wx_define( base, "wxAppConsole_SetAppDisplayName",                2, FALSE ),
	WXAPPCONSOLE_SETAPPNAME							= wx_define( base, "wxAppConsole_SetAppName",                       2, FALSE ),
	WXAPPCONSOLE_SETCLASSNAME						= wx_define( base, "wxAppConsole_SetClassName",                     2, FALSE ),
	WXAPPCONSOLE_SETVENDORDISPLAYNAME				= wx_define( base, "wxAppConsole_SetVendorDisplayName",             2, FALSE ),
	WXAPPCONSOLE_SETVENDORNAME						= wx_define( base, "wxAppConsole_SetVendorName",                    2, FALSE ),
	WXAPPCONSOLE_SETINSTANCE						= wx_define( base, "wxAppConsole_SetInstance",                      1, FALSE ),
	WXAPPCONSOLE_GETINSTANCE						= wx_define( base, "wxAppConsole_GetInstance",                      0, TRUE  ),
	WXAPPCONSOLE_ISMAINLOOPRUNNING					= wx_define( base, "wxAppConsole_IsMainLoopRunning",                0, TRUE  ),
$

export constant
	WXCLASSINFO_NEW					= wx_define( base, "wxClassInfo_new",               1, TRUE  ),
	WXCLASSINFO_CREATEOBJECT		= wx_define( base, "wxClassInfo_CreateObject",      1, TRUE  ),
	WXCLASSINFO_GETBASECLASSNAME1	= wx_define( base, "wxClassInfo_GetBaseClassName1", 1, TRUE  ),
	WXCLASSINFO_GETBASECLASSNAME2	= wx_define( base, "wxClassInfo_GetBaseClassName2", 1, TRUE  ),
	WXCLASSINFO_GETCLASSNAME		= wx_define( base, "wxClassInfo_GetClassName",      1, TRUE  ),
	WXCLASSINFO_FINDCLASS			= wx_define( base, "wxClassInfo_FindClass",         1, TRUE  ),
$

export constant
	WXEVENT_CLONE				= wx_define( base, "wxEvent_Clone",             1, TRUE  ),
	WXEVENT_GETEVENTOBJECT		= wx_define( base, "wxEvent_GetEventObject",    1, TRUE  ),
	WXEVENT_GETEVENTTYPE		= wx_define( base, "wxEvent_GetEventType",      1, TRUE  ),
	WXEVENT_GETEVENTCATEGORY	= wx_define( base, "wxEvent_GetEventCategory",  1, TRUE  ),
	WXEVENT_GETID				= wx_define( base, "wxEvent_GetId",             1, TRUE  ),
	WXEVENT_GETEVENTUSERDATA	= wx_define( base, "wxEvent_GetEventUserData",  1, TRUE  ),
	WXEVENT_GETSKIPPED			= wx_define( base, "wxEvent_GetSkipped",        1, TRUE  ),
	WXEVENT_GETTIMESTAMP		= wx_define( base, "wxEvent_GetTimestamp",      1, TRUE  ),
	WXEVENT_ISCOMMANDEVENT		= wx_define( base, "wxEvent_IsCommandEvent",    1, TRUE  ),
	WXEVENT_RESUMEPROPAGATION	= wx_define( base, "wxEvent_ResumePropagation", 2, FALSE ),
	WXEVENT_SETEVENTOBJECT		= wx_define( base, "wxEvent_SetEventObject",    2, FALSE ),
	WXEVENT_SETEVENTTYPE		= wx_define( base, "wxEvent_SetEventType",      2, FALSE ),
	WXEVENT_SETID				= wx_define( base, "wxEvent_SetId",             2, FALSE ),
	WXEVENT_SETTIMESTAMP		= wx_define( base, "wxEvent_SetTimestamp",      2, FALSE ),
	WXEVENT_SHOULDPROPAGATE		= wx_define( base, "wxEvent_ShouldPropagate",   1, TRUE  ),
	WXEVENT_SKIP				= wx_define( base, "wxEvent_Skip",              2, FALSE ),
	WXEVENT_STOPPROPAGATION		= wx_define( base, "wxEvent_StopPropagation",   1, TRUE  ),
$

export constant
	WXEVTHANDLER_QUEUEEVENT				= wx_define( base, "wxEvtHandler_QueueEvent",           2, FALSE ),
	WXEVTHANDLER_ADDPENDINGEVENT		= wx_define( base, "wxEvtHandler_AddPendingEvent",      2, FALSE ),
	WXEVTHANDLER_PROCESSPENDINGEVENTS	= wx_define( base, "wxEvtHandler_ProcessPendingEvents", 1, FALSE ),
	WXEVTHANDLER_DELETEPENDINGEVENTS	= wx_define( base, "wxEvtHandler_DeletePendingEvents",  1, FALSE ),
	WXEVTHANDLER_CONNECT				= wx_define( base, "wxEvtHandler_Connect",              4, FALSE ),
	WXEVTHANDLER_DISCONNECT				= wx_define( base, "wxEvtHandler_Disconnect",           3, TRUE  ),
	WXEVTHANDLER_GETOBJECT				= wx_define( base, "wxEvtHandler_GetObject",            0, TRUE  ),
$

export constant
	WXOBJECT_GETCLASSINFO	= wx_define( base, "wxObject_GetClassInfo", 1, TRUE  ),
	WXOBJECT_ISKINDOF		= wx_define( base, "wxObject_IsKindOf",     2, TRUE  ),
	WXOBJECT_ISSAMEAS		= wx_define( base, "wxObject_IsSameAs",     2, TRUE  ),
$

export constant
	WXVERSIONINFO_NEW				= wx_define( base, "wxVersionInfo_new",                 6, TRUE  ),
	WXVERSIONINFO_GETNAME			= wx_define( base, "wxVersionInfo_GetName",             1, TRUE  ),
	WXVERSIONINFO_GETMAJOR			= wx_define( base, "wxVersionInfo_GetMajor",            1, TRUE  ),
	WXVERSIONINFO_GETMINOR			= wx_define( base, "wxVersionInfo_GetMinor",            1, TRUE  ),
	WXVERSIONINFO_GETMICRO			= wx_define( base, "wxVersionInfo_GetMicro",            1, TRUE  ),
	WXVERSIONINFO_TOSTRING			= wx_define( base, "wxVersionInfo_ToString",            1, TRUE  ),
	WXVERSIONINFO_GETVERSIONSTRING	= wx_define( base, "wxVersionInfo_GetVersionString",    1, TRUE  ),
	WXVERSIONINFO_HASDESCRIPTION	= wx_define( base, "wxVersionInfo_HasDescription",      1, TRUE  ),
	WXVERSIONINFO_GETDESCRIPTION	= wx_define( base, "wxVersionInfo_GetDescription",      1, TRUE  ),
	WXVERSIONINFO_HASCOPYRIGHT		= wx_define( base, "wxVersionInfo_HasCopyright",        1, TRUE  ),
	WXVERSIONINFO_GETCOPYRIGHT		= wx_define( base, "wxVersionInfo_GetCopyright",        1, TRUE  ),
$
