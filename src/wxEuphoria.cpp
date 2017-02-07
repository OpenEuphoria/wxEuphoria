
#include "wx/init.h"
#include "wxEuphoria.h"

/*
#ifdef WXEUMSW
int winInstance;
HANDLE default_heap;
#endif
*/

EuAppBase* EuAppBase::s_EuAppBase;
EuCallFunc EuAppBase::s_CallFunc;
EuCallProc EuAppBase::s_CallProc;
MallocFunc EuAppBase::s_MallocFunc;
FreeFunc EuAppBase::s_FreeFunc;
intptr_t EuAppBase::s_RTFatal;
intptr_t EuAppBase::s_TheObject;

EuClientData::EuClientData() {}

void EuClientData::Add( intptr_t handler, wxWindowID window_id, wxEventType event_type, intptr_t routine_id ) {
	m_EvtType2Id[event_type][window_id] = wxObjRid( routine_id, handler );
}

void EuClientData::Del( wxWindowID window_id, wxEventType event_type ) {
	m_EvtType2Id[event_type].erase( window_id );
}

void EuClientData::Get( wxWindowID window_id, wxEventType event_type, intptr_t* handler, intptr_t* routine_id ) {
	
	wxEvtType2Id::iterator evIt = m_EvtType2Id.find( event_type );
	
	if ( evIt == m_EvtType2Id.end() ) {
		*routine_id = -1;
	}
	else {
		
		wxId2ObjRid::iterator rIt = evIt->second.find( window_id );
		
		if ( rIt == evIt->second.end() ) {
			rIt = evIt->second.find( wxID_ANY );
		}
		
		if ( rIt == evIt->second.end() ) {
			*handler    =  0;
			*routine_id = -1;
		}
		else {
			*handler    = rIt->second.m_EventObject;
			*routine_id = rIt->second.m_RoutineId;
		}
	
	}
}

EuAppBase::EuAppBase( EuCallFunc func, EuCallProc proc, intptr_t rtfatal )
{
	s_EuAppBase = this;
	s_CallFunc = func;
	s_CallProc = proc;
	s_RTFatal = rtfatal;
	s_TheObject = 0;
}

object EuAppBase::GetTheObject() {
	return s_TheObject;
}

void EuAppBase::Handler( wxEvent& event ) {
	
	wxEvtHandler* event_object = (wxEvtHandler*)event.GetEventObject();
	wxEventType   event_type   = (wxEventType)event.GetEventType();
	wxWindowID    window_id    = (wxWindowID)event.GetId();
	EuClientData* client_data  = (EuClientData*)event_object->GetClientObject();
	
	if ( client_data == NULL && event_object->IsKindOf(wxCLASSINFO(wxTimer)) ) {
		
		wxTimer* timer = (wxTimer*)event_object;
		wxEvtHandler* owner = timer->GetOwner();
		
		EuClientData* timer_data = (EuClientData*)owner->GetClientObject();
		if ( timer_data != NULL ) {
			
			intptr_t handler, routine_id;
			timer_data->Get( window_id, event_type, &handler, &routine_id );
			
			client_data = new EuClientData();
			client_data->Add( handler, window_id, event_type, routine_id );
			
			event_object->SetClientObject( client_data );
		}
	}
	
	if ( client_data == NULL ) {
		return;
	}
	
	intptr_t handler, routine_id;
	client_data->Get( window_id, event_type, &handler, &routine_id );
	
	if ( routine_id == -1 ) {
		return;
	}
	
//	s1_ptr data = NewS1( 4 );
//	data->base[1] = BOX_INT( handler );
//	data->base[2] = BOX_INT( event_type );
//	data->base[3] = BOX_INT( window_id );
//	data->base[4] = BOX_INT( &event );
//
//	EuAppBase::DoCallProc( routine_id, MAKE_SEQ(data) );
	
	s1_ptr params = NewS1( 1 );
	params->base[1] = BOX_INT( &event );
	
	EuAppBase::DoCallProc( routine_id, MAKE_SEQ(params) );
}

object EuAppBase::DoCallFunc( intptr_t id, object params )
{
	s_TheObject = params;
	return s_CallFunc( id );
}

void EuAppBase::DoCallProc( intptr_t id, object params )
{
	s_TheObject = params;
	s_CallProc( id );
}

void EuAppBase::DoRTFatal( wxString& msg )
{
	s1_ptr data = NewS1( 1 );
	data->base[1] = get_sequence( msg );
	
	EuAppBase::DoCallProc( s_RTFatal, MAKE_SEQ(data) );
}


#ifdef WXEUMSW

BOOL APIENTRY DllMain( HANDLE hModule, DWORD dwReason, LPVOID lpReserved ) {
	
	if ( dwReason == DLL_PROCESS_ATTACH )
	{
	//	winInstance = (intptr_t)hModule;
	//	default_heap = GetProcessHeap();
	}
	
	return TRUE;
}

#else

void __attribute__ ((constructor)) my_init(void) {}
void __attribute__ ((destructor))  my_fini(void) {}

#endif

extern "C" {

void WXEUAPI_BASE wxEuphoria_Initialize( object malloc_func, object free_func )
{
	EuAppBase::s_MallocFunc = (MallocFunc)malloc_func;
	EuAppBase::s_FreeFunc = (FreeFunc)free_func;
}

void WXEUAPI_BASE wxEuphoria_DeleteObject( object ptr )
{
	delete (wxObject*)ptr;
}

};