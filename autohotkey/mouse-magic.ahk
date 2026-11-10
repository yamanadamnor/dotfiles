#Requires AutoHotkey v2.0
#SingleInstance Force

; Poor mans MX Master
;==========================================================
; WIN + MOUSE3
;
; Click:
;   Play/Pause
;
; Drag left:
;   Switch to previous virtual desktop
;
; Drag right:
;   Switch to next virtual desktop
;
; Only ONE desktop switch can occur per button hold.
;==========================================================

; Horizontal distance required to trigger the gesture.
GestureThreshold := 70

; Horizontal movement must be greater than vertical movement.
DirectionRatio := 1.5


LWin & MButton::
{
    global GestureThreshold, DirectionRatio

    ; Remember where the mouse was when Mouse3 was pressed.
    MouseGetPos &startX, &startY

    gestureTriggered := false

    ; Wait and monitor until Mouse3 is released.
    while GetKeyState("MButton", "P")
    {
        MouseGetPos &currentX, &currentY

        deltaX := currentX - startX
        deltaY := currentY - startY

        absX := Abs(deltaX)
        absY := Abs(deltaY)

        ; Only trigger when horizontal movement passes the threshold
        ; and is clearly more significant than vertical movement.
        if (absX >= GestureThreshold
            && absX > absY * DirectionRatio)
        {
            gestureTriggered := true

            if (deltaX < 0)
                Send "^#{Left}"   ; Previous virtual desktop
            else
                Send "^#{Right}"  ; Next virtual desktop

            ; IMPORTANT:
            ; Stop checking immediately.
            ; This guarantees only ONE switch per hold.
            break
        }

        Sleep 10
    }

    ; If Mouse3 was simply clicked without a gesture:
    ; Play/Pause.
    if (!gestureTriggered)
        Send "{Media_Play_Pause}"

    ; If the gesture triggered, wait for Mouse3 to be released
    ; before allowing another gesture.
    if (gestureTriggered)
        KeyWait "MButton"
}


;==========================================================
; MEDIA CONTROLS
;==========================================================

LWin & XButton1::Send "{Media_Prev}"
LWin & XButton2::Send "{Media_Next}"


;==========================================================
; VOLUME CONTROLS
;==========================================================

LWin & WheelUp::Send "{Volume_Up}"
LWin & WheelDown::Send "{Volume_Down}"


; VIM Motions in alt-tab

; hjkl arrowing binds for Task Switcher
#HotIf WinActive("ahk_class XamlExplorerHostIslandWindow")
h::Send "{Left}"
l::Send "{Right}"
j::Send "{Down}"
k::Send "{Up}"
!h::Send "{blind}{Left}"                                    ; {blind} is required so AHK doesn't register ALT key being lifted.
!l::Send "{blind}{Right}"
!j::Send "{blind}{Down}"
!k::Send "{blind}{Up}"
#HotIf

; hjkl arrowing binds for Window Snapping
#+h::Send "{blind}{Left}"      ; hjkl binds for Window Snapping.
#+l::Send "{blind}{Right}"     ; This works really well with Powertoys FancyZones
#+j::Send "{blind}{Down}"      ; when "Override Windows Snap" is set to ON
#+k::Send "{blind}{Up}"        ; and "Move windows based on" is set to "Relative Position"
