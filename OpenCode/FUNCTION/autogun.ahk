autoweapons:
ListLines Off
SetBatchLines -1
SetKeyDelay 0
checkfile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
#Persistent
global TazerTo  := -1
global TazerIn  := 0
global TazerOut := 0
Loop
{
    autoweaponsloop:
    if (statusd == false)
    {
        sleep, 3500
        goto, autoweaponsloop
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
            SetTimer TakeGun, 3000
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, 3000
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, 3000
            }
        }
    }
    FileRead, info, %checkfile%
    text = %info%
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
        Sleep, 1500
        SendChat("/rb я")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	}
}
return

TakeGun:
TempWeapon := getPlayerWeaponId()
if (TempWeapon = 24) and (TazerOut != 2) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do Усовершенствованный пистолет *Baretta 92* находится в кобуре у сотрудни" Female1 " " Org ".")
        Sleep, %sleepingtime%
        SendChat("/me обхватив рукоятку пистолета марки *Baretta 92* вытащил его из кобуры.")
        TazerOut:=2
    }
    if (randt = 2) {
        SendChat("/do В кобуре, висящей на груди сотрудни" Female1 " " Org ", находится пистолет *Beretta 92*.")
        Sleep, %sleepingtime%
        SendChat("/me резким движением правой руки отстегнул" Female " кобуру, после чего вынул" Female " пистолет.")
        TazerOut:=2
    }
}
if (TempWeapon = 3) and (TazerOut != 3) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me быстрым движением руки, обхватил" Female " рукоятку дубинки, за тем сорвал" Female " её с пояса.")
        Sleep, %sleepingtime%
        SendChat("/me рывком руки вниз, полностью раскрыл" Female " телескопическую дубинку.")
        TazerOut:=3
    }
    if (randt = 2) {
        SendChat("/do На поясе висит телескопическая дубинка.")
        Sleep, %sleepingtime%
        SendChat("/me выхватил" Female " телескопическую дубинку с пояса, после чего раскрыл" Female " её.")
        TazerOut:=3
    }
}
if (TempWeapon = 23) and (TazerOut != 4) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me снял" Female " электрошокер с кобуры который был прикреплен к поясу.")
        TazerOut:=4
    }
    if (randt = 2) {
        SendChat("/do На поясе расположен электрошокер *Tazer*, застегнутый в чехле.")
        Sleep, %sleepingtime%
        SendChat("/me расстегнул" Female " чехол, после чего вынул" Female " *Tazer* из него.")
        TazerOut:=4
    }
}
if (TempWeapon = 25) and (TazerOut != 5) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do За спиной виднеется дробовик *Remington 1100 " Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me схватил" Female " дробовик двумя руками, достал" Female " его из-за спины и крепко сжал" Female ".")
        TazerOut:=5
    }
    if (randt = 2) {
        SendChat("/me вытянул" Female " из за спины дробовик *Remington 1100 " Org1 "* с резьбой.")
        Sleep, %sleepingtime%
        SendChat("/me пафосным видом перезарядил" Female " помповое оружие.")
        TazerOut:=5
    }
}
if (TempWeapon = 29) and (TazerOut != 6) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do На плече висит полу-автомат MP-5.")
        Sleep, %sleepingtime%
        SendChat("/me взял" Female " MP-5 в руки, после чего снял" Female " полуавтомат с предохранителя.")
        TazerOut:=6
    }
    if (randt = 2) {
        SendChat("/me вытянул" Female " из-за спины автоматическое оружие MP-5.")
        Sleep, %sleepingtime%
        SendChat("/me передёрнул" Female " затвор на автоматическом оружии.")
        TazerOut:=6
    }
}
if (TempWeapon = 31) and (TazerOut != 7) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me достал" Female " карабин M16A4, положил" Female " палец на курок, после чего снял" Female " предохранитель.")
        Sleep, %sleepingtime%
        SendChat("/do Автомат лежал в руках сотрудни" Female1 " " Org ", в полной готовности.")
        TazerOut:=7
    }
    if (randt = 2) {
        SendChat("/do На правом плече висит штурмовая винтовка *M16A4*.")
        Sleep, %sleepingtime%
        SendChat("/me движением правой руки снял" Female " винтовку с плеча передёрнув затвор на автоматическом оружии.")
        TazerOut:=7
    }
}
if (TempWeapon = 17) and (TazerOut != 8) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me надел" Female " противогаз.")
        Sleep 2000
        SendChat("/me достал" Female " светошумовую гранату.")
        TazerOut:=8
    }
    if (randt = 2) {
        SendChat("/me отцепил" Female " с бронежилета на груди дымовую гранату *ESG 2*.")
        Sleep, %sleepingtime%
        SendChat("/me выдернул" Female " чеку и приготовил" Female4 " к броску.")
        TazerOut:=8
    }
}
if (TempWeapon = 1) and (TazerOut != 9) {
    SendChat("/me надел" Female " кастет на руку.")
    TazerOut:=9
}
if (TempWeapon = 5) and (TazerOut != 10) {
    SendChat("/me взял" Female " бейсбольную биту в руки.")
    TazerOut:=10
}
if (TempWeapon = 14) and (TazerOut != 11) {
    SendChat("/me развернул" Female " букет цветов.")
    TazerOut:=11
}
if (TempWeapon = 30) and (TazerOut != 12) {
    SendChat("/me взял" Female " автомат АК-47 в руки.")
    TazerOut:=12
}
if (TempWeapon = 33) and (TazerOut != 13) {
    SendChat("/me взял" Female " винтовку в руки.")
    TazerOut:=13
}
if (TempWeapon = 34) and (TazerOut != 14) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me достал" Female " снайперскую винтовку из-за плеча.")
        Sleep, %sleepingtime%
        SendChat("/me снял" Female " снайперскую винтовку с предохранителя.")
        TazerOut:=14
    }
    if (randt = 2) {
        SendChat("/me вытянул" Female " из за спины чехол для снайперской винтовки с надписью *" Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me открыл" Female " чехол и вытащил" Female " от туда снайперскую винтовку *M82A1*.")
        Sleep, %sleepingtime%
        SendChat("/me развернул" Female " снайперское оружие на против себя.")
        Sleep, %sleepingtime%
        SendChat("/me зарядил" Female " в винтовку магазин патрон калибра *12.7x99 мм* с резьбой -Волк-.")
        TazerOut:=14
    }
}
if (TempWeapon = 43) and (TazerOut != 15) {
    SendChat("/me достал" Female " фотоаппарат.")
    TazerOut:=15
}
if (TempWeapon = 46) and (TazerOut != 16) {
    SendChat("/me одел" Female " парашют на плечи.")
    TazerOut:=16
}
if (TempWeapon = 15) and (TazerOut != 17) {
    SendChat("/me достал" Female " элегантную трость.")
    TazerOut:=17
}
if (TempWeapon = 36) and (TazerOut != 18) {
    SendChat("/me взял" Female " Stinger в руки.")
    TazerOut:=18
}
if (TempWeapon = 2) and (TazerOut != 19) {
    SendChat("/me взял" Female " клюшку в руки.")
    TazerOut:=19
}
TazerIn := 0
TazerTo := 1
SetTimer TakeGun, Off
return

