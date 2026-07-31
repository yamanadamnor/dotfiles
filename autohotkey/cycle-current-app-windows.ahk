#Requires AutoHotkey v2.0 #SingleInstance

; ================================================================
; Cycle through windows belonging to the same application
;
; Alt + § (SC029)
;
; Example:
;   Chrome 1 -> Chrome 2 -> Chrome 3 -> Chrome 1
;   Explorer 1 -> Explorer 2 -> Explorer 3 -> Explorer 1
; ================================================================

!SC029::
{
    static WindowList := []
    static CurrentIndex := 0
    static ActiveProcess := ""

    ; Get the currently active window
    ActiveHwnd := WinGetID("A")
    ProcessName := WinGetProcessName(ActiveHwnd)

    ; Get all windows belonging to the same application
    CurrentWindows := WinGetList("ahk_exe " ProcessName)

    ; Remove windows that no longer exist
    WindowList := FilterExistingWindows(WindowList)

    ; Check whether we need to create/rebuild the cycle
    NeedNewCycle := false

    ; Different application
    if ProcessName != ActiveProcess
    {
        NeedNewCycle := true
    }
    ; Active window isn't part of our existing cycle
    else if !ArrayContains(WindowList, ActiveHwnd)
    {
        NeedNewCycle := true
    }
    ; Number of windows has changed
    else if WindowList.Length != CurrentWindows.Length
    {
        NeedNewCycle := true
    }
    ; One or more windows have changed
    else
    {
        for Hwnd in CurrentWindows
        {
            if !ArrayContains(WindowList, Hwnd)
            {
                NeedNewCycle := true
                break
            }
        }
    }

    ; Build a new cycle
    if NeedNewCycle
    {
        WindowList := CurrentWindows
        ActiveProcess := ProcessName

        ; Find the currently active window
        CurrentIndex := 0

        for Index, Hwnd in WindowList
        {
            if Hwnd = ActiveHwnd
            {
                CurrentIndex := Index
                break
            }
        }

        ; Nothing to cycle through
        if WindowList.Length <= 1
            return
    }

    ; Move to the next window
    CurrentIndex++

    ; Wrap around to the first window
    if CurrentIndex > WindowList.Length
        CurrentIndex := 1

    ; Activate it
    NextHwnd := WindowList[CurrentIndex]

    if WinExist(NextHwnd)
        WinActivate(NextHwnd)
}


; ================================================================
; Remove windows that no longer exist
; ================================================================

FilterExistingWindows(WindowList)
{
    Result := []

    for Hwnd in WindowList
    {
        if WinExist(Hwnd)
            Result.Push(Hwnd)
    }

    return Result
}


; ================================================================
; Check whether an array contains a specific value
; ================================================================

ArrayContains(Array, Value)
{
    for Item in Array
    {
        if Item = Value
            return true
    }

    return false
}
