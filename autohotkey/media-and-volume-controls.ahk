#Requires AutoHotkey v2.0
#SingleInstance Force

;----------------------------------------------------------
; Media controls
;----------------------------------------------------------

LAlt & MButton::Send "{Media_Play_Pause}"
LAlt & XButton1::Send "{Media_Prev}"
LAlt & XButton2::Send "{Media_Next}"

;----------------------------------------------------------
; Volume controls
;----------------------------------------------------------

LAlt & WheelUp::Send("{Volume_Up}")
LAlt & WheelDown::Send("{Volume_Down}")
