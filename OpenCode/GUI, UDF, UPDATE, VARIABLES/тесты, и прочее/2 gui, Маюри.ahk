#NoTrayIcon

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
Gui, Add, Picture, x442 y199 w350 h670 , C:\Users\User\Downloads\1370384371131.png
; Generated using SmartGUI Creator for SciTE
Gui, Show, w792 h569, Untitled GUI
return

GuiClose:
ExitApp