#Requires AutoHotkey v2.0.2
#SingleInstance Force

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
#h::Send "{blind}{Left}"      ; hjkl binds for Window Snapping.
#l::Send "{blind}{Right}"     ; This works really well with Powertoys FancyZones
#j::Send "{blind}{Down}"      ; when "Override Windows Snap" is set to ON
#k::Send "{blind}{Up}"        ; and "Move windows based on" is set to "Relative Position"

#+h::Send "#+{Left}"    ; Send window to monitor on left.
#+l::Send "#+{Right}"   ; Send window to monitor on right.
