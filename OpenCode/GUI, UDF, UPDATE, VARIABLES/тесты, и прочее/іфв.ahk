#NoTrayIcon

Gui, Add, Tab2, x2 y9 w780 h160 , Tab1|Tab2
;~ Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Text, x112 y39 w40 h20 , Имя
Gui, Add, Edit, x12 y39 w90 h20 , Edit
Gui, Add, Text, x112 y69 w70 h20 , Фамилия
Gui, Add, Edit, x12 y69 w90 h20 , Edit
Gui, Add, DropDownList, x12 y99 w90 h150 , DropDownList
Gui, Add, Text, x112 y99 w40 h20 , Пол
Gui, Add, DropDownList, x12 y129 w90 h90 , DropDownList
Gui, Add, Text, x112 y129 w100 h20 , Организация
; Generated using SmartGUI Creator for SciTE
Gui, Show, w788 h565, Untitled GUI
return

GuiClose:
ExitApp