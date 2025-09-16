#Requires AutoHotkey v2.0
; Scancode Probe (abre Key history)
F1::{
    KeyHistory
    MsgBox "View -> Key history and script info. Presiona teclas, luego F5 para refrescar."
}
#InstallKeybdHook
#UseHook
