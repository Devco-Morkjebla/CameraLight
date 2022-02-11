CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen
Gui, +AlwaysOnTop
Gui, -Caption
Gui, +Border

~Alt::
    while GetKeyState("Alt")
    {
        MouseGetPos, mx, my
        PixelGetColor, color, mx, my, RGB
        HexRGB := SubStr(color, 3, 6) ; Sets HexRGB to FFFFFF from 0xFFFFFF
        ToolTip, % HexRGB
	IfWinNotActive, ahk_exe blender.exe
	{
        Gui, Color, % color
        GuiX := mx + 17
        GuiY := my + -16
        Gui, Show, x%GuiX% y%GuiY% w10 h30, title
	}
        Sleep, 10
    }
    ToolTip
    Gui, Hide
return

!c::
Gui, Hide
CopyCol := HexRGB
return

!v::
Gui, Hide
Send, % CopyCol
return

!F4::
Gui, Hide
Click
Send, !{F4}
return