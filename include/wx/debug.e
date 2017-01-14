
include "std/error.e"
include "std/io.e"

ifdef DEBUG then
include "euphoria/debug/debug.e"
end ifdef

public procedure wxAbort( atom exit_code = 0 )
	abort( exit_code )
end procedure

public procedure wxAssert( atom cond, sequence msg, object data = {} )
	if not cond then wxCrash( msg, data ) end if
end procedure

public procedure wxCrash( sequence msg, object data = {} )
	error:crash( msg, data )
end procedure

public procedure wxDebugf( sequence msg, object data = {} )
	ifdef DEBUG then printf( STDERR, msg, data ) end ifdef
end procedure

