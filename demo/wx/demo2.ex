
include "wx/wx.e"

wxApp app = wxApp:new()

wxClassInfo frameInfo = wxClassInfo:new( "wxFrame" )
wxFrame frame = wxClassInfo:CreateObject( frameInfo )
wxString name = wxClassInfo:GetClassName( frameInfo )
wxFrame:Create( frame, NULL, wxID_ANY, "wxEuphoria (" & name & ")", {-1,-1}, {720,480}, wxDEFAULT_FRAME_STYLE, "frame" )

wxClassInfo panelInfo = wxClassInfo:new( "wxPanel" )
wxPanel panel = wxClassInfo:CreateObject( panelInfo )
wxPanel:Create( panel, frame, wxID_ANY, {-1,-1}, {-1,-1}, wxTAB_TRAVERSAL, "panel" )

wxApp:SetTopWindow( app, frame )
wxFrame:Show( frame )

wxMain( frame )
