# Compiler

## C Compiler Options

    -g;-mthreads;-Wno-ctor-dtor-privacy;-pipe;-fmessage-length=0

## C++ Compiler Options

    -g;-mthreads;-Wno-ctor-dtor-privacy;-pipe;-fmessage-length=0

## Include Paths

    $(WXWIN)\include;$(WXWIN)\lib\$(WXCFG)

## Preprocessors

    _UNICODE;__WXMSW__;__WXDEBUG__;HAVE_W32API_H;EDEBUG;EWINDOWS;WXEUMSW

# Linker

## Linker Options

### Base

    -mthreads;-Wl,--whole-archive;-lwxbase31ud;-lwxtiffd;-lwxjpegd;-lwxpngd;-lwxzlibd;-lwxregexud;-Wl,--no-whole-archive;-lkernel32;-luser32;-lgdi32;-lcomdlg32;-lwinspool;-lwinmm;-lshell32;-lcomctl32;-lversion;-lshlwapi;-lole32;-loleaut32;-luuid;-lrpcrt4;-ladvapi32;-lwsock32

### Core

    -mthreads;-Wl,--whole-archive;-lwxmsw31ud_core;-Wl,--no-whole-archive;-lwxeud_base;-lkernel32;-luser32;-lgdi32;-lcomdlg32;-lwinspool;-lwinmm;-lshell32;-lcomctl32;-lversion;-lshlwapi;-lole32;-loleaut32;-luuid;-lrpcrt4;-ladvapi32;-lwsock32;-luxtheme;-loleacc

### XML

    -mthreads;-Wl,--whole-archive;-lwxbase31ud_xml;-lwxexpatd;-Wl,--no-whole-archive;-lwxeud_base;-lkernel32;-luser32;-lgdi32;-lcomdlg32;-lwinspool;-lwinmm;-lshell32;-lcomctl32;-lversion;-lshlwapi;-lole32;-loleaut32;-luuid;-lrpcrt4;-ladvapi32;-lwsock32

## Library Search Path

    $(WXWIN)\lib\gcc_lib

# Environment

    WXCFG=gcc_lib\mswud
