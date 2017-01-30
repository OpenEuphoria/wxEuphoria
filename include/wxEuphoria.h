#ifndef WXEUPHORIA_H
#define WXEUPHORIA_H

#include <wx/event.h>
#include <wx/string.h>
#include <wx/clntdata.h>
#include <wx/timer.h>
#include <wx/wxcrtvararg.h>
#include "alldefs.h"

#include <map>
using namespace std;

#ifdef WXEUMSW
#define WXEUAPI __cdecl
#else
#define WXEUAPI
#endif

#define WXEUAPI_BASE WXEUAPI
#define WXEUAPI_CORE WXEUAPI
#define WXEUAPI_XML  WXEUAPI

#ifdef LENGTH
#undef LENGTH
#endif

/* forward delcarations */
static inline object box_int( intptr_t x );
static inline intptr_t get_int( object x );

#define BOX_INT(x) box_int( (intptr_t)x )
#define UNBOX_INT(x) unbox_int( (intptr_t)x )
#define LENGTH(s1) ((s1_ptr)SEQ_PTR(s1))->length
#define EMPTY_SEQUENCE MAKE_SEQ( NewS1(0) )
#define wxDeRefDS(a) {assert(DBL_PTR(a)->ref); --(DBL_PTR(a)->ref);}
#define wxDeRef(a) if(IS_DBL_OR_SEQUENCE(a)){ wxDeRefDS(a); }

/*
#ifdef WXEUMSW
extern int winInstance;
extern HANDLE default_heap;
#endif
*/

/* call back functions into Euphoria code */
typedef object WXEUAPI (*EuCallFunc)(intptr_t);
typedef   void WXEUAPI (*EuCallProc)(intptr_t);
typedef object WXEUAPI (*MallocFunc)(intptr_t);
typedef   void WXEUAPI (*FreeFunc)(intptr_t);

/* shared class for wxEuphoria application */
class EuAppBase : public wxEvtHandler
{
public:
	EuAppBase( EuCallFunc func, EuCallProc proc, intptr_t rtfatal );
	void Handler( wxEvent& event );
	static object GetTheObject();
	
	static object DoCallFunc( intptr_t id, object params );
	static void DoCallProc( intptr_t id, object params );
	static void DoRTFatal( wxString& msg );
	
	static EuAppBase* s_EuAppBase;
	static EuCallFunc s_CallFunc;
	static EuCallProc s_CallProc;
	static MallocFunc s_MallocFunc;
	static FreeFunc s_FreeFunc;
	static intptr_t s_RTFatal;
	static intptr_t s_TheObject;
};

/* use external function to allocate memory */
static inline void* Malloc( intptr_t size )
{
	assert( EuAppBase::s_MallocFunc );
	object ptr = EuAppBase::s_MallocFunc( size );
	return (void*)get_int( ptr );
}

/* use external function to free memory */
static inline void Free( intptr_t ptr )
{
	assert( EuAppBase::s_FreeFunc );
	EuAppBase::s_FreeFunc( ptr );
}

/* convert atom to char. *must avoid side effects in elem* */
#define Char(elem) ((IS_ATOM_INT(elem)) \
	? ((char)INT_VAL(elem)) : doChar(elem)) 

/* convert to char (int done inline) */
static inline char doChar( object elem )
{
	if ( IS_ATOM_INT(elem) )
		return (char)elem;
	
	if ( IS_ATOM(elem) )
	{
		return (char)(DBL_PTR(elem)->dbl);
	}
	else
	{
	//	RTFatal("sequence found inside character string");
		return '\0';
	}
}

/* make an atom or sequence into a C string */
/* N.B. caller must allow one extra for the null terminator */
static inline void MakeCString( char *s, object obj )
{
	object_ptr elem;
	object x;
	
	if ( IS_ATOM(obj) )
	{
		*s++ = Char(obj);
	}
	else
	{
		obj = (object)SEQ_PTR(obj);
		elem = ((s1_ptr)obj)->base;
		
		while (TRUE)
		{ 
			x = *(++elem);
			if ( IS_ATOM_INT(x) )
			{
				*s++ = (char)x;
			}
			else
			{
				if ( x == NOVALUE )
					break;
				*s++ = doChar(x);
			}
		}
	}
	
	*s = '\0';
}

/* allocate space for a new double value */
static inline object NewDouble( double dbl )
{
	d_ptr d = (d_ptr)Malloc( (long)D_SIZE );
	d->ref = 1;
	d->dbl = dbl;
	d->cleanup = 0;
	
	return MAKE_DBL( d );
}

/* make a new s1 sequence block with a single reference count */
/* size is number of elements, NOVALUE is added as an end marker */
static inline s1_ptr NewS1( size_t size )
{
	size_t s1_size = sizeof(struct s1) + (size+1) * sizeof(object);
	
	s1_ptr s1 = (s1_ptr)Malloc( (long)s1_size );
	s1->ref = 1;
	s1->base = (object_ptr)(s1 + 1);
	s1->length = size;
	s1->postfill = 0;
	s1->cleanup = 0;
	*(s1->base + size) = NOVALUE;
	s1->base--;
	
	return s1;
}

