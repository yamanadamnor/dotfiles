<#
    This script should be run as admin.
#>

$REPEAT_DELAY = 175
$REPEAT_RATE = 16

function Set-RepeatRate {

    param (
        [Parameter(Mandatory)]
        $Delay,

        [Parameter(Mandatory)]
        $Rate
    )

    $FKRegistryPath = "HKCU:\Control Panel\Accessibility\Keyboard Response"
    $DelayKey = "AutoRepeatDelay"
    $RateKey = "AutoRepeatRate"
    $AcceptanceKey = "DelayBeforeAcceptance"
    $FlagKey = "Flags"

    # FilterKeys keyboard rate
    Set-ItemProperty -Path $FKRegistryPath -Name $DelayKey -Value $Delay
    Set-ItemProperty -Path $FKRegistryPath -Name $RateKey -Value $Rate
    Set-ItemProperty -Path $FKRegistryPath -Name $AcceptanceKey -Value 0
    Set-ItemProperty -Path $FKRegistryPath -Name $FlagKey -Value 59

    # Set regular windows keyboard rate
    $KBRegistryPath = "HKCU:\Control Panel\Keyboard"
    $KeyboardKey = "KeyboardSpeed"
    Set-ItemProperty -Path $KBRegistryPath -Name $KeyboardKey -Value 31
}

function New-TerminalContextMenuEntry {
    $BasePath = "HKCU:\Software\Classes\Directory\Background\shell\wt"
    $CommandPath = "${BasePath}\command"

    New-Item -Path $BasePath -Value "Windows terminal here" -Force
    New-Item -Path $CommandPath -Value "wt.exe -d ." -Force
}

function Invoke-Setup {
    # Set the keyboard repeat rate
    Set-RepeatRate -Delay $REPEAT_DELAY -Rate $REPEAT_RATE

    Write-Output "Done! Re-login for FilterKeys settings to take effect."
}

Invoke-Setup
