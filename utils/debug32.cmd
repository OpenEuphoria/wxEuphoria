@echo off

PUSHD %~p0\..
SET EUDIR=C:\Euphoria41-32bit
SET WXEUPATH=%CD%\bin\Win32-Debug
SET PATH=%WXEUPATH%;%EUDIR%\bin;%PATH%;
%ComSpec% /T:4F /K
COLOR
