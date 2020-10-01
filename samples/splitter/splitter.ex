
include "wx/wx.e"
include "wx/splitter.e"
include "wx/scrolwin.e"

include "std/math.e"
include "std/convert.e"

-- ID for the menu commands
enum
	SPLIT_QUIT = 1,
	SPLIT_HORIZONTAL,
	SPLIT_VERTICAL,
	SPLIT_UNSPLIT,
	SPLIT_LIVE,
	SPLIT_BORDER,
	SPLIT_3DSASH,
	SPLIT_NOTHEME,
	SPLIT_CUSTOM_COLOUR,
	SPLIT_SETPOSITION,
	SPLIT_SETMINSIZE,
	SPLIT_SETGRAVITY,
	SPLIT_REPLACE,
	SPLIT_INVISIBLE

wxWindow m_replacewindow = NULL

wxFrame m_frame = wxFrame:new( NULL, wxID_ANY, "wxSplitterWindow sample",
				wxDefaultPosition, wxSIZE(420,300),
				or_bits(wxDEFAULT_FRAME_STYLE, wxNO_FULL_REPAINT_ON_RESIZE) )

--wxFrame:SetIcon( m_frame, wxICON(sample) )
wxFrame:CreateStatusBar( m_frame, 2 )

wxMenu splitMenu = wxMenu:new()

wxMenu:AppendItem( splitMenu, SPLIT_VERTICAL,
				"Split &Vertically\tCtrl-V",
				"Split vertically" )

wxMenu:AppendItem( splitMenu, SPLIT_HORIZONTAL,
				"Split &Horizontally\tCtrl-H",
				"Split horizontally" )

wxMenu:AppendItem( splitMenu, SPLIT_UNSPLIT,
				"&Unsplit\tCtrl-U",
				"Unsplit" )

wxMenu:AppendCheckItem( splitMenu, SPLIT_INVISIBLE,
				"Toggle sash &invisibility\tCtrl-I",
				"Toggle sash invisibility" )
wxMenu:AppendSeparator( splitMenu )

wxMenu:AppendCheckItem( splitMenu, SPLIT_LIVE,
				"&Live update\tCtrl-L",
				"Toggle live update mode" )

wxMenu:AppendCheckItem( splitMenu, SPLIT_BORDER,
				"3D &Border",
				"Toggle wxSP_BORDER flag" )
wxMenu:Check( splitMenu, SPLIT_BORDER, TRUE )

wxMenu:AppendCheckItem( splitMenu, SPLIT_3DSASH,
				"&3D Sash",
				"Toggle wxSP_3DSASH flag" )
wxMenu:Check( splitMenu, SPLIT_3DSASH, TRUE )

ifdef WINDOWS then
wxMenu:AppendCheckItem( splitMenu, SPLIT_NOTHEME,
				"Disable XP &theme",
				"Toggle wxSP_NO_XP_THEME flag" )
end ifdef

wxMenu:AppendCheckItem( splitMenu, SPLIT_CUSTOM_COLOUR,
				"Use custom &colour",
				"Toggle custom colour" )

wxMenu:AppendItem( splitMenu, SPLIT_SETPOSITION,
				"Set splitter &position\tCtrl-P",
				"Set the splitter position" )

wxMenu:AppendItem( splitMenu, SPLIT_SETMINSIZE,
				"Set &min size\tCtrl-M",
				"Set minimum pane size" )

wxMenu:AppendItem( splitMenu, SPLIT_SETGRAVITY,
				"Set &gravity\tCtrl-G",
				"Set gravity of sash" )

wxMenu:AppendSeparator( splitMenu )

wxMenu:AppendItem( splitMenu, SPLIT_REPLACE,
				"&Replace right window",
				"Replace right window" )

wxMenu:AppendSeparator( splitMenu )

wxMenu:AppendItem( splitMenu, SPLIT_QUIT,
				"E&xit\tAlt-X",
				"Exit" )

wxMenuBar menuBar = wxMenuBar:new()
wxMenuBar:Append( menuBar, splitMenu, "&Splitter" )
wxFrame:SetMenuBar( m_frame, menuBar )

wxMenu:Check( splitMenu, SPLIT_LIVE, TRUE )
wxSplitterWindow m_splitter = wxSplitterWindow:new( m_frame )

