#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Simple script para mover el mouse hacia una imagen

+^r::

CoordMode,Pixel,Screen

ImageSearch, x, y, 0, 0, 1920, 1080, ‪‪‪C:\AHK\efectosPanel.png

MouseMove, %x%, %y%
