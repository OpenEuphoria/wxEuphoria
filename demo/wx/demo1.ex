
include "wx/wx.e"

enum ID_Button = 1

wxFrame myFrame = wxFrame:new( NULL, wxID_ANY, "wxEuphoria", {-1,-1}, {720,480}, wxDEFAULT_FRAME_STYLE, "frame" )
wxPanel myPanel = wxPanel:new( myFrame, wxID_ANY, {-1,-1}, {-1,-1}, wxTAB_TRAVERSAL, "panel" )
wxButton myButton = wxButton:new( myPanel, ID_Button, "Click me", {10,10}, {75,23}, 0, NULL, "button" )

procedure myButton_OnClick( wxEvent event ) -- should be wxCommandEvent
	
	wxMessageBox( "Hello, world!\n\nYou can only click that button once.",
		"Message Box", wxYES_NO+wxCANCEL+wxICON_EXCLAMATION )
	
	wxButton:Disconnect( myButton, ID_Button, wxEVT_BUTTON )
	
end procedure
wxButton:Connect( myButton, ID_Button, wxEVT_BUTTON, "myButton_OnClick" )

wxMain( myFrame )
