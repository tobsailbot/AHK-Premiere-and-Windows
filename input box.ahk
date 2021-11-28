#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

var1 = https://www.youtube.com/results?search_query=

^!+t::
InputBox, youtube, Youtube Search, youtube.com/, , 179, 132, 1747,910
Run, %var1%%youtube%
return