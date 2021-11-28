; mediante reconocimiento de imagenes busca el panel de efectos, ingresa el texto a bucar y arrastra el mouse automaticamenteal efecto para aplicarlo nuevamente al clip
; elejir la ruta del archivo efectPanel.png 


; checkear si el tacho de basura esta presionado o no
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


; checkear si estan presionados los botones dentro del panel efectos
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

; mover el mouse hacia la transicion del panel efectos y arrastrarla
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


#IfWinActive ahk_exe Adobe Premiere Pro.exe

+!k::
MouseGetPos, xpos, ypos
checkPanel()
trashCheck()
Send, push right
moveToTransition()
return

+^Right::
MouseGetPos, xpos, ypos   ; obtener coordenasdas actuales del mouse a las variables xpos ypos
trashCheck()
checkPanel()
Send, push right
moveToTransition()
return

+^Left::
Send, ^!j::
Send, {Tab 3}
Send, push left
moveToTransition()
return

+^Down::
Send, ^!j::
Send, {Tab 3}
Send, push down
moveToTransition()
return

+^Up::
Send, ^!j::
Send, {Tab 3}
Send, push up
moveToTransition()
return

^Numpad1::
Send, ^!j::
Send, {Tab 3}
Send, wide motion
moveToTransition()
return

^Numpad2::
Send, ^!j::
Send, {Tab 3}
Send, float motion
moveToTransition()
return

