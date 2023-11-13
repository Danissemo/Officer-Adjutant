Gui, +hwndhGui1
Gui, Add, Button, x10 y40 w70 gButton vButton, % Chr(0x2190)
Gui, Show, w788 h565
Gui, 2:Add, Hotkey, x12 y19 w50 h20 vHotKey1, %HotKey1%
GuiControl, ChooseString, HotKey1, %HotKey1%
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
Gui, 2:Add, Edit, x122 y259 w30 h20 vlimit, %limit%
Gui, 2:Add, Text, x162 y259 w40 h20 , км\час
Gui, 2:Add, Text, x72 y299 w140 h20 , - Отыгровка часов + F8
Gui, 2:Add, Button, x122 y329 w100 h30 , Сохранить.

Gui, 2:+hwndhGui2 +owner1 -Caption +Border
Gui, 2:Show, Hide
VarSetCapacity(WI, 60)
DllCall("GetWindowInfo", Ptr, hGui2, Ptr, &WI)
gui2width := NumGet(WI, 12, "UInt") - NumGet(WI, 4, "UInt")

OnMessage(0x3, "WM_MOVE")
OnMessage(0x112, "WM_MOVE")   ; WM_SYSCOMMAND = 0x112
return

Button:
   if i := !i  {
      DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
      Gui, 2:Show, % "x" NumGet(WI, 4, "UInt") - gui2width " y" NumGet(WI, 24, "UInt") 
                  . " h" NumGet(WI, 12, "UInt") - NumGet(WI, 24, "UInt") " hide"
   }
   DllCall("AnimateWindow", Ptr, hGui2, UInt, 400, UInt, 0x40000|(i ? 2 : 0x10001))
   GuiControl,, Button, % Chr(0x2190|(i ? 2 : 0))
   return
   
GuiClose:
   ExitApp
   
WM_MOVE(wp, lp, msg, hwnd)
{
   global hGui1, WI, i, gui2width
   static k
   if (msg = 0x112)
   {
      if (wp = 0xF020 && k := 1)   ; SC_MINIMIZE = 0xF020
         Gui, 2:Show, Hide
      
      if (wp = 0xF120 && !(k := 0) && i)   ; SC_RESTORE = 0xF120
         Gui, 2:Show
   }
   
   if (!i || hwnd != hGui1 || k = 1)
      return
   
   DllCall("GetWindowInfo", Ptr, hGui1, Ptr, &WI)
   Gui, 2:Show, % "x" NumGet(WI, 4, "UInt") - gui2width " y" NumGet(WI, 24, "UInt") 
               . " h" NumGet(WI, 12, "UInt") - NumGet(WI, 24, "UInt") " NA"
}