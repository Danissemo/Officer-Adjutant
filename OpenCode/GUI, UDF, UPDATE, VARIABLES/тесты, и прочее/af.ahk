#NoTrayIcon
#Include udf1.ahk
IniRead, Key1, %A_ScriptDir%\config.ini, Main, Key1
Gui, 50:Add, Hotkey, x12 y40 w110 h20 vKey1, %Key1%
Gui, 50:Add, Hotkey, x12 y70 w110 h20 vKey2,  
Gui, 50:Add, Hotkey, x12 y100 w110 h20 vKey3,  
Gui, 50:Add, Hotkey, x12 y130 w110 h20 vKey4,  
Gui, 50:Add, Hotkey, x12 y160 w110 h20 vKey5,  
Gui, 50:Add, Hotkey, x12 y190 w110 h20 vKey6,  
Gui, 50:Add, Hotkey, x12 y220 w110 h20 vKey7,  
Gui, 50:Add, Hotkey, x12 y250 w110 h20 vKey8,  
Gui, 50:Add, Hotkey, x12 y280 w110 h20 vKey9,  
Gui, 50:Add, Hotkey, x12 y310 w110 h20 vKey10,  
Gui, 50:Add, Hotkey, x12 y340 w110 h20 vKey11,  
Gui, 50:Add, Hotkey, x12 y370 w110 h20 vKey12,  
Gui, 50:Add, Hotkey, x12 y400 w110 h20 vKey13,  
Gui, 50:Add, Edit, x142 y40 w310 h20 vComanda1,  
Gui, 50:Add, Edit, x142 y70 w310 h20 vComanda2,  
Gui, 50:Add, Edit, x142 y100 w310 h20 vComanda3,  
Gui, 50:Add, Edit, x142 y130 w310 h20 vComanda4,  
Gui, 50:Add, Edit, x142 y160 w310 h20 vComanda5,  
Gui, 50:Add, Edit, x142 y190 w310 h20 vComanda6,  
Gui, 50:Add, Edit, x142 y220 w310 h20 vComanda7,  
Gui, 50:Add, Edit, x142 y250 w310 h20 vComanda8,  
Gui, 50:Add, Edit, x142 y280 w310 h20 vComanda9,  
Gui, 50:Add, Edit, x142 y310 w310 h20 vComanda10,  
Gui, 50:Add, Edit, x142 y340 w310 h20 vComanda11,  
Gui, 50:Add, Edit, x142 y370 w310 h20 vComanda12,  
Gui, 50:Add, Edit, x142 y400 w310 h20 vComanda13,  
Gui, 50:Add, Button, x182 y430 w100 h30 gOK, Старт  
Gui, 50:Add, Button, x12 y470 w100 h30 gReloadgui, Перезапустить  
Gui, 50:Add, Button, x122 y470 w100 h30 gSave, Сохранить  
Gui, 50:Add, Button, x232 y470 w100 h30 gMingui, Свернуть  
Gui, 50:Add, Button, x342 y470 w100 h30 gExit, Выход  
Gui, 50:Show, w460 h503, 123  
Gui, 50:Add, Text, x12 y20 w110 h20 , Клавиша  
Gui, 50:Add, Text, x142 y20 w310 h20 , Команда  
return  
OK:  
HotKey, %key1%, Off, UseErrorLevel  
HotKey, %key1%, Active1, On, UseErrorLevel  
HotKey, %key2%, Off, UseErrorLevel  
HotKey, %key2%, Active2, On, UseErrorLevel  
HotKey, %key3%, Off, UseErrorLevel  
HotKey, %key3%, Active3, On, UseErrorLevel  
HotKey, %key4%, Off, UseErrorLevel  
HotKey, %key4%, Active4, On, UseErrorLevel  
HotKey, %key5%, Off, UseErrorLevel  
HotKey, %key5%, Active5, On, UseErrorLevel  
HotKey, %key6%, Off, UseErrorLevel  
HotKey, %key6%, Active6, On, UseErrorLevel  
HotKey, %key7%, Off, UseErrorLevel  
HotKey, %key7%, Active7, On, UseErrorLevel  
HotKey, %key8%, Off, UseErrorLevel  
HotKey, %key8%, Active8, On, UseErrorLevel  
HotKey, %key9%, Off, UseErrorLevel  
HotKey, %key9%, Active9, On, UseErrorLevel  
HotKey, %key10%, Off, UseErrorLevel  
HotKey, %key10%, Active10, On, UseErrorLevel  
HotKey, %key11%, Off, UseErrorLevel  
HotKey, %key11%, Active11, On, UseErrorLevel  
HotKey, %key12%, Off, UseErrorLevel  
HotKey, %key12%, Active12, On, UseErrorLevel  
HotKey, %key13%, Off, UseErrorLevel  
HotKey, %key13%, Active13, On, UseErrorLevel  
return  

Active1:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda1% %id%{enter}  
return  
Active2:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda2% %id%{enter}  
return  
Active3:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda3% %id%{enter}  
return  
Active4:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda4% %id%{enter}  
return  
Active5:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda5% %id%{enter}  
return  
Active6:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda6% %id%{enter}  
return  
Active7:  
id := getClosestPlayerId()  
sendinput {f6}%Comand7% %id%{enter}  
return  
Active8:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda8% %id%{enter}  
return  
Active9:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda9% %id%{enter}  
return  
Active10:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda10% %id%{enter}  
return  
Active11:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda11% %id%{enter}  
return  
Active12:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda12% %id%{enter}  
return  
Active13:  
id := getClosestPlayerId()  
sendinput {f6}%Comanda13% %id%{enter}  
return  

Выйти:  
ExitApp  
return  
Exit:  
ExitApp  
return  

Mingui:  
Gui, Minimize  
return  

Save:  
Gui, 50: Submit, NoHide  
IniWrite, %Key1%, %A_ScriptDir%\config.ini, Main, Key1
return 
Далатнат

Reloadgui:  
Reload  
return 