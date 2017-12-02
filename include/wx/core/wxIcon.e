
namespace wxIcon

include "wx/dll.e"
include "wx/defs.e"
include "wx/core.e"
include "wx/icon.e"
include "wx/bitmap.e"
include "wx/gdicmn.e"
include "wx/string.e"

public include "wx/object.e"

constant wxIconInfo = wxClassInfo:FindClass( "wxIcon" )

public type wxIcon( object x )
	return wxObject:IsKindOf( x, wxIconInfo )
end type

public function new( object iconData, wxBitmapType iconType = wxBITMAP_TYPE_ANY, atom desiredWidth = -1, atom desiredHeight = -1 )
	return wx_func( WXICON_NEW, {iconData,iconType,desiredWidth,desiredHeight} )
end function

public function CreateFromHICON( atom icon )
	return wx_func( WXICON_CREATEFROMHICON, {icon} )
end function

public function CreateFromIcon( wxIcon orig )
	return wx_func( WXICON_CREATEFROMICON, {orig} )
end function

public function CreateFromXPM( sequence xpm )
	return wx_func( WXICON_CREATEFROMXPM, {xpm} )
end function

public function ConvertToDisabled( wxIcon self, atom brightness = 255 )
	return wx_func( WXICON_CONVERTTODISABLED, {self,brightness} )
end function

public procedure CopyFromBitmap( wxIcon self, wxBitmap bmp )
	wx_proc( WXICON_COPYFROMBITMAP, {self,bmp} )
end procedure

public function GetDepth( wxIcon self )
	return wx_func( WXICON_GETDEPTH, {self} )
end function

public function GetWidth( wxIcon self )
	return wx_func( WXICON_GETWIDTH, {self} )
end function

public function GetHeight( wxIcon self )
	return wx_func( WXICON_GETHEIGHT, {self} )
end function

public function IsOk( wxIcon self )
	return wx_func( WXICON_ISOK, {self} )
end function

public function LoadFile( wxIcon self, wxString name, wxBitmapType iconType = wxBITMAP_TYPE_ANY, atom desiredWidth = -1, atom desiredHeight = -1 )
	return wx_func( WXICON_LOADFILE, {self,name,iconType,desiredWidth,desiredHeight} )
end function

public procedure SetDepth( wxIcon self, atom depth )
	wx_proc( WXICON_SETDEPTH, {self,depth} )
end procedure

public procedure SetHeight( wxIcon self, atom height )
	wx_proc( WXICON_SETHEIGHT, {self,height} )
end procedure

public procedure SetWidth( wxIcon self, atom width )
	wx_proc( WXICON_SETWIDTH, {self,width} )
end procedure

