@echo off
setlocal

set PATH=C:\Program Files (x86)\Inno Setup 5;C:\Program Files\7-Zip;%PATH%

REM Executables
set ISCC="ISCC.exe"
set COMPIL32="Compil32.exe"
set P7ZIP="7z.exe"

REM Settings
set APPNAME=wxEuphoria
set VERSION=3.1.0
set PLATFORM=Win32
set RELEASE=alpha1
set ISSFILE=%APPNAME%-%VERSION%-%PLATFORM%.%RELEASE%.iss
set EXEFILE=%APPNAME%-%VERSION%-%PLATFORM%.%RELEASE%.exe
set ZIPFILE=%APPNAME%-%VERSION%-%PLATFORM%.%RELEASE%.zip

REM Directories
set DIST=dist\%PLATFORM%
set BIN=bin\%PLATFORM%-Release
set DEMO=demo
set INCLUDE=include

REM Clean up old files
if exist %DIST% rmdir /S /Q %DIST%
if exist %EXEFILE% del /Q %EXEFILE%
if exist %ZIPFILE% del /Q %ZIPFILE%

REM Make new directories
mkdir %DIST%\
mkdir %DIST%\bin\
mkdir %DIST%\demo\
mkdir %DIST%\include\

REM Copy required files
xcopy gpl.txt        %DIST%\
xcopy lgpl.txt       %DIST%\
xcopy licence.txt    %DIST%\
xcopy licendoc.txt   %DIST%\
xcopy /S %BIN%\*.*   %DIST%\bin\
xcopy /S %DEMO%\*.*  %DIST%\demo\
xcopy /S %INCLUDE%\* %DIST%\include\

REM Create new exe file
%ISCC% dist\%ISSFILE%

REM Create new zip file
pushd %DIST%
%P7ZIP% a -r ..\%ZIPFILE% *.*
popd

endlocal
