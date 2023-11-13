;~ fileinstall, image\background3.jpg , %a_temp%\background3.jpg
;~ Gui, Add, Picture, x-8 y-1 w700 h500 , %a_temp%\background3.jpg
;~ Gui, Add, Radio, x372 y59 w100 h20 gCheck vRadioGroup1 %Ch1%, ВКЛ\ВЫКЛ
;~ GuiControl, ChooseString, RadioGroup1, %RadioGroup1%
;~ Gui, Add, Radio, x522 y59 w110 h20 gCheck vRadioGroup2 %Ch2%, ВКЛ\ВЫКЛ
;~ GuiControl, ChooseString, RadioGroup2, %RadioGroup2%
;~ Gui, Add, Button, x212 y189 w100 h30 gButtonSave, СОХРАНИТЬ!
;~ Gui, Add, Button, x352 y189 w100 h30 gOpen, ЗАПУСК!!!
;~ Gui, Add, Button, x282 y249 w100 h30 gDownloadSamp, SAMP 0.3.7
;~ Gui, Add, Text, x170 y100 w358, Не работает биндер ? Скачайте SAMP 0.3.7 кликнув по кнопке ниже.
;~ Gui, Add, Edit, x22 y29 w100 h20 vName, %Name%
;~ Gui, Add, Edit, x132 y29 w100 h20 vSurname, %Surname%
;~ Gui, Add, DropDownList, x82 y59 w100 h150 vSex, Мужщина|Женщина
;~ GuiControl, ChooseString, Sex, %Sex%
;~ Gui, Add, Edit, x262 y29 w100 h20 vMarking, %Marking%
;~ Gui, Add, Edit, x372 y29 w100 h20 vRank, %Rank%
;~ Gui, Add, DropDownList, x292 y129 w80 h150 vOrgan, SAPD|FBI|SWAT|CIA
;~ GuiControl, ChooseString, Organ, %Organ%
;~ Gui, Add, GroupBox, x12 y9 w230 h80 , Пользовательская информация
;~ Gui, Add, Edit, x522 y29 w110 h20 vTag, %Tag%
;~ Gui, Add, GroupBox, x252 y9 w390 h80 , Рация
;~ Gui, Add, CheckBox, x262 y59 w100 h20 vEngVer %Ch3%, АНГЛ. ВЕРСИЯ
;~ Gui, Show, w687 h497, Officer Adjutant by Cooper.

fileinstall, image\background1.png , %a_temp%\background1.png
fileinstall, image\background2.png , %a_temp%\background2.png
fileinstall, image\background4.png , %a_temp%\background4.png
fileinstall, image\tuturu.mp3 , %a_temp%\tuturu.mp3
fileinstall, image\kuristina.mp3 , %a_temp%\kuristina.mp3
fileinstall, image\stupid.mp3 , %a_temp%\stupid.mp3
random, guiin, 1, 3
if (guiin == 1)
{
Gui, Add, Picture, x-8 y-1 w1220 h720 , %a_temp%\background1.png
SoundPlay, %a_temp%\kuristina.mp3
}
if (guiin == 2)
{
Gui, Add, Picture, x442 y199 w350 h670 , %a_temp%\background2.png
SoundPlay, %a_temp%\tuturu.mp3
}
if (guiin == 3)
{
Gui, Add, Picture, x412 y199 w400 h390 , %a_temp%\background4.png
SoundPlay, %a_temp%\stupid.mp3
}
Gui, Add, Radio, x362 y49 w100 h30 gCheck vRadioGroup1 %Ch1%, ВКЛ\ВЫКЛ
Gui, Add, Radio, x632 y29 w110 h20 gCheck vRadioGroup2 %Ch2%, ВКЛ\ВЫКЛ
Gui, Add, GroupBox, x12 y9 w220 h80 , Пользовательская информация
Gui, Add, GroupBox, x242 y9 w230 h80 , Рация с отыгровкой диспетчера
Gui, Add, GroupBox, x482 y9 w280 h50 , Рация без отыгровки диспетчера \ Тэговая рация
Gui, Add, GroupBox, x482 y69 w280 h50 , Организация
Gui, Add, DropDownList, x72 y59 w100 h200 , vSex, Мужщина|Женщина
GuiControl, ChooseString, Sex, %Sex%
Gui, Add, DropDownList, x572 y89 w100 h160 vOrgan, SAPD|FBI|SWAT|CIA
GuiControl, ChooseString, Organ, %Organ%
Gui, Add, CheckBox, x252 y49 w100 h30 vEngVer %Ch3%, АНГЛ. ВЕРСИЯ
Gui, Add, Edit, x22 y29 w90 h20 vName, %Name%
Gui, Add, Edit, x122 y29 w100 h20 vSurname, %Surname%
Gui, Add, Edit, x252 y29 w90 h20 vMarking, %Marking%
Gui, Add, Edit, x352 y29 w100 h20 vRank, %Rank%
Gui, Add, Edit, x492 y29 w100 h20 vTag, %Tag%
Gui, Add, Button, x12 y519 w100 h30 gDownloadSamp, СКАЧАТЬ SAMP
Gui, Add, Button, x122 y519 w100 h30 gButtonSave, СОХРАНИТЬ!
Gui, Add, Button, x232 y519 w100 h30 gOpen, ЗАПУСК!!!
Gui, Add, Button, x82 y449 w190 h60 , Выключить или включить музыкальные шедевры от автора
Gui, Show, w788 h565, Officer Adjutant by Cooper.

Check:
Return

DownloadSamp:
return

Open:
return

ButtonSave:
return