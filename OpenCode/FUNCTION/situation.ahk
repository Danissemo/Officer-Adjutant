﻿;~ #Include udfold.ahk
;~ #Include autogun.ahk

;~ !sc2C::
;~ if (limits==0)
;~ {
    ;~ SendChat("/limit 60")
    ;~ limits:=1
;~ }
;~ else if (limits==1)
;~ {
    ;~ SendChat("/limit 0")
    ;~ limits:=0
;~ }
;~ return

Active7: ; Активация/ Деактивация
active := !active
SendChat((active ? "/limit " limit "":"/limit 0"))
Return

Active8:
random, randt, 1, 2
if (randt == 1)
{
    SendChat("/me закатал" Female " рукав, взглянул" Female " на часы марки*G-Shock* с гравировкой*FRAPS*.")
    Sleep, %sleepingtime%
    SendChat("/time")
    sleep, 200
    Sendinput, {f8}{Enter}
}
if (randt == 2)
{
    SendChat("/me пафосным видом согнул" Female " правую руку к лицу, после чего посмотрел" Female " на свои*iTimes*")
    Sleep, %sleepingtime%
    SendChat("/time")
    sleep, 200
    Sendinput, {f8}{Enter}
}
return

:?:/mask::
    SendChat("/mask")
    Sleep, %sleepingtime%
    checkfile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    FileRead, info, %checkfile%
    text = %info%
    if text contains Ваше местоположение на карте скрыто!
    {
        random, randtmask, 1, 2
        if (randtmask == 1)
        {
            SendChat("/do У " name "'а во внутреннем кармане пиджака есть балаклава.")
            Sleep, %sleepingtime%
            SendChat("/me хлопнул" Female " себя правой рукой по внутреннему карману, нащупав балаклаву достал" Female " её.")
            Sleep, %sleepingtime%
        }
        if (randtmask == 2)
        {
            SendChat("/do У " surname "'а была маска напоминающая балаклаву внутри пиджака.")
            Sleep, %sleepingtime%
            SendChat("/me растегнул" Female " пиджак после чего достал" Female " от туда маску, после надел" Female " её.")
            Sleep, %sleepingtime%
        }
    }
    else if text contains Вы сняли маску!
    {
        if (randtmask == 1)
        {
            SendChat("/do У " name "'а на лице лежала балаклава.")
            Sleep, %sleepingtime%
            SendChat("/me подн" Female11 " обе руки к лицу и снял" Female " балаклаву, после чего положил" Female " её в карман.")
            Sleep, %sleepingtime%
        }
        if (randtmask == 2)
        {
            SendChat("/do У " surname "'а лежала маска на лице которая напоминала балаклаву.")
            Sleep, %sleepingtime%
            SendChat("/me растегнул" Female " пиджак после снял" Female " маску с лица и положил" Female " её в пиджак.")
            Sleep, %sleepingtime%
        }
    }
    FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
return

:?:/reps::
random, randt, 1, 2
if (randt == 1)
{
    SendChat("/rep Администрация, пожалуйста, проследите за мной, тут нарущение правил игры.")
}
if (randt == 2)
{
    SendChat("/rep Проследите за мной, тут нарушение правил. Буду благодар" Female13 " если верно оцените ситуацию.")
}
return



;~ ===================================Alt + 1=====================================

Active1:
    SendInput, {F6}/pagesize %page%{Enter}
    sleep, 75
