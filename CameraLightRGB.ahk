filePath := "overlay.mp4"
if ErrorLevel
    ExitApp

; variables
modeBool := False
transCol := "000000"
If (A_ScreenDPI > 0){
    correction := 100
    If (A_ScreenDPI > 110){
        correction := 125
        If (A_ScreenDPI > 135){
            correction := 150
            If (A_ScreenDPI > 160){
                correction := 175
                If (A_ScreenDPI > 185){
                    correction := 200
                }
            }
        }
    }
}
scrnS := ((correction)/100)
scrnH := A_ScreenHeight/scrnS
scrnW := A_ScreenWidth/scrnS

; settings
Gui +AlwaysOnTop -Caption -Border -Resize ;+E0x20 ; lets you click through gui
Gui, Color, %transCol%
Gui, Add, ActiveX, x0 y0 w%scrnW% h%scrnH% vWmp, WMPLayer.OCX
Wmp.Url := filePath

; hotkeys
:*:bmode::
 If (modeBool = False){
    Send, activated
    Sleep, 300
    Loop, 9{
        Send, {Backspace}
    }
    modeBool := True 
    Gui, Show, x0 y0 Maximize, CameraLight Wmp in GUI
    WinSet, TransColor, Black 100, CameraLight
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