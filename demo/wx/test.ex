
include "wx/app.e"
include "wx/apptrait.e"
include "wx/stdpaths.e"
include "wx/string.e"

procedure main()
	
	
	wxAppConsole app = wxAppConsole:new()
	printf( 1, "app = #%08x\n", app )
	
	
	wxAppTraits traits = wxAppConsole:GetTraits( app )
	printf( 1, "traits = #%08x\n", traits )
	
	sequence version = wxAppTraits:GetToolkitVersion( traits )
	printf( 1, "version = {%d,%d,%d}\n", version )
	
	sequence desktopEnv = wxAppTraits:GetDesktopEnvironment( traits )
	printf( 1, "desktopEnv = '%s'\n", {desktopEnv} )
	
	
--	wxStandardPaths paths1 = wxAppTraits:GetStandardPaths( traits )
--	printf( 1, "paths = #%08x\n", paths1 )
	
--	wxString configDir1 = wxStandardPaths:GetConfigDir( paths1 )
--	printf( 1, "configDir = '%s'\n", {configDir1} )
	
--	wxStandardPaths paths2 = wxStandardPaths:Get()
--	printf( 1, "paths = #%08x\n", paths2 )
	
--	wxString configDir2 = wxStandardPaths:GetConfigDir( paths2 )
--	printf( 1, "configDir = '%s'\n", {configDir2} )
	
	
end procedure

main()
