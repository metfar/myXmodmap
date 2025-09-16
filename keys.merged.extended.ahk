<^>!.:: send ">"
<^>!,:: send "<"
<^>!x:: send ">"
<^>!z:: send "<"
<^>!q:: send "@"
<^>!':: send "\"

<^>!e:: send "€"

<^>!w:: send "{#}"

<^>!1:: send "|"
<^>!2:: send "@"
<^>!3:: send "{#}"
<^>!4:: send "~"
<^>!5:: send "€"
<^>!6:: send "¬"
<^>!7:: send "{{}"
<^>!8:: send "["
<^>!9:: send "]"
<^>!0:: send "{}}"

; ======= BEGIN: Auto-generated from Xmodmap by Lumen (Extended) =======
#Requires AutoHotkey v2.0
; Mapeos AltGr/Shift+AltGr + dead keys extendidos (acute, grave, tilde, diaeresis, caron, macron, breve, cedilla, ogonek, circumflex).
<^>!1:: Send "|"
+<^>!1:: Send "!"
<^>!2:: Send "@"
+<^>!2:: Send """
<^>!3:: Send "#"
+<^>!3:: Send "§"
<^>!4:: Send "~"
+<^>!4:: Send "$"
<^>!5:: Send "€"
+<^>!5:: Send "%"
<^>!6:: Send "¬"
<^>!7:: Send "{{{}}"
+<^>!7:: Send "&"
<^>!8:: Send "{{{}}"
+<^>!8:: Send "*"
<^>!9:: Send "["
+<^>!9:: Send "("
<^>!0:: Send "]"
+<^>!0:: Send ")"
<^>!-:: Send "'"
+<^>!-:: Send "?"
<^>!=:: Send "¡"
+<^>!=:: Send "¿"
<^>!q:: Send "@"
+<^>!t:: Send "T"
+<^>!y:: Send "Y"
+<^>!u:: Send "U"
+<^>!i:: Send "I"
+<^>!g:: Send "G"
+<^>!h:: Send "H"
+<^>!j:: Send "J"
+<^>!k:: Send "K"
+<^>!l:: Send "L"
+<^>!ñ:: Send "Ñ"
<^>!\:: Send "ç"
+<^>!\:: Send "Ç"
<^>!z:: Send "<"
<^>!x:: Send ">"
+<^>!c:: Send "C"
+<^>!v:: Send "V"
+<^>!b:: Send "B"
+<^>!n:: Send "N"
+<^>!m:: Send "M"
+<^>!,:: Send ";"
+<^>!.:: Send ":"
<^>!/:: Send "-"
+<^>!/:: Send "_"
+<^>!<:: Send ">"

; === Dead key emulation (extended) =============================
#Requires AutoHotkey v2.0
global DeadMode := ""

DeadActivate(mode) {
    global DeadMode
    DeadMode := mode
    SetTimer(() => ToolTip(), -600)
}

; --- Dead triggers (AltGr+Shift+key) ---
+<^>!6:: DeadActivate("circumflex")   ; ^
+<^>!,:: DeadActivate("cedilla")      ; ¸
+<^>!.:: DeadActivate("ogonek")       ; ˛
+<^>!':: DeadActivate("acute")        ; ´
+<^>!`:: DeadActivate("grave")        ; `
+<^>!7:: DeadActivate("tilde")        ; ~  (dedicado)
+<^>!8:: DeadActivate("diaeresis")    ; ¨
+<^>!9:: DeadActivate("caron")        ; ˇ
+<^>!0:: DeadActivate("macron")       ; ¯
+<^>!-:: DeadActivate("breve")        ; ˘

; --- Dead-mode mappings ---
#HotIf DeadMode != ""
; Basic vowels (lower/upper)
a:: ComposeSend("a")
e:: ComposeSend("e")
i:: ComposeSend("i")
o:: ComposeSend("o")
u:: ComposeSend("u")
y:: ComposeSend("y")
A:: ComposeSend("A")
E:: ComposeSend("E")
I:: ComposeSend("I")
O:: ComposeSend("O")
U:: ComposeSend("U")
Y:: ComposeSend("Y")
; Common consonants
n:: ComposeSend("n")
N:: ComposeSend("N")
c:: ComposeSend("c")
C:: ComposeSend("C")
r:: ComposeSend("r")
R:: ComposeSend("R")
s:: ComposeSend("s")
S:: ComposeSend("S")
t:: ComposeSend("t")
T:: ComposeSend("T")
d:: ComposeSend("d")
D:: ComposeSend("D")
l:: ComposeSend("l")
L:: ComposeSend("L")

; Space yields the diacritic alone
Space::
{
    global DeadMode
    Send (
        DeadMode = "circumflex"  ? "^" :
        DeadMode = "cedilla"     ? "¸" :
        DeadMode = "ogonek"      ? "˛" :
        DeadMode = "acute"       ? "´" :
        DeadMode = "grave"       ? "`" :
        DeadMode = "tilde"       ? "~" :
        DeadMode = "diaeresis"   ? "¨" :
        DeadMode = "caron"       ? "ˇ" :
        DeadMode = "macron"      ? "¯" :
        DeadMode = "breve"       ? "˘" : ""
    )
    DeadMode := ""
}

; Any other printable/control: cancel and pass through
*~$Backspace::
*~$Tab::
*~$Enter::
*~$Esc::
*~$1::
*~$2::
*~$3::
*~$4::
*~$5::
*~$6::
*~$7::
*~$8::
*~$9::
*~$0::
*~$-::
*~$=::
{
    global DeadMode
    DeadMode := ""
    Send "{Blind}{" . SubStr(A_ThisHotkey,3) . "}"
}
#HotIf

ComposeSend(letter) {
    global DeadMode
    out := ""
    switch DeadMode {
        case "circumflex":
            out := MapCirc(letter)
        case "acute":
            out := MapAcute(letter)
        case "grave":
            out := MapGrave(letter)
        case "tilde":
            out := MapTilde(letter)
        case "diaeresis":
            out := MapDiaeresis(letter)
        case "cedilla":
            out := MapCedilla(letter)
        case "ogonek":
            out := MapOgonek(letter)
        case "caron":
            out := MapCaron(letter)
        case "macron":
            out := MapMacron(letter)
        case "breve":
            out := MapBreve(letter)
    }
    DeadMode := ""
    Send (out != "" ? out : letter)
}

MapCirc(l) {
    return (l="a")?"â":(l="e")?"ê":(l="i")?"î":(l="o")?"ô":(l="u")?"û":
           (l="A")?"Â":(l="E")?"Ê":(l="I")?"Î":(l="O")?"Ô":(l="U")?"Û":""
}
MapAcute(l) {
    return (l="a")?"á":(l="e")?"é":(l="i")?"í":(l="o")?"ó":(l="u")?"ú":(l="y")?"ý":
           (l="A")?"Á":(l="E")?"É":(l="I")?"Í":(l="O")?"Ó":(l="U")?"Ú":(l="Y")?"Ý":""
}
MapGrave(l) {
    return (l="a")?"à":(l="e")?"è":(l="i")?"ì":(l="o")?"ò":(l="u")?"ù":
           (l="A")?"À":(l="E")?"È":(l="I")?"Ì":(l="O")?"Ò":(l="U")?"Ù":""
}
MapTilde(l) {
    return (l="a")?"ã":(l="o")?"õ":(l="n")?"ñ":
           (l="A")?"Ã":(l="O")?"Õ":(l="N")?"Ñ":""
}
MapDiaeresis(l) {
    return (l="a")?"ä":(l="e")?"ë":(l="i")?"ï":(l="o")?"ö":(l="u")?"ü":(l="y")?"ÿ":
           (l="A")?"Ä":(l="E")?"Ë":(l="I")?"Ï":(l="O")?"Ö":(l="U")?"Ü":(l="Y")?"Ÿ":""
}
MapCedilla(l) {
    return (l="c")?"ç":(l="C")?"Ç":""
}
MapOgonek(l) {
    return (l="a")?"ą":(l="e")?"ę":(l="i")?"į":(l="u")?"ų":
           (l="A")?"Ą":(l="E")?"Ę":(l="I")?"Į":(l="U")?"Ų":""
}
MapCaron(l) { ; hace ˇ: checo/eslovaco/esloveno
    return (l="c")?"č":(l="s")?"š":(l="z")?"ž":(l="r")?"ř":(l="t")?"ť":(l="d")?"ď":(l="n")?"ň":
           (l="C")?"Č":(l="S")?"Š":(l="Z")?"Ž":(l="R")?"Ř":(l="T")?"Ť":(l="D")?"Ď":(l="N")?"Ň":""
}
MapMacron(l) {
    return (l="a")?"ā":(l="e")?"ē":(l="i")?"ī":(l="o")?"ō":(l="u")?"ū":(l="y")?"ȳ":
           (l="A")?"Ā":(l="E")?"Ē":(l="I")?"Ī":(l="O")?"Ō":(l="U")?"Ū":(l="Y")?"Ȳ":""
}
MapBreve(l) {
    return (l="a")?"ă":(l="e")?"ĕ":(l="i")?"ĭ":(l="o")?"ŏ":(l="u")?"ŭ":
           (l="A")?"Ă":(l="E")?"Ĕ":(l="I")?"Ĭ":(l="O")?"Ŏ":(l="U")?"Ŭ":""
}
; ================================================================
; ======= END: Auto-generated from Xmodmap by Lumen (Extended) =======
