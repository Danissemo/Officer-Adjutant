#NoTrayIcon

Gui, Add, Hotkey, x12 y19 w50 h20 +Center, 
Gui, Font, S10 CDefault, Verdana
Gui, Font, S9 CDefault, Verdana
Gui, Font, S8 CDefault, Verdana
Gui, Add, Text, x72 y19 w100 h30 , - Ситуация "Трафик-Стоп".
Gui, Add, Hotkey, x12 y59 w50 h20 , 
Gui, Add, Text, x72 y59 w110 h30 , - Ситуация "Арест" (57v`, 66).
Gui, Add, Hotkey, x12 y99 w50 h20 , 
Gui, Add, Text, x72 y99 w130 h20 , - Ситуация "Теракт".
Gui, Add, Hotkey, x12 y139 w50 h20 , 
Gui, Add, Text, x72 y139 w130 h20 , - Меню "Рация".
Gui, Add, Hotkey, x12 y179 w50 h20 , 
Gui, Add, Hotkey, x12 y219 w50 h20 , 
Gui, Add, Hotkey, x12 y259 w50 h20 , 
Gui, Add, Hotkey, x12 y299 w50 h20 , 
Gui, Add, Edit, x12 y339 w80 h20 , Edit
Gui, Add, Text, x72 y179 w140 h20 , - Фиксация на машине.
Gui, Add, Text, x72 y219 w140 h30 , - Сброс данных о машине.
Gui, Add, Text, x72 y259 w50 h20 , - Лимит
Gui, Add, Edit, x122 y259 w30 h20 , Edit
Gui, Add, Text, x162 y259 w40 h20 , км\час
Gui, Add, Text, x72 y299 w140 h20 , - Отыгровка часов + F8
Gui, Add, Text, x102 y339 w140 h20 , - Маска`, с отыгровкой.
Gui, Add, Button, x12 y369 w100 h30 , Button
Gui, Add, Button, x122 y369 w100 h30 , Button
; Generated using SmartGUI Creator for SciTE
Gui, Show, w242 h406, Untitled GUI
return

GuiClose:
ExitApp