-- If you use non-zero gravity you must initialize the splitter with its
-- correct initial size, otherwise it will change the sash position by a
-- huge amount when it's resized from its initial default size to its real
-- size when the frame lays it out. This wouldn't be necessary if default
-- zero gravity were used (although it would do no harm neither).
wxSplitterWindow:SetSize( m_splitter, wxFrame:GetClientSize(m_frame) )
wxSplitterWindow:SetSashGravity( m_splitter, 1.0 )

wxScrolledWindow m_left = wxScrolledWindow:new( m_splitter )
wxScrolledWindow:SetBackgroundColour( m_left, wxRED )
wxScrolledWindow:SetCursor( m_left, wxCursor:new(wxCURSOR_MAGNIFIER) )

wxScrolledWindow m_right = wxScrolledWindow:new( m_splitter )
wxScrolledWindow:SetBackgroundColour( m_right, wxBLUE )

wxSplitterWindow:SplitVertically( m_splitter, m_left, m_right, 100 )
wxFrame:SetStatusText( m_frame, "Min pane size = 0", 1 )

procedure MyFrame_OnQuit( atom event )
	
	wxFrame:Close( m_frame, FALSE )
	
end procedure
--wxFrame:Bind( m_frame, SPLIT_QUIT, wxEVT_MENU, "MyFrame_OnQuit" )
--wxFrame:Bind( menuBar, SPLIT_QUIT, wxEVT_MENU, "MyFrame_OnQuit" )
--wxFrame:Bind( splitMenu, SPLIT_QUIT, wxEVT_MENU, "MyFrame_OnQuit" )
wxFrame:Connect( m_frame, SPLIT_QUIT, wxEVT_MENU, "MyFrame_OnQuit" )

procedure MyFrame_OnSplitHorizontal( atom event )
	
	if wxSplitterWindow:IsSplit( m_splitter ) then
		wxSplitterWindow:Unsplit( m_splitter )
	end if
	
	wxScrolledWindow:Show( m_left, TRUE )
	wxScrolledWindow:Show( m_right, TRUE )
	
	wxSplitterWindow:SplitHorizontally( m_splitter, m_left, m_right )
	wxFrame:SetStatusText( m_frame, "Splitter split horizontally", 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_HORIZONTAL, wxEVT_MENU, "MyFrame_OnSplitHorizontal" )

procedure MyFrame_OnSplitVertical( atom event )
	
	if wxSplitterWindow:IsSplit( m_splitter ) then
		wxSplitterWindow:Unsplit( m_splitter )
	end if
	
	wxScrolledWindow:Show( m_left, TRUE )
	wxScrolledWindow:Show( m_right, TRUE )
	
	wxSplitterWindow:SplitVertically( m_splitter, m_left, m_right )
	wxFrame:SetStatusText( m_frame, "Splitter split vertically", 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_VERTICAL, wxEVT_MENU, "MyFrame_OnSplitVertical" )

procedure MyFrame_OnUnsplit( atom event )
	
	if wxSplitterWindow:IsSplit( m_splitter ) then
		wxSplitterWindow:Unsplit( m_splitter )
	end if
	
	wxFrame:SetStatusText( m_frame, "No splitter", 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_UNSPLIT, wxEVT_MENU, "MyFrame_OnUnsplit" )

procedure MyFrame_ToggleFlag( integer flag, boolean enable )
	
	atom style = wxSplitterWindow:GetWindowStyleFlag( m_splitter )
	if enable then
		style = or_bits( style, flag )
	else
		style = and_bits( style, not_bits(flag) )
	end if
	
	wxSplitterWindow:SetWindowStyleFlag( m_splitter, style )
	
	-- we need to move the sash to redraw it
	integer pos = wxSplitterWindow:GetSashPosition( m_splitter )
	wxSplitterWindow:SetSashPosition( m_splitter, pos + 1 )
	wxSplitterWindow:SetSashPosition( m_splitter, pos )
	
end procedure

