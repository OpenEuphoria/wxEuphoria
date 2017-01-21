
include "wx/wx.e"

enum ID_Button = 1

var myFrame = wxFrame:new( NULL, wxID_ANY, "wxEuphoria", {-1,-1}, {720,480}, wxDEFAULT_FRAME_STYLE, "frame" )
var myPanel = wxPanel:new( myFrame, wxID_ANY, {-1,-1}, {-1,-1}, wxTAB_TRAVERSAL, "panel" )
var myButton = wxButton:new( myPanel, ID_Button, "Click me", {10,10}, {75,23}, 0, NULL, "button" )

procedure myButton_OnClick( atom handler, atom event_type, atom window_id, atom event_object )
	
	wxMessageBox( "Hello, world!", "Message Box", wxYES_NO+wxCANCEL+wxICON_EXCLAMATION )
	
end procedure
wxButton:Connect( myButton, ID_Button, wxEVT_BUTTON, "myButton_OnClick" )

wxMain( myFrame )
