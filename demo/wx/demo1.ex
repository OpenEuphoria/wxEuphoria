
include "wx/wx.e"
include "tbar_xpm.e"

enum ID_Button = 1

wxFrame myFrame = wxFrame:new( NULL, wxID_ANY, "wxEuphoria Demo", wxDefaultPosition, wxSIZE(640,480) )

wxMenu fileMenu = wxMenu:new()
AppendItem( fileMenu, wxID_NEW, "&New\tCtrl+N" )
AppendItem( fileMenu, wxID_OPEN, "&Open...\tCtrl+O" )
AppendItem( fileMenu, wxID_SAVE, "Save\tCtrl+S" )
AppendItem( fileMenu, wxID_SAVEAS, "Save &As..." )
AppendItem( fileMenu, wxID_CLOSE, "C&lose\tCtrl+W" )
AppendSeparator( fileMenu )
AppendItem( fileMenu, wxID_EXIT, "E&xit\tCtrl+Q" )

wxMenu editMenu = wxMenu:new()
AppendItem( editMenu, wxID_UNDO, "&Undo\tCtrl+Z" )
AppendItem( editMenu, wxID_REDO, "&Redo\tCtrl+Y" )
AppendSeparator( editMenu )
AppendItem( editMenu, wxID_CUT, "Cu&t\tCtrl+X" )
AppendItem( editMenu, wxID_COPY, "&Copy\tCtrl+C" )
AppendItem( editMenu, wxID_PASTE, "&Paste\tCtrl+V" )
AppendItem( editMenu, wxID_CLEAR, "&Delete\tDel" )
AppendSeparator( editMenu )
AppendItem( editMenu, wxID_SELECTALL, "Select &All\tCtrl+A" )

wxMenuBar myMenuBar = wxMenuBar:new()
wxMenuBar:Append( myMenuBar, fileMenu, "&File" )
wxMenuBar:Append( myMenuBar, editMenu, "&Edit" )
wxFrame:SetMenuBar( myFrame, myMenuBar )

--wxPanel myPanel = wxPanel:new( myFrame )
--wxButton myButton = wxButton:new( myPanel, ID_Button, "Click me", {10,10}, {75,23}, 0, NULL, "myButton" )

wxTextCtrl myTextCtrl = wxTextCtrl:new( myFrame, wxID_ANY, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE+wxNO_BORDER )

wxFont CourierNew_10pt = wxFont:new( 10,,,,, "Courier New" )
SetFont( myTextCtrl, CourierNew_10pt )

wxStatusBar myStatusBar = wxFrame:CreateStatusBar( myFrame, 4 )
wxFrame:SetStatusWidths( myFrame, {64,48,32,-1} )
wxFrame:PushStatusText( myFrame, "Ready...", 0 )
wxFrame:PushStatusText( myFrame, "Set...",   1 )
wxFrame:PushStatusText( myFrame, "Go!",      2 )

wxIcon icon = wxIcon:CreateFromXPM( home_xpm )
wxFrame:SetIcon( myFrame, icon )

procedure fileMenu_OnClick( wxEvent event ) -- should be wxMenuEvent

	atom id = wxEvent:GetId( event )

	switch id do

		case wxID_NEW then
			sequence size = wxFrame:GetClientSize( myFrame )
			wxMessageBox( sprintf("width = %d, height = %d", size),
				"GetClientSize", wxOK+wxICON_INFORMATION )

		case wxID_EXIT then
			wxFrame:Close( myFrame )

	end switch

end procedure
wxMenu:Connect( fileMenu, wxID_ANY, wxEVT_MENU, "fileMenu_OnClick" )

--procedure myButton_OnClick( wxEvent event ) -- should be wxCommandEvent
--
--	wxMessageBox( "Hello, world!\n\nYou can only click that button once.",
--		"Message Box", wxYES_NO+wxCANCEL+wxICON_EXCLAMATION )
--
--	wxButton:Disconnect( myButton, ID_Button, wxEVT_BUTTON )
--
--end procedure
--wxButton:Connect( myButton, ID_Button, wxEVT_BUTTON, "myButton_OnClick" )

wxFrame:Center( myFrame )

wxMain( myFrame )