procedure MyFrame_OnSetPosition( atom event )
	
	sequence str = sprintf( "%d", wxSplitterWindow:GetSashPosition(m_splitter) )
	str = wxGetTextFromUser( "Enter splitter position:", "", str, m_frame )
	
	if length( str ) = 0 then
		return
	end if
	
	wxSplitterWindow:SetSashPosition( m_splitter, to_integer(str) )
	wxFrame:SetStatusText( m_frame, "Splitter position set to " & str, 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_SETPOSITION, wxEVT_MENU, "MyFrame_OnSetPosition" )

procedure MyFrame_OnSetMinSize( atom event )
	
	sequence str = sprintf( "%d", wxSplitterWindow:GetMinimumPaneSize(m_splitter) )
	str = wxGetTextFromUser( "Enter minimal size for panes:", "", str, m_frame )
	
	if length( str ) = 0 then
		return
	end if
	
	wxSplitterWindow:SetMinimumPaneSize( m_splitter, to_integer(str) )
	wxFrame:SetStatusText( m_frame, "Min pane size set to " & str, 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_SETMINSIZE, wxEVT_MENU, "MyFrame_OnSetMinSize" )

procedure MyFrame_OnSetGravity( atom event )
	
	sequence str = sprintf( "%g", wxSplitterWindow:GetSashGravity(m_splitter) )
	str = wxGetTextFromUser( "Enter sash gravity (0,1):", "", str, m_frame )
	
	if length( str ) = 0 then
		return
	end if
	
	wxSplitterWindow:SetSashGravity( m_splitter, to_number(str) )
	wxFrame:SetStatusText( m_frame, "Sash gravity set to " & str, 1 )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_SETGRAVITY, wxEVT_MENU, "MyFrame_OnSetGravity" )

procedure MyFrame_OnReplace( atom event )
	
	if m_replacewindow = NULL then
		
		m_replacewindow = wxSplitterWindow:GetWindow2( m_splitter )
		wxSplitterWindow:ReplaceWindow( m_splitter, m_replacewindow, wxPanel:new(m_splitter, wxID_ANY) )
		wxWindow:Hide( m_replacewindow )
		
	else
		
		wxWindow empty = wxSplitterWindow:GetWindow2( m_splitter )
		wxSplitterWindow:ReplaceWindow( m_splitter, empty, m_replacewindow )
		wxWindow:Show( m_replacewindow )
		wxWindow:Destroy( empty )
		m_replacewindow = NULL
		
	end if
	
end procedure
wxFrame:Connect( m_frame, SPLIT_REPLACE, wxEVT_MENU, "MyFrame_OnReplace" )

procedure MyFrame_OnToggleInvisible( atom event )
	
	boolean visible = wxSplitterWindow:IsSashInvisible( m_splitter )
	wxSplitterWindow:SetSashInvisible( m_splitter, not visible )
	--wxSplitterWindow:SizeWindows( m_splitter )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_INVISIBLE, wxEVT_MENU, "MyFrame_OnToggleInvisible" )

-- Update UI handlers

procedure MyFrame_OnUpdateUIHorizontal( wxUpdateUIEvent event )
	
	puts( 1, "MyFrame_OnUpdateUIHorizontal\n" )
	
	integer enable = (not wxSplitterWindow:IsSplit(m_splitter)) or (wxSplitterWindow:GetSplitMode(m_splitter) != wxSPLIT_HORIZONTAL)
	
	wxUpdateUIEvent:Enable( event, enable )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_HORIZONTAL, wxEVT_UPDATE_UI, "MyFrame_OnUpdateUIHorizontal" )

procedure MyFrame_OnUpdateUIVertical( wxUpdateUIEvent event )
	
	puts( 1, "MyFrame_OnUpdateUIVertical\n" )
	
	integer enable = (not wxSplitterWindow:IsSplit(m_splitter)) or (wxSplitterWindow:GetSplitMode(m_splitter) != wxSPLIT_VERTICAL)
	
	wxUpdateUIEvent:Enable( event, enable )
	
end procedure
wxFrame:Connect( m_frame, SPLIT_VERTICAL, wxEVT_UPDATE_UI, "MyFrame_OnUpdateUIVertical" )

printf( 1, "m_frame   = %016x\n", m_frame )
printf( 1, "menuBar   = %016x\n", menuBar )
printf( 1, "splitMenu = %016x\n", splitMenu )

wxMain( m_frame )
