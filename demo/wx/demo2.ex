
include "wx/wx.e"

wxApp app = wxApp:new()

wxFrame frame = wxClassInfo:CreateObject( "wxFrame" )
wxFrame:Create( frame, NULL, wxID_ANY, "wxEuphoria", wxDefaultPoint, wxDefaultSize, wxDEFAULT_FRAME_STYLE, "frame" )

wxPanel panel = wxClassInfo:CreateObject( "wxPanel" )
wxPanel:Create( panel, frame, wxID_ANY, {-1,-1}, {-1,-1}, wxTAB_TRAVERSAL, "panel" )

wxButton button = wxClassInfo:CreateObject( "wxButton" )
wxButton:Create( button, panel, wxID_ANY, "Click me", {10,10}, {75,23}, 0, NULL, "button" )

procedure button_OnClick( atom handler, atom event_type, atom window_id, atom event_object )
	wxMessageBox( "Hello, world!", "Message Box", wxYES_NO+wxCANCEL+wxICON_EXCLAMATION )
end procedure
wxButton:Connect( button, wxID_ANY, wxEVT_BUTTON, "button_OnClick" )

wxApp:SetTopWindow( app, frame )
wxFrame:Show( frame )

wxMain( frame )
