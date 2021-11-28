#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

Global SPIProc, User32Module
User32Module := DllCall("GetModuleHandle", Str, "user32", "Ptr")
SPIProc := DllCall("GetProcAddress", "Ptr", User32Module, "AStr", "SystemParametersInfoW", "Ptr")

; Hotkeys are "WIN+F1" and "WIN+F2"

;#F1::DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 9, Int, 0) 
;#F2::DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 18, Int, 0) 

#IfWinExist ahk_exe Adobe Premiere Pro.exe
 
~LButton::
If WinActive("ahk_exe Adobe Premiere Pro.exe")
    DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 11, Int, 0) ; Slightly Faster then Windows default
Return
 
~LButton Up::
    DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 9, Int, 0) ; Default Windows 6 Ticks [10], adjust this as needed. 
Return
 
#IfWinExist