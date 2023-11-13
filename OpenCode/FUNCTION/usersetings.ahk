ReadSettingsInfo:
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСканирую данные
sleep, 1000
SplashTextoff
IniRead, Name, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Name
IniRead, Surname, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Surname
IniRead, Marking, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Marking
IniRead, Rank, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Rank
IniRead, Sex, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Sex
IniRead, Organ, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Organ
IniRead, Tag, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Tag
IniRead, Sleepingtime, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Sleepingtime
IniRead, RadioGroup1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, One
IniRead, RadioGroup2, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, Two
IniRead, EngVer, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, Eng
if (RadioGroup1 == 1)
Ch1 = Checked
if (RadioGroup2 == 1)
Ch2 = Checked
if (EngVer == 1)
Ch3 = Checked
;~ goto, back1
if sex = Мужщина
{
    IniWrite, Мужчина, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Sex
    Reload
}
return

ReadSettingsPartner:
IniRead, PartnerSurname, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Surname
IniRead, PartnerId, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Id
IniRead, PartnerPost, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Post
;~ goto, back2
return

ReadSettingsHotKeys:
IniRead, HotKey1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey1
IniRead, HotKey2, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey2
IniRead, HotKey3, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey3
IniRead, HotKey4, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey4
IniRead, HotKey5, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey5
IniRead, HotKey6, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey6
IniRead, HotKey7, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey7
IniRead, HotKey8, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey8
;~ goto, back3
return

ReadLimitSettings:
IniRead, limit, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, Limit
;~ goto, back4
return

ButtonSave:
Gui, Submit, NoHide
IniWrite, %Name%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Name
IniWrite, %Surname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Surname
IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Marking
IniWrite, %Rank%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Rank
IniWrite, %Sex%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Sex
IniWrite, %Organ%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Organ
IniWrite, %Tag%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Tag
IniWrite, %Sleepingtime%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Information, Sleepingtime
sleep, 200
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСканирую данные
sleep, 1000
IniWrite, %partnerSurname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Surname
IniWrite, %partnerId%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Id
IniWrite, %partnerPost%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\partner.ini, Partner, Post
IniWrite, %RadioGroup1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, One
IniWrite, %RadioGroup2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, Two
IniWrite, %EngVer%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\config.ini, Radio, Eng
sleep, 200
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСохранил всю информацию
sleep, 1000
SplashTextoff
Return

SaveButton:
Gui, Submit, NoHide
IniWrite, %HotKey1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey1
IniWrite, %HotKey2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey2
IniWrite, %HotKey3%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey3
IniWrite, %HotKey4%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey4
IniWrite, %HotKey5%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey5
IniWrite, %HotKey6%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey6
IniWrite, %HotKey7%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey7
IniWrite, %HotKey8%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\hotkeys.ini, List, HotKey8
IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\limit.ini, Lists, limit
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСохранил всю информацию
sleep, 1000
SplashTextoff
return
