#NoTrayIcon

Gui, +hwndhGui1
Gui, Add, GroupBox, x12 y9 w220 h80 , Пользовательская информация
Gui, Add, Edit, x22 y29 w90 h20 , Edit
Gui, Add, Edit, x122 y29 w100 h20 , Edit
Gui, Add, DropDownList, x72 y59 w100 h200 , DropDownList
Gui, Add, GroupBox, x242 y9 w230 h80 , Рация с отыгровкой диспетчера
Gui, Add, Edit, x252 y29 w90 h20 , Edit
Gui, Add, Edit, x352 y29 w100 h20 , Edit
Gui, Add, CheckBox, x252 y49 w100 h30 , АНГЛ. ВЕРСИЯ
Gui, Add, Radio, x362 y49 w100 h30 , ВКЛ\ВЫКЛ
Gui, Add, GroupBox, x482 y9 w280 h50 , Рация без отыгровки диспетчера \ Тэговая рация
Gui, Add, Edit, x492 y29 w100 h20 , Edit
Gui, Add, Radio, x632 y29 w110 h20 , ВКЛ\ВЫКЛ
Gui, Add, GroupBox, x482 y69 w280 h50 , Организация
Gui, Add, DropDownList, x572 y89 w100 h160 , DropDownList
Gui, Add, Button, x12 y519 w100 h30 , СКАЧАТЬ SAMP
Gui, Add, Button, x122 y519 w100 h30 , СОХРАНИТЬ!
Gui, Add, Button, x232 y519 w100 h30 gStart, ЗАПУСК!!!
Gui, Add, Picture, x412 y199 w400 h390 , C:\Users\User\Downloads\tumblr_static_4pgvko5ky58ggk4884sg8g04k.png
Gui, Add, Button, x12 y219 w20 h80 gtest, <
Gui, Add, Text, x42 y249 w60 h30 +Center, Настройка клавиш
    Gui, 2:Add, Hotkey, x12 y19 w50 h20 vHotKey1, %HotKey1%
	Gui, 2:Add, Text, x72 y19 w100 h30 , - Ситуация "Трафик-Стоп".
	Gui, 2:Add, Hotkey, x12 y59 w50 h20 vHotKey2, %HotKey2%
	Gui, 2:Add, Text, x72 y59 w110 h30 , - Ситуация "Арест" (57v`, 66).
	Gui, 2:Add, Hotkey, x12 y99 w50 h20 vHotKey3, %HotKey3%
	Gui, 2:Add, Text, x72 y99 w130 h20 , - Ситуация "Теракт".
	Gui, 2:Add, Hotkey, x12 y139 w50 h20 vHotKey4, %HotKey4%
	Gui, 2:Add, Text, x72 y139 w130 h20 , - Меню "Рация".
	Gui, 2:Add, Hotkey, x12 y179 w50 h20 vHotKey5, %HotKey5%
	Gui, 2:Add, Hotkey, x12 y219 w50 h20 vHotKey6, %HotKey6%
	Gui, 2:Add, Hotkey, x12 y259 w50 h20 vHotKey7, %HotKey7%
	Gui, 2:Add, Hotkey, x12 y299 w50 h20 vHotKey8, %HotKey8%
	Gui, 2:Add, Text, x72 y179 w140 h20 , - Фиксация на машине.
	Gui, 2:Add, Text, x72 y219 w140 h30 , - Сброс данных о машине.
	Gui, 2:Add, Text, x72 y259 w50 h20 , - Лимит
	Gui, 2:Add, Edit, x122 y259 w30 h20 vHotKey10, %HotKey10%
	Gui, 2:Add, Text, x162 y259 w40 h20 , км\час
	Gui, 2:Add, Text, x72 y299 w140 h20 , - Отыгровка часов + F8
    Gui, 2:Add, Button, x122 y329 w100 h30 gStart, Сохранить.
; Generated using SmartGUI Creator for SciTE
;~ Gui, Show, w796 h573, Untitled GUI
Gui, Show, w796 h573, Untitled GUI
return

;~ x572 y250

GuiClose:
ExitApp

;~ test:
   ;~ WinGetPos, X, Y, W,, ahk_id %hGui1%
   ;~ Gui, +AlwaysOnTop
   ;~ Loop
   ;~ {
      ;~ Sleep, 10
      ;~ Gui, 2:Show, % "x" (x2 := X - A_Index*10) " y" Y+100 " w" 250 " h" 365 " NA", Настройки
   ;~ } Until x2 <= X-255
	;~ Gui, -AlwaysOnTop
   ;~ return
   
test:
   WinGetPos, X, Y, W,, ahk_id %hGui1%
   Gui, +AlwaysOnTop
   Loop
   {
      Sleep, 10
      Gui, 2:Show, % "x" (x2 := X - A_Index*10) " y" Y+100 " w" 250 " h" 365 " NA", Настройки
   } Until x2 >= X+W
	Gui, -AlwaysOnTop
   return
   
   SaveButton:
   return
   
   
Start:
Gui, Submit, NoHide
HotKey, %HotKey1%, Off, UseErrorLevel  
HotKey, %HotKey1%, Active1, On, UseErrorLevel  
HotKey, %HotKey2%, Off, UseErrorLevel  
HotKey, %Hotkey2%, Active2, On, UseErrorLevel  
HotKey, %Hotkey3%, Off, UseErrorLevel  
HotKey, %Hotkey3%, Active3, On, UseErrorLevel  
HotKey, %Hotkey4%, Off, UseErrorLevel  
HotKey, %Hotkey4%, Active4, On, UseErrorLevel  
HotKey, %Hotkey5%, Off, UseErrorLevel  
HotKey, %Hotkey5%, Active5, On, UseErrorLevel  
HotKey, %Hotkey6%, Off, UseErrorLevel  
HotKey, %Hotkey6%, Active6, On, UseErrorLevel  
HotKey, %Hotkey7%, Off, UseErrorLevel  
HotKey, %Hotkey7%, Active7, On, UseErrorLevel  
HotKey, %Hotkey8%, Off, UseErrorLevel  
HotKey, %Hotkey8%, Active8, On, UseErrorLevel  
return 

Active1:
Send, {F6}Далатна{Enter}
return

!1::
MsgBox, % HotKey9
return 


