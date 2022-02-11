; variables
modeBool := False
transCol := "FFFFFF"

; settings
CoordMode, ToolTip, Screen
Gui, +AlwaysOnTop -Caption +Border
Gui, Color, %transCol%

; hotkeys
:*:bmode::
 If (modeBool = False){
    Send, activated 
    modeBool := True 
    Gui, Show, x500 y500 h100 w100, CameraLight
    WinSet, TransColor, %transCol% 255, CameraLight
 }
 Else {
     Send, disbled
     modeBool := False
     Gui, Hide
 }

return