if (zavers==1){
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Выйдите из предыдущего меню и повторите попытку.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F2]{FFFFFF} - Оповестить диспетчера о трафик-стопе. (c 55)")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Остановить водителя, обычный трафик-стоп, используя /m. (c 55)")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Отыгровка скидывания ремня безопасности и выход из машины.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Отыгровка провожения по задней фаре большим пальцем.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Отыгровка стука в окно автомобиля на водительском месте.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Отыгровка представления, используя /showudost.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Отыгровка проверки документов водителя. {F63939} 'ТОЛЬКО В МАШИНЕ'.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Отыгровка изымания вод. прав, используя /take.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Отыгровка выписывания штрафа, используя /ticket.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - Отыгровка помилования нарушителя {F63939}'ПО УСМОТРЕНИЮ ПОЛИЦЕЙСКОГО'.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню ситуации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    obratka4:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka4
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}

        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input , OutputVar, L1 V, {F2}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        }
        if (ErrorLevel = "EndKey:F2") or (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:F2
    {
        55с := 1
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (Radio1 = 1 and EngVer = 1)
        {
            SendChat("/r " Marking " to DISP: *55, Code *four*, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY **")
        }
        else if (Radio1 = 1 and EngVer = 0)
        {
            SendChat("/r " Marking " to DISP: *55, Код *четыре*, *20 " getPlayerZone() ", " M " [AT" su "" City "], недоступен, конец**")
        }
        else if (Radio2 = 1)
        {
            if (partner>=1)
            {
                SendChat("/r " Tag " Докладывает " surname " | Остановили " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
            }
            else
            SendChat("/r " Tag " Докладывает " surname " | Остановил " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
        }
        restarting:=1
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
        goto, obratka4
    }
    if ErrorLevel = EndKey:Numpad1
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не получили информацию о водителе / {FFFFFF}Нажмите [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На торпеде полицейского крузера лежит мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к торпеде, взял" Female " мегафон, поднес" Female6 " его ко рту, сказал" Female ":")
            }
            if (randt = 2)
            {
                SendChat("/do Между седеньями лежал мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к мегафону, после чего взял" Female " его высунул" Female4 " из окна сказав:")
            }
            if (randt = 3)
            {
                SendChat("/do На торпеде был закреплен мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me обхватил" Female " рукоятку мегафона, после чего снял" Female " его с крепежа.")
                Sleep, %sleepingtime%
                SendChat("/do Мегафон находился в руке у " name "" Female12 ".")
            }
            Sleep, %sleepingtime%
            if (M = "Coach") or (M = "Bus")
            {
                SendChat("/m - Водитель автобуса, немедленно прижмитесь к обочине, это " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - Приготовьте документы сидящих в автобусе, и не выходите из автобуса.")
            }
            else if (M = "Cabbie") or (M = "Taxi")
            {
                SendChat("/m - Водитель такси, немедленно прижмитесь к обочине, это " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - Не выходите из своего Т\С и приготовьте документы сидящих в машине!")
            }
            else if (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
            {
                SendChat("/m - Водитель грузовика, немедленно прижмитесь к обочине, это " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - Приготовьте документы, руки на руль. Выходить из грузовика - запрещено!")
            }
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer")
            {
                SendChat("/m - Водитель мотоцикла " M ", прижмитесь к обочине, это " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - Приготовьте документы свои документы, и ожидайте меня возле мотоцикла!")
            }
            else if (M = "Quad")
            {
                SendChat("/m - Водитель квадроцикла, немедленно прижмитесь к обочине.")
                Sleep, %sleepingtime%
                SendChat("/m - Приготовьте документы свои документы, и ожидайте меня возле квадроцикла!")
            }
            else
            {
                Random, randt, 1, 3
                if (randt = 1) {
                    SendChat("/m - Говорит сотрудник " Org2 ". Водитель автомобиля - *" M "*.")
                    Sleep, %sleepingtime%
                    SendChat("/m - Приготовьте документы сидящих в машине, и не выходите своего Т\С")
                }
                if (randt = 2) {
                    SendChat("/m - Говорит " Org1 "! Водитель *" M "*. Остановитесь у обочины!")
                    Sleep, %sleepingtime%
                    SendChat("/m - Не выходите из своего транспортного средства и приготовьте документы!")
                }
                if (randt = 3) {
                    SendChat("/m - Водитель автомобиля *" M "*, прижмитесь к обочине и остановитесь.")
                    Sleep, %sleepingtime%
                    SendChat("/m - Приготовьте документы, руки на руль. Выходить из машины - запрещено!")
                }
            }
            Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/me закончив говорить положил" Female " мегафон обратно на торпеду.")
        }
        if (randt = 2)
        {
            SendChat("/me донес" Female6 " свои требования до правонарушителя, положил" Female " мегафон на место.")
        }
        if (randt = 3)
        {
            SendChat("/me закончив говорить, вернул" Female4 " в кабину, закрепил" Female " мегафон на торпеде.")
        }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/me отслонил" Female " рацию мегафона со рта, после чего закрепил" Female " её возле боротового компютера.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к кнопки ремня отстегнул" Female " ремень после чего открыл" Female " дверь.")
        }
        if (randt = 2) {
            SendChat("/me отстегнул" Female " ремень, потянулся рукой к двери, потянув ручку на себя открыл" Female " дверь.")
            Sleep, %sleepingtime%
            SendChat("/me вышел" Female " из крузера, после чего направил" Female4 " к машине которая была рядом.")
        }
        if (randt = 3) {
            SendChat("/me сняв ремень безопасности проверил" Female " тактильным ощущением оружие находящегося в кобуре.")
            Sleep, %sleepingtime%
            SendChat("/me правой рукой открыл" Female " дверь крузера, после чего выш" Female7 " из машины.")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/me проходя мимо автомобиля, торкнул" Female4 " пальцем к багажнику, тем самим оставил отпечаток.")
        }
        if (randt = 2) {
            SendChat("/me направляючись к окну водителя, провел" Female " рукой по багажнику, оставил" Female " отпечаток.")
        }
        if (randt = 3) {
            SendChat("/me оставил" Female " отпечаток на багажнике автомобиля, одним глазком посматривая на задние съедения.")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        SendChat("/me согнув указательный палец, аккуратно постучал" Female " в окно двери водителя.")
        Sleep, %sleepingtime%
        SendChat("/todo Опустите окно пожалуйста. *показывая жестами человеку в машине о том что нужно открыть окно.")
        Sleep, %sleepingtime%
        SendChat("/me пытается рассмотреть лицо водителя, после салон автомобиля.")
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("Здравствуйте, " Org5 ": " name " " surname " беспокоит.")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " удостоверение сотрудника " Org ".")
            Sleep, %sleepingtime%
        }
        if (randt = 2) {
            SendChat("Добрый день уважаемый, ваше время заберёт сотрудник " Org ": " name " " surname ".")
            Sleep, %sleepingtime%
            SendChat("/me правой рукой открыл" Female " пафосным видом удостоверение сотрудника " Org ".")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
        }
        if (randt = 3) {
            SendChat("Здравствуйте, Вас беспокоит сотрудник " Org2 " - " surname ".")
            Sleep, %sleepingtime%
            SendChat("/do Верхнем кармашке жилета лежит удостоверение.")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
            SendChat("/me движением руки вытащил" Female " удостоверение, показав его человеку напротив.")
            Sleep, %sleepingtime%
        }
    SendInput {F6}/showudost{space}
        KeyWait, Enter, D
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        idskr:=getIdsInAnyVehicle()
        if (idskr == -1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не в машине. / {F63939}Сядьте в машину, и повторите действие.")
            goto, obratka4
        }
        else
        {
            Random, randt, 1, 2
            if (randt = 1) {
                SendChat("/do Компактный бортовой компютер возле " name "а в салоне автомобиля.")
                Sleep, %sleepingtime%
                SendChat("/me клацал" Female " по КБК после чего в итоге включил" Female " его.")
                Sleep, %sleepingtime%
                SendChat("/me заш" Female7 " в базу разыскиваемых, посмотрел" Female " нужную информацию после чего выключил КПК.")
                Sleep, %sleepingtime%
                SendChat("/do Компактный Бортовой Компютер издал звук блокировки.")
                Sleep, %sleepingtime%
                SendChat("/wanted")
            }
            if (randt = 2) {
                SendChat("/do В автомобиле установлен бортовой компьютер.")
                Sleep, %sleepingtime%
                SendChat("/me нажатием кнопки по экрану компьютера, зашел в базу *Staff wanted criminalsl*.")
                Sleep, %sleepingtime%
                SendChat("/me тыкая по клавиатуре ввёл инфомрацию о водителе читая её с документа.")
                Sleep, %sleepingtime%
                SendChat("/do Информация о водителе высветилась на бортовом компютере.")
                Sleep, %sleepingtime%
                SendChat("/wanted")
            }
            goto, obratka4
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/do В руке у " name "а был включённый коммуникатор.")
            Sleep, %sleepingtime%
            SendChat("/me вош" Female7 " в раздел Лицензии, после чего ввёл" Female " данные о нарушителе.")
            Sleep, %sleepingtime%
            SendChat("/me заполнив данные, нажал" Female " на [Enter], после чего выключил" Female " Коммуникатор.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        if (randt = 2) {
            SendChat("/me правой рукой из верхнего кармана достал" Female " бланк, после ручку.")
            Sleep, %sleepingtime%
            SendChat("/do Бланк и ручка в руках у " name "а.")
            Sleep, %sleepingtime%
            SendChat("/me заполняет бланк ручкой, вписывая каждые пропуски.")
            Sleep, %sleepingtime%
            SendChat("/do Через некоторое время заполнил" Female " бланк.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        if (randt = 3) {
            SendChat("/me достал из внутреннего кармана пиджака пакетик для улик.")
            Sleep, %sleepingtime%
            SendChat("/me забрал у нарушителя запрещенные предметы, положив их в пакетик.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        SendMessage, 0x50,, 0x4190419,,A
        SendChat("/do На поясе у " name "а планшет с блаками для штрафов.")
        Sleep, %sleepingtime%
        SendChat("/me резким движением руки, вытягивает один бланк, после берёт его в руки.")
        Sleep, %sleepingtime%
        SendChat("/me заполняет бланк взяв ручку из нагрудного кармана.")
        Sleep, %sleepingtime%
        SendChat("/do Через некоторое время заполнил" Female " бланк полностью.")
        Sleep, %sleepingtime%
        SendChat("/me передал" Female " человеку напротив заполненный бланк.")
        Sleep, %sleepingtime%
    SendInput {F6}/ticket{space}
        KeyWait, Enter, D
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        SendChat("Хорошо, на этот раз я Вас отпускаю, но еще раз увижу, дам по шапке.")
        Sleep, %sleepingtime%
        SendChat("/todo Счастливой дороги. И да, я слежу за Вами. *символизировал жест двумя пальцами с глаза на глаз.")
        Sleep, %sleepingtime%
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню ситуации. {00FF00}Продолжайте работу.")
    }
    zavers:=0
}
return

;~ ===================================Alt + 2=====================================

Active2:
    SendInput, {F6}/pagesize %page%{Enter}
    sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Выйдите из предыдущего меню и повторите попытку.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F2]{FFFFFF} - Оповестить диспетчера в рацию о погоне (c 57v).")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F3]{FFFFFF} - Оповестить диспетчера в рацию о остановке повышенного риска (c 66).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Остановить нарушителя закона, используя /m - (c 57v) {F63939} *ДЛЯ ПРЕСТУПНИКА*.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Заставить водителя и пассажиров выйти на дорогу и лечь на асфальт, используя /m. (c 66).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Закрепить на руках нарушителя наручники, используя /cuff.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Повести нарушителя за собой, используя /gotome.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Посадить преступника в машину, используя /cput.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Зачитать правило миранды нарушителю, в машине.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Затащить нарушителя в участок, используя /ceject.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Открыть КПЗ, после чего посадить преступника за решетку используя /arrest.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню ситуации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    obratka3:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka3
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input , OutputVar, L1 V, {F2}{F3}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{End}
        }
        if (ErrorLevel = "EndKey:F2") or (ErrorLevel = "EndKey:F3") or (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:F2
    {
        if (sbros == 1)
        {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не получили информацию о водителе / {FFFFFF}Нажмите [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            57v := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
            }
            if (randt = 2)
            {
                SendChat("/me снял" Female " полицейскую рацию с бронежилета")
                Sleep, %sleepingtime%
                SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
            }
            if (randt = 3)
            {
                SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
                Sleep, %sleepingtime%
                SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
            }
            Sleep, %sleepingtime%
            if (Radio1 = 1 and EngVer = 1)
        {
            SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY **")
        }
        else if (Radio1 = 1 and EngVer = 0)
        {
            SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M " [AT" su "" City "], недоступен, конец**")
        }
        else if (Radio2 = 1)
        {
            if (partner>=1)
            {
                SendChat("/r " Tag " Докладывает " surname " | Погоня за " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
            }
            else
            SendChat("/r " Tag " Докладывает " surname " | Погоня за  " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
        }
        restarting:=1
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
            }
            if (randt = 2)
            {
                SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
            }
            if (randt = 3)
            {
                SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
            }
        }
        goto, obratka3
    }
        if ErrorLevel = EndKey:F3
    {
    if (sbros == 1)
        {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не получили информацию о водителе / {FFFFFF}Нажмите [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            66c := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
            }
            if (randt = 2)
            {
                SendChat("/me снял" Female " полицейскую рацию с бронежилета")
                Sleep, %sleepingtime%
                SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
            }
            if (randt = 3)
            {
                SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
                Sleep, %sleepingtime%
                SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
            }
            Sleep, %sleepingtime%
           if (Radio1 = 1 and EngVer = 1)
        {
            SendChat("/r " Marking " to DISP: *66, Code *one*, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY**")
        }
        else if (Radio1 = 1 and EngVer = 0)
        {
            SendChat("/r " Marking " to DISP: *66, Код*один*, *20 " getPlayerZone() ", " M " [AT" su "" City "], недост., конец**")
        }
        else if (Radio2 = 1)
        {
            if (partner>=1)
            {
                SendChat("/r " Tag " Докладывает " surname " | Остановили " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
            }
            else
            SendChat("/r " Tag " Докладывает " surname " | Остановил " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
        }
        restarting:=1
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
            }
            if (randt = 2)
            {
                SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
            }
            if (randt = 3)
            {
                SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
            }
        }
        goto, obratka3
    }
    if ErrorLevel = EndKey:Numpad1
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не получили информацию о водителе / {FFFFFF}Нажмите [{F63939}" NameKey6 "{FFFFFF}]")
            goto, obratka3
        }
        else if (sbros == 0)
        {
            57v := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На торпеде полицейского крузера лежит мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к торпеде, взял" Female " мегафон, после поднес" Female6 " его ко рту, сказав:")
            }
            if (randt = 2)
            {
                SendChat("/do Между седеньями лежал мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к мегафону, после чего взял" Female " его высунул" Female4 " из окна, сказав:")
            }
            if (randt = 3)
            {
                SendChat("/do На торпеде был закреплен мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me обхватил" Female " рукоятку мегафона, после чего снял" Female " его с крепежа.")
                Sleep, %sleepingtime%
                SendChat("/do Мегафон находился в руке у " name "" Female12 ".")
            }
            Sleep, %sleepingtime%
            if (M = "Coach") or (M = "Bus")
            SendChat("/m - Водитель автобуса, немедленно прижмитесь к обочине, это " Org1 "!")
            else if (M = "Cabbie") or (M = "Taxi")
            SendChat("/m - Водитель такси, немедленно прижмитесь к обочине, это " Org1 "!")
            else if (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
            SendChat("/m - Водитель грузовика, немедленно прижмитесь к обочине, это " Org1 "!")
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer")
            SendChat("/m - Водитель мотоцикла " M ", немедленно прижмитесь к обочине, это " Org1 "!")
            else if (M = "Quad")
            SendChat("/m - Водитель квадроцикла, немедленно прижмитесь к обочине, это " Org1 "!")
            else
            Random, randt, 1, 2
            {
                if (randt == 1)
                {
                    SendChat("/m - Говорит " Org3 ". Водитель автомобиля марки - *" M "* ")
                    Sleep, %sleepingtime%
                    SendChat("/m - Прижмитесь к обочине! В противном случае мы можем открыть огонь.")
                }
                else if (randt == 2)
                {
                    SendChat("/m - Говорит " Org1 "! Водитель *" M "*. Остановитесь у обочины!")
                }
            }
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/me закончив говорить положил" Female " мегафон обратно на торпеду.")
            }
            if (randt = 2)
            {
                SendChat("/me донес" Female6 " свои требования до правонарушителя, положил" Female " мегафон на место.")
            }
            if (randt = 3)
            {
                SendChat("/me закончив говорить, вернул" Female4 " в кабину, закрепил" Female " мегафон на торпеде.")
            }
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}Вы не получили информацию о водителе / {FFFFFF}Нажмите [{F63939}" NameKey6 "{FFFFFF}]")
            goto, obratka3
        }
        else if (sbros == 0)
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На торпеде полицейского крузера лежит мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к торпеде, взял" Female " мегафон, после поднес" Female6 " его ко рту, сказав:")
            }
            if (randt = 2)
            {
                SendChat("/do Между седеньями лежал мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " к мегафону, после чего взял" Female " его высунул" Female4 " из окна, сказав:")
            }
            if (randt = 3)
            {
                SendChat("/do На торпеде был закреплен мегафон.")
                Sleep, %sleepingtime%
                SendChat("/me обхватил" Female " рукоятку мегафона, после чего снял" Female " его с крепежа.")
                Sleep, %sleepingtime%
                SendChat("/do Мегафон находился в руке у " name "" Female12 ".")
            }
            Sleep, %sleepingtime%
            if (M = "Coach") or (M = "Bus") or (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
            {
                SendChat("/m - Вытащите ключ из замка зажигания, откройте окно и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Водитель и пассажиры, если такие имеються, медленно выйдите на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Затем ложитесь на дорогу и никаких резких движений.")
            }
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer") or (M = "Quad")
            {
                SendChat("/m - Вытащите ключ из замка зажигания и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Поднимите руки, и слезайте с транспортного средства.")
                Sleep, %sleepingtime%
                SendChat("/m - Не оборачиваясь на меня ложитесь на асфальт, руки положите на голову!")
            }
            else
            {
                SendChat("/m - Вытащите ключ из замка зажигания, откройте окно и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Водитель и пассажир, если такой имеется, вытащите руки из окна...")
                Sleep, %sleepingtime%
                SendChat("/m - ...затем откройте боковую дверь снаружи.")
                Sleep, %sleepingtime%
                SendChat("/m - Выйдите из автомобиля и медленно пройдите спиной ко мне к центру дороги.")
                Sleep, %sleepingtime%
                SendChat("/m - Затем ложитесь на дорогу и никаких резких движений.")
            }
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/me закончив говорить положил" Female " мегафон обратно на торпеду.")
            }
            if (randt = 2)
            {
                SendChat("/me донес" Female6 " свои требования до правонарушителя, положил" Female " мегафон на место.")
            }
            if (randt = 3)
            {
                SendChat("/me закончив говорить, вернул" Female4 " в кабину, закрепил" Female " мегафон на торпеде.")
            }
            goto, obratka3
        }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        zones:=getPlayerZone()
        Random, randt, 1, 6
        if (randt = 1) {
            SendChat("/me навали" Female2 " на человека, достает наручники с ручного держателя.")
            Sleep, %sleepingtime%
            SendChat("/me заводит" Female3 " обе его руки за спину, надевает наручники.")
            Sleep, %sleepingtime%
        }
        if (randt = 2) {
            SendChat("/me накинул" Female4 " на человека, складывая обе руки приступника за спину.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " наручникии с поясного держателя, после чего одел" Female " их на него.")
            Sleep, %sleepingtime%
        }
        if (randt = 3) {
            SendChat("/do На поясе у " surname "а висят наручники.")
            Sleep, %sleepingtime%
            SendChat("/me навали" Female2 " на человека, правой рукой снял" Female " наручники с держателя.")
            Sleep, %sleepingtime%
        }
        if (randt = 4) {
            SendChat("/do Наручники на поясе у " surname "а.")
            Sleep, %sleepingtime%
            SendChat("/me лёгким движением руки снял" Female " наручники с пояса, после надел" Female " на задержанного.")
            Sleep, %sleepingtime%
        }
        if (randt = 5) {
            SendChat("/do Наручники в кармане бронежилета у " surname "а.")
            Sleep, %sleepingtime%
            SendChat("/me отстигнул" Female " застешку от кармана бронижелета, затем достал" Female " наручники.")
            Sleep, %sleepingtime%
            SendChat("/me навали" Female2 " на человека, заводит" Female3 " обе его руки за спину надевая наручники.")
            Sleep, %sleepingtime%
        }
        if (randt = 6) {
            SendChat("/me заломал" Female " руки преступнику, после надел" Female " на него наручники.")
            Sleep, %sleepingtime%
            SendChat("/todo Не дергайся!*ударив дубинкой по колену.")
            Sleep, %sleepingtime%
        }
        id := getClosestPlayerId()
        ped := getTargetPed()
        Sleep, %sleepingtime%
        if (ped)
        {
            pid := getIdByPed(ped)
            SendChat("/cuff " pid "")
        }
        else if (id > -1)
        {
            SendChat("/cuff " id "")
        }
        else
        {
            SendInput, {F6}/cuff{SPACE}
            KeyWait, Enter, D
        }
        FileRead, info, %checkfile%
        text = %info%
        Sleep, %sleepingtime%
        if text contains Игрок не находится в розыске.
        {
            SendInput, {F6}/su{SPACE}
            KeyWait, Enter, D
            sleep, 7500
        }
        if (radio1 = 1 and engver = 1)
        {
            SendInput, {F6}/r %Marking% to DISP: *15, One suspect, code *four*, *20 %zones%, nRFR, OVER SAY **{SPACE}
        }
        else if (radio1 = 1 and engver = 0)
        {
            SendInput, {F6}/r %Marking% to DISP: *15, Задержал нарушителя, Код *четыре*, *20 %zones%, недоступен, конец**{SPACE}
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 4
        if (randt = 1) {
            SendChat("/me вцепившись за туловише человека, потащил" Female " его за собой.")
        }
        if (randt = 2) {
            SendChat("/me взял" Female " за затылок человека правой рукой, держа в левой оружие, после повел" Female " человека.")
        }
        if (randt = 3) {
            SendChat("/me ухватил" Female4 " за плечо человека, после повел" Female " его перед собой.")
        }
        if (randt = 4) {
            SendChat("/me ловко вывернул" Female " руки человеку напротив, заломал" Female " его, после того повёл" Female " за собой.")
        }
        Sleep, %sleepingtime%
        id := getClosestPlayerId()
        ped := getTargetPed()
        Sleep, %sleepingtime%
        if (ped)
        {
            pid := getIdByPed(ped)
            SendChat("/gotome " pid "")
        }
        else if (id > -1)
        {
            SendChat("/gotome " id "")
        }
        else
        {
            SendInput, {F6}/gotome{space}
            KeyWait, Enter, D
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 3
        SendMessage, 0x50,, 0x4190419,,A
        if (randt = 1) {
            SendChat("/me правой рукой ухватившись за ручку двери открыл" Female " её.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " за голову преступника и затолкнул" Female " преступника в машину.")
            Sleep, %sleepingtime%
            SendChat("/todo Удачной поездки. Животное.*хлопнул" Female " дверьми машины.")
        }
        if (randt = 2) {
            SendChat("/me держа правой рукой преступника, левой рукой открыл" Female " дверь машины.")
            Sleep, %sleepingtime%
            SendChat("Ну что, голубчик, допрыгался ? Сиди и не рыпайся.")
            Sleep, %sleepingtime%
            SendChat("/me правой рукой пихнул" Female " человека в машину, после закрыл" Female " дверь машины.")
        }
        if (randt = 3) {
            SendChat("/me подойдя с преступником к автомобилю, облокотил" Female " его на каркас автомобиля.")
            Sleep, %sleepingtime%
            SendChat("/me открыв дверь автомобиля держа преступника правой рукой, подвёл" Female " его к двери.")
            Sleep, %sleepingtime%
            SendChat("/do У " name "a на лице было ярко выражено ненависть к преступнику, но " Female5 " сдерживал" Female " себя.")
            Sleep, %sleepingtime%
            SendChat("/me аккуратно ухватил" Female4 " за голову преступника левой рукой, помог" Female6 " усадить его в автомобиль.")
            Sleep, %sleepingtime%
            SendChat("/me после того как усадил" Female " преступника, захлопнул" Female " дверь автомобиля.")
        }
        Sleep, 4100
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Примечание* - {FFFFFF}Сядьте в автомобиль сейчас-же, комманда сейчас введеться в чат!")
        if (pid > -1)
        {
            SendChat("/cput " pid "")
        }
        else if (id > -1)
        {
            SendChat("/cput " id "")
        }
        else
        {
            SendInput, {F6}/cput{space}
            KeyWait, Enter, D
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        SendChat("Вы имеете право хранить молчание.")
        Sleep, %sleepingtime%
        SendChat("Всё, что вы скажете, может и будет использовано против вас в суде.")
        Sleep, %sleepingtime%
        SendChat("Ваш адвокат может присутствовать при допросе.")
        Sleep, %sleepingtime%
        SendChat("Если вы не можете оплатить услуги адвоката, он будет предоставлен вам государством.")
        Sleep, %sleepingtime%
        SendChat("Вы понимаете свои права ?")
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do Через некоторое время преступник был заведён в депортамент.")
        }
        if (randt = 2) {
            SendChat("/me выш" Female7 " из машины, открыл" Female " дверь машины, вытащил" Female " от туда преступника пов" Female8 " его в участок.")
        }
        Sleep, %sleepingtime%
        if (id > -1)
        {
            SendChat("/ceject " id "")
        }
        if (id <= -1)
        {
            SendInput {F6}/ceject{space}
            KeyWait, Enter, D
        }
    goto, obratka3
    }
    else 
    if ErrorLevel = EndKey:Numpad8
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/me достал" Female " бланк с ручкой из своего верхнего кармана.")
            Sleep, %sleepingtime%
            SendChat("/me заполняет бланк ручкой, не пропуская каждого пропуска.")
            Sleep, %sleepingtime%
            SendChat("/do Через некоторое время бланк был заполнен.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " из кармана ключи от наручников, после чего снял" Female " их с нарушителя.")
            Sleep, %sleepingtime%
            SendChat("/me открыл" Female " решётку, после чего пихнул" Female " человека в за неё.")
        }
        if (randt = 2) {
            SendChat("/do КПК в кармане у " surname "а.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " КПК после чего включил его, открыл" Female " базу данных МВБ.")
            Sleep, %sleepingtime%
            SendChat("/me вводит данные о задержанном преступнике.")
            Sleep, %sleepingtime%
            SendChat("/do Высветилось сообщение в КПК - [Дело закрыто].")
            Sleep, %sleepingtime%
            SendChat("/me выключил" Female " КПК, после чего снял" Female " наручники у подозреваемого.")
            Sleep, %sleepingtime%
            SendChat("/me открыл" Female " дверь, пихнул" Female " человека в участок.")
        }
        if (randt = 3) {
            SendChat("/me прижав преступника лицом к стене, снял" Female " ключ с пояса, затем вставил" Female " его в скважину.")
            Sleep, %sleepingtime%
            SendChat("/me провернув ключ открыл" Female " камеру, снял" Female " с преступника наручники, затолкал" Female " его в КПЗ.")
            Sleep, %sleepingtime%
            SendChat("/do Ключи от камеры все еще находился в скважине.")
            Sleep, %sleepingtime%
            SendChat("/me закрыв камеру на ключ повернув им, после чего повесил" Female " связку с наручниками на пояс.")
            Sleep, %sleepingtime%
            SendChat("/do Камера закрыта на замок, ключ надёжно прикреплён к поясу " name "а.")
        }
        Sleep, %sleepingtime%
        if (id > -1)
        {
            SendChat("/arrest " id "")
        }
        else
        {
            SendInput {F6}/arrest{space}
            KeyWait, Enter, D
        }
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню ситуации. {00FF00}Продолжайте работу.")
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню ситуации. {00FF00}Продолжайте работу.")
    }
    zavers:=0
}
return

;~ ===================================Alt + 3=====================================

Active3:
    SendInput, {F6}/pagesize %page%{Enter}
    sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Выйдите из предыдущего меню и повторите попытку.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Отыгровка того что Вы взяли оружие на базе.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Отыгровка того что Вы взяли из багажника ограждение.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Прокричать в /s, о том что работает " Org1 ".")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Отыгровка разминирования бомбы.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Отыгровка замораживания бомбы {F63939}*ЕСЛИ РАЗМИНИРОВАНО НЕУДАЧНО*.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Обыск преступников, используя /frisk.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню ситуации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    obratka5:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka5
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
        sleep, 75
        if !IsInChat()
        {
            sleep, 75
        Input, OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{End}
        }
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad1
    {
        SendChat("/me увидел" Female " полки на которых были разные типы оружий.")
        Sleep, %sleepingtime%
        SendChat("/do На полках шкафа: Remington 1100 " Org1 ", Электрошокер, бронижилет.")
        Sleep, %sleepingtime%
        SendChat("/me взял" Female " Remington 1100 " Org1 " с полки шкафа, повесил" Female " на спину...")
        Sleep, %sleepingtime%
        SendChat("/me ...после чего взял Электрошокер с полки, вставил" Female " в кобуру.")
        Sleep, %sleepingtime%
        SendChat("/do На " name "е были установлены плотно оба оружия.")
        Sleep, %sleepingtime%
        SendChat("/me взял" Female " бронижилет с полки, после чего укрепил" Female " его на себе.")
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/me достав ключ от багажника, вставил" Female " в скважено его, тем самым открыл его.")
            Sleep, %sleepingtime%
            SendChat("/do В багажнике были разные типы ограждений, которые можно было использовать.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " нужное заграждение из багажника после чего пош" Female7 " устанавливать его.")
            Sleep, %sleepingtime%
            SendChat("/me положил" Female " заграждение на асфальт, после чего отош" Female7 ".")
        }
        if (randt = 2) {
            SendChat("/me выняв ключ с пояса, открыл" Female " багажник.")
            Sleep, %sleepingtime%
            SendChat("/do В багажнике валялись ограждения и шины, с инструментами.")
            Sleep, %sleepingtime%
            SendChat("/me достав ограждение из багажника пон" Female11 " его в нужное место.")
        }
        Sleep, %sleepingtime%
    SendInput {F6}/break{space}
        KeyWait, Enter, D
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/s " Org1 ", НЕМЕДЛЕННО ЛЕЧЬ НА ЗЕМЛЮ И НЕ ДВИГАТЬСЯ!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление при аресте.")
        }
        if (randt = 2) {
            SendChat("/s ЭТО " Org1 ", ВСЕМ ЛЕЧЬ НА ЗЕМЛЮ, ЖИВО!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление при аресте.")
        }
        if (randt = 3) {
            SendChat("/s " Org7 ", ВСЕМ ЛЕЧЬ НА ЗЕМЛЮ, БЫСТРО!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление при аресте.")
        }
        if (randt = 4) {
            SendChat("/s МОРДОЙ В ЗЕМЛЮ, РУКИ ЗА ГОЛОВУ, " Org1 "!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление при аресте.")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do В руках у " name "а был набор [Для сапёра] с логотипом [" Org1 "].")
            Sleep, %sleepingtime%
            SendChat("/do На бомбе было видно крышку, с 4 болтиками которые прикрывали детонатор.")
            Sleep, %sleepingtime%
            SendChat("/me увидил" Female " на крышке бомбы 4 болта.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " отвертку из чемодана с набором сапера.")
            Sleep, %sleepingtime%
            SendChat("/do У " name "а в руках была отвертка, которую " Female5 " приготовился использовать.")
            Sleep, %sleepingtime%
            SendChat("/me откручивает болтики отверткой.")
            Sleep, %sleepingtime%
            SendChat("/me открутил" Female " болтики а затем приоткрыл крышку бомбы.")
            Sleep, %sleepingtime%
            SendChat("/do В детонаторе было 2-а провода. Крастный и синий.")
            Sleep, %sleepingtime%
            SendChat("/me увидил" Female " что в детонатора 2 провода.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " щипцы а затем надрезал" Female " красный провод.")
            Sleep, %sleepingtime%
            SendChat("/try разминировал" Female " бомбу, которая лежит на полу")
            Sleep, 200
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если разминирование бомбы не удачно - {F63939}*Numpad 5*")
        }
        if (randt = 2) {
            SendChat("/do На поясе " name " " surname " прикреплен сапёрский набор. ")
            Sleep, %sleepingtime%
            SendChat("/me резким движением отщелкнул" Female " набор с держателя, затем поставил" Female " его на пол, открыл" Female ".")
            Sleep, %sleepingtime%
            SendChat("/do " name " " surname " достал" Female " из чемоданчика отвертку и жидкий азот.")
            Sleep, %sleepingtime%
            SendChat("/do На корпусе бомбы находится 2 цензура.")
            Sleep, %sleepingtime%
            SendChat("/me открутил" Female " первый цензураик с крышки бомбы, затем открутил" Female " второй цензураик, после чего...")
            Sleep, %sleepingtime%
            SendChat("/me ...резким движением закинул" Female " отвертку обратно в чемоданчик.")
            Sleep, %sleepingtime%
            SendChat("/me аккуратно приоткрыл" Female " крышку бомбы.")
            Sleep, %sleepingtime%
            SendChat("/do Видна детонирующая часть.")
            Sleep, %sleepingtime%
            SendChat("/do " name " " surname " внимательно осмотрел бомбу, затем взял" Female " из чемоданчика кусачки.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female " на себя красный провод, перекусил" Female " его кусачками.")
            Sleep, %sleepingtime%
            SendChat("/do Таймер остановился, тиканья со стороны бомбы не слышно.")
            Sleep, %sleepingtime%
            SendChat("/try разминировал" Female " бомбу, которая лежит на полу")
            Sleep, 200
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если разминирование бомбы не удачно - {F63939}*Numpad 5*")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 2
        if (randt = 1) {
            Sleep, %sleepingtime%
            SendChat("/do Бомба не взорвалась, в наборе для сапёра находилась спец. заморозка.")
            Sleep, %sleepingtime%
            SendChat("/me достал" Female " заморозку из набора для сапёра.")
            Sleep, %sleepingtime%
            SendChat("/me повернув кран пустил" Female " через него струю заморажуещего вещества.")
            Sleep, %sleepingtime%
            SendChat("/do Через некоторое время бомба была заморожена.")
            Sleep, %sleepingtime%
            SendChat("/me осторожно подняв из земли бомбу, понес" Female6 " её в руках.")
        }
        if (randt = 2) {
            Sleep, %sleepingtime%
            SendChat("/do Бомба не взорвалась, в наборе для сапёра находилась спец. заморозка.")
            Sleep, %sleepingtime%
            SendChat("/me положил охлаждающий пакет с жидким азотом в детонирующую часть бомбы.")
            Sleep, %sleepingtime%
            SendChat("/do Таймер сбросился еще на 10 секунд.")
            Sleep, %sleepingtime%
            SendChat("/me делает дополнительную заморозку бомбы прижимая пакет к бомбе.")
            Sleep, %sleepingtime%
            SendChat("/do Бомба заморожена. Таймер замерз.")
            Sleep, %sleepingtime%
            SendChat("/me осторожно подняв из земли бомбу, понес" Female6 " её в руках.")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do Перчатки для обыска у " surname "а лежат в правом кармане брюк.")
            Sleep, %sleepingtime%
            SendChat("/me протянул" Female " правую руку к перчаткам, после чего вытянул" Female " их, затем надел" Female " их.")
            Sleep, %sleepingtime%
            SendChat("/me подойдя ближе к человеку на против, ощупал" Female " его торс, затем прош" Female9 " руками по ногам.")
            Sleep, %sleepingtime%
            SendChat("/do Пройшло некоторое время, после того как " name " провернул" Female " свои действия.")
            Sleep, %sleepingtime%
            SendChat("/me осматривая еще раз, провер" Female10 " наличие запрещённых предметов, а так-же наличие документов.")
            Sleep, %sleepingtime%
        SendInput {F6}/frisk{Space}
            KeyWait, Enter, D
            Sleep, %sleepingtime%
            SendChat("/do Документы при себе имеются ?")
        }
        if (randt = 2) {
            SendChat("/me достал" Female " из кармана пиджака прорезиненные перчатки, надевает их поочередно на кисти рук.")
            Sleep, %sleepingtime%
            SendChat("/me похлопал" Female " по торсу, спине человека, затем по карманам одежды.")
            Sleep, %sleepingtime%
            SendChat("/me похлопал" Female " по ногам, по карманам брюк.")
            Sleep, %sleepingtime%
            SendChat("/do Пройшло некоторое время, после того как " name " провернул" Female " свои действия.")
            Sleep, %sleepingtime%
        SendInput {F6}/frisk{Space}
            KeyWait, Enter, D
            Sleep, %sleepingtime%
            SendChat("/me снял" Female " перчатки с рук, убрал" Female " их обратно в карман.")
            Sleep, %sleepingtime%
            SendChat("/do Документы при себе имеются ?")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню ситуации. {00FF00}Продолжайте работу.")
    }
    zavers:=0
}
return

;~ ===================================Alt + 4===================================== | Англ Версия с Маркировкой.

Active4:
    SendInput, {F6}/pagesize %page%{Enter}
    sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Выйдите из предыдущего меню и повторите попытку.")
}
else if (Zavers==0 and EngVer==1 and Radio1==1)
{
    zavers:=1
    city:=getPlayerCity()
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Оповестить диспетчера о том что Вы покинули гараж в Линкольне\Адаме.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Оповестить диспетчера о том что Вы патрулируете " city ".")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Оповестить диспетчера о том что Вы приняли последний вызов ('10-4).")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Оповестить диспетчера о том что у Вы берёте перерыв на обед ( Код '7').")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Оповестить диспетчера о том что Вы в бедственном положении ( Код '1').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Оповестить диспетчера о том что на Вас напали. ( Код '0').")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Оповестить диспетчера о том что ситуация урегулирована ('99)")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Оповестить диспетчера о том что Вы запрашиваете транспортировку.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - Готовоя форма обращения в рацию к диспетчеру.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - Оповестить диспетчера о нарушителе, используя /su.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню рации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    idtvoi:=getId()
    obratka2:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka2
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input , OutputVar, L1 V, {Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        }
        if (ErrorLevel = "EndKey:Numpad0") or (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad0
    {
        idskr:=getIdsInAnyVehicle()
        if (idskr == -1)
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me опустил" Female " руку в нагрудный карман, после достал" Female " её от туда держа в руках *КПК*.")
            Sleep, %sleepingtime%
            SendChat("/me ввёл" Female " данные о правонарушителе, после чего вернул *КПК* обратно.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me правой рукой клацая по бортовому компютеру ввёл данные о нарушителе")
            Sleep, %sleepingtime%
        }
        SendInput {F6}/su{space}
    }
    else
    if ErrorLevel = EndKey:Numpad1
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner=3)
        {
            SendChat("/r " Rank "#" idtvoi " & " partnerPost "#" partnerId " Leave from " Org6 ", on marking - " Marking ". RFR, OVER SAY**")
        }
        else
        {
            SendChat("/r " Rank "#" idtvoi " to DISP: Leave from " Org6 " , on marking - " Marking ", RFR, OVER SAY **")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        city:=getPlayerCity()
        Sleep, %sleepingtime%
        if (city == "LS")
        {
            SendChat("/r " Marking " to DISP: Starting watching from *Los-Santos*, RFR, OVER SAY **")
        }
        if (city == "SF")
        {
            SendChat("/r " Marking " to DISP: Starting watching from *San-Fierro*, RFR, OVER SAY **")
        }
        if (city == "LV")
        {
            SendChat("/r " Marking " to DISP: Starting watching from *Las-Venturas*, RFR, OVER SAY **")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if 1055 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 for *55, nRFR, OVER SAY **")
            1057v:=0
		    1066:=0
            1055:=0
        }
        else if 1057v = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 for *57v, nRFR, OVER SAY **")
            1055:=0
		    1066:=0
            1057v:=0
        }
        else if 1066 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 for *66, nRFR, OVER SAY **")
            1057v:=0
		    1055:=0
            1066:=0
        }
        else
        {
            SendChat("/r " Marking " to DISP: 10-4 for last call, nRFR, OVER SAY **")
        }
        Sleep, %sleepingtime%
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
    Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: Take the code *7*, nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
    Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *70, *20 " getPlayerZone() ", code *one*, need a help! nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: MAYDAY, MAYDAY, *70, *20 " getPlayerZone() ", code *null*, nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (57v = 1)
        {
            SendChat("/r " Marking " to DISP: *99 for last *57V, RFR, OVER SAY **")
            57v := 0
        }
        else if (66c = 1)
        {
            SendChat("/r " Marking " to DISP: *99 for last *66, RFR, OVER SAY **")
            66c := 0
        }
        else if (code0 = 1)
        {
            SendChat("/r " Marking " to DISP: *99 for last code *null*, RFR, OVER SAY **")
            code0 := 0
        }
        else if (55c = 1)
        {
            SendChat("/r " Marking " to DISP: *99 for last *55, RFR, OVER SAY **")
            55c := 0
        }
        else
        {
            SendChat("/r " Marking " to DISP: *99 for last call, RFR, OVER SAY **")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *14, on *20 " getPlayerZone() ", nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendMessage, 0x50,, 0x4190419,,A
    SendInput {F6}/r %Marking% to DISP: , RFR, OVER SAY **{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}
        KeyWait, Enter, D
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
    }
    sleep, 200
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
;~ ===================================Alt + Numpad 0===================================== | Русс. Версия с Маркировкой.
else if (Zavers = 0 and EngVer = 0 and Radio1 = 1)
{
    zavers:=1
    city:=getPlayerCity()
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Оповестить диспетчера о том что Вы покинули гараж в Линкольне\Адаме.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Оповестить диспетчера о том что Вы патрулируете " city ".")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Оповестить диспетчера о том что Вы приняли последний вызов ('10-4).")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Оповестить диспетчера о том что у Вы берёте перерыв на обед ( Код '7').")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Оповестить диспетчера о том что Вы в бедственном положении ( Код '1').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Оповестить диспетчера о том что на Вас напали. ( Код '0').")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Оповестить диспетчера о том что ситуация урегулирована ( *99 ).")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Оповестить диспетчера о том что Вы запрашиваете транспортировку.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - Готовоя форма обращения в рацию к диспетчеру.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - Оповестить диспетчера о нарушителе, используя /su.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню рации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    idtvoi:=getId()
    obratka12:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka12
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input, OutputVar, L1 V, {Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        }
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad0
    {
        SendMessage, 0x50,, 0x4190419,,A
        idskr:=getIdsInAnyVehicle()
        if (idskr == -1)
        {
            SendChat("/me опустил" Female " руку в нагрудный карман, после достал" Female " её от туда держа в руках *КПК*.")
            Sleep, %sleepingtime%
            SendChat("/me ввёл" Female " данные о правонарушителе, после чего вернул *КПК* обратно.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendChat("/me правой рукой клацая по бортовому компютеру ввёл данные о нарушителе")
            Sleep, %sleepingtime%
        }
        SendInput {F6}/su{space}
    }
    else
    if ErrorLevel = EndKey:Numpad1
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner=3)
        {
            SendChat("/r " Rank "#" idtvoi " & " partnerPost "#" partnerId " to DISP: Выехали на смену, по маркировке - " Marking ". доступен, конец**")
        }
        else
        {
            SendChat("/r " Rank "#" idtvoi " to DISP: Выехал на смену, по маркировке - " Marking ", доступен, конец**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        city:=getPlayerCity()
        Sleep, %sleepingtime%
        if (city == "LS")
        {
            SendChat("/r " Marking " to DISP: Начинаем патрулирование улицы Лос-Сантоса, доступен, конец**")
        }
        else if (city = "SF")
        {
            SendChat("/r " Marking " to DISP: Начинаем патрулирование улицы Сан-Фиерро, доступен, конец**")
        }
        else if (city = "LV")
        {
            SendChat("/r " Marking " to DISP: Начинаем патрулирование улицы Лас-Вентураса, доступен, конец**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if 1055 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 для *55, недоступен, конец**")
            1057v:=0
		    1066:=0
            1055:=0
        }
        else if 1057v = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 для *57v, недоступен, конец**")
            1055:=0
		    1066:=0
            1057v:=0
        }
        else if 1066 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 для *66, недоступен, конец**")
            1057v:=0
		    1055:=0
            1066:=0
        }
        else
        {
            SendChat("/r " Marking " to DISP: 10-4 для последнего вызова, недоступен, конец**")
        }
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
    Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: Берём код *7*, недоступен, конец связи**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }    
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
    Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *70, *20 " getPlayerZone() ", код*один*, нужна помощь! недоступен, конец**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }    
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: МэйДей, МэйДей *70, *20 " getPlayerZone() ", код*ноль*,  конец**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (57v = 1)
        {
            SendChat("/r " Marking " to DISP: *99 для последнего *57V, доступен, конец связи**")
            57v := 0
        }
        else if (66c = 1)
        {
            SendChat("/r " Marking " to DISP: *99 для последнего *66, доступен, конец связи**")
            57f := 0
        }
        else if (code0 = 1)
        {
            SendChat("/r " Marking " to DISP: *99 для последнего кода *ноль* , доступен, конец связи**")
            code0 := 0
        }
        else
        {
            SendChat("/r " Marking " to DISP: *99 для последнего вызова, доступен, конец связи**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *14, по *20 " getPlayerZone() ", недоступен, конец**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        SendMessage, 0x50,, 0x4190419,,A
    SendInput {F6}/r %Marking% to DISP: , доступен, конец связи**{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}
        KeyWait, Enter, D
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
    }
    sleep, 200
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
else if (Radio2 = 1)
{
    zavers:=1
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Доложить о том что Вы покинули гараж.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Доложить о том что Вы патрулируете.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Доложить о том что Вы стоите на посту.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Доложить о том что Вы ведёте воздушный патруль.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Доложить о том что Вы вы потеряли правонарушителя.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Доложить о том что Вам нужен вертолёт.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Доложить о том что на Вас напали.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Оповестить диспетчера о нарушителе, используя /su.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - Доложить о том что вы ведёте погоню.")
sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню рации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    idtvoi:=getId()
    obratka22:
    Loop
{
    if (statusd == false)
    {
        sleep, 750
        goto, obratka22
    }
    else
    {
        TempWeapon := getPlayerWeaponId()
        if (TempWeapon = 23) or (TempWeapon = 3)
        if not TazerIn
        {
            TazerIn := 1
            if TazerSleep
            SetTimer TakeGun, 100
            else
            SetTimer TakeGun, % timeweap
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap
            }
        }
    }
    if restarting = 0
    {
        FileRead, info, %checkfile%
        text = %info%
    }
    if restarting = 1
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
        restarting:=0
    }
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 присоединяюсь к,10-4 for,10-4 для,10-4,*99
	{
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
	}
	if text contains 10-55,*55,'55
	{
        1055:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-55 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
	{
        1057v:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-57 VICTOR {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1055:=0
		1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
	if text contains 10-66,*66,'66
	{
        1066:=1
		addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Поступила информация о {FF0000}10-66 {FFFFFF}примите вызов используя меню рации...")
		showGameText("RADIO", 1000, 1)
		1057v:=0
		1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
    if text contains кюмба
	{
        sleep, 750
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input , OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        }
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad1
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (Partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Напарник: " partnerSurname " | Статус: Выехали из " Org6 ".")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Без напарника | Статус: Выехал из " Org6 ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    Else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Проводим патруль района " getPlayerZone() " | Статус: Спокойно.")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Провожу патруль района " getPlayerZone() " | Статус: Спокойно.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Пост: " getPlayerZone() " | Напарник: " partnerSurname " | Статус: Стабильно.")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Пост: " getPlayerZone() " | Без напарника | Статус: Стабильно.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Ведём воздушный патруль города " getPlayerCity() " | Статус: Стабильно.")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Веду воздушный патруль города " getPlayerCity() " | Статус: Стабильно.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Правонарушитель скрылся где-то в районе*" getPlayerZone() "*.")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Правонарушитель скрылся где-то в районе*" getPlayerZone() "*.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Напарник: " partnerSurname " | Нужен вертолёт на " getPlayerZone() ".")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Нуждаюсь в воздушной поддержке на " getPlayerZone() ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Напарник: " partnerSurname " | Запрашиваю поддержку на " getPlayerZone() ".")
        }
        else
        {
            SendChat("/r " Tag " Докладывает " surname " | Запрашиваю срочную поддержку на " getPlayerZone() ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        idskr:=getIdsInAnyVehicle()
        if (idskr == -1)
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me опустил" Female " руку в нагрудный карман, после достал" Female " её от туда держа в руках *КПК*.")
            Sleep, %sleepingtime%
            SendChat("/me ввёл" Female " данные о правонарушителе, после чего вернул *КПК* обратно.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me правой рукой клацая по бортовому компютеру ввёл данные о нарушителе")
            Sleep, %sleepingtime%
        }
        SendInput {F6}/su{space}
    }
    else
    if ErrorLevel = EndKey:Nmmpad9
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
            Sleep, %sleepingtime%
            SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* на рации. после что-то произнес" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me снял" Female " полицейскую рацию с бронежилета")
            Sleep, %sleepingtime%
            SendChat("/me поднес" Female6 " полицейскую рацию ко рту, после произнес" Female6 " что-то")
        }
        if (randt = 3)
        {
            SendChat("/do На поясе у " name ", была включенная и работоспособная рация.")
            Sleep, %sleepingtime%
            SendChat("/me взял" Female " рацию, поднес" Female6 " её ко рту, после произнес" Female6 " что-то")
        }
        Sleep, %sleepingtime%
        if (partner >= 1)
        {
            SendChat("/r " Tag " Докладывает " surname " | Ведём погоню за " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
        }
        else
        SendChat("/r " Tag " Докладывает " surname " | Веду погоню за " M " | Номера: [AT" su "" City "] | Район: " getPlayerZone() ".")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do Закончив говорить " name " перестал" Female " зажимать кнопку *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do Закончив говорить " name " повесил" Female " рацию обратно на бронежилет.")
        }
        if (randt = 3)
        {
            SendChat("/do Закончив говорить " name " положил" Female " рацию обратно на пояс.")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
    }
    sleep, 200
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
