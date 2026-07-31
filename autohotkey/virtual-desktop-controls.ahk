;----------------------------------------------------------
; Win + Middle Mouse Drag -> Switch virtual desktops
;----------------------------------------------------------

*#MButton::
{
    CoordMode "Mouse", "Screen"

    MouseGetPos &startX, &startY

    threshold := 100      ; Pixels to move before switching
    switched := false

    while GetKeyState("MButton", "P")
    {
        MouseGetPos &x, &y

        deltaX := x - startX

        if !switched
        {
            if deltaX >= threshold
            {
                Send "#^{Right}"   ; Win+Ctrl+Right
                switched := true
            }
            else if deltaX <= -threshold
            {
                Send "#^{Left}"    ; Win+Ctrl+Left
                switched := true
            }
        }

        Sleep 10
    }
}
