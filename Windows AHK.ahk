#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


var1 = https://www.youtube.com/results?search_query=

; G1
^!+l::
Run, open "D:\TOBI-PC\Descargas\"
return

; G2
^!+m::
Run, open "D:\TOBI-PC\Descargas\3-VIDEO PROJECTS\1.VIDEO EDITING RESOURCES"
return

; G3 youtube search box
^!+t::
InputBox, youtube, Youtube Search, youtube.com/search=, , 179, 132, 1747, 910
if ErrorLevel {
    SplashTextOn,,,cancel
    SplashTextOff
}
else{
    Run, %var1%%youtube%
}

return

; G4
^!+g::
Run https://docs.google.com/
return

;G5 Tab forward
^!+f4::
if WinActive ("ahk_exe chrome.exe"){
Send, ^{Tab}
}
return

;G6 Tab backwards
^!+f3::
if WinActive ("ahk_exe chrome.exe"){
Send, ^+{Tab}
}
return


; cerrar pestaña chrome y cerrar ventanas alt f4
^!+o::
if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe chrome.exe") { 
	Send, ^{w}
}

else{
	Send, !{f4}
}	
return


