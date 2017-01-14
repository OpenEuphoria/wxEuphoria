@echo off

PUSHD %~p0\..
SET EUDIR=C:\Euphoria41-64bit
SET WXEUPATH=%CD%\bin\Win64-Debug
SET PATH=%WXEUPATH%;%EUDIR%\bin;%PATH%;
%ComSpec% /T:1F /K
COLOR
