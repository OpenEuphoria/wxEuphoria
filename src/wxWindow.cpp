
#include <wx/window.h>
#include "wxEuphoria.h"

extern "C" {

/* Window status functions */

object WXEUAPI wxWindow_Show( object self, object show )
{
	return BOX_INT( ((wxWindow*)self)->Show( show ) );
}

};