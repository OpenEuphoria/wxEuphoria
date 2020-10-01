
#include <wx/app.h>
#include <wx/frame.h>
#include <wx/taskbarbutton.h>
#include "wxEuphoria.h"

class EuApp : public wxApp, public EuAppBase
{
public:
	EuApp( EuCallFunc func, EuCallProc proc, object rtfatal );
	bool OnInit();
	int OnExit();
};

class EuFrame : public wxFrame
{
public:
	void OnCloseWindow( wxCommandEvent& event )
	{
		wxApp* app = (wxApp*)wxApp::GetInstance();
		wxWindow* topWindow = app->GetTopWindow();
		
		if( this == topWindow ) {
			app->ExitMainLoop();
		}
		else {
			this->Show( false );
		}
	}
};

extern "C" {

/* Public Member Functions */

object WXEUAPI_CORE wxFrame_new( object parent, object id, object title, object pos, object size, object style, object name )
{
	wxFrame* frame = new wxFrame( (wxWindow*)parent, get_int(id), get_string(title), get_point(pos), get_size(size), get_int(style), get_string(name) );
	frame->Connect( id, wxEVT_CLOSE_WINDOW, wxCommandEventHandler(EuFrame::OnCloseWindow) );
	
	wxDeRef( title );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( frame );
}

void WXEUAPI_CORE wxFrame_Centre( object self, object direction )
{
	((wxFrame*)self)->Centre( get_int(direction) );
}

void WXEUAPI_CORE wxFrame_Center( object self, object direction )
{
	((wxFrame*)self)->Center( get_int(direction) );
}

object WXEUAPI_CORE wxFrame_Create( object self, object parent, object id, object title, object pos, object size, object style, object name )
{
	bool result = ((wxFrame*)self)->Create( (wxWindow*)parent, get_int(id), get_string(title), get_point(pos), get_size(size), get_int(style), get_string(name) );
	if ( result ) ((wxFrame*)self)->Connect( id, wxEVT_CLOSE_WINDOW, wxCommandEventHandler(EuFrame::OnCloseWindow) );
	
	wxDeRef( title );
	wxDeRef( pos );
	wxDeRef( size );
	wxDeRef( name );
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxFrame_CreateStatusBar( object self, object number, object style, object id, object name )
{
	wxStatusBar* statusBar = ((wxFrame*)self)->CreateStatusBar( get_int(number), get_int(style), get_int(id), get_string(name) );
	
	wxDeRef( name );
	return BOX_INT( statusBar );
}

object WXEUAPI_CORE wxFrame_CreateToolBar( object self, object style, object id, object name )
{
	wxToolBar* toolBar = ((wxFrame*)self)->CreateToolBar( get_int(style), get_int(id), get_string(name) );
	
	wxDeRef( name );
	return BOX_INT( toolBar );
}

object WXEUAPI_CORE wxFrame_GetClientAreaOrigin( object self )
{
	wxPoint pt = ((wxFrame*)self)->GetClientAreaOrigin();
	
	return get_sequence( pt );
}

object WXEUAPI_CORE wxFrame_GetMenuBar( object self )
{
	wxMenuBar* menuBar = ((wxFrame*)self)->GetMenuBar();
	
	return BOX_INT( menuBar );
}

object WXEUAPI_CORE wxFrame_GetStatusBar( object self )
{
	wxStatusBar* statusBar = ((wxFrame*)self)->GetStatusBar();
	
	return BOX_INT( statusBar );
}

object WXEUAPI_CORE wxFrame_GetStatusBarPane( object self )
{
	int result = ((wxFrame*)self)->GetStatusBarPane();
	
	return BOX_INT( result );
}

object WXEUAPI_CORE wxFrame_GetToolBar( object self )
{
	wxToolBar* toolBar = ((wxFrame*)self)->GetToolBar();
	
	return BOX_INT( toolBar );
}

object WXEUAPI_CORE wxFrame_ProcessCommand( object self, object id )
{
	bool result = ((wxFrame*)self)->ProcessCommand( get_int(id) );
	
	return BOX_INT( result );
}

void WXEUAPI_CORE wxFrame_SetMenuBar( object self, object menuBar )
{
	((wxFrame*)self)->SetMenuBar( (wxMenuBar*)menuBar );
}

void WXEUAPI_CORE wxFrame_SetStatusBar( object self, object statusBar )
{
	((wxFrame*)self)->SetStatusBar( (wxStatusBar*)statusBar );
}

void WXEUAPI_CORE wxFrame_SetStatusBarPane( object self, object n )
{
	((wxFrame*)self)->SetStatusBarPane( get_int(n) );
}

void WXEUAPI_CORE wxFrame_SetStatusText( object self, object text, object number )
{
	wxDeRef( text );
	((wxFrame*)self)->SetStatusText( get_string(text), get_int(number) );
}

void WXEUAPI_CORE wxFrame_SetStatusWidths( object self, object widths )
{
	int n = LENGTH( widths );
	int w[n];
	
	for (size_t i = 0; i < n; i++) {
		w[i] = get_int( widths, i+1 );
	}
	
	((wxFrame*)self)->SetStatusWidths( n, w );
}

void WXEUAPI_CORE wxFrame_SetToolBar( object self, object toolBar )
{
	((wxFrame*)self)->SetToolBar( (wxToolBar*)toolBar );
}

object WXEUAPI_CORE wxFrame_MSWGetTaskBarButton( object self )
{
#ifdef WXEUMSW
	wxTaskBarButton* button = ((wxFrame*)self)->MSWGetTaskBarButton();
	
	return BOX_INT( button );
#else
	return BOX_INT( NULL );
#endif
}

void WXEUAPI_CORE wxFrame_PushStatusText( object self, object text, object number )
{
	wxDeRef( text );
	((wxFrame*)self)->PushStatusText( get_string(text), get_int(number) );
}

void WXEUAPI_CORE wxFrame_PopStatusText( object self, object number )
{
	((wxFrame*)self)->PopStatusText( get_int(number) );
}

};