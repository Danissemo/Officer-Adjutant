#NoTrayIcon

Gui, Add, Picture, x-8 y-1 w1220 h720 , C:\Users\User\Downloads\2j1uInRy4j.png
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
Gui, Add, Button, x232 y519 w100 h30 , ЗАПУСК!!!
; Generated using SmartGUI Creator for SciTE
Gui, Show, w788 h565, Untitled GUI
return

GuiClose:
ExitApp