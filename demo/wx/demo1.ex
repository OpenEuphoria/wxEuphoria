
include "wx/wx.e"
include "tbar_xpm.e"

enum ID_Button = 1

wxFrame myFrame = wxFrame:new( NULL, wxID_ANY, "wxEuphoria" )

wxMenuBar myMenuBar = wxMenuBar:new( 0 )
wxMenuBar:Attach( myMenuBar, myFrame )

wxPanel myPanel = wxPanel:new( myFrame )
wxButton myButton = wxButton:new( myPanel, ID_Button, "Click me", {10,10}, {75,23}, 0, NULL, "button" )

wxStatusBar myStatusBar = wxFrame:CreateStatusBar( myFrame, 4 )
wxFrame:SetStatusWidths( myFrame, {64,48,32,-1} )
wxFrame:PushStatusText( myFrame, "Ready...", 0 )
wxFrame:PushStatusText( myFrame, "Set...",   1 )
wxFrame:PushStatusText( myFrame, "Go!",      2 )

wxIcon icon = wxIcon:CreateFromXPM( home_xpm )
wxFrame:SetIcon( myFrame, icon )

procedure myButton_OnClick( wxEvent event ) -- should be wxCommandEvent
	
	wxMessageBox( "Hello, world!\n\nYou can only click that button once.",
		"Message Box", wxYES_NO+wxCANCEL+wxICON_EXCLAMATION )
	
	wxButton:Disconnect( myButton, ID_Button, wxEVT_BUTTON )
	
end procedure
wxButton:Connect( myButton, ID_Button, wxEVT_BUTTON, "myButton_OnClick" )

wxFrame:Center( myFrame )

wxMain( myFrame )
