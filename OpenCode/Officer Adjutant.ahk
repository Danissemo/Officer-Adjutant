#SingleInstance force
;~#NoEnv

;~IniRead, Reloads, %A_MyDocuments%\GTA San Andreas User Files\SAMP\reloads.ini, Information, Reloads
;~if (reloads == 1)
;~{
;~	gosub, nexted
;~}
;~else if (reloads == 0)
;~{
;~	SendMessage, 0x50,, 0x4090409,, A
;~	IniWrite, 1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\reloads.ini, Information, Reloads
;~	reload
;~}
;~else
;~{
;~	SendMessage, 0x50,, 0x4090409,, A
;~	IniWrite, 1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\reloads.ini, Information, Reloads
;~	reload
;~}
;~return

;~nexted:
;~FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
;~IniWrite, 0, %A_MyDocuments%\GTA San Andreas User Files\SAMP\reloads.ini, Information, Reloads
#Include GUI, UDF, UPDATE, VARIABLES/variables.ahk
#Include GUI, UDF, UPDATE, VARIABLES/update.ahk
#Include GUI, UDF, UPDATE, VARIABLES/udfold.ahk
;~ #Include GUI, UDF, UPDATE, VARIABLES/samp.ahk
#Include GUI, UDF, UPDATE, VARIABLES/gui.ahk
#Include FUNCTION/usersetings.ahk
#Include FUNCTION/autodet.ahk
#Include FUNCTION/autogun.ahk
#Include FUNCTION/situation.ahk
#Include FUNCTION/dialog.ahk
;~ #Include test.ahk