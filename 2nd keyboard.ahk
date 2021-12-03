#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Process, Priority, , H
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
#SingleInstance force





; -----------------------------------------------------------------------------
; ------------      Aceleracion de mouse para Premiere Pro      ----------------------------
; ------------------------------------------------------------------------------


; Esto sirve para que funcionen bien los deslizadores dentro del panel de Control de efectos

Global SPIProc, User32Module
User32Module := DllCall("GetModuleHandle", Str, "user32", "Ptr")
SPIProc := DllCall("GetProcAddress", "Ptr", User32Module, "AStr", "SystemParametersInfoW", "Ptr")


#IfWinExist ahk_exe Adobe Premiere Pro.exe
 
~LButton::
If WinActive("ahk_exe Adobe Premiere Pro.exe")
    DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 11, Int, 0) ; Slightly Faster then Windows default
Return
 
~LButton Up::
    DllCall( SPIProc, Int, 0x71, Int, 0, UInt, 9, Int, 0) ; Default Windows 6 Ticks [10], adjust this as needed. 
Return
 
#IfWinExist








; ------------------------------------------------------------------------------------
; ------------------------- Middle mouse changes to HAND TOOL ---------------------------------
; ------------------------------------------------------------------------------------




~MButton::
If WinActive("ahk_exe Adobe Premiere Pro.exe"){
Send, h
sleep, 10
Send {LButton down}
}
return

~MButton Up::
If WinActive("ahk_exe Adobe Premiere Pro.exe"){
Send {LButton up}
sleep, 10
Send, v
}
return






; -----------------------------------------------------------------------------------
; --------------------- Funciones de Premiere Pro ---------------------------------
; ---------------------------------------------------------------------------------

; -mediante reconocimiento de imagenes busca el panel de efectos, ingresa el texto a bucar y arrastra el mouse automaticamenteal efecto para aplicarlo nuevamente al clip
; -elejir la ruta del archivo efectPanel.png 


; -checkear si el tacho de basura esta presionado o no

trashCheck(){
Send, ^!j::
CoordMode,Pixel,Screen
ImageSearch, i, j, 10, 10, 1920, 1080, D:\TOBI-PC\Imagenes\trashActive.png
if ErrorLevel = 0
	{
	Send, {Tab 3}
	}
else
	{
	Send, {Tab 2}
	}
}



; -checkear si estan presionados los botones dentro del panel efectos

checkPanel(){
MouseClick, Left
Send, ^!j::
sleep,10
CoordMode,Pixel,Screen
ImageSearch, a, b, 10, 10, 1920, 1080, D:\TOBI-PC\Imagenes\panelCheck1.png
if ErrorLevel = 0
	{
	MouseMove, %a%, %b%
	MouseClick, Left
	} 
sleep, 10
ImageSearch, c, d, 10, 10, 1920, 1080, D:\TOBI-PC\Imagenes\panelCheck2.png
if ErrorLevel = 0
	{
	MouseMove, %c%, %d%
	MouseClick, Left
	} 
sleep, 10
ImageSearch, e, f, 10, 10, 1920, 1080, D:\TOBI-PC\Imagenes\panelCheck3.png
if ErrorLevel = 0
	{
	MouseMove, %e%, %f%
	MouseClick, Left
	}
sleep, 10

}



; -mover el mouse hacia la transicion del panel efectos y arrastrarla

moveToTransition(){
CoordMode,Pixel,Screen   ; ejecutar dentro de la pantalla en medida de pixeles
ImageSearch, x, y, 0, 0, 1920, 1080, D:\TOBI-PC\Imagenes\efectPanel.png   ; buscar en la pantalla la imagen 
sleep, 10
MouseMove, %x%, %y%         ; mover el cursor hacia la imagen reconocida
sleep, 10
MouseMove, 10, 90, 0, R      ; mover el mouse 90 pixeles en direccion
global xpos
global ypos
sleep, 10
MouseClickDrag, left, , , %xpos%, %ypos%     ; click izq y arrastra a la posicion original xpos ypos
}






; --------------------------------------------------------------------------------------
; ------------------------------- Activar 2do teclado ----------------------------------
; --------------------------------------------------------------------------------------


#if (getKeyState("F23", "P"))

F12::return

; ---------  Asistente de Google  ----------

p::Send, +#a

;--------------------------------------------

w::msgbox, you pressed %A_thishotkey% on the extra keyboard
e::tooltip, you pressed %A_thishotkey% on the extra keyboard
r::SoundBeep, 1000, 500
Numpad0:: Send, z


Right::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, push right
moveToTransition()
return

Left::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, push left
moveToTransition()
return

Down::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, push down
moveToTransition()
return

Up::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, push up
moveToTransition()
return

Numpad1::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, wide motion
moveToTransition()
return

Numpad2::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, float motion
moveToTransition()
return

Numpad4::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, mobius vr
moveToTransition()
return

Numpad5::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, blend in
moveToTransition()
return

Numpad6::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, copiadora
moveToTransition()
return

; --------------------------------------------------------------------------
; ----------------------- Pymiere sounds automation ------------------------
; -------------------------------------------------------------------------



; abrir consola y ejecutar script de python

Numpad7::
if WinExist("Pymiere Console")
{
    	WinActivate , Pymiere Console
	Send, python pymiere_sounds.py pop
	Send, {Enter}
	WinMinimize, Pymiere Console
}
else
{
	Run, C:\PythonScripts\Pymiere Automation\Pymiere Console.lnk
    	WinWaitActive, Pymiere Console
	Send, python pymiere_sounds.py pop
	Send, {Enter}
	WinMinimize, Pymiere Console
}
return


Numpad8::
if WinExist("Pymiere Console")
{
    	WinActivate , Pymiere Console
	Send, python pymiere_sounds.py swoosh
	Send, {Enter}
	WinMinimize, Pymiere Console
}
else
{
	Run, C:\PythonScripts\Pymiere Automation\Pymiere Console.lnk
    	WinWaitActive, Pymiere Console
	Send, python pymiere_sounds.py swoosh
	Send, {Enter}
	WinMinimize, Pymiere Console
}
return



#if



 