UnloadGun:
TempWeapon := getPlayerWeaponId()
if not (TempWeapon = 24) and (TazerOut = 2)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do На поясе сотрудни" Female1 " " Org ", закреплена кожаная кобура с логотипом *" Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me держа угол обзора перед собой, положил" Female " пистолет обратно.")
    }
    if (randt = 2) {
        SendChat("/me вернул" Female " пистолет *Beretta 92* в кобуру, после чего застегнул" Female " её.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 3)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me плавно закрепил" Female " телескопическую дубинку на поясе.")
        Sleep, %sleepingtime%
        SendChat("/do Дубинка у сотрудни" Female1 " " Org " находится на поясе.")
    }
    if (randt = 2) {
        SendChat("/me вернул" Female " телескопическую дубинку на пояс, крепко закрепив ее.")
    }
}
if not (TempWeapon = 23) and (TazerOut = 4)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me повесил" Female " электрошокер на пояс.")
    }
    if (randt = 2) {
        SendChat("/me отключил" Female " электрошокер *Tazer*, после чего закрепил" Female " его в чехол, на пояс.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 5)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do В обеих руках сотрудни" Female1 " " Org2 ", находится дробовик.")
        Sleep, %sleepingtime%
        SendChat("/me слегка приподняв нос дробовика перевернул" Female " его, после чего вернул" Female " его на спину.")
    }
    if (randt = 2) {
        SendChat("/me убрал" Female " за спину дробовик *Remington 1100*. с гравировкой *" Org1 "*.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 6)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me повесил" Female " *MP-5* на плечо.")
    }
    if (randt = 2) {
        SendChat("/me убрал" Female " автоматическое оружие *MP-5* на перевес.")
    }
}
if not (TempWeapon = 31) and (TazerOut = 7)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do Автомат находится на весу, на толстом, кожаном ремешке.")
        Sleep, %sleepingtime%
        SendChat("/me держа угол обзора перед собой, открыл" Female " кобуру одной рукой и положил" Female " автомат обратно.")
    }
    if (randt = 2) {
        SendChat("/me убрал" Female " за спину автоматическое оружие *M16A4* с обвесом.")
    }
}
if not (TempWeapon = 1) and (TazerOut = 9)
{
    SendChat("/me снял" Female " кастет.")
}
if not (TempWeapon = 5) and (TazerOut = 10)
{
    SendChat("/me спрятал" Female " биту.")
}
if not (TempWeapon = 14) and (TazerOut = 11)
{
    SendChat("/do Цветы не в руках.")
}
if not (TempWeapon = 30) and (TazerOut = 12)
{
    SendChat("/me убрал" Female " АК-47 за спину.")
}
if not (TempWeapon = 33) and (TazerOut = 13)
{
    SendChat("/me убрал" Female " винтовку.")
}
if not (TempWeapon = 34) and (TazerOut = 14)
{
    SendChat("/me поставил" Female " снайперскую винтовку на предохранитель.")
    Sleep, %sleepingtime%
    SendChat("/me повесил" Female " снайперскую винтовку на плечо.")
}
if not (TempWeapon = 43) and (TazerOut = 15)
{
    SendChat("/me закрыл" Female " крышечкой объектив фотоаппарата.")
}
if not (TempWeapon = 46) and (TazerOut = 16)
{
    SendChat("/me снял" Female " парашют.")
}
TazerOut:=0
SetTimer UnloadGun, Off
return