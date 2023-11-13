IfExist, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini
Gosub, ReadSettingsInfo
else
{
    Name         := "Ваше Имя."
    Surname      := "Ваша Фамилия."
    Ida          := "Ид."
    Marking      := "Маркировка."
    Rank         := "Сокращенное звание."
    Sex          := "Мужчина"
    Organ        := "SAPD"
    Tag          := "[Ваш тэг]:"
    Sleepingtime := "2000"
    RadioGroup1  := "1"
    Ch1          := "Checked"
    RadioGroup2  := "0"
    EngVer       := "1"
    Ch3          := "Checked"
}

back1:
IfExist, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini
Gosub, ReadSettingsPartner
else
{
    PartnerSurname = 0
    PartnerId = 0
    PartnerPost = 0
    Partner = 0
}


back2:
IfExist, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini
Gosub, ReadSettingsHotKeys
else
{
    Hotkey1 = !1
    Hotkey2 = !2
    Hotkey3 = !3
    Hotkey4 = !4
    Hotkey5 = NumpadSub
    Hotkey6 = NumpadMult
    Hotkey7 = !z
    Hotkey8 = !x
}

back3:
IfExist, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini
Gosub, ReadLimitSettings
else
{
    limit = 60
}

back4:
;~ fileinstall, image\background1.png , %a_temp%\background1.png
;~ fileinstall, image\background2.png , %a_temp%\background2.png
;~ fileinstall, image\background4.png , %a_temp%\background4.png
;~ fileinstall, image\tuturu.mp3 , %a_temp%\tuturu.mp3
;~ fileinstall, image\kuristina.mp3 , %a_temp%\kuristina.mp3
;~ fileinstall, image\stupid.mp3 , %a_temp%\stupid.mp3
;~ Gui, +hwndhGui1
;~ random, prerandom, 1, 9
;~ if (prerandom = 1) or (prerandom = 4) or (prerandom = 7)
;~ {
    ;~ random, guiin, 7, 9
    ;~ if (guiin = 7)
    ;~ {
        ;~ guirandom := 2
    ;~ }
    ;~ if (guiin = 8)
    ;~ {
        ;~ guirandom := 1
    ;~ }
    ;~ if (guiin = 9)
    ;~ {
        ;~ guirandom := 3
    ;~ }
;~ }
;~ if (prerandom = 2) or (prerandom = 5) or (prerandom = 8)
;~ {
    ;~ random, guiin, 4, 6
    ;~ if (guiin = 4)
    ;~ {
        ;~ guirandom := 2
    ;~ }
    ;~ if (guiin = 5)
    ;~ {
        ;~ guirandom := 1
    ;~ }
    ;~ if (guiin = 6)
    ;~ {
        ;~ guirandom := 3
    ;~ }
;~ }
;~ if (prerandom = 3) or (prerandom = 6) or (prerandom = 9)
;~ {
    ;~ random, guiin, 1, 3
    ;~ if (guiin = 1)
    ;~ {
        ;~ guirandom := 2
    ;~ }
    ;~ if (guiin = 2)
    ;~ {
        ;~ guirandom := 1
    ;~ }
    ;~ if (guiin = 3)
    ;~ {
        ;~ guirandom := 3
    ;~ }
;~ }
;~ if (guirandom == 1)
;~ {
;~ Gui, Add, Picture, x-8 y-1 w1220 h720 , %a_temp%\background1.png
;~ SoundPlay, %a_temp%\kuristina.mp3
;~ }
;~ if (guirandom == 2)
;~ {
;~ Gui, Add, Picture, x442 y199 w350 h670 , %a_temp%\background2.png
;~ SoundPlay, %a_temp%\tuturu.mp3
;~ }
;~ if (guirandom == 3)
;~ {
;~ Gui, Add, Picture, x412 y199 w400 h390 , %a_temp%\background4.png
;~ SoundPlay, %a_temp%\stupid.mp3
;~ }
;~ Gui, Add, Radio, x362 y49 w100 h30 gCheck vRadioGroup1 %Ch1%, ВКЛ\ВЫКЛ
;~ Gui, Add, Radio, x632 y29 w110 h20 gCheck vRadioGroup2 %Ch2%, ВКЛ\ВЫКЛ
;~ Gui, Add, GroupBox, x12 y9 w220 h80 , Пользовательская информация
;~ Gui, Add, GroupBox, x242 y9 w230 h80 , Рация с отыгровкой диспетчера
;~ Gui, Add, GroupBox, x482 y9 w280 h50 , Рация без отыгровки диспетчера \ Тэговая рация
;~ Gui, Add, GroupBox, x482 y69 w280 h50 , Организация
;~ Gui, Add, DropDownList, x72 y59 w100 h200 vSex, Мужщина|Женщина
;~ GuiControl, ChooseString, Sex, %Sex%
;~ Gui, Add, DropDownList, x572 y89 w100 h160 vOrgan, SAPD|FBI|SWAT|CIA
;~ GuiControl, ChooseString, Organ, %Organ%
;~ Gui, Add, CheckBox, x252 y49 w100 h30 vEngVer %Ch3%, АНГЛ. ВЕРСИЯ
;~ Gui, Add, Edit, x22 y29 w90 h20 vName, %Name%
;~ Gui, Add, Edit, x122 y29 w100 h20 vSurname, %Surname%
;~ Gui, Add, Edit, x252 y29 w90 h20 vMarking, %Marking%
;~ Gui, Add, Edit, x352 y29 w100 h20 vRank, %Rank%
;~ Gui, Add, Edit, x492 y29 w100 h20 vTag, %Tag%
;~ Gui, Add, Button, x12 y519 w100 h30 gDownloadSamp, СКАЧАТЬ SAMP
;~ Gui, Add, Button, x122 y519 w100 h30 gButtonSave, СОХРАНИТЬ!
;~ Gui, Add, Button, x232 y519 w100 h30 gOpen, ЗАПУСК!!!
;~ Gui, Add, Text, x12 y499 w320 h20 , Не работает F1 \ Биндер ? - Скачай нашу версию SAMP
;~ Gui, Add, Button, x12 y219 w20 h80 gAnimation, <
;~ Gui, Add, Text, x42 y249 w60 h30 +Center, Настройка клавиш
;~ Gui, 2:Add, Hotkey, x12 y19 w50 h20 vHotKey1, %HotKey1%
;~ GuiControl, ChooseString, HotKey1, %HotKey1%
;~ Gui, 2:Add, Text, x72 y19 w100 h30 , - Ситуация "Трафик-Стоп".
;~ Gui, 2:Add, Hotkey, x12 y59 w50 h20 vHotKey2, %HotKey2%
;~ Gui, 2:Add, Text, x72 y59 w110 h30 , - Ситуация "Арест" (57v`, 66).
;~ Gui, 2:Add, Hotkey, x12 y99 w50 h20 vHotKey3, %HotKey3%
;~ Gui, 2:Add, Text, x72 y99 w130 h20 , - Ситуация "Теракт".
;~ Gui, 2:Add, Hotkey, x12 y139 w50 h20 vHotKey4, %HotKey4%
;~ Gui, 2:Add, Text, x72 y139 w130 h20 , - Меню "Рация".
;~ Gui, 2:Add, Hotkey, x12 y179 w50 h20 vHotKey5, %HotKey5%
;~ Gui, 2:Add, Hotkey, x12 y219 w50 h20 vHotKey6, %HotKey6%
;~ Gui, 2:Add, Hotkey, x12 y259 w50 h20 vHotKey7, %HotKey7%
;~ Gui, 2:Add, Hotkey, x12 y299 w50 h20 vHotKey8, %HotKey8%
;~ Gui, 2:Add, Text, x72 y179 w140 h20 , - Фиксация на машине.
;~ Gui, 2:Add, Text, x72 y219 w140 h30 , - Сброс данных о машине.
;~ Gui, 2:Add, Text, x72 y259 w50 h20 , - Лимит
;~ Gui, 2:Add, Edit, x122 y259 w30 h20 vlimit, %limit%
;~ Gui, 2:Add, Text, x162 y259 w40 h20 , км\час
;~ Gui, 2:Add, Text, x72 y299 w140 h20 , - Отыгровка часов + F8
;~ Gui, 2:Add, Button, x122 y329 w100 h30 gSaveButton, Сохранить.
;~ Gui, Add, Button, x82 y449 w190 h60 , Выключить или включить музыкальные шедевры от автора
;~ Gui, Show, w788 h565, Officer Adjutant by Cooper.
;~ return
fileinstall, image\backgrond1.png , %a_temp%\backgrond1.png
fileinstall, image\backgrond2.png , %a_temp%\backgrond2.png
fileinstall, image\backgrond3.png , %a_temp%\backgrond3.png
fileinstall, image\backgrond4.png , %a_temp%\backgrond4.png
fileinstall, image\backgrond5.png , %a_temp%\backgrond5.png
fileinstall, image\backgrond6.png , %a_temp%\backgrond6.png
fileinstall, image\strob.png , %a_temp%\strob.png
fileinstall, image\tuturu.mp3 , %a_temp%\tuturu.mp3
IniRead, vupd, %a_temp%\verlen.ini, UPD, v
Gui, +hwndhGui1
IniRead nextbackground, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configmenu.ini, Background, Number
nextbackground++
IniWrite, %nextbackground%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configmenu.ini, Background, Number
if (nextbackground == 1)
{
    Gui, Add, Picture, x-8 y-1 w800 h590 , %a_temp%\backgrond1.png
}
else if (nextbackground == 2)
{
    Gui, Add, Picture, x-8 y-1 w800 h570 , %a_temp%\backgrond2.png
}
else if (nextbackground == 3)
{
    Gui, Add, Picture, x-8 y-1 w820 h570 , %a_temp%\backgrond3.png
}
else if (nextbackground == 4)
{
    Gui, Add, Picture, x-8 y-1 w800 h570 , %a_temp%\backgrond4.png
}
else if (nextbackground == 5)
{
    Gui, Add, Picture, x-8 y-1 w800 h570 , %a_temp%\backgrond5.png
}
else if (nextbackground >= 6)
{
    Gui, Add, Picture, x-8 y-1 w800 h570 , %a_temp%\backgrond6.png
    nextbackground := 0
    IniWrite, %nextbackground%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configmenu.ini, Background, Number
}
Gui, Add, Picture, x712 y0 w80 h80, %a_temp%\strob.png
Gui, Add, Radio, x352 y79 w60 h20 gCheck vRadioGroup1 %Ch1%, ON\OFF
Gui, Add, Radio, x132 y129 w70 h20 gCheck vRadioGroup2 %Ch2%, ON\OFF
Gui, Add, CheckBox, x242 y79 w100 h20 vEngVer %Ch3%, АНГЛ. ВЕРСИЯ
SoundPlay, %a_temp%\tuturu.mp3
Gui, Add, Edit, x22 y29 w100 h20 vName, %Name%
Gui, Add, Edit, x132 y29 w100 h20 vSurname, %Surname%
Gui, Add, DropDownList, x252 y29 w100 h180 vSex, Мужчина|Женщина
GuiControl, ChooseString, Sex, %Sex%
Gui, Add, GroupBox, x12 y9 w460 h50 , Информация о пользователе
Gui, Add, Edit, x22 y79 w100 h20 vMarking, %Marking%
Gui, Add, Edit, x132 y79 w100 h20 vRank, %Rank%
Gui, Add, GroupBox, x12 y59 w410 h50 , Рация с отыгровкой диспетчера
Gui, Add, Edit, x22 y129 w100 h20 vTag, %Tag%
Gui, Add, GroupBox, x222 y109 w110 h50 , Время ожидания(в м\с).
Gui, Add, Edit, x232 y129 w90 h20 vSleepingtime, %sleepingtime%
Gui, Add, DropDownList, x362 y29 w100 h70 vOrgan, SAPD|FBI|SWAT|CIA
GuiControl, ChooseString, Organ, %Organ%
Gui, Add, GroupBox, x12 y109 w200 h50 , Тэговый вариант рации
Gui, Add, Button, x12 y519 w100 h30  gButtonSave, СОХРАНИТЬ!
Gui, Add, Button, x122 y519 w100 h30 gOpen, ЗАПУСК!!!
Gui, Add, Button, x12 y479 w100 h30 gDownloadSamp, СКАЧАТЬ SAMP
Gui, Add, Button, x12 y219 w20 h80 gAnimation, <
Gui, Add, Text, x42 y249 w60 h30 +Center, Настройка клавиш
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
Gui, 2:Add, Button, x122 y329 w100 h30 gSaveButton, Сохранить.
Gui, Add, Text, x12 y439 w160 h30 , Не работает F1 \ Биндер ? - Скачай нашу версию SAMP
;~ Gui, Add, Button, x82 y449 w190 h60 , Выключить или включить музыкальные шедевры от автора
; Generated using SmartGUI Creator for SciTE
Gui, Show, w788 h565, Adjutant by Cooper ver: %vupd%
return

animation:
Gui, Submit, NoHide
   WinGetPos, X, Y, W,, ahk_id %hGui1%
   Gui, +AlwaysOnTop
   Loop
   {
      Sleep, 10
      Gui, 2:Show, % "x" (x2 := X - A_Index*4) " y" Y+100 " w" 250 " h" 365 " NA", Настройки
   } Until x2 <= X-252
	Gui, -AlwaysOnTop
return


GuiClose:
ExitApp
return

Check:
Gui, Submit, NoHide
Loop, 2
if (RadioGroup%A_Index% == 1)
{
    if (A_Index = 1)
    {
        Radio1:=1
        Radio2:=0
    }
    else if (A_Index = 2)
    {
        Radio1:=0
        Radio2:=1
    }
}
Return

DownloadSamp:
{
    SplashTextOn, , 60, Менеджер обновлений,  Ожидайте`n------------------------`nСкачиваем SAMP
    URLDownloadToFile, https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/samp.exe, %a_temp%\samp.exe
    sleep, 500
    SplashTextOn, , 60, Менеджер обновлений,  Ожидайте`n------------------------`nЗапускаем установщик
    sleep, 500
    SplashTextoff
    run, %a_temp%\samp.exe
}
return

Open:
TrayTip, Officer Adjutant by Cooper, Вы запустили биндер!                                               Нажмите в игре F1 для того что-бы попасть в меню.,4,1
Gui, Submit
Gui, 2:Submit
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
loop, 8
if Hotkey%A_Index% not contains "!", "+", "^", "#"
{
NameKey%A_Index% := Hotkey%A_Index%
}
loop, 8
if Hotkey%A_Index% contains !
{
NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "!(.*)", "alt + $1")
}
loop, 8
if Hotkey%A_Index% contains +
{
NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "+(.*)", "shift + $1")
}
loop, 8
if Hotkey%A_Index% contains ^
{
NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "^(.*)", "ctrl + $1")
}
loop, 8
if Hotkey%A_Index% contains #
{
NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "#(.*)", "win + $1")
}
if Sex = Мужчина
{
    Female =
    Female1 = ка
    Female2 = вается
    Female3 = одит
    Female4 = ся
    Female5 = он
    Female6 =
    Female7 = ел
    Female8 = ёл
    Female9 = ёлся
    Female10 = яет
    Female11 = ёс
    Famele12 = 'a
    Famele13 = ен
}
if Sex = Женщина
{
    Female = а
    Female1 = цы
    Female2 = лась
    Female3 = ела
    Female4 = ась
    Female5 = она
    Female6 = ла
    Female7 = ла
    Female8 = ела
    Female9 = лась
    Female10 = ила
    Female11 = есла
    Famele12 =
    Famele13 = на
}
if Organ = SAPD
{
    Org = полиции
    Org1 = SAPD
    Org2 = Управления Полиции SA
    Org3 = Офицер Полиции San Andreas
    Org4 = Управление полиции San-Andreas
    Org5 = сотрудник Управления Полиции SA
    Org7 = ПОЛИЦИЯ
    if (engver = 1)
    {
        Org6 := "PDHQ"
    }
    else
    Org6 = гаража ЛСПД
}
if Organ = FBI
{
    Org = федерального бюро
    Org1 = FBI
    Org2 = Федерального Бюро
    Org3 = Агент Федерального Бюро Расследований
    Org4 = Федральное Бюро Расследований
    Org5 = агент Федерального Бюро LS
    Org7 = ФЕДЕРАЛЬНОЕ БЮРО
    if (engver = 1)
    {
        Org6 := "Garage FBI"
    }
    else
    Org6 = гаража ФБР
}
if Organ = SWAT
{
    Org = специального подразделения
    Org1 = SWAT
    Org2 = Cпециального Подразделения
    Org3 = Офицер Специального Подразделения
    Org4 = Специальное Подразделения SA
    Org5 = офицер Спец. Подразделения SA
    Org7 = СПЕЦНАЗ
    if (engver = 1)
    {
        Org6 := "Garage SWAT"
    }
    else
    Org6 = гаража СВАТ
}
if Organ = CIA
{
    Org = разведывательного агентства
    Org1 = CIA
    Org2 = Разведывательного Агентства
    Org3 = Агент Разведывательного Агенства.
    Org4 = Центральное Разведывательное Агенство.
    Org5 = агент Разведывательного Агенства SA.
    Org7 = ЦЕНТРАЛЬНОЕ АГЕНТСВО
    if (engver = 1)
    {
        Org6 := "Garage CIA"
    }
    else
    Org6 = гаража ЦРУ
}
if PartnerSurname!=0
{
    Partner:=1
}
if PartnerId!=0
{
    Partner:=2
}
if PartnerPost!=0
{
    Partner := 3
}
if (PartnerSurname == 0 or None)
{
    PartnerSurname = "None"
    Partner := 0
}
if (PartnerId == 0 or None)
{
    PartnerId = "None"
    Partner := 0
}
if (PartnerPost == 0 or None)
{
    PartnerPost = "None"
    Partner := 0
}
if (ch1 = "Checked")
{
    Radio1:=1
    Radio2:=0
}
if (ch2 = "Checked")
{
    Radio1:=0
    Radio2:=1
}
gosub, autoweapons