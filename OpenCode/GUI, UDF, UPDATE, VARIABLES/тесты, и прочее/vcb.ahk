Gui, Add, Hotkey, x6 y14 w100 h20 vMyHotKey, 
Gui, Add, Button, x116 y14 w100 h20 gPzz, Начать 
; Generated using SmartGUI Creator 4.0 
Gui, Show, h48 w243, New GUI Window 
Return 

GuiClose: 
ExitApp 

Pzz: 
Gui, Submit 
Hotkey, %MyHotKey%, key, on, useerrorlevel
MsgBox,%MyHotKey% 
return 

key: 
Gui, Submit, NoHide  
MsgBox,%MyHotKey% 
Hotkey, %MyHotKey%, key, off, useerrorlevel  
return 