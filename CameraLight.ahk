; variables
modeBool := False
transCol := "FFFFFF"

; settings
Gui +AlwaysOnTop -Caption -Border -Resize +E0x20 ; lets you click through gui
Gui, Color, %transCol%
Gui, Add, Picture, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, overlay.png

; hotkeys
:*:bmode::
 If (modeBool = False){
    Send, activated
    Sleep, 300
    Loop, 9{
        Send, {Backspace}
    }
    modeBool := True 
    Gui, Show, x0 y0 Maximize, CameraLight
    WinSet, TransColor, %transCol% 240, CameraLight
    Sleep, 100
    Click
 }
 Else {
    Send, disabled
    Sleep, 300
    Loop, 8{
        Send, {Backspace}
    }
    modeBool := False
    Gui, Hide
 }

return