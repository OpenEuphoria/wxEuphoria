
#include <wx/app.h>
#include <wx/frame.h>
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

};