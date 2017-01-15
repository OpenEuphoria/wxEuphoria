
#include <wx/app.h>
#include <wx/frame.h>
#include <wx/msgdlg.h>
#include <wx/vidmode.h>
#include "wxEuphoria.h"

/* class for wxEuphoria GUI application */
class EuApp : public wxApp, public EuAppBase
{
public:
	EuApp( EuCallFunc func, EuCallProc proc, object rtfatal )
		: EuAppBase( func, proc, rtfatal ) {}
	
	bool OnInit() {
		return true;
	}
	
	int OnExit() {
		wxUninitialize();
		return 0;
	}
};

extern "C" {

object WXEUAPI_CORE wxApp_new( object func, object proc, object rtfatal )
{
	EuApp* app = new EuApp( (EuCallFunc)func, (EuCallProc)proc, rtfatal );
	
	wxInitialize();
	wxApp::SetInstance( app );
	
	return BOX_INT( app );
}

// TODO - implement wxVideoMode
//object WXEUAPI_CORE wxApp_GetDisplayMode( object self )
//{
//	wxVideoMode mode = ((wxApp*)self)->GetDisplayMode();
//	
//	s1_ptr s = NewS1( 4 );
//	s->base[1] = BOX_INT( mode.w );
//	s->base[2] = BOX_INT( mode.h );
//	s->base[3] = BOX_INT( mode.bpp );
//	s->base[4] = BOX_INT( mode.refresh );
//	
//	return MAKE_SEQ( s );
//}

object WXEUAPI_CORE wxApp_GetExitOnFrameDelete( object self )
{
	return BOX_INT( ((wxApp*)self)->GetExitOnFrameDelete() );
}

object WXEUAPI_CORE wxApp_GetLayoutDirection( object self )
{
	return BOX_INT( ((wxApp*)self)->GetLayoutDirection() );
}

object WXEUAPI_CORE wxApp_GetUseBestVisual( object self )
{
	return BOX_INT( ((wxApp*)self)->GetUseBestVisual() );
}

object WXEUAPI_CORE wxApp_GetTopWindow( object self )
{
	return BOX_INT( ((wxApp*)self)->GetTopWindow() );
}

object WXEUAPI_CORE wxApp_IsActive( object self )
{
	return BOX_INT( ((wxApp*)self)->IsActive() );
}

object WXEUAPI_CORE wxApp_SafeYield( object self, object window, object onlyIfNeeded )
{
	return BOX_INT( ((wxApp*)self)->SafeYield( (wxWindow*)window, (bool)onlyIfNeeded ) );
}

object WXEUAPI_CORE wxApp_SafeYieldFor( object self, object window, object eventsToProcess )
{
	return BOX_INT( ((wxApp*)self)->SafeYieldFor( (wxWindow*)window, (long)eventsToProcess ) );
}

// TODO - implement wxVideoMode
//object WXEUAPI_CORE wxApp_SetDisplayMode( object self, object mode )
//{
//	int width   = get_int( mode, 1 );
//	int height  = get_int( mode, 2 );
//	int bpp     = get_int( mode, 3 );
//	int refresh = get_int( mode, 4 );
//	
//	wxVideoMode m(width, height, bpp, refresh);
//	
//	wxDeRefDS( mode );
//	return BOX_INT( ((wxApp*)self)->SetDisplayMode(m) );
//}

void WXEUAPI_CORE wxApp_SetExitOnFrameDelete( object self, object flag )
{
	((wxApp*)self)->SetExitOnFrameDelete( (bool)flag );
}

void WXEUAPI_CORE wxApp_SetTopWindow( object self, object window )
{
	((wxApp*)self)->SetTopWindow( (wxWindow*)window );
}

object WXEUAPI_CORE wxApp_wxMessageBox( object message, object caption, object style, object parent, object x, object y )
{
	int result = wxMessageBox( get_string(message), get_string(caption), get_int(style), (wxWindow*)parent, get_int(x), get_int(y) );
	return BOX_INT( result );
}

};