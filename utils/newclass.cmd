@echo off

PUSHD %~p0\..

echo generate a new class stub
if "%1" == "/?" goto usage
if "%1" == "/help" goto usage
goto :start

:usage
	echo usage: %~nx0 [libname] [classname]
	goto end

:start
set LIBNAME=%1
set CLASSNAME=%2

if "%1" == "" (
	set /P LIBNAME=library name: 
)

if "%2" == "" (
	set /P CLASSNAME=class name: 
)

set LIBPATH=%CD%\include\wx\%LIBNAME%
set FILENAME=%LIBPATH%\%CLASSNAME%.e
echo LIBPATH=%LIBPATH%
echo FILENAME=%FILENAME%
pause

if not exist "%LIBPATH%" (
	mkdir "%LIBPATH%"
)

if exist "%FILENAME%" (
	echo %FILENAME% already exists
	goto end
)

echo creating %FILENAME%
echo.>> %FILENAME%
echo namespace %CLASSNAME%>> %FILENAME%
echo.>> %FILENAME%
echo include "wx/dll.e">> %FILENAME%
echo include "wx/%LIBNAME%.e">> %FILENAME%
echo.>> %FILENAME%
echo public type %CLASSNAME%( object x )>> %FILENAME%
echo 	return wxObject(x)>> %FILENAME%
echo end type>> %FILENAME%
echo.>> %FILENAME%

echo.
:end

POPD