/* create a new string sequence */
static inline object NewString( unsigned char* s )
{
	int len = strlen( (char *)s );
	s1_ptr s1 = NewS1( (size_t)len );
	object_ptr obj_ptr = (object_ptr)s1->base;
	
	if (len > 0) do {
		*(++obj_ptr) = (unsigned char)*s++;
	} while (--len > 0);
	
	return MAKE_SEQ( s1 );
}

/* create a new string sequence */
static inline object NewStringConst( const unsigned char* s )
{
	int len = strlen( (char *)s );
	s1_ptr s1 = NewS1((long)len);
	object_ptr obj_ptr = (object_ptr)s1->base;
	
	if (len > 0) do {
	    *(++obj_ptr) = (unsigned char)*s++;
	} while (--len > 0);
	
	return MAKE_SEQ( s1 );
}

/* wrap an int in an atom if necessary */
static inline object box_int( intptr_t x )
{
	if ( x > NOVALUE && x < TOO_BIG_INT )
		return (object)x;
	
	return NewDouble( (eudouble)x );
}

/* convert a Euphoria sequence to a wxString */
static inline wxString get_string( object seq )
{
	if ( !IS_SEQUENCE(seq) ) {
	//	EuApp::RTFatal("expected a sequence");
		return wxEmptyString;
	}
	
	s1_ptr s1 = SEQ_PTR( seq );
	int len = s1->length;
	
	wxChar* str = new wxChar[len+1];
	for( int i = 1; i <= len; i++ )
	{
		object x = s1->base[i];
		
		if ( IS_SEQUENCE(x) ) {
			return wxEmptyString;
		}
		
		if ( !IS_ATOM_INT(x) ) {
			x = (intptr_t)DBL_PTR(x)->dbl;
		}
		
		str[i-1] = (wxChar)x;
	}
	
	str[len] = 0;
	wxString s( str );
	
	delete[] str;
	return s;
}

/* convert an item of a Euphoria sequence to a wxString */
static inline wxString get_string( object seq, intptr_t index )
{
	return get_string( (object)SEQ_PTR(seq)->base[index] );
}

/* convert a wxString to a Euphoria sequence */
static inline object get_sequence( const wxString& str )
{
	s1_ptr s = NewS1( str.length() );
	
	for ( int i = 0; i < str.length(); i++ ) {
		wxChar ch = str.GetChar( i );
		s->base[i+1] = BOX_INT( ch );
	}
	
	return MAKE_SEQ( s );
}

/* convert a Euphoria atom to a C double */
static inline double get_double( object x )
{
	if ( IS_SEQUENCE(x) ) return 0.0;
//		EuApp::RTFatal("expected an integer");
	
	if ( x > NOVALUE && x < TOO_BIG_INT )
		return (double)x; // a double
	else
		return (double)((d_ptr)DBL_PTR(x))->dbl;
}

/* convert an item of a Euphoria sequence to a C double */
static inline double get_double( object seq, intptr_t index )
{
	return get_double( (object)SEQ_PTR(seq)->base[index] );
}

/* convert a Euphoria atom to a C int */
static inline intptr_t get_int( object x )
{
	if ( IS_SEQUENCE(x) ) return 0;
//		EuApp::RTFatal("expected an integer");
	
	if ( x > NOVALUE && x < TOO_BIG_INT )
		return (intptr_t)x; // an integer
	else
		return (intptr_t)((d_ptr)DBL_PTR(x))->dbl;
}

/* convert an item of a Euphoria sequence to a C int */
static inline intptr_t get_int( object seq, intptr_t index )
{
	return get_int( (object)SEQ_PTR(seq)->base[index] );
}

/* convert a Euphoria object to a wxPoint */
static inline wxPoint get_point( object pt )
{
	if ( IS_SEQUENCE( pt ) ) {
		s1_ptr s = SEQ_PTR( pt );
		intptr_t xx = s->base[1];
		intptr_t yy = s->base[2];
		return wxPoint( xx, yy );
	}
	else {
		return *(wxPoint*)pt;
	}
}

/* convert a Euphoria object to a wxSize */
static inline wxSize get_size( object sz )
{
	if ( IS_SEQUENCE( sz ) ) {
		s1_ptr s = SEQ_PTR( sz );
		intptr_t xx = s->base[1];
		intptr_t yy = s->base[2];
		return wxSize( xx, yy );
	}
	else {
		return *(wxSize*)sz;
	}
}

/* routine id lookup table entry structure */
typedef struct wxObjRid {
	wxObjRid() {};
	wxObjRid( intptr_t routine_id, intptr_t event_object )
		: m_RoutineId(routine_id)
		, m_EventObject(event_object) {};
	intptr_t m_RoutineId;
	intptr_t m_EventObject;
} wxObjRid;

/* map types for routine id lookup table */
typedef map<intptr_t, wxObjRid> wxId2ObjRid;
typedef map<intptr_t, wxId2ObjRid> wxEvtType2Id;

/* shared class for wxEuphoria event data */
class EuClientData : public wxClientData
{
public:
	EuClientData();
	/* event_type -> window_id -> (handler, routine_id, user_data) */
	void Add( intptr_t handler, wxWindowID window_id, wxEventType event_type, intptr_t routine_id );
	void Get( wxWindowID window_id, wxEventType event_type, intptr_t* handler, intptr_t* routine_id );
	void Del( wxWindowID window_id, wxEventType event_type );
private:
	wxEvtType2Id m_EvtType2Id;
};

#endif // WXEUPHORIA_H