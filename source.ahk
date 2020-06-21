; <COMPILER: v1.1.32.00>
#SingleInstance force
#NoEnv
buildscr = 60
downlurl := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/updt.exe"
downllen := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/verlen.ini"
OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs
SplashTextOn, , 60, Менеджер обновлений, Проверка обновления`n------------------------`nОжидайте
URLDownloadToFile, %downllen%, %a_temp%\verlen.ini
IniRead, buildupd, %a_temp%\verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 60, Менеджер обновлений, Ошибка подключения`n------------------------`nНет связи с сервером
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    SplashTextOn, , 60, Менеджер обновлений,  Ожидайте`n------------------------`nНовая версия - %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%\verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    sleep, 200
    put2 := % A_ScriptFullPath
    RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
    SplashTextOn, , 60, Менеджер обновлений,  Ожидайте`n------------------------`nОбновляем скрипт
    URLDownloadToFile, %downlurl%, %a_temp%\updt.exe
    sleep, 100
    run, %a_temp%\updt.exe
    exitapp
}
SplashTextoff
IniRead, Reloads, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Reloads
if (reloads == 1)
{
    gosub, nexted
}
else if (reloads == 0)
{
    SendMessage, 0x50,, 0x4090409,, A
    IniWrite, 1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Reloads
    reload
}
else
{
    SendMessage, 0x50,, 0x4090409,, A
    IniWrite, 1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Reloads
    reload
}
return
nexted:
FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
IniWrite, 0, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Reloads
global ADDR_CP_CHECK						:=	0xC7DEEA
global ADDR_CPED_ARMOROFF					:=	0x548
global ADDR_CPED_HPOFF						:=	0x540
global ADDR_CPED_INTID						:=	0xA4ACE8
global ADDR_CPED_MONEY						:=	0x0B7CE54
global ADDR_CPED_PTR						:=	0xB6F5F0
global ADDR_CPED_SKINIDOFF					:=	0x22
global ADDR_CURRENT_WEAPON					:=	0xBAA410
global ADDR_POSITION_X						:=	0xB6F2E4
global ADDR_POSITION_Y						:=	0xB6F2E8
global ADDR_POSITION_Z						:=	0xB6F2EC
global ADDR_REDMARKER						:=	[0xC7DEC8, 0xC7DECC, 0xC7DED0]
global ADDR_SAMP_CHATMSG_PTR				:=	0x21a0e4
global ADDR_SAMP_CRASHREPORT				:=	0x5CF2C
global ADDR_SAMP_INCHAT_PTR					:=	0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF				:=	0x55
global ADDR_SAMP_USERNAME					:=	0x219A6F
global ADDR_SET_INTERIOR_OFFSET				:=	0xB72914
global ADDR_SET_POSITION					:=	0xB7CD98
global ADDR_SET_POSITION_OFFSET				:=	0x14
global ADDR_SET_POSITION_X_OFFSET			:=	0x30
global ADDR_SET_POSITION_Y_OFFSET			:=	0x34
global ADDR_SET_POSITION_Z_OFFSET			:=	0x38
global ADDR_VEHICLE_CVEH					:=	0xB6F980
global ADDR_VEHICLE_DOORSTATE				:=	0x4F8
global ADDR_VEHICLE_DRIVER					:=	0x460
global ADDR_VEHICLE_ENGINESTATE				:=	0x428
global ADDR_VEHICLE_HPOFF					:=	0x4C0
global ADDR_VEHICLE_LIGHTSTATE				:=	0x584
global ADDR_VEHICLE_MODEL					:=	0x22
global ADDR_VEHICLE_PTR						:=	0xBA18FC
global ADDR_VEHICLE_SIRENSTATE				:=	0x1069
global ADDR_VEHICLE_SIRENSTATE2				:=	0x1300
global ADDR_VEHICLE_SPEED_X					:=	0x44
global ADDR_VEHICLE_SPEED_Y					:=	0x48
global ADDR_VEHICLE_SPEED_Z					:=	0x4C
global ADDR_VEHICLE_TYPE					:=	0x590
global ADDR_VEHICLE_X						:=	0x44
global ADDR_VEHICLE_Y						:=	0x48
global ADDR_VEHICLE_Z						:=	0x4C
global ADDR_ZONECODE						:=	0xA49AD4
global bInitZaC								:=	0
global CheckpointCheck						:=	0xC7DEEA
global cities								:=	[]
global clist_erp							:=	["{ffffff}", "{089401}", "{56fb4e}", "{49e789}", "{2a9170}", "{9ed201}", "{279b1e}", "{51964d}", "{ff0606}", "{ff6600}", "{f45000}", "{be8a01}", "{b30000}", "{954f4f}", "{e7961d}", "{e6284e}", "{ff9db6}", "{110ce7}", "{0cd7e7}", "{139bec}", "{2c9197}", "{114d71}", "{8813e7}", "{b313e7}", "{758c9d}", "{ffde24}", "{ffee8a}", "{ddb201}", "{dda701}", "{b0b000}", "{868484}", "{b8b6b6}", "{333333}", "{fafafa}"]
global datatypes	:=	{"Int64" : 8, "Double" : 8, "UInt" : 4, "Int" : 4, "Float" : 4, "Ptr" : 4, "UPtr" : 4, "UShort" : 2, "Short" : 2, "Char" : 1, "UChar" : 1, "Byte" : 1}
global DIALOG_STYLE_INPUT					:=	1
global DIALOG_STYLE_LIST					:=	2
global DIALOG_STYLE_MSGBOX					:=	0
global DIALOG_STYLE_PASSWORD				:=	3
global DIALOG_STYLE_TABLIST					:=	4
global DIALOG_STYLE_TABLIST_HEADERS			:=	5
global dwGTAPID								:=	0x0
global dwSAMP								:=	0x0
global ERROR_ALLOC_MEMORY					:=	10
global ERROR_CITY_NOT_FOUND					:=	7
global ERROR_CREATE_THREAD					:=	13
global ERROR_ENUM_PROCESS_MODULES			:=	5
global ERROR_FREE_MEMORY					:=	11
global ERROR_INVALID_HANDLE					:=	3
global ERROR_MODULE_NOT_FOUND				:=	4
global ERROR_OK								:=	0
global ERROR_OPEN_PROCESS					:=	2
global ERROR_PROCESS_NOT_FOUND				:=	1
global ERROR_READ_MEMORY					:=	8
global ERROR_WAIT_FOR_OBJECT				:=	12
global ERROR_WRITE_MEMORY					:=	9
global ERROR_ZONE_NOT_FOUND					:=	6
global FIGHT_STYLE_BOXING					:=	5
global FIGHT_STYLE_ELBOW					:=	16
global FIGHT_STYLE_GRABKICK					:=	15
global FIGHT_STYLE_KNEEHEAD					:=	7
global FIGHT_STYLE_KUNGFU					:=	6
global FIGHT_STYLE_NORMAL					:=	4
global FUNC_SAMP_ADDTOCHATWND				:=	0x64520
global FUNC_SAMP_CLOSEDIALOG				:=	0x6C040
global FUNC_SAMP_PLAYAUDIOSTR				:=	0x62da0
global FUNC_SAMP_SEND_CMD					:=	0x65C60
global FUNC_SAMP_SEND_SAY					:=	0x57F0
global FUNC_SAMP_SENDCMD					:=	0x65c60
global FUNC_SAMP_SENDSAY					:=	0x57f0
global FUNC_SAMP_SHOWDIALOG					:=	0x6B9C0
global FUNC_SAMP_SHOWGAMETEXT				:=	0x9c2c0
global FUNC_SAMP_STOPAUDIOSTR				:=	0x629a0
global FUNC_UPDATESCOREBOARD				:=	0x8A10
global GAMESTATE_AWAIT_JOIN					:=	15
global GAMESTATE_CONNECTED					:=	14
global GAMESTATE_CONNECTING					:=	13
global GAMESTATE_RESTARTING					:=	18
global GAMESTATE_WAIT_CONNECT				:=	9
global GAMETEXT_1							:=	0xBAAD40
global GAMETEXT_2							:=	0xBAADC0
global GAMETEXT_3							:=	0xBAAE40
global GAMETEXT_4							:=	0xBAAEC0
global GAMETEXT_5							:=	0xBAABC0
global gangZoneTick							:=	0
global GTA_BLIP_COLOR_OFFSET				:=	0x0
global GTA_BLIP_COUNT						:=	0xAF
global GTA_BLIP_ELEMENT_SIZE				:=	0x28
global GTA_BLIP_ID_OFFSET					:=	0x24
global GTA_BLIP_POOL						:=	0xBA86F0
global GTA_BLIP_STYLE_OFFSET				:=	0x25
global GTA_BLIP_X_OFFSET					:=	0x8
global GTA_BLIP_Y_OFFSET					:=	0xC
global GTA_BLIP_Z_OFFSET					:=	0x10
global GTA_CHECKPOINT						:=	0x00C7DEC8
global GTA_CHECKPOINT_OFF_X					:=	0x00
global GTA_CHECKPOINT_OFF_Y					:=	0x04
global GTA_CHECKPOINT_OFF_Z					:=	0x08
global GTA_CPED_PTR							:=	0xB6F5F0
global GTA_IS_CHECKPOINT					:=	0x0220214C
global GTA_VEHICLE_PTR						:=	0xBA18FC
global hGTA									:=	0x0
global iRefreshHandles						:=	0
global iRefreshScoreboard					:=	0
global iUpdateTick							:=	1000
global nCity								:=	1
global nCube								:=	1
global nZone								:=	1
global oAirplaneModels						:=	[417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels							:=	[481,509,510]
global OBJECT_MATERIAL_SIZE_128x128			:=	60
global OBJECT_MATERIAL_SIZE_128x32			:=	40
global OBJECT_MATERIAL_SIZE_128x64			:=	50
global OBJECT_MATERIAL_SIZE_256x128			:=	90
global OBJECT_MATERIAL_SIZE_256x256			:=	100
global OBJECT_MATERIAL_SIZE_256x32			:=	70
global OBJECT_MATERIAL_SIZE_256x64			:=	80
global OBJECT_MATERIAL_SIZE_32x32			:=	10
global OBJECT_MATERIAL_SIZE_512x128			:=	120
global OBJECT_MATERIAL_SIZE_512x256			:=	130
global OBJECT_MATERIAL_SIZE_512x512			:=	140
global OBJECT_MATERIAL_SIZE_512x64			:=	110
global OBJECT_MATERIAL_SIZE_64x32			:=	20
global OBJECT_MATERIAL_SIZE_64x64			:=	30
global OBJECT_MATERIAL_TEXT_ALIGN_CENTER	:=	1
global OBJECT_MATERIAL_TEXT_ALIGN_LEFT		:=	0
global OBJECT_MATERIAL_TEXT_ALIGN_RIGHT		:=	2
global objectTick							:=	0
global oGangzones							:=	[]
global oObjects								:=	[]
global oPickups								:=	[]
global oPlayers								:=	""
global oradiostationNames					:=	["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oScoreboardData						:=	""
global oTextDraws							:=	[]
global oTextLabels							:=	[]
global ovehicleNames 						:= ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oVehicles							:=	""
global oweaponNames							:=	["Кулак","Кастет","Клюшка","Дубинка","Нож","Бита","Лопата","Кий","Катана","Бензопила","Фиолетовый дилдо","Дилдо","Вибратор","Серебрянный вибратор","Цветы","Трость","Граата","Дымовая граната","Молотов", "", "", "", "Пистолет","Пистолет с глушителем","Дигл","Дробовик","Обрез","Боевой дробовик","Узи","MP5","AK-47","M4","Tec-9","Ружье","Снайперская винтовка","RPG","HS Rocket","Огнемет","Миниган","Взрывчатка","Детонатор","Перцовый балончик","Огнетушитель","Камера","Ночное зрение","Тепловые очки","Парашут"]
global oweatherNames						:=	["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global color11namecars :=["черно-", "бело-", "голубо-", "красно-", "серо-", "лилово-", "оранжево-", "голубо-", "серо-", "серо-", "сине-", "серо-", "голубо-", "серо-", "серо-", "серо-", "зелено-", "красно-", "красно-", "серо-", "сине-", "малиново-", "малиново-", "серо-", "серо-", "серо-", "серо-", "серо-", "сине-", "серо-", "коричнево-", "коричнево-", "голубо-", "серо-", "серо-", "серо-", "черно-", "черно-", "серо-", "голубо-", "коричнево-", "серо-", "красно-", "красно-", "зелено-", "красно-", "зелено-","серо-", "серо-", "серо-", "серо-", "зелено-", "серо-", "сине-", "сине-", "коричнево-", "серо-", "коричнево-", "красно-", "сине-", "серо-", "коричнево-", "красно-", "серо-", "серо-", "желто-", "коричнево-", "голубо-", "желто-", "розово-", "красно-", "голубо-", "серо-", "серо-", "коричнево-", "черно-", "серо-", "коричнево-", "красно-", "сине-", "красно-", "коричнево-", "красно-", "зелено-", "коричнево-", "красно-", "зелено-", "голубо-", "красно-", "серо-", "светло-серо-", "сине-", "серо-", "голубо-", "сине-", "сине-", "серо-", "серо-", "серо-", "коричнево-", "серо-", "сине-", "коричнево-", "сине-", "коричнево-", "серо-", "голубо-", "серо-", "голубо-", "серо-", "коричнево-", "серо-", "голубо-", "коричнево-", "зелено-", "малиново-", "сине-", "красно-", "серо-", "коричнево-", "коричнево-", "красно-", "серо-", "желто-", "малиново-", "сине-", "розово-"]
global color12namecars := ["салатовый", "шоколадный", "голубой", "горчичный", "кремово-розовый", "черный", "фиолетовый", "светло-голубой", "лиловый", "ярко-салатовый", "бежевый", "лилово-фиолетовый", "молочный", "кремовый", "желтый", "пудровый", "лилово-пудровый", "бледно-салатовый", "бледно-розовый", "розовый", "серый", "серо-коричневый", "серый", "серо-салатовый", "голубой", "хакки", "светло-салатовый", "серо-голубой", "песочный", "светло-серый", "кирпичный", "коричневый", "темно-зеленый", "персиково-розовый", "темно-голубой", "морская волна", "темно-серый", "серо-голубой", "бледно-голубой", "фиалковый", "светлый шоколад", "бледно-лиловый", "бледно-пурпурный", "пурпурный", "грязный зеленый", "светлый шоколад", "светло-коричневый", "яркий персиковый", "бледно-фиолетовый", "бледно-пудровый", "бледно-розовый", "ягодный", "светло-горчичный", "темный персиковый", "темный бежевый", "светло-кирпичный", "бледно-розовый", "светло-серый","темно-зеленый", "зеленый", "светло-зеленый", "серо-зеленый", "чайная роза", "бледно-салатовый", "молочный", "белый", "яркожелтый", "бледно-желтый", "белый", "яичный", "серо-голубой", "хакки", "кремовый", "серо-синий", "серо-зеленый", "темно-серый", "металлик", "черно-синий", "черно-серый", "серый", "сизый", "серо-голубой", "темный серо-голубой", "фиолетовый", "кирпичный", "молочный", "желто-зеленый", "темный зеленый", "бежевый", "светло-голубой", "персиковый", "светло-оранжевый", "истинный розовый", "светло-желтый", "персиково-оранжевый", "темно-синий", "светлый шоколад", "хакки", "салатовый", "темно-зеленый", "кремово-желтый", "зеленый", "сливовый", "грязно-желтый", "лилово-розовый", "светло-малиновый", "темно-зеленый", "серо-зеленый", "темно-серый", "пудровый", "песочный", "кирпичный", "голубой", "желто-салатовый", "темно-малиновый", "бледно-зеленый", "шоколадный", "темно-зеленый", "серо-голубой", "серый", "светлый шоколад", "вишневый", "молочный", "светло-серый", "серый", "слоновая кость", "кремово-серый", "серо-синий"]
global color21namecars :=["Black", "White", "Blue", "Red", "Dark Gray", "Purple", "Orange", "Gray-blue", "Light Gray", "Gray", "Gray-blue", "Gray", "Gray-blue", "Gray", "Light Gray"," Light Gray", "Light Gray", "Green", "Cherry", "Dark Crimson"," Light Gray", "Gray-blue", "Pale Crimson", "Dark Crimson", "Light Gray", "Gray", "Dark Gray", "Light Gray", "Gray", "Gray-blue", "Light Gray", "Dark Brown", "Light Blue", "Gray", "Gray", "Dark Gray", "Gray-green", "Gray", "Gray-blue", "Dark Brown", "Gray", " Pale Cherry", "Cherry", "Dark Green", "Brown-cherry", "Light Khaki", "Gray", "Light Gray", "Light Gray", "Gray", "Green-blue", "Gray", "Blue", "Pale Blue", "Cocoa", "Light Gray", "Light Khaki", "Dark Cherry", "Gray-blue", "Light Gray", "Dark Sand", "Dark Crimson", "Gray", "Gray", "Pale Green", "Dark Brown", "Gray-blue", "Light Khaki", "Cocoa With Milk", "Pale Cherry", "Blue", "Dark Gray", "Light Gray", "Dark Brown", "Dark Blue", "Light Gray", "Light Khakki", "Pale Cherry", "Blue", "Pale Crimson", "Mocha", "Dark-cherry", "Dark Green", "Milk Chocolate", "Raspberry", "Light Green", "Blue", "Pale Cherry", "Pale Khaki", "Light Gray", "Gray", "Gray", "Blue", "Light Shiny", "Blue", "Light Gray", "Gray", "Dark Gray", "Light Khaki", "Blue", "Dark Blue", "Light Khaki", "Blue", "Mocha", "Gray", "Dark Blue", "Sand", "Blue", "Dark Gray", "Cocoa", "Light Gray", "Blue", "Chocolate", "Khaki", "Magenta", "Blue", "Cherry", "Light Gray", "Cocoa", "Mocha", "Dark Cherry", "Dark Gray", "Mustard", "Dark Magenta", "Blue", "Pink"]
global color22namecars :=["Light Green", "Chocolate", "Blue", "Mustard", "Cream Pink", "Black", "Purple", "Light Blue", "Purple", "Bright Green", "Beige", "Purple", "Milky", "Cream", "Yellow", "Powdery", "Purple", "Pale Pink", "Pale Pink", "Pink", "Pink", "Pink", "Pink", "Gray-brown", "Gray", "Gray-light Green", "Blue", "Hakki", "Light Green", "Gray-blue", "Sand", "Light Gray", "Brick", "Brown", "Dark Green", "Peach Pink", "Dark Blue", "Sea Wave", "Dark Gray", "Gray-blue", "Pale Blue", " Violet", "Light Chocolate", "Pale Lilac", "Pale Purple", "Purple", "Dirty Green", "Light Chocolate", "Light Brown", "Bright Peach", "Pale Violet", "Pale Powdery", "Pale Pink", "Berry", "Light Mustard", "Dark Peach", "Dark Beige", "Light Brick", "Light Gray", "Light Gray", "Dark Green", "Green", "Light Green", "Gray-green", "Tea Rose", "Pale Green", "Milky", "White", "Yarkozhelty", "Pale Yellow", "White", "Egg", "Gray-blue", "Hakki", "Cream", "Gray-blue", "Gray-green", "Dark Gray", " Metallic", "Black And Blue", "Black And Gray", "Gray", "Gray", "Gray-blue", "Dark Gray-blue", "Purple", "Brick", "Milk", "Yellow-green", "Dark Green", "Beige", "Light Blue", "Peach", "Light Orange", "True Pink", "Light Yellow", "Peach Orange", "Dark Blue", "Light Chocolate", "Hakki", "Light Green", "Dark Green", "Cream Yellow", "Green", "Plum", "Dirty Yellow", "Purple-pink", "Light Crimson", "Dark Green", "Gray-green", "Dark Gray", "Powdery", "Sand", "Brick ", "Blue", "Yellow-green", "Dark Crimson", "Pale Green", "Chocolate", "Dark Green", "Gray-blue", "Gray", "Light Chocolate", "Cherry", "Milky", "Light Gray", "Gray", "Ivory", "Cream Gray", " Gray-blue"]
global pDetours								:=	0x0
global pickupTick							:=	0
global pInjectFunc							:=	0x0
global playerTick							:=	0
global pMemory								:=	0x0
global pParam1								:=	0x0
global pParam2								:=	0x0
global pParam3								:=	0x0
global pParam4								:=	0x0
global pParam5								:=	0x0
global rmaddrs								:=	[0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SAMP_3DTEXT							:=	0x12C7BC
global SAMP_CHAT_INFO_PTR					:=	0x21A0E4
global SAMP_CHAT_SHOW						:=	0x21A0E8
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:=	0x466
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:=	0x465
global SAMP_DIALOG_CAPTION_OFFSET			:=	0x40
global SAMP_DIALOG_ID_OFFSET				:=	0x30
global SAMP_DIALOG_INDEX_OFFSET				:=	0x443
global SAMP_DIALOG_INFO_PTR					:=	0x21A0B8
global SAMP_DIALOG_LINECOUNT_OFFSET			:=	0x150
global SAMP_DIALOG_LINENUMBER_OFFSET		:=	0x140
global SAMP_DIALOG_LINES_OFFSET				:=	0x44C
global SAMP_DIALOG_OFFSET					:=	0x34
global SAMP_DIALOG_OPEN_OFFSET				:=	0x28
global SAMP_DIALOG_PTR1_OFFSET				:=	0x1C
global SAMP_DIALOG_PTR2_OFFSET				:=	0x20
global SAMP_DIALOG_SHOW_OFFSET				:=	0x28
global SAMP_DIALOG_SIZE						:=	2048
global SAMP_DIALOG_STRUCT_PTR				:=	0x21A0B8
global SAMP_DIALOG_STYLE_OFFSET				:=	0x2C
global SAMP_DIALOG_TEXT						:=	0x12D8F8
global SAMP_DIALOG_TEXT_PTR_OFFSET			:=	0x34
global SAMP_DIALOG_TITLE					:=	0x40
global SAMP_DIALOG_TITLE_SIZE				:=	64
global SAMP_ILOCALPLAYERPING_OFFSET			:=	0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET		:=	0x2A
global SAMP_INFO_OFFSET						:=	0x21A0F8
global SAMP_INFO_PTR						:=	0x21A0F8
global SAMP_INFO_SETTINGS_OFFSET			:=	0x3C5
global SAMP_INPUT_INFO_PTR					:=	0x21A0E8
global SAMP_IPING_OFFSET					:=	0x28
global SAMP_ISCORE_OFFSET					:=	0x24
global SAMP_ISNPC_OFFSET					:=	0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET	:=	0x1A
global SAMP_ISTRLENNAME___OFFSET			:=	0x1C
global SAMP_KILL_INFO_PTR					:=	0x21A0EC
global SAMP_LOCALPLAYER						:=	0x22
global SAMP_MAX_GANGZONES					:=	1024
global SAMP_MAX_OBJECTS						:=	1000
global SAMP_MAX_PICKUPS						:=	4096
global SAMP_MAX_PLAYERS						:=	1004
global SAMP_MAX_PLAYERTEXTDRAWS				:=	256
global SAMP_MAX_TEXTDRAWS					:=	2048
global SAMP_MAX_TEXTLABELS					:=	2048
global SAMP_MAX_VEHICLES					:=	2000
global SAMP_MISC_INFO_PTR					:=	0x21A10C
global SAMP_PLAYER_MAX						:=	1004
global SAMP_POOL_ACTOR						:=	0x0
global SAMP_POOL_GANGZONE					:=	0x8
global SAMP_POOL_OBJECT						:=	0x4
global SAMP_POOL_PICKUP						:=	0x20
global SAMP_POOL_PLAYER						:=	0x18
global SAMP_POOL_PLAYERLABEL				:=	0x14
global SAMP_POOL_TEXTDRAW					:=	0x10
global SAMP_POOL_TEXTLABEL					:=	0xC
global SAMP_POOL_VEHICLE					:=	0x1C
global SAMP_POOLS							:=	0x3CD
global SAMP_PPOOL_PLAYER_OFFSET				:=	0x18
global SAMP_PPOOLS_OFFSET					:=	0x3CD
global SAMP_PREMOTEPLAYER_OFFSET			:=	0x2E
global SAMP_PSZLOCALPLAYERNAME_OFFSET		:=	0xA
global SAMP_PSZPLAYERNAME_OFFSET			:=	0xC
global SAMP_RAKCLIENT						:=	0x3C9
global SAMP_REMOTEPLAYERS					:=	0x2E
global SAMP_SCOREBOARD_INFO_PTR				:=	0x21A0B4
global SAMP_SKIN_OFFSET						:=	0x22
global SAMP_SLOCALPLAYERID_OFFSET			:=	0x4
global SAMP_SZHOSTNAME_OFFSET				:=	0x121
global SAMP_SZIP_OFFSET						:=	0x20
global SAMP_SZLOCALPLAYERNAME_OFFSET		:=	0xA
global SAMP_SZPLAYERNAME_OFFSET				:=	0xC
global SAMP_TEXTDRAW_FONT					:=	0x987
global SAMP_TEXTDRAW_LETTERHEIGHT			:=	0x967
global SAMP_TEXTDRAW_LETTERWIDTH			:=	0x963
global SAMP_TEXTDRAW_PROPORTIONAL			:=	0x97E
global SAMP_TEXTDRAW_RIGHT					:=	0x986
global SAMP_TEXTDRAW_XPOS					:=	0x98B
global SAMP_TEXTDRAW_YPOS					:=	0x98F
global SERVER_SPEED_KOEFF					:=	1.425
global SIZE_SAMP_CHATMSG					:=	0xFC
global textDrawTick							:=	0
global textLabelTick						:=	0
global VEHICLE_TYPE_BIKE					:=	2
global VEHICLE_TYPE_BOAT					:=	4
global VEHICLE_TYPE_CAR						:=	1
global VEHICLE_TYPE_HELI					:=	3
global VEHICLE_TYPE_PLANE					:=	5
global vehicleTick							:=	0
global zones								:=	[]
global functionPatches 						:=	{}
cities.Push(Object("NAME", "Las Venturas", "X1", 685.0, "Y1", 476.093, "X2", 3000.0, "Y2", 3000.0))
cities.Push(Object("NAME", "San Fierro", "X1", -3000.0, "Y1", -742.306, "X2", -1270.53, "Y2", 1530.24))
cities.Push(Object("NAME", "San Fierro", "X1", -1270.53, "Y1", -402.481, "X2", -1038.45, "Y2", 832.495))
cities.Push(Object("NAME", "San Fierro", "X1", -1038.45, "Y1", -145.539, "X2", -897.546, "Y2", 376.632))
cities.Push(Object("NAME", "Los Santos", "X1", 480.0, "Y1", -3000.0, "X2", 3000.0, "Y2", -850.0))
cities.Push(Object("NAME", "Los Santos", "X1", 80.0, "Y1", -2101.61, "X2", 1075.0, "Y2", -1239.61))
cities.Push(Object("NAME", "Tierra Robada", "X1", -1213.91, "Y1", 596.349, "X2", -480.539, "Y2", 1659.68))
cities.Push(Object("NAME", "Red County", "X1", -1213.91, "Y1", -768.027, "X2", 2997.06, "Y2", 596.349))
cities.Push(Object("NAME", "Flint County", "X1", -1213.91, "Y1", -2892.97, "X2", 44.6147, "Y2", -768.027))
cities.Push(Object("NAME", "Whetstone", "X1", -2997.47, "Y1", -2892.97, "X2", -1213.91, "Y2", -1115.58))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2667.810, "Y1", -302.135, "X2", -2646.400, "Y2", -262.320))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1315.420, "Y1", -405.388, "X2", -1264.400, "Y2", -209.543))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2550.040, "Y1", -355.493, "X2", -2470.040, "Y2", -318.493))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1490.330, "Y1", -209.543, "X2", -1264.400, "Y2", -148.388))
zones.Push(Object("NAME", "Garcia", "X1", -2395.140, "Y1", -222.589, "X2", -2354.090, "Y2", -204.792))
zones.Push(Object("NAME", "Shady Cabin", "X1", -1632.830, "Y1", -2263.440, "X2", -1601.330, "Y2", -2231.790))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1494.030, "X2", 2421.030, "Y2", -1454.350))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1236.630, "Y1", 1163.410, "X2", 1277.050, "Y2", 1203.280))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1277.050, "Y1", 1044.690, "X2", 1315.350, "Y2", 1087.630))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2470.040, "Y1", -355.493, "X2", -2270.040, "Y2", -318.493))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -926.999, "X2", 1357.000, "Y2", -910.170))
zones.Push(Object("NAME", "Unity Station", "X1", 1692.620, "Y1", -1971.800, "X2", 1812.620, "Y2", -1932.800))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1315.350, "Y1", 1044.690, "X2", 1375.600, "Y2", 1087.630))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1454.350, "X2", 2632.830, "Y2", -1393.420))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1858.100, "X2", 2495.090, "Y2", 1970.850))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -787.391, "X2", -956.476, "Y2", -768.027))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1170.870, "X2", 1463.900, "Y2", -1130.850))
zones.Push(Object("NAME", "Esplanade East", "X1", -1620.300, "Y1", 1176.520, "X2", -1580.010, "Y2", 1274.260))
zones.Push(Object("NAME", "Market Station", "X1", 787.461, "Y1", -1410.930, "X2", 866.009, "Y2", -1310.210))
zones.Push(Object("NAME", "Linden Station", "X1", 2811.250, "Y1", 1229.590, "X2", 2861.250, "Y2", 1407.590))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1582.440, "Y1", 347.457, "X2", 1664.620, "Y2", 401.750))
zones.Push(Object("NAME", "Frederick Bridge", "X1", 2759.250, "Y1", 296.501, "X2", 2774.250, "Y2", 594.757))
zones.Push(Object("NAME", "Yellow Bell Station", "X1", 1377.480, "Y1", 2600.430, "X2", 1492.450, "Y2", 2687.360))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1507.510, "Y1", -1385.210, "X2", 1582.550, "Y2", -1325.310))
zones.Push(Object("NAME", "Jefferson", "X1", 2185.330, "Y1", -1210.740, "X2", 2281.450, "Y2", -1154.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1318.130, "Y1", -910.170, "X2", 1357.000, "Y2", -768.027))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2361.510, "Y1", -417.199, "X2", -2270.040, "Y2", -355.493))
zones.Push(Object("NAME", "Jefferson", "X1", 1996.910, "Y1", -1449.670, "X2", 2056.860, "Y2", -1350.720))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1236.630, "Y1", 2142.860, "X2", 1297.470, "Y2", 2243.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2124.660, "Y1", -1494.030, "X2", 2266.210, "Y2", -1449.670))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1848.400, "Y1", 2478.490, "X2", 1938.800, "Y2", 2553.490))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1570.200, "X2", 466.223, "Y2", -1406.050))
zones.Push(Object("NAME", "Cranberry Station", "X1", -2007.830, "Y1", 56.306, "X2", -1922.000, "Y2", 224.782))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1391.050, "Y1", -1026.330, "X2", 1463.900, "Y2", -926.999))
zones.Push(Object("NAME", "Redsands West", "X1", 1704.590, "Y1", 2243.230, "X2", 1777.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Little Mexico", "X1", 1758.900, "Y1", -1722.260, "X2", 1812.620, "Y2", -1577.590))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1375.600, "Y1", 823.228, "X2", 1457.390, "Y2", 919.447))
zones.Push(Object("NAME", "Los Santos International", "X1", 1974.630, "Y1", -2394.330, "X2", 2089.000, "Y2", -2256.590))
zones.Push(Object("NAME", "Beacon Hill", "X1", -399.633, "Y1", -1075.520, "X2", -319.033, "Y2", -977.516))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1501.950, "X2", 422.680, "Y2", -1406.050))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1369.620, "X2", 334.503, "Y2", -1292.070))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1250.900, "X2", 1812.620, "Y2", -1150.870))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1703.230, "X2", 2137.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1378.330, "Y1", -1130.850, "X2", 1463.900, "Y2", -1026.330))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1197.390, "Y1", 1044.690, "X2", 1277.050, "Y2", 1163.390))
zones.Push(Object("NAME", "Conference Center", "X1", 1073.220, "Y1", -1842.270, "X2", 1323.900, "Y2", -1804.210))
zones.Push(Object("NAME", "Montgomery", "X1", 1451.400, "Y1", 347.457, "X2", 1582.440, "Y2", 420.802))
zones.Push(Object("NAME", "Foster Valley", "X1", -2270.040, "Y1", -430.276, "X2", -2178.690, "Y2", -324.114))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1325.600, "Y1", 596.349, "X2", 1375.600, "Y2", 795.010))
zones.Push(Object("NAME", "Los Santos International", "X1", 2051.630, "Y1", -2597.260, "X2", 2152.450, "Y2", -2394.330))
zones.Push(Object("NAME", "Mulholland", "X1", 1096.470, "Y1", -910.170, "X2", 1169.130, "Y2", -768.027))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1457.460, "Y1", 2723.230, "X2", 1534.560, "Y2", 2863.230))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1783.230, "X2", 2162.390, "Y2", 1863.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1210.740, "X2", 2185.330, "Y2", -1126.320))
zones.Push(Object("NAME", "Mulholland", "X1", 952.604, "Y1", -937.184, "X2", 1096.470, "Y2", -860.619))
zones.Push(Object("NAME", "Aldea Malvada", "X1", -1372.140, "Y1", 2498.520, "X2", -1277.590, "Y2", 2615.350))
zones.Push(Object("NAME", "Las Colinas", "X1", 2126.860, "Y1", -1126.320, "X2", 2185.330, "Y2", -934.489))
zones.Push(Object("NAME", "Las Colinas", "X1", 1994.330, "Y1", -1100.820, "X2", 2056.860, "Y2", -920.815))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -954.662, "X2", 768.694, "Y2", -860.619))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1277.050, "Y1", 1087.630, "X2", 1375.600, "Y2", 1203.280))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1377.390, "Y1", 2433.230, "X2", 1534.560, "Y2", 2507.230))
zones.Push(Object("NAME", "Willowfield", "X1", 2201.820, "Y1", -2095.000, "X2", 2324.000, "Y2", -1989.900))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1704.590, "Y1", 2342.830, "X2", 1848.400, "Y2", 2433.230))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1130.850, "X2", 1378.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Little Mexico", "X1", 1701.900, "Y1", -1842.270, "X2", 1812.620, "Y2", -1722.260))
zones.Push(Object("NAME", "Queens", "X1", -2411.220, "Y1", 373.539, "X2", -2253.540, "Y2", 458.411))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1515.810, "Y1", 1586.400, "X2", 1729.950, "Y2", 1714.560))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1292.070, "X2", 466.223, "Y2", -1235.070))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1026.330, "X2", 1391.050, "Y2", -926.999))
zones.Push(Object("NAME", "East Los Santos", "X1", 2266.260, "Y1", -1494.030, "X2", 2381.680, "Y2", -1372.040))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2623.180, "Y1", 943.235, "X2", 2749.900, "Y2", 1055.960))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -1941.400, "X2", 2703.580, "Y2", -1852.870))
zones.Push(Object("NAME", "Las Colinas", "X1", 2056.860, "Y1", -1126.320, "X2", 2126.860, "Y2", -920.815))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2625.160, "Y1", 2202.760, "X2", 2685.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1501.950, "X2", 334.503, "Y2", -1369.620))
zones.Push(Object("NAME", "Las Brujas", "X1", -365.167, "Y1", 2123.010, "X2", -208.570, "Y2", 2217.680))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2536.430, "Y1", 2442.550, "X2", 2685.160, "Y2", 2542.550))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1406.050, "X2", 466.223, "Y2", -1292.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.557, "Y1", -1227.280, "X2", 787.461, "Y2", -1118.280))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1684.650, "X2", 558.099, "Y2", -1570.200))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2498.210, "Y1", 2542.550, "X2", 2685.160, "Y2", 2626.550))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1430.870, "X2", 1812.620, "Y2", -1250.900))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1684.650, "X2", 312.803, "Y2", -1501.950))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1449.670, "X2", 2266.210, "Y2", -1372.040))
zones.Push(Object("NAME", "Hampton Barns", "X1", 603.035, "Y1", 264.312, "X2", 761.994, "Y2", 366.572))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1130.840, "X2", 1252.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1087.930, "Y1", 855.370, "X2", -961.950, "Y2", 986.281))
zones.Push(Object("NAME", "Verona Beach", "X1", 1046.150, "Y1", -1722.260, "X2", 1161.520, "Y2", -1577.590))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1722.260, "X2", 1440.900, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1357.000, "Y1", -926.999, "X2", 1463.900, "Y2", -768.027))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1570.200, "X2", 558.099, "Y2", -1385.070))
zones.Push(Object("NAME", "Mulholland", "X1", 911.802, "Y1", -860.619, "X2", 1096.470, "Y2", -768.027))
zones.Push(Object("NAME", "Mulholland", "X1", 768.694, "Y1", -954.662, "X2", 952.604, "Y2", -860.619))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 2377.390, "Y1", 788.894, "X2", 2537.390, "Y2", 897.901))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1852.870, "X2", 1971.660, "Y2", -1742.310))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2089.000, "Y1", -2394.330, "X2", 2201.820, "Y2", -2235.840))
zones.Push(Object("NAME", "Commerce", "X1", 1370.850, "Y1", -1577.590, "X2", 1463.900, "Y2", -1384.950))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2121.400, "Y1", 2508.230, "X2", 2237.400, "Y2", 2663.170))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1026.330, "X2", 1252.330, "Y2", -910.170))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1449.670, "X2", 1996.910, "Y2", -1350.720))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1242.980, "Y1", -50.096, "X2", -1213.910, "Y2", 578.396))
zones.Push(Object("NAME", "Martin Bridge", "X1", -222.179, "Y1", 293.324, "X2", -122.126, "Y2", 476.465))
zones.Push(Object("NAME", "The Strip", "X1", 2106.700, "Y1", 1863.230, "X2", 2162.390, "Y2", 2202.760))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -2059.230, "X2", 2703.580, "Y2", -1941.400))
zones.Push(Object("NAME", "Marina", "X1", 807.922, "Y1", -1577.590, "X2", 926.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1143.210, "X2", 1777.400, "Y2", 1203.280))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1742.310, "X2", 1951.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Esplanade East", "X1", -1580.010, "Y1", 1025.980, "X2", -1499.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1384.950, "X2", 1463.900, "Y2", -1170.870))
zones.Push(Object("NAME", "The Mako Span", "X1", 1664.620, "Y1", 401.750, "X2", 1785.140, "Y2", 567.203))
zones.Push(Object("NAME", "Rodeo", "X1", 312.803, "Y1", -1684.650, "X2", 422.680, "Y2", -1501.950))
zones.Push(Object("NAME", "Pershing Square", "X1", 1440.900, "Y1", -1722.260, "X2", 1583.500, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 687.802, "Y1", -860.619, "X2", 911.802, "Y2", -768.027))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.070, "Y1", 1490.470, "X2", -2616.400, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Colinas", "X1", 2185.330, "Y1", -1154.590, "X2", 2281.450, "Y2", -934.489))
zones.Push(Object("NAME", "Mulholland", "X1", 1169.130, "Y1", -910.170, "X2", 1318.130, "Y2", -768.027))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1938.800, "Y1", 2508.230, "X2", 2121.400, "Y2", 2624.230))
zones.Push(Object("NAME", "Commerce", "X1", 1667.960, "Y1", -1577.590, "X2", 1812.620, "Y2", -1430.870))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1544.170, "X2", 225.165, "Y2", -1404.970))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2536.430, "Y1", 2202.760, "X2", 2625.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1684.650, "X2", 225.165, "Y2", -1544.170))
zones.Push(Object("NAME", "Market", "X1", 952.663, "Y1", -1310.210, "X2", 1072.660, "Y2", -1130.850))
zones.Push(Object("NAME", "Las Colinas", "X1", 2632.740, "Y1", -1135.040, "X2", 2747.740, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 861.085, "Y1", -674.885, "X2", 1156.550, "Y2", -600.896))
zones.Push(Object("NAME", "King's", "X1", -2253.540, "Y1", 373.539, "X2", -1993.280, "Y2", 458.411))
zones.Push(Object("NAME", "Redsands East", "X1", 1848.400, "Y1", 2342.830, "X2", 2011.940, "Y2", 2478.490))
zones.Push(Object("NAME", "Downtown", "X1", -1580.010, "Y1", 744.267, "X2", -1499.890, "Y2", 1025.980))
zones.Push(Object("NAME", "Conference Center", "X1", 1046.150, "Y1", -1804.210, "X2", 1323.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -1118.280, "X2", 787.461, "Y2", -954.662))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", 277.411, "X2", -2867.850, "Y2", 458.411))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 930.890, "X2", 1166.530, "Y2", 1044.690))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1100.820, "X2", 1994.330, "Y2", -973.380))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1375.600, "Y1", 919.447, "X2", 1457.370, "Y2", 1203.280))
zones.Push(Object("NAME", "Regular Tom", "X1", -405.770, "Y1", 1712.860, "X2", -276.719, "Y2", 1892.750))
zones.Push(Object("NAME", "Verona Beach", "X1", 1161.520, "Y1", -1722.260, "X2", 1323.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2281.450, "Y1", -1372.040, "X2", 2381.680, "Y2", -1135.040))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2137.400, "Y1", 1703.230, "X2", 2437.390, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1951.660, "Y1", -1742.310, "X2", 2124.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Pilgrim", "X1", 2624.400, "Y1", 1383.230, "X2", 2685.160, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 2124.660, "Y1", -1742.310, "X2", 2222.560, "Y2", -1494.030))
zones.Push(Object("NAME", "Queens", "X1", -2533.040, "Y1", 458.411, "X2", -2329.310, "Y2", 578.396))
zones.Push(Object("NAME", "Downtown", "X1", -1871.720, "Y1", 1176.420, "X2", -1620.300, "Y2", 1274.260))
zones.Push(Object("NAME", "Commerce", "X1", 1583.500, "Y1", -1722.260, "X2", 1758.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1454.350, "X2", 2462.130, "Y2", -1135.040))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1577.590, "X2", 807.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1404.970, "X2", 225.165, "Y2", -1235.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.712, "Y1", -1416.250, "X2", 787.461, "Y2", -1227.280))
zones.Push(Object("NAME", "East Los Santos", "X1", 2222.560, "Y1", -1628.530, "X2", 2421.030, "Y2", -1494.030))
zones.Push(Object("NAME", "Rodeo", "X1", 558.099, "Y1", -1684.650, "X2", 647.522, "Y2", -1384.930))
zones.Push(Object("NAME", "Easter Tunnel", "X1", -1709.710, "Y1", -833.034, "X2", -1446.010, "Y2", -730.118))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1385.070, "X2", 647.522, "Y2", -1235.070))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2202.760, "X2", 2011.940, "Y2", 2342.830))
zones.Push(Object("NAME", "The Clown's Pocket", "X1", 2162.390, "Y1", 1783.230, "X2", 2437.390, "Y2", 1883.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1971.660, "Y1", -1852.870, "X2", 2222.560, "Y2", -1742.310))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1546.650, "Y1", 208.164, "X2", 1745.830, "Y2", 347.457))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -2235.840, "X2", 2201.820, "Y2", -1989.900))
zones.Push(Object("NAME", "Temple", "X1", 952.663, "Y1", -1130.840, "X2", 1096.470, "Y2", -937.184))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1848.400, "Y1", 2553.490, "X2", 1938.800, "Y2", 2863.230))
zones.Push(Object("NAME", "Los Santos International", "X1", 1400.970, "Y1", -2669.260, "X2", 2189.820, "Y2", -2597.260))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1213.910, "Y1", 950.022, "X2", -1087.930, "Y2", 1178.930))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1339.890, "Y1", 828.129, "X2", -1213.910, "Y2", 1057.040))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1339.890, "Y1", 599.218, "X2", -1213.910, "Y2", 828.129))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1213.910, "Y1", 721.111, "X2", -1087.930, "Y2", 950.022))
zones.Push(Object("NAME", "Verona Beach", "X1", 930.221, "Y1", -2006.780, "X2", 1073.220, "Y2", -1804.210))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1073.220, "Y1", -2006.780, "X2", 1249.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1130.840, "X2", 952.604, "Y2", -954.662))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1310.210, "X2", 952.663, "Y2", -1130.840))
zones.Push(Object("NAME", "Commerce", "X1", 1463.900, "Y1", -1577.590, "X2", 1667.960, "Y2", -1430.870))
zones.Push(Object("NAME", "Market", "X1", 787.461, "Y1", -1416.250, "X2", 1072.660, "Y2", -1310.210))
zones.Push(Object("NAME", "Rockshore West", "X1", 2377.390, "Y1", 596.349, "X2", 2537.390, "Y2", 788.894))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2237.400, "Y1", 2542.550, "X2", 2498.210, "Y2", 2663.170))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1668.130, "X2", 2747.740, "Y2", -1393.420))
zones.Push(Object("NAME", "Fallow Bridge", "X1", 434.341, "Y1", 366.572, "X2", 603.035, "Y2", 555.680))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -1989.900, "X2", 2324.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Chinatown", "X1", -2274.170, "Y1", 578.396, "X2", -2078.670, "Y2", 744.170))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2337.180, "X2", 8.430, "Y2", 2487.180))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2145.100, "X2", 2703.580, "Y2", -2059.230))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -768.027, "X2", -956.476, "Y2", -578.118))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1703.230, "X2", 2027.400, "Y2", 1863.230))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -430.276, "X2", -2831.890, "Y2", -222.589))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -860.619, "X2", 687.802, "Y2", -768.027))
zones.Push(Object("NAME", "Green Palms", "X1", 176.581, "Y1", 1305.450, "X2", 338.658, "Y2", 1520.720))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -768.027, "X2", 700.794, "Y2", -674.885))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2162.390, "Y1", 1883.230, "X2", 2437.390, "Y2", 2012.180))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1668.130, "X2", 2959.350, "Y2", -1498.620))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1372.040, "X2", 2281.450, "Y2", -1210.740))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1290.870, "X2", 1724.760, "Y2", -1150.870))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1430.870, "X2", 1724.760, "Y2", -1290.870))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1499.890, "Y1", 696.442, "X2", -1339.890, "Y2", 925.353))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 1457.390, "Y1", 823.228, "X2", 2377.390, "Y2", 863.229))
zones.Push(Object("NAME", "East Los Santos", "X1", 2421.030, "Y1", -1628.530, "X2", 2632.830, "Y2", -1454.350))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 1044.690, "X2", 1197.390, "Y2", 1203.220))
zones.Push(Object("NAME", "Las Colinas", "X1", 2747.740, "Y1", -1120.040, "X2", 2959.350, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 737.573, "Y1", -768.027, "X2", 1142.290, "Y2", -674.885))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2730.880, "X2", 2324.000, "Y2", -2418.330))
zones.Push(Object("NAME", "East Los Santos", "X1", 2462.130, "Y1", -1454.350, "X2", 2581.730, "Y2", -1135.040))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1722.330, "X2", 2632.830, "Y2", -1628.530))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2831.890, "Y1", -430.276, "X2", -2646.400, "Y2", -222.589))
zones.Push(Object("NAME", "Willowfield", "X1", 1970.620, "Y1", -2179.250, "X2", 2089.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Esplanade North", "X1", -1982.320, "Y1", 1274.260, "X2", -1524.240, "Y2", 1358.900))
zones.Push(Object("NAME", "The High Roller", "X1", 1817.390, "Y1", 1283.230, "X2", 2027.390, "Y2", 1469.230))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2418.330, "X2", 2324.000, "Y2", -2095.000))
zones.Push(Object("NAME", "Last Dime Motel", "X1", 1823.080, "Y1", 596.349, "X2", 1997.220, "Y2", 823.228))
zones.Push(Object("NAME", "Bayside Marina", "X1", -2353.170, "Y1", 2275.790, "X2", -2153.170, "Y2", 2475.790))
zones.Push(Object("NAME", "King's", "X1", -2329.310, "Y1", 458.411, "X2", -1993.280, "Y2", 578.396))
zones.Push(Object("NAME", "El Corona", "X1", 1692.620, "Y1", -2179.250, "X2", 1812.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1375.600, "Y1", 596.349, "X2", 1558.090, "Y2", 823.228))
zones.Push(Object("NAME", "The Pink Swan", "X1", 1817.390, "Y1", 1083.230, "X2", 2027.390, "Y2", 1283.230))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1197.390, "Y1", 1163.390, "X2", 1236.630, "Y2", 2243.230))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1393.420, "X2", 2747.740, "Y2", -1135.040))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1863.230, "X2", 2106.700, "Y2", 2011.830))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1938.800, "Y1", 2624.230, "X2", 2121.400, "Y2", 2861.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 851.449, "Y1", -1804.210, "X2", 1046.150, "Y2", -1577.590))
zones.Push(Object("NAME", "Robada Intersection", "X1", -1119.010, "Y1", 1178.930, "X2", -862.025, "Y2", 1351.450))
zones.Push(Object("NAME", "Linden Side", "X1", 2749.900, "Y1", 943.235, "X2", 2923.390, "Y2", 1198.990))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2703.580, "Y1", -2302.330, "X2", 2959.350, "Y2", -2126.900))
zones.Push(Object("NAME", "Willowfield", "X1", 2324.000, "Y1", -2059.230, "X2", 2541.700, "Y2", -1852.870))
zones.Push(Object("NAME", "King's", "X1", -2411.220, "Y1", 265.243, "X2", -1993.280, "Y2", 373.539))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1842.270, "X2", 1701.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Mulholland", "X1", 1269.130, "Y1", -768.027, "X2", 1414.070, "Y2", -452.425))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1804.210, "X2", 851.449, "Y2", -1577.590))
zones.Push(Object("NAME", "Battery Point", "X1", -2741.070, "Y1", 1268.410, "X2", -2533.040, "Y2", 1490.470))
zones.Push(Object("NAME", "The Four Dragons Casino", "X1", 1817.390, "Y1", 863.232, "X2", 2027.390, "Y2", 1083.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1203.220, "X2", 1197.390, "Y2", 1403.220))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1534.560, "Y1", 2433.230, "X2", 1848.400, "Y2", 2583.230))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1117.400, "Y1", 2723.230, "X2", 1457.460, "Y2", 2863.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1602.310, "X2", 2124.660, "Y2", -1449.670))
zones.Push(Object("NAME", "Redsands West", "X1", 1297.470, "Y1", 2142.860, "X2", 1777.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Doherty", "X1", -2270.040, "Y1", -324.114, "X2", -1794.920, "Y2", -222.589))
zones.Push(Object("NAME", "Hilltop Farm", "X1", 967.383, "Y1", -450.390, "X2", 1176.780, "Y2", -217.900))
zones.Push(Object("NAME", "Las Barrancas", "X1", -926.130, "Y1", 1398.730, "X2", -719.234, "Y2", 1634.690))
zones.Push(Object("NAME", "Pirates in Men's Pants", "X1", 1817.390, "Y1", 1469.230, "X2", 2027.400, "Y2", 1703.230))
zones.Push(Object("NAME", "City Hall", "X1", -2867.850, "Y1", 277.411, "X2", -2593.440, "Y2", 458.411))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2646.400, "Y1", -355.493, "X2", -2270.040, "Y2", -222.589))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 863.229, "X2", 2087.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Hashbury", "X1", -2593.440, "Y1", -222.589, "X2", -2411.220, "Y2", 54.722))
zones.Push(Object("NAME", "Los Santos International", "X1", 1852.000, "Y1", -2394.330, "X2", 2089.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 1098.310, "Y1", 1726.220, "X2", 1197.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Sherman Reservoir", "X1", -789.737, "Y1", 1659.680, "X2", -599.505, "Y2", 1929.410))
zones.Push(Object("NAME", "El Corona", "X1", 1812.620, "Y1", -2179.250, "X2", 1970.620, "Y2", -1852.870))
zones.Push(Object("NAME", "Downtown", "X1", -1700.010, "Y1", 744.267, "X2", -1580.010, "Y2", 1176.520))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1250.970, "X2", -1794.920, "Y2", -1115.580))
zones.Push(Object("NAME", "Las Payasadas", "X1", -354.332, "Y1", 2580.360, "X2", -133.625, "Y2", 2816.820))
zones.Push(Object("NAME", "Valle Ocultado", "X1", -936.668, "Y1", 2611.440, "X2", -715.961, "Y2", 2847.900))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1166.530, "Y1", 795.010, "X2", 1375.600, "Y2", 1044.690))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1852.870, "X2", 2632.830, "Y2", -1722.330))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -730.118, "X2", -1132.820, "Y2", -50.096))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2011.830, "X2", 2106.700, "Y2", 2202.760))
zones.Push(Object("NAME", "Esplanade East", "X1", -1499.890, "Y1", 578.396, "X2", -1339.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2087.390, "Y1", 1543.230, "X2", 2437.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Royal Casino", "X1", 2087.390, "Y1", 1383.230, "X2", 2437.390, "Y2", 1543.230))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1235.070, "X2", 321.356, "Y2", -1008.150))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1783.230, "X2", 2685.160, "Y2", 2012.180))
zones.Push(Object("NAME", "Mulholland", "X1", 1281.130, "Y1", -452.425, "X2", 1641.130, "Y2", -290.913))
zones.Push(Object("NAME", "Downtown", "X1", -1982.320, "Y1", 744.170, "X2", -1871.720, "Y2", 1274.260))
zones.Push(Object("NAME", "Hankypanky Point", "X1", 2576.920, "Y1", 62.158, "X2", 2759.250, "Y2", 385.503))
zones.Push(Object("NAME", "K.A.C.C. Military Fuels", "X1", 2498.210, "Y1", 2626.550, "X2", 2749.900, "Y2", 2861.550))
zones.Push(Object("NAME", "Harry Gold Parkway", "X1", 1777.390, "Y1", 863.232, "X2", 1817.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Bayside Tunnel", "X1", -2290.190, "Y1", 2548.290, "X2", -1950.190, "Y2", 2723.290))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2302.330, "X2", 2703.580, "Y2", -2145.100))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1044.070, "X2", 647.557, "Y2", -860.619))
zones.Push(Object("NAME", "Randolph Industrial Estate", "X1", 1558.090, "Y1", 596.349, "X2", 1823.080, "Y2", 823.235))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1852.870, "X2", 2959.350, "Y2", -1668.130))
zones.Push(Object("NAME", "Flint Water", "X1", -314.426, "Y1", -753.874, "X2", -106.339, "Y2", -463.073))
zones.Push(Object("NAME", "Blueberry", "X1", 19.607, "Y1", -404.136, "X2", 349.607, "Y2", -220.137))
zones.Push(Object("NAME", "Linden Station", "X1", 2749.900, "Y1", 1198.990, "X2", 2923.390, "Y2", 1548.990))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1350.720, "X2", 2056.860, "Y2", -1100.820))
zones.Push(Object("NAME", "Downtown", "X1", -1993.280, "Y1", 265.243, "X2", -1794.920, "Y2", 578.396))
zones.Push(Object("NAME", "Redsands West", "X1", 1377.390, "Y1", 2243.230, "X2", 1704.590, "Y2", 2433.230))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1235.070, "X2", 647.522, "Y2", -1044.070))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.450, "Y1", 1659.680, "X2", -2616.400, "Y2", 2175.150))
zones.Push(Object("NAME", "Lil' Probe Inn", "X1", -90.218, "Y1", 1286.850, "X2", 153.859, "Y2", 1554.120))
zones.Push(Object("NAME", "Flint Intersection", "X1", -187.700, "Y1", -1596.760, "X2", 17.063, "Y2", -1276.600))
zones.Push(Object("NAME", "Las Colinas", "X1", 2281.450, "Y1", -1135.040, "X2", 2632.740, "Y2", -945.035))
zones.Push(Object("NAME", "Sobell Rail Yards", "X1", 2749.900, "Y1", 1548.990, "X2", 2923.390, "Y2", 1937.250))
zones.Push(Object("NAME", "The Emerald Isle", "X1", 2011.940, "Y1", 2202.760, "X2", 2237.400, "Y2", 2508.230))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2123.010, "X2", 114.033, "Y2", 2337.180))
zones.Push(Object("NAME", "Santa Flora", "X1", -2741.070, "Y1", 458.411, "X2", -2533.040, "Y2", 793.411))
zones.Push(Object("NAME", "Playa del Seville", "X1", 2703.580, "Y1", -2126.900, "X2", 2959.350, "Y2", -1852.870))
zones.Push(Object("NAME", "Market", "X1", 926.922, "Y1", -1577.590, "X2", 1370.850, "Y2", -1416.250))
zones.Push(Object("NAME", "Queens", "X1", -2593.440, "Y1", 54.722, "X2", -2411.220, "Y2", 458.411))
zones.Push(Object("NAME", "Pilson Intersection", "X1", 1098.390, "Y1", 2243.230, "X2", 1377.390, "Y2", 2507.230))
zones.Push(Object("NAME", "Spinybed", "X1", 2121.400, "Y1", 2663.170, "X2", 2498.210, "Y2", 2861.550))
zones.Push(Object("NAME", "Pilgrim", "X1", 2437.390, "Y1", 1383.230, "X2", 2624.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1403.220, "X2", 1197.390, "Y2", 1726.220))
zones.Push(Object("NAME", "'The Big Ear'", "X1", -410.020, "Y1", 1403.340, "X2", -137.969, "Y2", 1681.230))
zones.Push(Object("NAME", "Dillimore", "X1", 580.794, "Y1", -674.885, "X2", 861.085, "Y2", -404.790))
zones.Push(Object("NAME", "El Quebrados", "X1", -1645.230, "Y1", 2498.520, "X2", -1372.140, "Y2", 2777.850))
zones.Push(Object("NAME", "Esplanade North", "X1", -2533.040, "Y1", 1358.900, "X2", -1996.660, "Y2", 1501.210))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1499.890, "Y1", -50.096, "X2", -1242.980, "Y2", 249.904))
zones.Push(Object("NAME", "Fisher's Lagoon", "X1", 1916.990, "Y1", -233.323, "X2", 2131.720, "Y2", 13.800))
zones.Push(Object("NAME", "Mulholland", "X1", 1414.070, "Y1", -768.027, "X2", 1667.610, "Y2", -452.425))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1498.620, "X2", 2959.350, "Y2", -1120.040))
zones.Push(Object("NAME", "San Andreas Sound", "X1", 2450.390, "Y1", 385.503, "X2", 2759.250, "Y2", 562.349))
zones.Push(Object("NAME", "Shady Creeks", "X1", -2030.120, "Y1", -2174.890, "X2", -1820.640, "Y2", -1771.660))
zones.Push(Object("NAME", "Market", "X1", 1072.660, "Y1", -1416.250, "X2", 1370.850, "Y2", -1130.850))
zones.Push(Object("NAME", "Rockshore West", "X1", 1997.220, "Y1", 596.349, "X2", 2377.390, "Y2", 823.228))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1534.560, "Y1", 2583.230, "X2", 1848.400, "Y2", 2863.230))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", -50.096, "X2", -1499.890, "Y2", 249.904))
zones.Push(Object("NAME", "Leafy Hollow", "X1", -1166.970, "Y1", -1856.030, "X2", -815.624, "Y2", -1602.070))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1457.390, "Y1", 863.229, "X2", 1777.400, "Y2", 1143.210))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1117.400, "Y1", 2507.230, "X2", 1534.560, "Y2", 2723.230))
zones.Push(Object("NAME", "Blueberry", "X1", 104.534, "Y1", -220.137, "X2", 349.607, "Y2", 152.236))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -464.515, "Y1", 2217.680, "X2", -208.570, "Y2", 2580.360))
zones.Push(Object("NAME", "Downtown", "X1", -2078.670, "Y1", 578.396, "X2", -1499.890, "Y2", 744.267))
zones.Push(Object("NAME", "Rockshore East", "X1", 2537.390, "Y1", 676.549, "X2", 2902.350, "Y2", 943.235))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1501.210, "X2", -1996.660, "Y2", 1659.680))
zones.Push(Object("NAME", "Paradiso", "X1", -2741.070, "Y1", 793.411, "X2", -2533.040, "Y2", 1268.410))
zones.Push(Object("NAME", "The Camel's Toe", "X1", 2087.390, "Y1", 1203.230, "X2", 2640.400, "Y2", 1383.230))
zones.Push(Object("NAME", "Old Venturas Strip", "X1", 2162.390, "Y1", 2012.180, "X2", 2685.160, "Y2", 2202.760))
zones.Push(Object("NAME", "Juniper Hill", "X1", -2533.040, "Y1", 578.396, "X2", -2274.170, "Y2", 968.369))
zones.Push(Object("NAME", "Juniper Hollow", "X1", -2533.040, "Y1", 968.369, "X2", -2274.170, "Y2", 1358.900))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2237.400, "Y1", 2202.760, "X2", 2536.430, "Y2", 2542.550))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2685.160, "Y1", 1055.960, "X2", 2749.900, "Y2", 2626.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 647.712, "Y1", -2173.290, "X2", 930.221, "Y2", -1804.210))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -599.884, "X2", -1794.920, "Y2", -324.114))
zones.Push(Object("NAME", "Arco del Oeste", "X1", -901.129, "Y1", 2221.860, "X2", -592.090, "Y2", 2571.970))
zones.Push(Object("NAME", "Fallen Tree", "X1", -792.254, "Y1", -698.555, "X2", -452.404, "Y2", -380.043))
zones.Push(Object("NAME", "The Farm", "X1", -1209.670, "Y1", -1317.100, "X2", -908.161, "Y2", -787.391))
zones.Push(Object("NAME", "The Sherman Dam", "X1", -968.772, "Y1", 1929.410, "X2", -481.126, "Y2", 2155.260))
zones.Push(Object("NAME", "Esplanade North", "X1", -1996.660, "Y1", 1358.900, "X2", -1524.240, "Y2", 1592.510))
zones.Push(Object("NAME", "Financial", "X1", -1871.720, "Y1", 744.170, "X2", -1701.300, "Y2", 1176.420))
zones.Push(Object("NAME", "Garcia", "X1", -2411.220, "Y1", -222.589, "X2", -2173.040, "Y2", 265.243))
zones.Push(Object("NAME", "Montgomery", "X1", 1119.510, "Y1", 119.526, "X2", 1451.400, "Y2", 493.323))
zones.Push(Object("NAME", "Creek", "X1", 2749.900, "Y1", 1937.250, "X2", 2921.620, "Y2", 2669.790))
zones.Push(Object("NAME", "Los Santos International", "X1", 1249.620, "Y1", -2394.330, "X2", 1852.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 72.648, "Y1", -2173.290, "X2", 342.648, "Y2", -1684.650))
zones.Push(Object("NAME", "Mulholland Intersection", "X1", 1463.900, "Y1", -1150.870, "X2", 1812.620, "Y2", -768.027))
zones.Push(Object("NAME", "Angel Pine", "X1", -2324.940, "Y1", -2584.290, "X2", -1964.220, "Y2", -2212.110))
zones.Push(Object("NAME", "Verdant Meadows", "X1", 37.032, "Y1", 2337.180, "X2", 435.988, "Y2", 2677.900))
zones.Push(Object("NAME", "Octane Springs", "X1", 338.658, "Y1", 1228.510, "X2", 664.308, "Y2", 1655.050))
zones.Push(Object("NAME", "Come-A-Lot", "X1", 2087.390, "Y1", 943.235, "X2", 2623.180, "Y2", 1203.230))
zones.Push(Object("NAME", "Redsands West", "X1", 1236.630, "Y1", 1883.110, "X2", 1777.390, "Y2", 2142.860))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 342.648, "Y1", -2173.290, "X2", 647.712, "Y2", -1684.650))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1249.620, "Y1", -2179.250, "X2", 1692.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1236.630, "Y1", 1203.280, "X2", 1457.370, "Y2", 1883.110))
zones.Push(Object("NAME", "Flint Range", "X1", -594.191, "Y1", -1648.550, "X2", -187.700, "Y2", -1276.600))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 930.221, "Y1", -2488.420, "X2", 1249.620, "Y2", -2006.780))
zones.Push(Object("NAME", "Palomino Creek", "X1", 2160.220, "Y1", -149.004, "X2", 2576.920, "Y2", 228.322))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2373.770, "Y1", -2697.090, "X2", 2809.220, "Y2", -2330.460))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -50.096, "X2", -947.980, "Y2", 578.396))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 883.308, "Y1", 1726.220, "X2", 1098.310, "Y2", 2507.230))
zones.Push(Object("NAME", "Calton Heights", "X1", -2274.170, "Y1", 744.170, "X2", -1982.320, "Y2", 1358.900))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", 249.904, "X2", -1242.980, "Y2", 578.396))
zones.Push(Object("NAME", "Los Santos Inlet", "X1", -321.744, "Y1", -2224.430, "X2", 44.615, "Y2", -1724.430))
zones.Push(Object("NAME", "Doherty", "X1", -2173.040, "Y1", -222.589, "X2", -1794.920, "Y2", 265.243))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -2189.910, "X2", -2030.120, "Y2", -1771.660))
zones.Push(Object("NAME", "Fort Carson", "X1", -376.233, "Y1", 826.326, "X2", 123.717, "Y2", 1220.440))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1115.580, "X2", -1794.920, "Y2", -599.884))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -222.589, "X2", -2593.440, "Y2", 277.411))
zones.Push(Object("NAME", "Fern Ridge", "X1", 508.189, "Y1", -139.259, "X2", 1306.660, "Y2", 119.526))
zones.Push(Object("NAME", "Bayside", "X1", -2741.070, "Y1", 2175.150, "X2", -2353.170, "Y2", 2722.790))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1203.280, "X2", 1777.390, "Y2", 1883.110))
zones.Push(Object("NAME", "Blueberry Acres", "X1", -319.676, "Y1", -220.137, "X2", 104.534, "Y2", 293.324))
zones.Push(Object("NAME", "Palisades", "X1", -2994.490, "Y1", 458.411, "X2", -2741.070, "Y2", 1339.610))
zones.Push(Object("NAME", "North Rock", "X1", 2285.370, "Y1", -768.027, "X2", 2770.590, "Y2", -269.740))
zones.Push(Object("NAME", "Hunter Quarry", "X1", 337.244, "Y1", 710.840, "X2", 860.554, "Y2", 1031.710))
zones.Push(Object("NAME", "Los Santos International", "X1", 1382.730, "Y1", -2730.880, "X2", 2201.820, "Y2", -2394.330))
zones.Push(Object("NAME", "Missionary Hill", "X1", -2994.490, "Y1", -811.276, "X2", -2178.690, "Y2", -430.276))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1659.680, "X2", -1996.660, "Y2", 2175.150))
zones.Push(Object("NAME", "Restricted Area", "X1", -91.586, "Y1", 1655.050, "X2", 421.234, "Y2", 2123.010))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2997.470, "Y1", -1115.580, "X2", -2178.690, "Y2", -971.913))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -1771.660, "X2", -1936.120, "Y2", -1250.970))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1794.920, "Y1", -730.118, "X2", -1213.910, "Y2", -50.096))
zones.Push(Object("NAME", "The Panopticon", "X1", -947.980, "Y1", -304.320, "X2", -319.676, "Y2", 327.071))
zones.Push(Object("NAME", "Shady Creeks", "X1", -1820.640, "Y1", -2643.680, "X2", -1226.780, "Y2", -1771.660))
zones.Push(Object("NAME", "Back o Beyond", "X1", -1166.970, "Y1", -2641.190, "X2", -321.744, "Y2", -1856.030))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2994.490, "Y1", -2189.910, "X2", -2178.690, "Y2", -1115.580))
zones.Push(Object("NAME", "Tierra Robada", "X1", -1213.910, "Y1", 596.349, "X2", -480.539, "Y2", 1659.680))
zones.Push(Object("NAME", "Flint County", "X1", -1213.910, "Y1", -2892.970, "X2", 44.615, "Y2", -768.027))
zones.Push(Object("NAME", "Whetstone", "X1", -2997.470, "Y1", -2892.970, "X2", -1213.910, "Y2", -1115.580))
zones.Push(Object("NAME", "Bone County", "X1", -480.539, "Y1", 596.349, "X2", 869.461, "Y2", 2993.870))
zones.Push(Object("NAME", "Tierra Robada", "X1", -2997.470, "Y1", 1659.680, "X2", -480.539, "Y2", 2993.870))
zones.Push(Object("NAME", "San Fierro", "X1", -2997.470, "Y1", -1115.580, "X2", -1213.910, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Venturas", "X1", 869.461, "Y1", 596.349, "X2", 2997.060, "Y2", 2993.870))
zones.Push(Object("NAME", "Red County", "X1", -1213.910, "Y1", -768.027, "X2", 2997.060, "Y2", 596.349))
zones.Push(Object("NAME", "Los Santos", "X1", 44.615, "Y1", -2892.970, "X2", 2997.060, "Y2", -768.027))
isTrailerAttached()
{
    return !checkHandles() ? "" : readMem(hGTA, getModuleBaseAddress("gta_sa.exe", hGTA) + 0x76FC70)
}
sendDialogResponse(dialogID, buttonID, listIndex := 0xFFFF, inputResponse := "")
{
    if ((inputLen := StrLen(inputResponse)) > 128 || !checkHandles())
    return false
    VarSetCapacity(buf, (bufLen := 0x17 + inputLen), 0)
    NumPut(48 + inputLen * 8, buf, 0, "UInt")
    NumPut(2048, buf, 4, "UInt")
    NumPut(pMemory + 1024 + 0x11, buf, 0xC, "UInt")
    NumPut(1, buf, 0x10, "UChar")
    NumPut(dialogID, buf, 0x11, "UShort")
    NumPut(buttonID, buf, 0x13, "UChar")
    NumPut(listIndex, buf, 0x14, "UShort")
    NumPut(inputLen, buf, 0x16, "UChar")
    if (inputLen > 0)
    StrPut(inputResponse, &buf + 0x17, inputLen, "")
    if (!__WRITERAW(hGTA, pMemory + 1024, &buf, bufLen))
    return false
    return __CALL(hGTA, dwSAMP + 0x30B30, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_RAKCLIENT])], ["i", dwSAMP + 0xD7FA8], ["i", pMemory + 1024], ["i", 1] , ["i", 9], ["i", 0], ["i", 0]], false, true)
}
__DWORD(hProcess, dwAddress, offsets)
{
    if (!hProcess || !dwAddress)
    return ""
    VarSetCapacity(dwRead, 4)
    for i, o in offsets
    {
        dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
        if (!dwRet)
        return ""
        dwAddress := NumGet(dwRead, 0, "UInt")
    }
    return dwAddress
}
__CALL(hProcess, dwFunc, aParams, bCleanupStack = true, bThisCall = false, bReturn = false, sDatatype = "Char")
{
    if (!hProcess || !dwFunc)
    return ""
    dataOffset := 0
    i := aParams.MaxIndex()
    bytesUsed := 0
    bytesMax := 5120
    dwLen := i * 5 + bCleanupStack * 3 + bReturn * 5 + 6
    VarSetCapacity(injectData, dwLen, 0)
    while (i > 0)
    {
        if (aParams[i][1] == "i" || aParams[i][1] == "p" || aParams[i][1] == "f")
        value := aParams[i][2]
        else if (aParams[i][1] == "s")
        {
            if (bytesMax - bytesUsed < StrLen(aParams[i][2]))
            return ""
            value := pMemory + bytesUsed
            __WRITESTRING(hProcess, value, [0x0], aParams[i][2])
            bytesUsed += StrLen(aParams[i][2]) + 1
            if (ErrorLevel)
            return ""
        }
        else
        return ""
        NumPut((bThisCall && i == 1 ? 0xB9 : 0x68), injectData, dataOffset, "UChar")
        NumPut(value, injectData, ++dataOffset, aParams[i][1] == "f" ? "Float" : "Int")
        dataOffset += 4
        i--
    }
    offset := dwFunc - (pInjectFunc + dataOffset + 5)
    NumPut(0xE8, injectData, dataOffset, "UChar")
    NumPut(offset, injectData, ++dataOffset, "Int")
    dataOffset += 4
    if (bReturn)
    {
        NumPut(sDatatype = "Char" || sDatatype = "UChar" ? 0xA2 : 0xA3, injectData, dataOffset, "UChar")
        NumPut(pMemory, injectData, ++dataOffset, "UInt")
        dataOffset += 4
    }
    if (bCleanupStack)
    {
        NumPut(0xC483, injectData, dataOffset, "UShort")
        dataOffset += 2
        NumPut((aParams.MaxIndex() - bThisCall) * 4, injectData, dataOffset, "UChar")
        dataOffset++
    }
    NumPut(0xC3, injectData, dataOffset, "UChar")
    __WRITERAW(hGTA, pInjectFunc, &injectData, dwLen)
    if (ErrorLevel)
    return ""
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return ""
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    if (bReturn)
    return __READMEM(hGTA, pMemory, [0x0], sDatatype)
    return true
}
__WRITESTRING(hProcess, dwAddress, oOffsets, wString)
{
    if (!hProcess || !dwAddress)
    return false
    if A_IsUnicode
    wString := __unicodeToAnsi(wString)
    requiredSize := StrPut(wString)
    VarSetCapacity(buffer, requiredSize)
    for i, o in oOffsets
    {
        if (i == oOffsets.MaxIndex())
        {
            StrPut(wString, &buffer, StrLen(wString) + 1)
            return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", requiredSize, "UInt", 0, "UInt")
        }
        dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", 4, "UInt*", 0)
        if (!dwRet)
        return false
        dwAddress := NumGet(buffer, 0, "UInt")
    }
}
__WRITEBYTES(hProcess, dwAddress, byteArray)
{
    if (!hProcess || !dwAddress || !byteArray)
    return false
    dwLen := byteArray.MaxIndex()
    VarSetCapacity(byteCode, dwLen)
    for i, o in byteArray
    NumPut(o, &byteCode, i - 1, "UChar")
    return __WRITERAW(hProcess, dwAddress, &byteCode, dwLen)
}
getByteSize(number)
{
    return number <= 0xFF ? 1 : number <= 0xFFFF ? 2 : 4
}
__INJECT(hProcess, aInstructions)
{
    aOpcodes := { "mov edi" : 0x3D8B, "NOP" : 0x90, "mov ecx" : 0xB9, "mov dword" : 0x05C7, "push" : 0x68, "call" : 0xE8, "mov byte" : 0x05C6
        , "ret" : 0xC3, "add esp" : 0xC483, "xor edi, edi" : 0xFF33, "xor eax, eax" : 0xC033, "mov edi, eax" : 0xF88B, "push edi" : 0x57, "push eax" : 0x50
        , "mov address, eax" : 0xA3, "mov [address], eax" : 0x0589, "test eax, eax" : 0xC085, "jz" : 0x74, "mov ecx, eax" : 0xC88B, "jmp" : 0xEB
    , "mov edx" : 0xBA, "fstp" : 0x1DD9}
    dwLen := 0
    for i, o in aInstructions
    dwLen += getByteSize(aOpcodes[o[1]]) + ((datatypes[o[2][2]] == null) ? 0 : datatypes[o[2][2]]) + ((datatypes[o[3][2]] == null ? 0 : datatypes[o[3][2]]))
    VarSetCapacity(injectData, dwLen, 0)
    dwDataOffset := 0
    for i, o in aInstructions
    {
        NumPut(aOpcodes[o[1]], injectData, dwDataOffset, getByteSize(aOpcodes[o[1]]) == 1 ? "UChar" : "UShort")
        dwDataOffset += getByteSize(aOpcodes[o[1]])
        if (o[2][1] != null)
        {
            NumPut(o[2][1] - (o[1] = "call" ? (pInjectFunc + 4 + dwDataOffset) : 0), injectData, dwDataOffset, o[2][2])
            dwDataOffset += datatypes[o[2][2]]
        }
        else
        continue
        if (o[3][1] != null)
        {
            NumPut(o[3][1], injectData, dwDataOffset, o[3][2])
            dwDataOffset += datatypes[o[3][2]]
        }
    }
    __WRITERAW(hGTA, pInjectFunc, &injectData, dwLen)
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return ErrorLevel ? false : __READMEM(hGTA, pMemory, [0x0], "Int")
}
NOP(hProcess, dwAddress, dwLen)
{
    if (dwLen < 1 || !hProcess || !dwAddress)
    return false
    VarSetCapacity(byteCode, dwLen)
    Loop % dwLen
    NumPut(0x90, &byteCode, A_Index - 1, "UChar")
    return __WRITERAW(hProcess, dwAddress, &byteCode, dwLen)
}
__READBYTE(hProcess, dwAddress)
{
    if (!checkHandles())
    return false
    VarSetCapacity(value, 1, 0)
    DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", value, "UInt", 1, "UInt *", 0)
    return NumGet(value, 0, "Byte")
}
__READSTRING(hProcess, dwAddress, oOffsets, dwLen)
{
    if (!hProcess || !dwAddress)
    return ""
    VarSetCapacity(dwRead, dwLen)
    for i, o in oOffsets
    {
        if (i == oOffsets.MaxIndex())
        {
            dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", dwLen, "UInt*", 0, "UInt")
            return !dwRet ? "" : (A_IsUnicode ? __ansiToUnicode(dwRead) : dwRead)
        }
        dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
        if (!dwRet)
        return ""
        dwAddress := NumGet(dwRead, 0, "UInt")
    }
}
__WRITEMEM(hProcess, dwAddress, oOffsets, value, sDatatype = "Int")
{
    dwLen := datatypes[sDatatype]
    if (dwLen < 1 || !hProcess || !dwAddress)
    return false
    VarSetCapacity(dwRead, 4)
    for i, o in oOffsets
    {
        if (i == oOffsets.MaxIndex())
        {
            NumPut(value, dwRead, 0, sDatatype)
            return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "UInt", &dwRead, "UInt", dwLen, "UInt", 0)
        }
        dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
        if (!dwRet)
        return false
        dwAddress := NumGet(dwRead, 0, "UInt")
    }
}
__READMEM(hProcess, dwAddress, oOffsets, sDatatype = "Int")
{
    if (!hProcess || !dwAddress)
    return ""
    VarSetCapacity(dwRead, 4)
    for i, o in oOffsets
    {
        dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
        if (!dwRet)
        return ""
        if (i == oOffsets.MaxIndex())
        return NumGet(dwRead, 0, sDatatype)
        dwAddress := NumGet(dwRead, 0, "UInt")
    }
}
__WRITERAW(hProcess, dwAddress, pBuffer, dwLen)
{
    return (!hProcess || !dwAddress || !pBuffer || dwLen < 1) ? false : DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress, "UInt", pBuffer, "UInt", dwLen, "UInt", 0, "UInt")
}
closeDialog()
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x6B210, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])]], false, true)
}
isDialogOpen()
{
    return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x28])
}
getDialogTextPos()
{
    return !checkHandles() ? false : [__DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x4]), __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x8])]
}
getDialogStyle()
{
    return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x2C])
}
getDialogID()
{
    return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x30])
}
setDialogID(id)
{
    return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x30], id, "UInt")
}
getDialogIndex()
{
    return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [0x12E350, 0x143]) + 1
}
getDialogCaption()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x40], 64)
}
getDialogText()
{
    return !checkHandles() ? "" : ((dialogText := __READSTRING(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x34])), [0x0], 4096)) == "" ? __READSTRING(hGTA, dwAddress, [0x0], getDialogTextSize(dwAddress)) : dialogText)
}
getDialogTextSize(dwAddress)
{
    Loop, 4096
    {
        if (!__READBYTE(hGTA, dwAddress + (i := A_Index - 1)))
        break
    }
    return i
}
getDialogLine(index)
{
    return index > (lines := getDialogLineCount()).Length() ? "" : lines[getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS ? ++index : index]
}
getDialogLineCount()
{
    return (text := getDialogText()) == "" ? -1 : StrSplit(text, "`n")
}
getDialogSelectedUI()
{
    if (!checkHandles() || !(uiAddress := __DWORD(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [0x21A190])), [0xF])))
    return 0
    dwAddress := __DWORD(hGTA, dwAddress, [0x15E])
    Loop, 3
    {
        if (__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4]) == uiAddress)
        return A_Index
    }
    return 0
}
showDialog(style, caption, text, button1, button2 := "", id := 1)
{
    if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4095 || StrLen(button1) > 10 || StrLen(button2) > 10 || !checkHandles())
    return false
    while(GetKeyState("ENTER", "P") || GetKeyState("NumpadENTER", "P"))
    continue
    sleep, 50
    return __CALL(hGTA, dwSAMP + 0x6B9C0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])], ["i", id], ["i", style], ["s", caption], ["s", text], ["s", button1], ["s", button2], ["i", 0]], false, true)
}
pressDialogButton(button)
{
    return !checkHandles() || button < 0 || button > 1 ? false : __CALL(hGTA, dwSAMP + 0x6C040, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])], ["i", button]], false, true)
}
blockDialog()
{
    return checkHandles() && NOP(hGTA, dwSAMP + 0x6C014, 7)
}
unblockDialog()
{
    return checkHandles() && __WRITEBYTES(hGTA, dwSAMP + 0x6C014, [0xC7, 0x46, 0x28, 0x1, 0x0, 0x0, 0x0])
}
setVehicleLightStatus(frontLeft, frontRight, rearBoth)
{
    return !checkHandles() || !isPlayerDriver() || getVehicleType() != 1 ? false : __WRITEMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x5B0]
    , (~frontLeft & 1) + ((~frontRight & 1) << 2) + ((~rearBoth & 1) << 6), "UChar")
}
isChatOpen()
{
    return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x8, 0x4], "UChar")
}
isInMenu()
{
    return checkHandles() && __READMEM(hGTA, 0xB6B964, [0x0], "UChar")
}
isScoreboardOpen()
{
    return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR, 0x0], "UChar")
}
sendChat(text)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + (SubStr(text, 1, 1) == "/" ? FUNC_SAMP_SEND_CMD : FUNC_SAMP_SEND_SAY), [["s", text]], false)
}
addChatMessage(text, color := 0xFFFFFFFF, timestamp := true)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x64010, [["i", __DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR])], ["i", timestamp ? 4 : 2], ["s", text], ["i", 0], ["i", color], ["i", 0]], false, true)
}
addChatMessageEx(color, text, timestamp := true)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x64010, [["i", __DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR])], ["i", timestamp ? 4 : 2], ["s", text], ["i", 0], ["i", color], ["i", 0]], false, true)
}
getPageSize()
{
    return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x0], "UChar")
}
setPageSize(pageSize)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x636D0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR])], ["i", pageSize]], false, true)
}
getMoney()
{
    return !checkHandles() ? "" : __READMEM(hGTA, 0xB7CE50, [0x0], "Int")
}
getPlayerAnim()
{
    return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x4], "Short")
}
getPing()
{
    if (!checkHandles() || !__CALL(hGTA, dwSAMP + 0x8A10, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR])]], false, true))
    return 0
    return  __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x26])
}
getScore()
{
    return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x2A])
}
getVehicleIDByNumberPlate(numberPlate)
{
    if (!checkHandles() || (len := StrLen(numberPlate)) <= 0 || len > 32 || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
    return false
    count := __DWORD(hGTA, dwAddress, [0x0])
    Loop % SAMP_MAX_VEHICLES
    {
        if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
        continue
        if (numberPlate == __READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], len))
        return A_Index - 1
        if (--count <= 0)
        break
    }
    return false
}
getVehicleNumberPlates()
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
    return ""
    vehicles := []
    count := __DWORD(hGTA, dwAddress, [0x0])
    Loop % SAMP_MAX_VEHICLES
    {
        if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
        continue
        vehicles[A_Index - 1] := __READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], 32)
        if (--count <= 0)
        break
    }
    return vehicles
}
getVehicleIDsByNumberPlate(numberPlate)
{
    if (!checkHandles() || (len := StrLen(numberPlate)) <= 0 || len > 32 || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
    return ""
    vehicles := []
    count := __DWORD(hGTA, dwAddress, [0x0])
    Loop % SAMP_MAX_VEHICLES
    {
        if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
        continue
        if (InStr(__READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], 32), numberPlate))
        vehicles.Push(A_Index - 1)
        if (--count <= 0)
        break
    }
    return vehicles
}
getVehiclePosition(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, vehicleID * 4 + 0x1134, 0x40, 0x14])), [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getVehicleNumberPlate(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, vehicleID * 4 + 0x1134, 0x93], 32)
}
getVehicleID()
{
    if (!checkHandles() || !isPlayerInAnyVehicle())
    return false
    return __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, isPlayerDriver() ? 0xAA : 0x5C], "UShort")
}
getPlayerScore(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x24])
}
isPlayerUsingCell(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0])
}
isPlayerUrinating(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x2B6])
}
isPlayerDancing(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x28A])
}
getPlayerDanceStyle(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x28E])
}
getPlayerDanceMove(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x292])
}
getPlayerDrunkLevel(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x281])
}
getPlayerSpecialAction(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xBB], "UChar")
}
getPlayerVehicleID(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xAD], "UShort")
}
getPlayerVehiclePos(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])), [0x93], "Float"), __READMEM(hGTA, dwAddress, [0x97], "Float"), __READMEM(hGTA, dwAddress, [0x9B], "Float")]
}
getPlayerTeamID(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x8], "UChar")
}
getPlayerState(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x9], "UChar")
}
getPlayerSeatID(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xA], "UChar")
}
getPlayerPing(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x28])
}
isNPC(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x4])
}
getAFKState(playerID)
{
    return !checkHandles() || playerID < 0 || playerID >= SAMP_MAX_PLAYERS ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x1D1])
}
__getPlayerWeaponID(playerID, slot)
{
    return (slot < 0 || slot > 12 || playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles()) ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4, 0x5A0 + slot * 0x1C])
}
getPlayerAmmo(playerID, slot)
{
    return (slot < 0 || slot > 12 || playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles()) ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4, 0x5AC + slot * 0x1C])
}
getPlayerColor(playerID)
{
    return !checkHandles() ? -1 : (((color := __DWORD(hGTA, dwSAMP, [0x216378 + playerID * 4])) >> 8) & 0xFF) + ((color >> 16) & 0xFF) * 0x100 + ((color >> 24) & 0xFF) * 0x10000
}
getPlayerColor1(playerID)
{
    return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [0x103078 + playerID * 4])
}
getChatBubbleText(playerID)
{
    return playerID < 0 || playerID > SAMP_MAX_PLAYERS - 1 || !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x21A0DC, playerID * 0x118 + 0x4], 256)
}
isChatBubbleShown(playerID)
{
    return playerID < 0 || playerID > SAMP_MAX_PLAYERS - 1 || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [0x21A0DC, playerID * 0x118], "Int")
}
getPlayerID(playerName, exact := 0)
{
    if (!updatePlayers())
    return ""
    for i, o in oPlayers
    {
        if (exact)
        {
            if (o = playerName)
            return i
        }
        else
        {
            if (InStr(o, playerName) == 1)
            return i
        }
    }
    return ""
}
getPlayerName(playerID)
{
    if (playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() || getPlayerScore(playerID) == "")
    return ""
    if (__DWORD(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4])), [0x1C]) > 15)
    return __READSTRING(hGTA, dwAddress, [0xC, 0x0], 25)
    return __READSTRING(hGTA, dwAddress, [0xC], 16)
}
getUsername()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x219A6F], 25)
}
getArmor()
{
    return !checkHandles() ? "" : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float")
}
getID()
{
    return !checkHandles() ? -1 : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x4], "UShort")
}
getChatlogPath()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x11], 256)
}
showGameText(text, time, style)
{
    text := RusToTextDraw(text)
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x9C2C0, [["s", text], ["i", time], ["i", style]], false)
}
getGameText()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x13BEFC], 128)
}
getGameTextByStyle(style)
{
    return !checkHandles() ? "" : __READSTRING(hGTA, 0xBAACC0, [style * 0x80], 128)
}
toggleChatShown(shown := true)
{
    return !checkHandles() ? -1 : __WRITEMEM(hGTA, dwSAMP, [0x64230], shown ? 0x56 : 0xC3, "UChar")
}
isChatShown()
{
    return checkHandles() && __READMEM(hGTA, dwSAMP, [0x64230], "UChar") == 0x56
}
isCheckpointSet()
{
    return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x24], "UChar")
}
toggleCheckpoint(toggle := true)
{
    return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x24], toggle ? 1 : 0 ,"UChar")
}
getCheckpointSize()
{
    return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x18], "Float")
}
getCheckpointPos()
{
    if (!checkhandles())
    return ""
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])
    for i, o in [0xC, 0x10, 0x14]
    pos%i% := __READMEM(hGTA, dwAddress, [o], "Float")
    return [pos1, pos2, pos3]
}
setCheckpointPos(cpPos)
{
    if (!checkhandles())
    return ""
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])
    for i, o in [0xC, 0x10, 0x14]
    pos%i% := __WRITEMEM(hGTA, dwAddress, [o], cpPos[A_Index], "Float")
    return [pos1, pos2, pos3]
}
setCheckpoint(fX, fY, fZ, fSize := 3.0)
{
    if (!checkHandles())
    return false
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    if (!__WRITERAW(hGTA, pMemory + 20, &buf, 16))
    return false
    return __CALL(hGTA, dwSAMP + 0x9D340, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])], ["i", pMemory + 20], ["i", pMemory + 32]], false, true) && toggleCheckpoint()
}
isRaceCheckpointSet()
{
    return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x49], "UChar")
}
toggleRaceCheckpoint(toggle := true)
{
    return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x49], toggle ? 1 : 0 ,"UChar")
}
getRaceCheckpointType()
{
    return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x48], "UChar")
}
getRaceCheckpointSize()
{
    return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x44], "Float")
}
getRaceCheckpointPos()
{
    if (!checkhandles())
    return ""
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])
    Loop, 6
    pos%A_Index% := __READMEM(hGTA, dwAddress, [0x2C + (A_Index - 1) * 4], "Float")
    return [pos1, pos2, pos3, pos4, pos5, pos6]
}
setRaceCheckpoint(type, fX, fY, fZ, fXNext, fYNext, fZNext, fSize := 3.0)
{
    if (!checkHandles())
    return false
    VarSetCapacity(buf, 28, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fXNext, buf, 12, "Float")
    NumPut(fYNext, buf, 16, "Float")
    NumPut(fZNext, buf, 20, "Float")
    if (!__WRITERAW(hGTA, pMemory + 24, &buf, 28))
    return false
    return __CALL(hGTA, dwSAMP + 0x9D660, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])], ["i", type], ["i", pMemory + 24], ["i", pMemory + 36]
    , ["f", fSize]], false, true) && toggleRaceCheckpoint()
}
getLastSentMsg()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x1565], 128)
}
setLastSentMsg(text)
{
    return checkHandles() && __WRITESTRING(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x1565], text)
}
pushSentMsg(text)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x65930, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR])], ["s", text]], false, true)
}
patchWanteds()
{
    return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x9C9C0, [0xC2, 0x04, 0x0, 0x0])
}
unpatchWanteds()
{
    return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x9C9C0, [0x8A, 0x44, 0x24,04])
}
checkSendCMDNOP()
{
    return checkHandles() && NOP(hGTA, dwSAMP + 0x65DF8, 5) && NOP(hGTA, dwSAMP + 0x65E45, 5)
}
patchSendSay(toggle := true)
{
    return !checkHandles() ? false : (toggle ? __WRITEBYTES(hGTA, dwSAMP + 0x64915, [0xC3, 0x90]) : __WRITEBYTES(hGTA, dwSAMP + 0x64915, [0x85, 0xC0]))
}
unpatchSendCMD()
{
    return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x65DF8, [0xE8, 0x63, 0xFE, 0xFF, 0xFF]) && __WRITEBYTES(hGTA, dwSAMP + 0x65E45, [0xE8, 0x16, 0xFE, 0xFF, 0xFF])
}
getChatRenderMode()
{
    return !checkHandles() ? -1 : __READMEM(hGTA, [SAMP_CHAT_INFO_PTR, 0x8], "UChar")
}
toggleScoreboard(toggle)
{
    return checkHandles() && (toggle ? __CALL(hGTA, dwSAMP + 0x6AD30, [["i", __DWORD(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR])]], false, true) : __CALL(hGTA, dwSAMP + 0x6A320, [["i", __DWORD(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR])], ["i", 1]], false, true))
}
toggleChatInput(toggle)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + (toggle ? 0x657E0 : 0x658E0), [["i", __DWORD(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR])]], false, true)
}
setGameState(state)
{
    return !checkHandles() ? false : __WRITEMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3BD], state)
}
getGameState()
{
    return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3BD])
}
isLineOfSightClear(fX1, fY1, fZ1, fX2, fY2, fZ2)
{
    if (!checkHandles())
    return false
    __WRITEMEM(hGTA, pMemory, [0x0], fX1, "Float")
    __WRITEMEM(hGTA, pMemory + 4, [0x0], fY1, "Float")
    __WRITEMEM(hGTA, pMemory + 8, [0x0], fZ1, "Float")
    __WRITEMEM(hGTA, pMemory + 12, [0x0], fX2, "Float")
    __WRITEMEM(hGTA, pMemory + 16, [0x0], fY2, "Float")
    __WRITEMEM(hGTA, pMemory + 20, [0x0], fZ2, "Float")
    return __CALL(hGTA, 0x56A490, [["i", pMemory], ["i", pMemory + 12], ["i", 1], ["i", 0], ["i", 0], ["i", 1], ["i", 0], ["i", 0], ["i", 0]], true, false, true)
}
takeScreenshot()
{
    return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [0x119CBC], "UChar")
}
getPlayerFightingStyle()
{
    return !checkHandles() ? false : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x72D], "UChar")
}
getMaxPlayerID()
{
    return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x0])
}
getWeatherID()
{
    return !checkHandles() ? "" : __READMEM(hGTA, 0xC81320, [0x0], "UShort")
}
getAmmo(slot)
{
    return (slot < 0 || slot > 12 || !checkHandles()) ? "" : __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x5AC + slot * 0x1C])
}
getWeaponID(slot)
{
    return (slot < 0 || slot > 12 || !checkHandles()) ? "" : __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x5A0 + slot * 0x1C])
}
getActiveWeaponSlot()
{
    return !checkHandles() ? -1 : __READMEM(hGTA, 0xB7CDBC, [0x0], "UChar")
}
cameraRestoreWithJumpcut()
{
    return checkHandles() && __CALL(hGTA, 0x50BAB0, [["i", 0xB6F028]], false, true)
}
calcAngle(xActor, yActor, xPoint, yPoint)
{
    fX := xActor - xPoint
    fY := yActor - yPoint
    return atan2(fX, fY)
}
atan2(x, y)
{
    return DllCall("msvcrt\atan2", "Double", y, "Double", x, "CDECL Double")
}
getPlayerZAngle()
{
    return !checkHandles() ? "" : __READMEM(hGTA, 0xB6F5F0, [0x0, 0x558], "Float")
}
setCameraPosX(fAngle)
{
    return checkHandles() && __WRITEMEM(hGTA, 0xB6F258, [0x0], "Float")
}
isPlayerFrozen()
{
    return checkHandles() && __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x42], "UChar")
}
isPlayerInRangeOfPoint(fX, fY, fZ, r)
{
    return checkHandles() && getDistance(getPlayerPos(), [fX, fY, fZ]) <= r
}
getMapQuadrant(pos)
{
    return pos[1] <= 0 ? (pos[2] <= 0 ? 3 : 1) : (pos[2] <= 0 ? 4 : 2)
}
getWeaponIDByName(weaponName)
{
    for i, o in oWeaponNames
    {
        if (o = weaponName)
        return i - 1
    }
    return -1
}
getWeaponName(weaponID)
{
    return weaponID < 0 || weaponID > oWeaponNames.MaxIndex() ? "" : oWeaponNames[weaponID + 1]
}
getPlayerPed(playerID)
{
    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? 0x0 : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4])
}
getIFPAnimationName1(playerID)
{
    if (!(ped := getPlayerPed(playerID)))
    return ""
    if (!(dwAddress := isTaskActive(ped, 401)))
    dwAddress := __DWORD(hGTA, ped, [0x47C])
    return __READSTRING(hGTA, dwAddress, [0x28], 10) . " , " . __READSTRING(hGTA, dwAddress, [0x10], 20)
}
getIFPAnimationName(playerID)
{
    if (!(ped := getPlayerPed(playerID)))
    return ""
    if (!(dwAddress := isTaskActive(ped, 401)))
    dwAddress := __DWORD(hGTA, ped, [0x47C])
    return __READSTRING(hGTA, dwAddress, [0x10], 20)
}
isTaskActive(ped, taskID)
{
    return !checkHandles() ? false : __CALL(hGTA, 0x681740, [["i", __DWORD(hGTA, ped, [0x47C]) + 0x4], ["i", taskID]], false, true, true, "UInt")
}
getVehicleColor1()
{
    return !checkHandles() ? false : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x434], "UChar")
}
getVehicleColor2()
{
    return !checkHandles() ? false : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x435], "UChar")
}
getVehicleSpeed()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : sqrt(((fSpeedX := __READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])), [0x44], "Float")) * fSpeedX) + ((fSpeedY := __READMEM(hGTA, dwAddress, [0x48], "Float")) * fSpeedY) + ((fSpeedZ := __READMEM(hGTA, dwAddress, [0x4C], "Float")) * fSpeedZ)) * 100 * SERVER_SPEED_KOEFF
}
getVehicleMaxSpeed(modelID)
{
    if (!checkHandles())
    return false
    return __READMEM(hGTA, 0xC2BA60, [(modelID - 400) * 0xE0], "Float")
}
getVehicleBootAngle()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x5DC], "Float")
}
getVehicleBonnetAngle()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x5C4], "Float")
}
getVehicleType()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? false : __CALL(hGTA, 0x6D1080, [["i", __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])]], false, true, true, "Char")
}
getInteriorID()
{
    return !checkHandles() ? false : __DWORD(hGTA, 0xA4ACE8, [0x0])
}
isPlayerInAnyVehicle()
{
    return checkHandles() && __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0]) > 0
}
isPlayerDriver()
{
    return checkHandles() && __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x460]) == __DWORD(hGTA, GTA_CPED_PTR, [0x0])
}
getPlayerHealth()
{
    return !checkHandles() ? -1 : Round(__READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x540], "Float"))
}
getPlayerArmor()
{
    return !checkHandles() ? -1 : Round(__READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float"))
}
getRemotePlayerHealth(playerID)
{
    return playerID < 0 || playerID > 1004 || !checkHandles() ? -1 : Round(__READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 0x4, 0x0, 0x1BC], "Float"))
}
getVehicleHealth()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : Round(__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x4C0], "Float"))
}
getVehicleRotation()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x0], "Float"), __READMEM(hGTA, dwAddress, [0x4], "Float"), __READMEM(hGTA, dwAddress, [0x8], "Float")]
}
getVehiclePos()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getPlayerVehicleModelID()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x22], "UShort")
}
__getVehicleModelName(modelID)
{
    return modelID < 400 || modelID > 611 ? "" : oVehicleNames[modelID - 399]
}
getPlayerVehicleEngineState()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 16 ? true : false)
}
getPlayerVehicleLightState()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 64 ? true : false)
}
getPlayerVehicleLockState()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x4F8]) == 2)
}
getPlayerVehicleSirenState()
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x1F7])
}
setVehicleSirenState(toggle := true)
{
    return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __WRITEMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x42D], toggle ? 208 : 80, "UChar")
}
toggleVision(type, toggle := true)
{
    return (type != 0 && type != 1) || !checkHandles() ? false : __WRITEMEM(hGTA, 0xC402B8, [type], toggle, "UChar")
}
toggleCursor(toggle)
{
    return checkHandles() && __WRITEMEM(hGTA, __DWORD(hGTA, dwSAMP + 0x21A0CC, [0x0]), [0x0], toggle ? true : false, "UChar") && __CALL(hGTA, dwSAMP + 0x9BD30, [["i", (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR]))], ["i", 0], ["i", 0]], false, true) && (toggle ? __CALL(hGTA, dwSAMP + 0x9BC10, [["i", dwAddress]], false, true) : true)
}
getDrunkLevel()
{
    return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8, 0x2C9])
}
setPlayerAttachedObject(slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
    return false
    VarSetCapacity(struct, 52, 0)
    NumPut(modelID, &struct, 0, "UInt")
    NumPut(bone, &struct, 4, "UInt")
    NumPut(xPos, &struct, 8, "Float")
    NumPut(yPos, &struct, 12, "Float")
    NumPut(zPos, &struct, 16, "Float")
    NumPut(xRot, &struct, 20, "Float")
    NumPut(yRot, &struct, 24, "Float")
    NumPut(zRot, &struct, 28, "Float")
    NumPut(xScale, &struct, 32, "Float")
    NumPut(yScale, &struct, 36, "Float")
    NumPut(zScale, &struct, 40, "Float")
    NumPut(color1, &struct, 44, "UInt")
    NumPut(color2, &struct, 48, "UInt")
    return !__WRITERAW(hGTA, pMemory + 1024, &struct, 52) ? false : __CALL(hGTA, dwSAMP + 0xAB3E0, [["i", dwAddress], ["i", slot], ["i", pMemory + 1024]], false, true)
}
setRemotePlayerAttachedObject(playerID, slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])))
    return false
    if (!(dwAddress := __DWORD(hGTA, dwAddress, [0x0])))
    return false
    VarSetCapacity(struct, 52, 0)
    NumPut(modelID, &struct, 0, "UInt")
    NumPut(bone, &struct, 4, "UInt")
    NumPut(xPos, &struct, 8, "Float")
    NumPut(yPos, &struct, 12, "Float")
    NumPut(zPos, &struct, 16, "Float")
    NumPut(xRot, &struct, 20, "Float")
    NumPut(yRot, &struct, 24, "Float")
    NumPut(zRot, &struct, 28, "Float")
    NumPut(xScale, &struct, 32, "Float")
    NumPut(yScale, &struct, 36, "Float")
    NumPut(zScale, &struct, 40, "Float")
    NumPut(color1, &struct, 44, "UInt")
    NumPut(color2, &struct, 48, "UInt")
    return !__WRITERAW(hGTA, pMemory + 1024, &struct, 52) ? false : __CALL(hGTA, dwSAMP + 0xAB3E0, [["i", dwAddress], ["i", slot], ["i", pMemory + 1024]], false, true)
}
printRemotePlayerAttachedObjects(playerID)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])))
    return false
    if (!(dwAddress := __DWORD(hGTA, dwAddress, [0x0])))
    return false
    array := []
    Loop, 10
    {
        if (!(objectID := __DWORD(hGTA, dwAddress, [0x74 + (A_Index - 1) * 0x34])))
        continue
    array.Push({"slot": A_Index - 1, "objectid": objectID})
    }
    return array
}
getPlayerAttachedObjects()
{
    if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
    return ""
    oPlayerObjects := []
    Loop, 10
    {
        if (!(objectID := __DWORD(hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
        continue
        oPlayerObjects.Push(Object("SLOT", A_Index - 1, "OBJECTID", objectID))
    }
    return oPlayerObjects
}
getPlayerAttachedObjectPos(slot)
{
    if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
    return ""
    posMatrix := []
    Loop, 9
    posMatrix[A_Index] := __READMEM(hGTA, dwLocalPlayerPED, [0x7C + slot * 0x34 + (A_Index - 1) * 0x4], "Float")
    return posMatrix
}
printPlayerAttachedObjectPos(slot)
{
    if ((posMatrix := getPlayerAttachedObjectPos(slot)) == "")
    return 0
    string := ""
    for i, o in posMatrix
    string .= o ", "
    StringTrimRight, string, string, 2
return {"slot": slot, "text": string}
}
printPlayerAttachedObjects()
{
    if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
    return ""
    oPlayerObjects := []
    Loop, 10
    {
        if (!(objectID := __DWORD(hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
        continue
        AddChatMessage("SLOT: " A_Index - 1 ", OBJECTID: " objectID)
    }
    return oPlayerObjects
}
clearPlayerAttachedObject(slot)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0xA96F0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])], ["i", slot]], false, true)
}
quitGame()
{
    return checkHandles() && __CALL(hGTA, 0x619B60, [["i", 0x1E], ["i", 0]])
}
getServerName()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x121], 259)
}
getServerIP()
{
    return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x20], 257)
}
getServerPort()
{
    return !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x225], "UInt")
}
isPlayerSwimming()
{
    return !checkHandles() ? "" : __CALL(hGTA, 0x601070, [["i", __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x47C])]], false, true, true, "UInt") > 0
}
getTargetPlayerID()
{
    return !checkHandles() ? 0xFFFF : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x161], "UShort")
}
isPlayerSpawned()
{
    return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x136])
}
updatePlayers()
{
    if (!checkHandles())
    return false
    if (playerTick + 1000 > A_TickCount)
    return true
    oPlayers := []
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    Loop, % getMaxPlayerID() + 1
    {
        if (!(dwRemoteplayer := __DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4])))
        continue
        oPlayers[A_Index - 1] := (__DWORD(hGTA, dwRemoteplayer, [0x1C]) > 15 ? __READSTRING(hGTA, dwRemoteplayer, [0xC, 0x0], 25) : __READSTRING(hGTA, dwRemoteplayer, [0xC], 16))
    }
    playerTick := A_TickCount
    return true
}
printPlayers()
{
    if (!updatePlayers())
    return false
    return oPlayers
}
getPlayerCount()
{
    if (!updatePlayers())
    return false
    playerCount := 1
    for i, o in oPlayers
    playerCount++
    return playerCount
}
updateGangzones()
{
    if (!checkHandles())
    return false
    if (gangZoneTick + 1000 > A_TickCount)
    return true
    oGangzones := []
    if (!(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_GANGZONE])))
    return false
    Loop % SAMP_MAX_GANGZONES
    {
        if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 4 * SAMP_MAX_GANGZONES]))
        continue
        oGangzones.Push(Object("ID", A_Index - 1, "XMIN", __READMEM(hGTA, (dwGangzone := __DWORD(hGTA, dwAddress, [(A_Index - 1) * 4])), [0x0], "Float"), "YMIN", __READMEM(hGTA, dwGangzone, [0x4], "Float"), "XMAX", __READMEM(hGTA, dwGangzone, [0x8], "Float"), "YMAX", __READMEM(hGTA, dwGangzone, [0xC], "Float"), "COLOR1", __DWORD(hGTA, dwGangzone, [0x10]), "COLOR2", __DWORD(hGTA, dwGangzone, [0x14])))
    }
    gangZoneTick := A_TickCount
    return true
}
printGangzones()
{
    if (!updateGangzones())
    return false
    return oGangzones
}
checkLyDTextDraws()
{
    if (!checkHandles())
    return false
    dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
    if (__READMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], "UInt") == 3)
    return false
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 315.0, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 540.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 12.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 1, "UChar")
    return true
}
changeLyDTextDraws()
{
    if (!checkHandles())
    return false
    dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 315.0, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 540.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 12.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 1, "UChar")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1F1FE0, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF009933, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFFFF901E, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFFFFFFF, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF00D7FF, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF00D7FF, "UInt")
    return true
}
resetLyDTextDraws()
{
    if (!checkHandles())
    return false
    dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 1, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.31, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.085, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 35.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 321.0, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.19, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 0.9, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 406.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 27.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 0, "UChar")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 26.0, "Float")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1D19B4, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF2C6836, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFF7F3C32, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFE1E1E1, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF106290, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF63C0E2, "UInt")
    return true
}
updateTextDraws()
{
    if (!checkHandles())
    return false
    if (textDrawTick + 1000 > A_TickCount)
    return true
    oTextDraws := []
    if (!(dwTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])))
    return false
    Loop, % SAMP_MAX_TEXTDRAWS
    {
        if (!__DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4]) || !(dwAddress := __DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS))])))
        continue
        oTextDraws.Push(Object("TYPE", "Global", "ID", A_Index - 1, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 800)))
    }
    Loop, % SAMP_MAX_PLAYERTEXTDRAWS
    {
        if (!__DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + SAMP_MAX_TEXTDRAWS * 4]) || !(dwAddress := __DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS * 2))])))
        continue
        oTextDraws.Push(Object("TYPE", "Player", "ID", A_Index - 1, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 800)))
    }
    textDrawTick := A_TickCount
    return true
}
getLYDWantedLevel()
{
    if (!checkHandles() || !(dwTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])))
    return ""
    Loop, % SAMP_MAX_PLAYERTEXTDRAWS
    {
        if (!__DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + SAMP_MAX_TEXTDRAWS * 4]) || !(dwAddress := __DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS * 2))])) || !InStr((string := __READSTRING(hGTA, dwAddress, [0x0], 800)), "Wantedlevel"))
        continue
        RegExMatch(string, "Wantedlevel: ~w~(\d+)", wantedlevel)
        return wantedlevel1
    }
    return ""
}
printTextDraws()
{
    if (!updateTextDraws())
    return false
    return oTextDraws
}
getTextDrawBySubstring(substring)
{
    if (!updateTextDraws())
    return ""
    for i, o in oTextDraws
    {
        if (InStr(o.TEXT, substring))
        return o.TEXT
    }
    return ""
}
deleteTextDraw(ByRef textDrawID)
{
    if (textDrawID < 0 || textDrawID > SAMP_MAX_TEXTDRAWS - 1 || !checkHandles())
    {
        textDrawID := -1
        return -1
    }
    if (__CALL(hGTA, dwSAMP + 0x1AD00, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])], ["i", textDrawID]], false, true))
    {
        textDrawID := -1
        return -1
    }
    return textDrawID
}
createTextDraw(text, xPos, yPos, letterColor := 0xFFFFFFFF, font := 3, letterWidth := 0.4, letterHeight := 1, shadowSize := 0, outline := 1
, shadowColor := 0xFF000000, box := 0, boxColor := 0xFFFFFFFF, boxSizeX := 0.0, boxSizeY := 0.0, left := 0, right := 0, center := 1
, proportional := 1, modelID := 0, xRot := 0.0, yRot := 0.0, zRot := 0.0, zoom := 1.0, color1 := 0xFFFF, color2 := 0xFFFF)
{
    if (font > 5 || StrLen(text) > 800 || !checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])))
    return -1
    text := RusToTextDraw(text)
    Loop, 2048
    {
        i := 2048 - A_Index
        if (__DWORD(hGTA, dwAddress, [i * 4]))
        continue
        VarSetCapacity(struct, 63, 0)
        NumPut((box ? 1 : 0) + (left ? 2 : 0) + (right ? 4 : 0) + (center ? 8 : 0) + (proportional ? 16 : 0), &struct, 0, "UChar")
        NumPut(letterWidth, &struct, 1, "Float")
        NumPut(letterHeight, &struct, 5, "Float")
        NumPut(letterColor, &struct, 9, "UInt")
        NumPut(boxSizeX, &struct, 0xD, "Float")
        NumPut(boxSizeY, &struct, 0x11, "Float")
        NumPut(boxColor, &struct, 0x15, "UInt")
        NumPut(shadowSize, &struct, 0x19, "UChar")
        NumPut(outline, &struct, 0x1A, "UChar")
        NumPut(shadowColor, &struct, 0x1B, "UInt")
        NumPut(font, &struct, 0x1F, "UChar")
        NumPut(1, &struct, 0x20, "UChar")
        NumPut(xPos, &struct, 0x21, "Float")
        NumPut(yPos, &struct, 0x25, "Float")
        NumPut(modelID, &struct, 0x29, "Short")
        NumPut(xRot, &struct, 0x2B, "Float")
        NumPut(yRot, &struct, 0x2F, "Float")
        NumPut(zRot, &struct, 0x33, "Float")
        NumPut(zoom, &struct, 0x37, "Float")
        NumPut(color1, &struct, 0x3B, "Short")
        NumPut(color2, &struct, 0x3D, "Short")
        return !__WRITERAW(hGTA, pMemory + 1024, &struct, 63) ? -1 : __CALL(hGTA, dwSAMP + 0x1AE20, [["i", dwAddress], ["i", i], ["i", pMemory + 1024], ["s", text]], false, true) ? i : -1
    }
    return -1
}
getTextDrawPos(textDrawID, textDrawType)
{
    if (textDrawType == "Global")
    return textDrawID < 0 || textDrawID > 2047 || !checkHandles() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], "Float"), __READMEM(hGTA, dwAddress, [0x98F], "Float")]
    else if (textDrawType == "Player")
    return textDrawID < 0 || textDrawID > 2047 || !checkHandles() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS*2)])), [0x98B], "Float"), __READMEM(hGTA, dwAddress, [0x98F], "Float")]
    else
    AddChatMessage("Укажите textDrawType в функции getTextDrawPos")
}
moveTextDraw(textDrawID, xPos, yPos)
{
    return textDrawID < 0 || textDrawID > 2047 || checkHandles() && __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], xPos, "Float") && __WRITEMEM(hGTA, dwAddress, [0x98F], yPos, "Float")
}
resizeTextDraw(textDrawID, letterWidth, letterHeight)
{
    return return textDrawID < 0 || textDrawID > 2047 || checkHandles()
    && __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP
    , [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x963], letterWidth
    , "Float") && __WRITEMEM(hGTA, dwAddress, [0x967], letterHeight, "Float")
}
setTextDrawAlignment(textDrawID, align)
{
    if (textDrawID < 0 || textDrawID > 2047 || !checkHandles())
    return false
    __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x970], align == "CENTER", "UChar")
    __WRITEMEM(hGTA, dwAddress, [0x985], align == "LEFT", "UChar")
    return __WRITEMEM(hGTA, dwAddress, [0x986], align == "RIGHT", "UChar")
}
setTextDrawFont(textDrawID, tdFont)
{
    return textDrawID < 0 || textDrawID > 2047 || checkHandles() && __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x987], tdFont, "UChar")
}
updateTextDraw(textDrawID, text)
{
    if (textDrawID < 0 || textDrawID > 2047 || StrLen(text) > 800 || !checkHandles())
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])
    return __WRITESTRING(hGTA, dwAddress, [0x0], text)
}
destroyObject(ByRef objectID)
{
    if (objectID < 0 || objectID > SAMP_MAX_OBJECTS - 1 || !checkHandles())
    {
        objectID := -1
        return false
    }
    if (__CALL(hGTA, dwSAMP + 0xF3F0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])], ["i", objectID]], false, true))
    {
        objectID := -1
        return true
    }
    return false
}
attachObjectToPlayerVehicle(objectID)
{
    if (!checkHandles())
    return false
    vehPtr := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
    if (vehPtr == "" || !vehPtr)
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
    if (!dwAddress)
    return false
    if (!__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
    return false
    if (__WRITEMEM(hGTA, dwAddress, [objectID * 0x4 + 0xFA4, 0x40, 0xFC], vehPtr, "UInt"))
    return true
    return false
}
createObject(modelID, xPos, yPos, zPos, xRot, yRot, zRot, drawDistance := 0)
{
    if (!(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || __DWORD(hGTA, dwAddress, [0x0]) == SAMP_MAX_OBJECTS)
    return -1
    Loop, % SAMP_MAX_OBJECTS - 1
    {
        i := SAMP_MAX_OBJECTS - A_Index
        if (__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
        continue
        return __CALL(hGTA, dwSAMP + 0xF470, [["i", dwAddress], ["i", i], ["i", modelID], ["f", xPos], ["f", yPos], ["f", zPos], ["f", xRot]
        , ["f", yRot], ["f", zRot], ["f", drawDistance]], false, true) ? i : -1
    }
    return -1
}
setObjectMaterialText(objectID, text, matIndex := 0, matSize := 90, font := "Arial", fontSize := 24, bold := 1, fontColor := 0xFFFFFFFF, backColor := 0xFF000000, align := 1)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || !__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
    return false
    return __CALL(hGTA, dwSAMP + 0xA3050, [["i", __DWORD(hGTA, dwAddress, [objectID * 0x4 + 0xFA4])], ["i", matIndex], ["s", text], ["i", matSize], ["s", font]
    , ["i", fontSize], ["i", bold], ["i", fontColor], ["i", backColor], ["i", align]], false, true)
}
editObject(objectID)
{
    return __CALL(hGTA, dwSAMP + 0x6DE40, [["i", __DWORD(hGTA, dwSAMP, [0x21A0C4])], ["i", objectID], ["i", 1]], false, true)
}
editAttachedObject(slot)
{
    return __CALL(hGTA, dwSAMP + 0x6DF00, [["i", __DWORD(hGTA, dwSAMP, [0x21A0C4])], ["i", slot]], false, true)
}
getObjectPos(objectID)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || !__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
    return false
    dwAddress := __DWORD(hGTA, dwAddress, [objectID * 0x4 + 0xFA4])
    xPos := __READMEM(hGTA, dwAddress, [0x10B], "Float")
    yPos := __READMEM(hGTA, dwAddress, [0x10F], "Float")
    zPos := __READMEM(hGTA, dwAddress, [0x113], "Float")
    xRot := __READMEM(hGTA, dwAddress, [0xAD], "Float")
    yRot := __READMEM(hGTA, dwAddress, [0xB1], "Float")
    zRot := __READMEM(hGTA, dwAddress, [0xB5], "Float")
    return [xPos, yPos, zPos, xRot, yRot, zRot]
}
printObjectPos(objectID)
{
    return ((pos := getObjectPos(objectID)) ? pos : 0)
}
getClosestObjectByModel(modelID)
{
    if (!updateObjects())
    return ""
    dist := -1
    obj := ""
    pPos := getPlayerPos()
    for i, o in oObjects
    {
        if (o.MODELID != modelID)
        continue
        if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
        {
            obj := o
            dist := newDist
        }
    }
    return obj
}
getClosestObjectModel()
{
    if (!updateObjects())
    return ""
    dist := -1
    model := ""
    pPos := getPlayerPos()
    for i, o in oObjects
    {
        if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
        {
            dist := newDist
            model := o.MODELID
        }
    }
    return model
}
printObjects()
{
    if (!updateObjects())
    return false
    return oObjects
}
printObjectsByModelID(modelID)
{
    if (!updateObjects())
    return false
    array := []
    for i, o in oObjects
    if (o.MODELID == modelID)
    array.Push(o)
    return array
}
isSirenAttached()
{
    if (!checkHandles())
    return false
    vehPtr := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
    if (vehPtr == "" || !vehPtr)
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
    if (!dwAddress)
    return false
    count := __DWORD(hGTA, dwAddress, [0x0])
    Loop, % SAMP_MAX_OBJECTS
    {
        i := A_Index - 1
        if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
        continue
        dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
        if (__DWORD(hGTA, dwObject, [0x4E]) == 18646 && __DWORD(hGTA, dwObject, [0x40, 0xFC]) == vehPtr)
        return true
        count--
        if (count <= 0)
        break
    }
    return false
}
createPickup(modelID, type, xPos, yPos, zPos)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])))
    return -1
    Loop, % SAMP_MAX_PICKUPS
    {
        if (__READMEM(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x4004], "Int") > 0)
        continue
        VarSetCapacity(struct, 20, 0)
        NumPut(modelID, &struct, 0, "UInt")
        NumPut(type, &struct, 4, "UInt")
        NumPut(xPos, &struct, 8, "Float")
        NumPut(yPos, &struct, 12, "Float")
        NumPut(zPos, &struct, 16, "Float")
        return !__WRITERAW(hGTA, pMemory + 1024, &struct, 20) ? -1 : __CALL(hGTA, dwSAMP + 0xFDC0, [["i", dwAddress], ["i", pMemory + 1024], ["i", A_Index - 1]] , false, true) ? A_Index - 1 : -1
    }
    return -1
}
getConnectionTicks()
{
    return !checkHandles() ? 0 : DllCall("GetTickCount") - __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3C1], "UInt")
}
getRunningTime()
{
    return !checkHandles() ? 0 : __READMEM(hGTA, 0xB610E1, [0x0], "UInt") / 4
}
deletePickup(ByRef pickupID)
{
    if (pickupID < 0 || pickupID > SAMP_MAX_PICKUPS - 1 || !checkHandles())
    return false
    if (__CALL(hGTA, dwSAMP + 0xFE70, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])], ["i", pickupID]], false, true))
    {
        pickupID := -1
        return true
    }
    return false
}
getPickupModel(modelID)
{
    if (!updatePickups())
    return ""
    for i, o in oPickups
    {
        if (o.MODELID == modelID)
        return o
    }
    return ""
}
getClosestPickupModel()
{
    if (!updatePickups())
    return -1
    dist := -1
    model := 0
    pPos := getPlayerPos()
    for i, o in oPickups
    {
        if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
        {
            dist := newDist
            model := o.MODELID
        }
    }
    return model
}
getPickupModelsInDistance(distance)
{
    if (!updatePickups())
    return ""
    array := []
    pPos := getPlayerPos()
    for i, o in oPickups
    {
        if (getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos) < distance)
        array.Push(o.MODELID)
    }
    return array
}
isPlayerDead(playerID)
{
    if (!checkHandles())
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4])
    if (!dwAddress2 || dwAddress2 == "")
    return false
    if (!(dwAddress3 := isTaskActive(dwAddress2, 401)))
    dwAddress3 := __DWORD(hGTA, dwAddress2, [0x47C])
    if (__READSTRING(hGTA, dwAddress3, [0x10], 20) == "crckdeth2")
    return true
    return false
}
getClosestDeadPlayer()
{
    if (!checkHandles())
    return [-1, 0]
    dist := 0
    playerID := -1
    pos1 := getPlayerPos()
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    Loop % getMaxPlayerID() + 1
    {
        dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4, 0x0, 0x0, 0x2A4])
        if (!dwAddress2 || dwAddress2 == "")
        continue
        if (!(dwAddress3 := isTaskActive(dwAddress2, 401)))
        dwAddress3 := __DWORD(hGTA, dwAddress2, [0x47C])
        if (__READSTRING(hGTA, dwAddress3, [0x10], 20) != "crckdeth2")
        continue
        dwAddress2 := __DWORD(hGTA, dwAddress2, [0x14])
        dist2 := getDistance([__READMEM(hGTA, dwAddress2, [0x30], "Float"), __READMEM(hGTA, dwAddress2, [0x34], "Float"), __READMEM(hGTA, dwAddress2, [0x38], "Float")], pos1)
        if (dist == 0 || dist2 < dist)
        {
            playerID := A_Index - 1
            dist := dist2
        }
    }
    return [playerID, dist]
}
getClosestPlayer()
{
    if (!checkHandles())
    return [-1, 0]
    dist := 0
    playerID := -1
    pos1 := getPlayerPos()
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    Loop % getMaxPlayerID() + 1
    {
        dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4, 0x0, 0x0])
        if (!dwAddress2 || dwAddress2 == "")
        continue
        dwAddress2 := __DWORD(hGTA, dwAddress2, [0x2A4, 0x14])
        if (!dwAddress2 || dwAddress2 == "")
        continue
        dist2 := getDistance([__READMEM(hGTA, dwAddress2, [0x30], "Float"), __READMEM(hGTA, dwAddress2, [0x34], "Float"), __READMEM(hGTA, dwAddress2, [0x38], "Float")], pos1)
        if (dist == 0 || dist2 < dist)
        {
            playerID := A_Index - 1
            dist := dist2
        }
    }
    return [playerID, dist]
}
saveGTASettings()
{
    return checkHandles() && __CALL(hGTA, 0x57C660, [["i", 0xBA6748]], false, true)
}
getLyDRadioStatus()
{
    return !checkHandles()? false : __READMEM(hGTA, dwSAMP + 0x11A610, [0x0], "UChar")
}
getLyDRadioText()
{
    return !checkHandles()? false : __READSTRING(hGTA, dwSAMP + 0x11A400, [0x0], 256)
}
getLyDRadioStation()
{
    return !checkHandles()? false : __READSTRING(hGTA, dwSAMP + 0x11A1F0, [0x0], 256)
}
setRadioVolume(volume)
{
    return (volume < 0 || volume > 16 || !checkHandles()) ? false : __CALL(hGTA, 0x506DE0, [["i", 0xB6BC90], ["i", volume * 4]], false, true) && __WRITEMEM(hGTA, 0xBA6798, [0x0], volume * 4, "UChar") && saveGTASettings()
}
getRadioVolume()
{
    return !checkHandles() ? false : __READMEM(hGTA, 0xBA6798, [0x0], "UChar")
}
setSFXVolume(volume)
{
    return (volume < 0 || volume > 16 || !checkHandles()) ? false : __CALL(hGTA, 0x506E10, [["i", 0xB6BC90], ["i", volume * 4]], false, true) && __WRITEMEM(hGTA, 0xBA6797, [0x0], volume * 4, "UChar") && saveGTASettings()
}
getSFXVolume()
{
    return !checkHandles() ? false : __READMEM(hGTA, 0xBA6797, [0x0], "UChar")
}
getDistanceToPickup(modelID)
{
    if (!updatePickups())
    return -1
    dist := -1
    pPos := getPlayerPos()
    for i, o in oPickups
    {
        if (o.MODELID != modelID)
        continue
        if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
        dist := newDist
    }
    return dist
}
printPickups()
{
    if (!updatePickups())
    return false
    return oPickups
}
updatePickups()
{
    if (pickupTick + 200 > A_TickCount)
    return true
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])) || (pickupCount := __DWORD(hGTA, dwAddress, [0x0])) <= 0)
    return false
    oPickups := []
    Loop, % SAMP_MAX_PICKUPS
    {
        pickupID := __READMEM(hGTA, dwAddress, [(i := A_Index - 1) * 4 + 0x4004], "Int")
        if (pickupID < 0)
        continue
        pickupCount--
        oPickups.Push(Object("ID", pickupID, "MODELID", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF004], "Int"), "TYPE", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF008], "Int"), "XPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF00C], "Float"), "YPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF010], "Float"), "ZPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF014], "Float")))
        if (pickupCount <= 0)
        break
    }
    pickupTick := A_TickCount
    return true
}
updateObjects()
{
    if (!checkHandles())
    return false
    if (objectTick + 1000 > A_TickCount)
    return true
    oObjects := []
    objectTick := A_TickCount
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
    if (!dwAddress)
    return false
    count := __DWORD(hGTA, dwAddress, [0x0])
    Loop, % SAMP_MAX_OBJECTS
    {
        i := A_Index - 1
        if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
        continue
        dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
        oObjects.Push(Object("ID", i, "MODELID", __DWORD(hGTA, dwObject, [0x4E]), "XPOS", __READMEM(hGTA, dwObject, [0x5C], "Float"), "YPOS"
        , __READMEM(hGTA, dwObject, [0x60], "Float"), "ZPOS", __READMEM(hGTA, dwObject, [0x64], "Float")))
        count--
        if (count <= 0)
        break
    }
    return true
}
_getChatline(dwIndex)
{
    if (dwIndex < 0 || dwIndex > 99 || !checkHandles())
    return false
    return __READSTRING(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x152 + 0xFC * (99 - dwIndex)], 144)
}
printObjectTexts()
{
    if (!checkHandles())
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
    if (!dwAddress)
    return false
    count := __DWORD(hGTA, dwAddress, [0x0])
    array := []
    Loop, % SAMP_MAX_OBJECTS
    {
        i := A_Index - 1
        if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
        continue
        dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
        string := __READSTRING(hGTA, dwObject, [0x10CB, 0x0], 256)
        if (string != "")
    array.Push({"id": i, "text": string, "x": __READMEM(hGTA, dwObject, [0x5C], "Float"), "y": __READMEM(hGTA, dwObject, [0x60], "Float")})
        count--
        if (count <= 0)
        break
    }
    return array
}
getTextLabelBySubstring(string)
{
    if (!updateTextLabels())
    return ""
    for i, o in oTextLabels
    {
        if (InStr(o.TEXT, string))
        return o.TEXT
    }
    return ""
}
updateTextLabels()
{
    if (!checkHandles())
    return false
    if (textLabelTick + 200 > A_TickCount)
    return true
    oTextLabels := []
    dwTextLabels := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])
    if (!dwTextLabels)
    return false
    Loop, % SAMP_MAX_TEXTLABELS
    {
        i := A_Index - 1
        if (!__DWORD(hGTA, dwTextLabels, [0xE800 + i * 4]))
        continue
        dwAddress := __DWORD(hGTA, dwTextLabels, [i * 0x1D])
        if (!dwAddress)
        continue
        fX := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x8], "Float")
        fY := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0xC], "Float")
        fZ := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x10], "Float")
        wVehicleID := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x1B], "UShort")
        wPlayerID := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x19], "UShort")
        oTextLabels.Push(Object("ID", i, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 256), "XPOS", fX, "YPOS", fY, "ZPOS", fZ, "VEHICLEID", wVehicleID, "PLAYERID"
        , wPlayerID, "VISIBLE", __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x18], "UChar"), "DISTANCE", __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x14], "Float")))
    }
    textLabelTick := A_TickCount
    return true
}
updateTextLabel(textLabelID, text)
{
    if (textLabelID < 0 || textLabelID > 2047 || !checkHandles())
    return false
    return __WRITESTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL, textLabelID * 0x1D, 0x0], text)
}
createTextLabel(text, color, xPos, yPos, zPos, drawDistance := 46.0, testLOS := 0, playerID := 0xFFFF, vehicleID := 0xFFFF)
{
    if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])))
    return -1
    Loop, % SAMP_MAX_TEXTLABELS
    {
        if (__DWORD(hGTA, dwAddress, [0xE800 + (SAMP_MAX_TEXTLABELS - A_Index) * 4]))
        continue
        return __CALL(hGTA, dwSAMP + 0x11C0, [["i", dwAddress], ["i", SAMP_MAX_TEXTLABELS - A_Index], ["s", text], ["i", color], ["f", xPos], ["f", yPos], ["f", zPos]
        , ["f", drawDistance], ["i", testLOS], ["i", playerID], ["i", vehicleID]], false, true) ? SAMP_MAX_TEXTLABELS - A_Index : -1
    }
    return -1
}
deleteTextLabel(ByRef textLabelID)
{
    if (textLabelID < 0 || !checkHandles())
    {
        textLabelID := -1
        return -1
    }
    if (__CALL(hGTA, dwSAMP + 0x12D0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])], ["i", textLabelID]], false, true))
    {
        textLabelID := -1
        return -1
    }
    return textLabelID
}
printPlayerTextLabels()
{
    if (!updateTextLabels())
    return false
    array := []
    for i, o in oTextLabels
    {
        if (o.TEXT != "" && o.TEXT != " " && o.PLAYERID != 0xFFFF)
        array.Push(o)
    }
    return array
}
printTextLabels()
{
    if (!updateTextLabels())
    return false
    return oTextLabels
}
countLabels()
{
    return !updateTextLabels() ? -1 : oTextLabels.Length()
}
getPlayerAttachedTextLabel(playerID)
{
    if (!checkHandles() || !updateTextLabels())
    return false
    for i, o in oTextLabels
    {
        if (playerID == o.PLAYERID)
        return o
    }
    return false
}
getPlayerAttachedTextLabels(playerID)
{
    if (!checkHandles() || !updateTextLabels())
    return false
    labels := []
    for i, o in oTextLabels
    {
        if (playerID == o.PLAYERID)
        labels.Push(o)
    }
    return labels
}
getLabelBySubstring(text := "")
{
    if (!updateTextLabels())
    return 0
    for i, o in oTextLabels
    {
        if (text != "" && InStr(o.TEXT, text) == 0)
        continue
        return o
    }
    return ""
}
getNearestLabel2(text := "", pos1 := "")
{
    if (!updateTextLabels())
    return 0
    nearest := ""
    dist := -1
    if (pos1 == "")
    pos1 := getPlayerPos()
    for i, o in oTextLabels
    {
        if (text != "" && !InStr(o.TEXT, text))
        continue
        newDist := getDistance(pos1, [o.XPOS, o.YPOS, o.ZPOS])
        if (dist == -1 || newDist < dist)
        {
            dist := newDist
            nearest := o
        }
    }
    return [nearest, dist]
}
getNearestLabel(text := "")
{
    if (!updateTextLabels())
    return 0
    nearest := 0
    dist := -1
    pos1 := getPlayerPos()
    for i, o in oTextLabels
    {
        if (text != "" && o.TEXT != text)
        continue
        newDist := getDistance(pos1, [o.XPOS, o.YPOS, o.ZPOS])
        if (dist == -1 || newDist < dist)
        {
            dist := newDist
            nearest := o
        }
    }
    return nearest
}
getNearestLabelDistance(text := "")
{
    if (!updateTextLabels())
    return 0
    nearest := 0
    dist := 5000
    pos1 := getPlayerPos()
    For i, o in oTextLabels
    {
        if (text != "" && !InStr(o.TEXT, text))
        continue
        pos2 := [o.XPOS, o.YPOS, o.ZPOS]
        dist2 := getDistance(pos1, pos2)
        if (dist2 < dist)
        {
            dist := dist2
            nearest := o
        }
    }
    return [nearest, dist]
}
createBlip(dwIcon, fX, fY)
{
    if (!checkHandles())
    return ""
    dwReturn := __INJECT(hGTA, [["NOP"]
    , ["push", [3, "Int"]]
    , ["push", [0, "Int"]]
    , ["push", [0.0, "Float"]]
    , ["push", [fY, "Float"]]
    , ["push", [fX, "Float"]]
    , ["push", [4, "Int"]]
    , ["call", [0x583820, "Int"]]
    , ["mov address, eax", [pMemory, "Int"]]
    , ["push", [dwIcon, "Int"]]
    , ["push eax"]
    , ["call", [0x583D70, "Int"]]
    , ["add esp", [0x20, "UChar"]]
    , ["ret"]])
    return dwReturn
}
clearBlip(dwBlip)
{
    if (!checkHandles() || !dwBlip)
    return false
    return __CALL(hGTA, 0x587CE0, [["i", dwBlip]])
}
getBlipPosByIconID(iconID)
{
    if (!checkHandles())
    return Object("ID", -1)
    Loop % GTA_BLIP_COUNT
    {
        currentElement := GTA_BLIP_POOL + (A_Index - 1) * GTA_BLIP_ELEMENT_SIZE
        if (__READMEM(hGTA, currentElement + GTA_BLIP_ID_OFFSET, [0x0], "UChar") != iconID)
        continue
        xPos := __READMEM(hGTA, currentElement + GTA_BLIP_X_OFFSET, [0x0], "Float")
        yPos := __READMEM(hGTA, currentElement + GTA_BLIP_Y_OFFSET, [0x0], "Float")
        zPos := __READMEM(hGTA, currentElement + GTA_BLIP_Z_OFFSET, [0x0], "Float")
        return Object("ID", A_Index - 1, "XPOS", xpos, "YPOS", yPos, "ZPOS", zPos)
    }
    return Object("ID", -1)
}
printMapIcons()
{
    if (!checkHandles())
    return false
    array := []
    Loop % GTA_BLIP_COUNT
    {
        currentElement := GTA_BLIP_POOL + (A_Index - 1) * GTA_BLIP_ELEMENT_SIZE
        style := __READMEM(hGTA, currentElement + GTA_BLIP_STYLE_OFFSET, [0x0], "UChar")
        id := __READMEM(hGTA, currentElement + GTA_BLIP_ID_OFFSET, [0x0], "UChar")
        xPos := __READMEM(hGTA, currentElement + GTA_BLIP_X_OFFSET, [0x0], "Float")
        yPos := __READMEM(hGTA, currentElement + GTA_BLIP_Y_OFFSET, [0x0], "Float")
        zPos := __READMEM(hGTA, currentElement + GTA_BLIP_Z_OFFSET, [0x0], "Float")
        color := intToHex(__READMEM(hGTA, currentElement + GTA_BLIP_COLOR_OFFSET, [0x0], "UInt"))
        if (id != 0)
    array.Push({"id": id, "style": style, "coord": [xPos, yPos, zPos], "color": color})
    }
    return array
}
getVehicleAddress(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4])
}
__getVehicleModelID(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? false : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x22], "UShort")
}
__getVehicleLockState(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x4F8], "UShort") == 2
}
__getVehicleEngineState(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x428], "UShort") & 16 ? true : false
}
__getVehicleLightState(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x428], "UShort") & 64 ? true : false
}
__getVehicleSirenState(vehicleID)
{
    return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x1F7], "UShort")
}
getVehicleDriver(vehicleID)
{
    if (vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES || !checkHandles() || !updatePlayers())
    return ""
    dwPed := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x460])
    if (dwPed == 0x0 || dwPed == "")
    return ""
    if (dwPed == __DWORD(hGTA, GTA_CPED_PTR, [0x0]))
    return Object("ID", getID(), "NAME", getUserName())
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    for i, o in oPlayers
    {
        if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) == dwPed)
        return Object("ID", i, "NAME", o)
    }
    return ""
}
getVehicleDriverByPtr(dwVehiclePtr)
{
    if (dwVehiclePtr == 0x0 || dwVehiclePtr == "" | !checkHandles() || !updatePlayers())
    return ""
    dwPed := __DWORD(hGTA, dwVehiclePtr, [0x460])
    if (dwPed == 0x0 || dwPed == "")
    return ""
    if (dwPed == __DWORD(hGTA, GTA_CPED_PTR, [0x0]))
    return Object("ID", getID(), "NAME", getUserName())
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    for i, o in oPlayers
    {
        if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) == dwPed)
        return Object("ID", i, "NAME", o)
    }
    return ""
}
getPlayerPosition(playerID)
{
    if (playerID < 0 || !checkHandles() || playerID > getMaxPlayerID() || playerID == getID())
    return ""
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0])
    if (!dwAddress || dwAddress == "")
    return ""
    dwAddress := __DWORD(hGTA, dwAddress, [0x2A4, 0x14])
    return [__READMEM(hGTA, dwAddress, [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getClosestVehicleDriver(modelID := -1, skipOwn := 1)
{
    if ((modelID < 400 && modelID != -1) || modelID > 611 || !checkHandles() || !updateVehicles())
    return ""
    nearest := ""
    dist := 10000.0
    pos1 := getPlayerPos()
    vehPTR := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
    closestDriver := ""
    playerID := getID()
    for i, o in oVehicles
    {
        if (modelID != -1 && modelID != o.MODELID || (skipOwn == 1 && o.PTR == vehPTR))
        continue
        dist2 := getDistance(pos1, getVehiclePosByPtr(o.PTR))
        if (dist2 < dist && (driver := getVehicleDriverByPtr(o.PTR)) != "")
        {
            if (skipOwn == 2 && driver.ID == playerID)
            continue
            dist := dist2
            nearest := o
            closestDriver := driver
        }
    }
    return [closestDriver, dist]
}
getVehiclePassengers(vehicleID)
{
    if (vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES || !checkHandles() || !updatePlayers())
    return ""
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4])
    if (dwAddress == 0x0 || dwAddress == "")
    return ""
    dwCPedPtr := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
    passengers := []
    Loop, 10
    {
        if ((dwPED := __DWORD(hGTA, dwAddress + 0x45C, [4 * A_Index])) == 0x0)
        continue
        if (dwCPedPtr == dwPED)
        passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", getID(), "NAME", getUsername()))
        else
        passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", 0xFFFF, "NAME", ""))
    }
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    for i, o in oPlayers
    {
        for j, k in passengers
        {
            if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) != k.PED)
            continue
            k.ID := i
            k.NAME := o
        }
    }
    return passengers
}
getMyVehiclePassengers()
{
    if (!checkHandles() || !updatePlayers())
    return ""
    dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
    if (!dwAddress)
    return ""
    dwCPedPtr := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
    passengers := []
    Loop, 10
    {
        if ((dwPED := __DWORD(hGTA, dwAddress + 0x45C, [4 * A_Index])) == 0x0)
        continue
        if (dwCPedPtr == dwPED)
        passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", getID(), "NAME", getUsername()))
        else
        passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", 0xFFFF, "NAME", ""))
    }
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    for i, o in oPlayers
    {
        for j, k in passengers
        {
            if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) != k.PED)
            continue
            k.ID := i
            k.NAME := o
        }
    }
    return passengers
}
updateVehicles()
{
    if (!checkHandles())
    return false
    if (vehicleTick + 1000 > A_TickCount)
    return true
    oVehicles := []
    stVehiclePool := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])
    if (!stVehiclePool)
    return false
    vehicleCount := __DWORD(hGTA, stVehiclePool, [0x0])
    Loop, % SAMP_MAX_VEHICLES
    {
        if (!__DWORD(hGTA, stVehiclePool, [0x3074 + (A_Index - 1) * 0x4]))
        continue
        vehPtr := __DWORD(hGTA, stVehiclePool, [0x4FB4 + (A_Index - 1) * 0x4])
        if (!vehPtr)
        continue
        oVehicles.Push(Object("ID", A_Index - 1, "PTR", vehPTR, "MODELID", __READMEM(hGTA, vehPtr, [0x22], "UShort")))
        vehicleCount--
        if (vehicleCount < 1)
        break
    }
    vehicleTick := A_TickCount
    return true
}
getVehiclePosByPtr(dwVehPtr)
{
    if (!dwVehPtr || !checkHandles())
    return false
    dwAddress := __DWORD(hGTA, dwVehPtr, [0x14])
    if (!dwAddress)
    return false
    return [__READMEM(hGTA, dwAddress, [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getClosestVehicle(modelID := -1, skipOwn := true)
{
    if ((modelID < 400 && modelID != -1) || modelID > 611 || !checkHandles() || !updateVehicles())
    return ""
    nearest := ""
    dist := 10000.0
    pos1 := getPlayerPos()
    vehPTR := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
    for i, o in oVehicles
    {
        if (modelID != -1 && modelID != o.MODELID || (skipOwn && o.PTR == vehPTR))
        continue
        dist2 := getDistance(pos1, getVehiclePosByPtr(o.PTR))
        if (dist2 < dist)
        {
            dist := dist2
            nearest := o
        }
    }
    return nearest
}
getPlayerSkin()
{
    return !checkHandles() ? false : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x22], "UShort")
}
getSkinID(dwID := -1)
{
    if (dwID == -1)
    dwID := GetID()
    if (!checkHandles() || dwID > SAMP_MAX_PLAYERS || dwID < 0)
    return -1
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + dwID * 4])
    if (!dwAddress)
    return -1
    dwAddress := __DWORD(hGTA, dwAddress, [0x0])
    if (!dwAddress)
    return -1
    dwAddress := __DWORD(hGTA, dwAddress, [0x0])
    if (!dwAddress)
    return -1
    dwAddress := __DWORD(hGTA, dwAddress, [0x2A4])
    if (!dwAddress)
    return -1
    skin := __READMEM(hGTA, dwAddress, [0x22], "UShort")
    if (ErrorLevel)
    return -1
    return skin
}
setPlayerSkin(skinID)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x9A590, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])], ["i", skinID]], false, true)
}
getPlayerPos()
{
    return !checkHandles() ? "" : [__READMEM(hGTA, 0xB6F2E4, [0x0], "Float"), __READMEM(hGTA, 0xB6F2E8, [0x0], "Float"), __READMEM(hGTA, 0xB6F2EC, [0x0], "Float")]
}
getDistance(pos1, pos2)
{
    return !pos1 || pos1 == "" || !pos2 || pos2 == "" ? -1 : Sqrt((pos1[1] - pos2[1]) * (pos1[1] - pos2[1]) + (pos1[2] - pos2[2]) * (pos1[2] - pos2[2]) + (pos1[3] - pos2[3]) * (pos1[3] - pos2[3]))
}
isKillInfoEnabled()
{
    return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR, 0x0])
}
toggleKillInfoEnabled(toggle := true)
{
    return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR, 0x0], toggle ? 1 : 0, "UInt")
}
getKilledPlayers(bReset := false)
{
    if (!checkHandles())
    return ""
    kills := []
    dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
    dwLocalPED := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
    Loop % getMaxPlayerID() + 1
    {
        dwRemoteplayer := __DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4])
        if (!dwRemoteplayer)
        continue
        fHealth := __READMEM(hGTA, dwRemoteplayer, [0x0, 0x1BC], "Float")
        if (fHealth > 0)
        continue
        dwSAMPActor := __DWORD(hGTA, dwRemoteplayer, [0x0, 0x0])
        if (!dwSAMPActor)
        continue
        dwPED := __DWORD(hGTA, dwSAMPActor, [0x2A4])
        if (!dwPED)
        continue
        dwMurderer := __DWORD(hGTA, dwPED, [0x764])
        if (!dwMurderer || dwLocalPED != dwMurderer)
        continue
        if (bReset)
        __WRITEMEM(hGTA, dwPED, [0x764], 0, "UInt")
        kills.Push(Object("ID", A_Index - 1, "WEAPON", __DWORD(hGTA, dwPED, [0x760])))
    }
    return kills
}
getKillEntry(index)
{
    if (index < 0 || index > 4 || !checkHandles())
    return false
    dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR]) + 0x4
    sVictim := __READSTRING(hGTA, dwAddress, [index * 0x3B], 25)
    sKiller := __READSTRING(hGTA, dwAddress, [index * 0x3B + 0x19], 25)
    dwVictimColor := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x32], "UInt")
    dwKillerColor := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x36], "UInt")
    bReason := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x3A], "UChar")
    return Object("VICTIM", sVictim, "KILLER", sKiller, "VCOLOR", dwVictimColor, "KCOLOR", dwKillerColor, "REASON", bReason)
}
addKillEntry(victimName := " ", killerName := " ", victimColor := 0xFFFFFFFF, killerColor := 0xFFFFFFFF, reason := 255)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x66930, [["i", __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR])], ["s", victimName], ["s", killerName], ["i", victimColor], ["i", killerColor], ["i", reason]], false, true)
}
playAudioStream(url)
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x62DA0, [["s", url], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
}
stopAudioStream()
{
    return checkHandles() && __CALL(hGTA, dwSAMP + 0x629A0, [["i", 1]], false)
}
playSound(soundID)
{
    return checkHandles() && __CALL(hGTA, 0x506EA0, [["i", 0xB6BC90], ["i", soundID], ["i", 0], ["f", 1.0]], false, true)
}
playAudioEvent(eventID)
{
    if (!checkHandles())
    return false
    VarSetCapacity(buf, 12, 0)
    NumPut(0, buf, 0, "Float")
    NumPut(0, buf, 4, "Float")
    NumPut(0, buf, 8, "Float")
    if (!__WRITERAW(hGTA, pMemory + 20, &buf, 12))
    return false
    return __CALL(hGTA, 0x507340, [["i", pMemory + 20], ["i", eventID]], false, false)
}
addDelimiters(value, delimiter := ".")
{
return RegExReplace(Round(value), "\G\d+?(?=(\d{3})+(?:\D|$))", "$0" delimiter)
}
checkHandles()
{
    return !refreshGTA() || !refreshSAMP() || !refreshMemory() ? false : true
}
refreshGTA()
{
    if (!(newPID := getPID("GTA:SA:MP")))
    {
        if (hGTA)
        {
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
        }
        dwGTAPID := 0, hGTA := 0x0, dwSAMP := 0x0, pMemory := 0x0
        return false
    }
    if (!hGTA || dwGTAPID != newPID)
    {
        if (!(hGTA := openProcess(newPID)))
        {
            dwGTAPID := 0, hGTA := 0x0, dwSAMP := 0x0, pMemory := 0x0
            return false
        }
        dwGTAPID := newPID, dwSAMP := 0x0, pMemory := 0x0
    }
    return true
}
refreshSAMP()
{
    if (dwSAMP)
    return true
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if (!dwSAMP)
    return false
    if (__READMEM(hGTA, dwSAMP, [0x1036], "UChar") != 0xD8)
    {
        msgbox, 64, % "ERROR", % "Установленная версия сампа не совместима."
        ExitApp
    }
    return true
}
refreshMemory()
{
    if (!pMemory)
    {
        pMemory := virtualAllocEx(hGTA, 6384, 0x1000 | 0x2000, 0x40)
        if (ErrorLevel)
        {
            pMemory := 0x0
            return false
        }
        pInjectFunc := pMemory + 5120
        pDetours	:= pInjectFunc + 1024
    }
    return true
}
queryPerformance()
{
    Static QPCLAST, QPCNOW, QPCFREQ
    if not QPCFREQ
    if not DllCall("QueryPerformanceFrequency", "Int64 *", QPCFREQ)
    return "Fail QPF"
    QPCLAST=%QPCNOW%
    if not DllCall("QueryPerformanceCounter", "Int64 *", QPCNOW)
    return "Fail QPC"
    return (QPCNOW-QPCLAST)/QPCFREQ
}
getTownNumber()
{
    if (!checkHandles())
    return false
    pos := getPlayerPos()
    VarSetCapacity(struct, 12, 0)
    NumPut(pos[1], &struct, 0, "Float")
    NumPut(pos[2], &struct, 4, "Float")
    NumPut(pos[3], &struct, 8, "Float")
    return !__WRITERAW(hGTA, pMemory + 1024, &struct, 63) ? -1 : __CALL(hGTA, 0x572300, [["i", pMemory + 1024]], true, false, true)
}
getCity(x, y, z)
{
    if (z > 900.0)
    return "Interior"
    for i, o in cities
    {
        if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
        return o.NAME
    }
    return "Unbekannt"
}
getZone(x, y, z)
{
    if (z > 900.0)
    return "Interior"
    for i, o in zones
    {
        if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
        return o.NAME
    }
    return "Unbekannt"
}
getFPS()
{
    if (!checkHandles())
    return 0
    static timev := A_TickCount
    static val   := readDWORD(hGTA, 0xB7CB4C)
    temp := readDWORD(hGTA, 0xB7CB4C)
    ret := (temp-val)/(A_TickCount-timev)*1000
    timev := A_TickCount
    val := temp
    return Round(ret)
}
sendDialogResponseWait(dialogID, buttonID, listIndex := 0xFFFF, inputResponse := "")
{
    Loop, 100
    {
        if (getDialogID() == dialogID)
        {
            sendDialogResponse(dialogID, buttonID, listIndex, inputResponse)
            return true
        }
        sleep, 20
    }
    unblockDialog()
    return false
}
waitForDialogID(dialogID)
{
    Loop, 100
    {
        if (getDialogID() == dialogID)
        {
            sleep, 300
            return true
        }
        sleep, 20
    }
    unblockDialog()
    return false
}
getGender(playerID)
{
    skin := getSkinID(playerID)
    if (skin < 1)
    return ""
    return SubStr(skinGender, skin + 1, 1) ? "Herr " : "Frau "
}
fpsUnlock()
{
    if (!checkHandles())
    return 0
    global instruction
    instruction := readMem(hGTA, dwSAMP + 0x9D9D0, 4, "UInt")
    return writeMemory(hGTA, dwSAMP + 0x9D9D0, 0x5051FF15, 4, "UChar")
}
fpsLock()
{
    if (!checkHandles())
    return 0
    global instruction
    if (instruction)
    {
        return writeMemory(hGTA, dwSAMP + 0x9D9D0, instruction, 4, "UInt")
    }
    else
    {
        return false
    }
}
getCoordinates()
{
    if (!checkHandles())
    return ""
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
updateTextLabelData()
{
    if (!checkHandles())
    return 0
    if (iRefreshTL+iUpdateTickTL > A_TickCount)
    return 1
    oTextLabelData := []
    iRefreshTL := A_TickCount
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwTextLabels := readDWORD(hGTA, dwAddress + 12)
    if (ErrorLevel || dwTextDraws==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    Loop, % 2048
    {
        i := A_Index-1
        dwIsActive := readDWORD(hGTA, dwTextLabels + 59392 + i*4)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if (dwIsActive==0)
        continue
        dwAddr := readDWORD(hGTA, dwTextLabels + i*29)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if (dwAddr==0)
        continue
        sText := readString(hGTA, dwAddr, 256)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fX := readFloat(hGTA, dwTextLabels + i*29 +8)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fY := readFloat(hGTA, dwTextLabels + i*29 +12)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fZ := readFloat(hGTA, dwTextLabels + i*29 +16)
        if (ErrorLevel)
        {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        wPlayerID := readMem(hGTA, dwTextLabels + i * 0x1D + 0x19, 2, "UShort")
        wVehicleID := readMem(hGTA, dwTextLabels + i * 0x1D + 0x1B, 2, "UShort")
        oTextLabelData[i] := Object("TEXT", sText, "XPOS", fX , "YPOS", fY , "ZPOS", fZ, "PLAYERID", wPlayerID, "VEHICLEID", wVehicleID)
    }
    ErrorLevel := ERROR_OK
    return 1
}
changeServerTextdraws()
{
    if (!checkHandles())
    return false
    dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 315.0, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 540.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 12.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 1, "UChar")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1F1FE0, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF009933, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFFFF901E, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFFFFFFF, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF00D7FF, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF00D7FF, "UInt")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2400 + 1152 * 4])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 437, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2400 + 1154 * 4])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 560, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 20, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2400 + 6 * 4])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 26, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 304, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2400 + 5 * 4])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 32, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 324, "Float")
    return true
}
resetServerTextdraws()
{
    if (!checkHandles())
    return false
    dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 1, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.31, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.085, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 35.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 321.0, "Float")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.19, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 0.9, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 406.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 27.0, "Float")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 0, "UChar")
    dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
    __WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 26.0, "Float")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1D19B4, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF2C6836, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFF7F3C32, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFE1E1E1, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF106290, "UInt")
    __WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF63C0E2, "UInt")
    return true
}
restartGameEx()
{
    if (!checkHandles())
    return -1
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwFunc := dwSAMP + 0xA060
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if (ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    return true
}
disconnectEx()
{
    if (!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ecx := dwAddress
    dwAddress := readDWORD(hGTA, dwAddress)
    if (ErrorLevel || dwAddress==0)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    VarSetCapacity(injectData, 24, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(ecx, injectData, 1, "UInt")
    NumPut(0xB8, injectData, 5, "UChar")
    NumPut(dwAddress, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(0, injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(500, injectData, 16, "UInt")
    NumPut(0x50FF, injectData, 20, "UShort")
    NumPut(0x08, injectData, 22, "UChar")
    NumPut(0xC3, injectData, 23, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 24)
    if (ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    return true
}
getCheckpointPos_(ByRef x, ByRef y, ByRef z)
{
    if (!checkHandles())
    return 0
    x := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_X)
    y := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_Y)
    z := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_Z)
    return 1
}
getCheckpointDistance()
{
    getCheckpointPos_(x, y, z)
    return getDistanceToPoint(x, y, z)
}
getDistanceToPoint(x, y, z = 0)
{
    GetPlayerPos_(_x, _y, _z)
    if (z == 0)
    return sqrt((_x-x)**2+(_y-y)**2)
    else
    return sqrt((_x-x)**2+(_y-y)**2+(_z-z)**2)
    return 0
}
GetPlayerPos_(ByRef fX,ByRef fY,ByRef fZ)
{
    if (!checkHandles())
    return 0
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
}
SkinInCop(skin)
{
    if skin in 165,166,280,281,282,283,284,285,286,288,310,311
    Return 1
    Return 0
}
GetGameShowText()
{
    Return readString(hGTA, 0x0BAAD40, 100)
}
noManyPanSpray(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0x96C009, 0x1)
    else
    writeMemory(hGTA, 0x96C009, 0x0)
}
GetCameraRotation()
{
    If(!checkHandles())
    return -1
    return readFloat(hGTA, 0xB6F178)
}
NightVision(value)
{
    If(!checkHandles())
    return false
    If (value)
    writeMemory(hGTA, 0xC402B8, 0x1)
    else
    writeMemory(hGTA, 0xC402B8, 0x0)
}
setCarNitro()
{
    If(!checkHandles())
    return -1
    return writeMemory(hGTA, 0x969165, 0x1)
}
ThermalVision(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0xC402B9, 0x1)
    else
    writeMemory(hGTA, 0xC402B9, 0x0)
}
UnderWaterDrive(value)
{
    If(!checkHandles())
    return false
    If(value)
    writeMemory(hGTA, 0x6C2759, 0x1)
    else
    writeMemory(hGTA, 0x6C2759, 0x0)
}
WaterDrive(value)
{
    If(!checkHandles())
    return false
    If(value)
    {
        writeMemory(hGTA, 0x969152, 0x1)
    }
    else
    {
        writeMemory(hGTA, 0x969152, 0x0)
    }
}
GetGravity()
{
    If(!checkHandles())
    return -1
    return readFloat(hGTA, 0x863984)
}
SetGravity(value)
{
    If(!checkHandles())
    return -1
    writeMemory(hGTA, 0x863984, value, 4, "float")
}
AntiPause()
{
    if(!checkHandles())
    return false
    writeBytes(hGTA, 0x747FB6, "01")
    writeBytes(hGTA, 0x74805A, "01")
    writeBytes(hGTA, 0x74542B, "90909090909090")
    writeBytes(hGTA, 0x74542C, "90909090909090")
    writeBytes(hGTA, 0x74542D, "909090909090")
    return
}
setPlayerWanted(level)
{
    if(!checkHandles())
    return -1
    return ProcessWriteMemory(level, 0x58DB60, "gta_sa.exe", "Byte", 1)
}
getPlayerFps(float := false)
{
    if(!checkHandles())
    return -1
    return (float ? ProcessReadMemory(0xB7CB50, "gta_sa.exe", "Float", 4):Round(ProcessReadMemory(0xB7CB50, "gta_sa.exe", "Float", 4)))
}
WallHack(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x70F1A, 1, "byte")
    if((tog == -1 && byte == 232) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x70F1A, "9090909090")
        writeBytes(hGTA, dwSAMP + 0x6FE0A, "9090909090")
        writeBytes(hGTA, dwSAMP + 0x70E24, "909090909090")
        writeBytes(hGTA, dwSAMP + 0x6FD14, "909090909090")
        return true
    }
    else if ((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x70F1A, "E8B1AD0300")
        writeBytes(hGTA, dwSAMP + 0x6FE0A, "E8C1BE0300")
        writeBytes(hGTA, dwSAMP + 0x70E24, "0F8A71010000")
        writeBytes(hGTA, dwSAMP + 0x6FD14, "0F8A50010000")
        return false
    }
    return -1
}
NOP_SetPlayerPos(tog := -1)
{
    if(!checkHandles())
    return -1
    dwAddress := dwSAMP+0x15970
    byte := readMem(hGTA, dwAddress, 1, "byte")
    if((tog == -1 && byte != 195) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwAddress, "C390")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwAddress, "E910")
        return false
    }
    return -1
}
WaitOpenDialog(ms := 300)
{
    time := A_TickCount
    while(!isDialogOpen())
    if (A_tickCount - time > ms)
    return RegExReplace(Round(ms / 1000, 2), "[.0]+$")
    return -1
}
GetWeaponIDforModel(model)
{
    for k, v in oWeaponIdForModel
    if (v == model)
    return k
    return 0
}
getTargetPlayerWeaponModel(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    model := readMem(hGTA, player + 0x740, 2, "byte")
    if(model == 65535)
    return 0
    return model
}
toggleNoAnimations(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x16FA0, 1, "byte")
    if((tog == -1 && byte == 85) || tog == true || tog == 1)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0xC3, 1, "byte")
        return true
    }
    else if((tog == -1 && byte == 195) || !tog)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0x55, 1, "byte")
        return false
    }
    return -1
}
getTargetPlayerHealth(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    return readMem(hGTA, player + 0x540, 2, "byte")
}
getTargetPlayerArmour(player)
{
    if(!checkHandles())
    return 0
    if (player is integer) and (player >= 0) and (player <= 999)
    player := getPedById(player)
    if(!player)
    return 0
    return readMem(hGTA, player + 0x548, 2, "byte")
}
setPlayerFreeze(status)
{
    if(!checkHandles())
    return -1
    dwCPed := readDWORD(hGTA, 0xB6F5F0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPed + 0x42
    writeString(hGTA, dwAddr, status)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return true
}
GetText(name, min := 1, max := 45, button := 0)
{
    text:=""
    for key, val in name
    {
        if (A_Index >= min && A_Index <= max)
        text .= val "`n"
        temp_A_Index := A_Index
    }
    text := Trim(text, "`n")
    if  (button)
    {
        if (min > 45)
        text .= " `nНазад"
        if (temp_A_Index > max)
        text .= "`nВперед"
    }
    text := Trim(text, "`n")
    return Array(text, min, max, temp_A_Index)
}
getChatLineEx(line := 0) {
    if(!checkHandles())
    return
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA, dwPtr)
    if(ErrorLevel)
    return
    msg := readString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), 0xFC)
    if(ErrorLevel)
    return
    Return
}
get(url, user_agent := "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 YaBrowser/17.6.1.744 Yowser/2.5 Safari/537.36", time_out := 5)
{
    loop 5
    {
        ComObjError(false)
        whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", url)
        whr.WaitForResponse(time_out)
        whr.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
        whr.SetRequestHeader("User-Agent", user_agent)
        whr.Send()
        if(!strlen(whr.ResponseText))
        continue
        ResponseText := RegExReplace(whr.ResponseText, "<br>", "`n")
        ResponseText := RegExReplace(ResponseText, "<t>", "`t")
        ResponseText := RegExReplace(ResponseText, "<br \/>", "`n")
        return ResponseText
    }
}
post(url, send := "", user_agent := "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 YaBrowser/17.6.1.744 Yowser/2.5 Safari/537.36", result := 0, time_out := 5)
{
    if (!user_agent)"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 YaBrowser/17.6.1.744 Yowser/2.5 Safari/537.36"
    try
    {
        hObject := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        hObject.Open("POST", url, true)
        hObject.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
        hObject.SetRequestHeader("User-Agent", user_agent)
        hObject.Send(send)
        hObject.WaitForResponse(time_out)
    }
    catch ex
    return 0
    if (!result)
    return 1
    else if (result)
    {
        ResponseText := RegExReplace(hObject.ResponseText, "<br>", "`n")
        ResponseText := RegExReplace(ResponseText, "<t>", "`t")
        ResponseText := RegExReplace(ResponseText, "<br \/>", "`n")
        return ResponseText
    }
}
IsChatActive()
{
    if(!checkHandles())
    return -1
    dwChatInfo := readDWORD(hGTA, dwSAMP + SAMP_CHAT_SHOW)
    dwAddr := readDWORD(hGTA, dwChatInfo + 8)
    first_byte := Memory_ReadByte(hGTA, dwAddr + 4)
    second_byte := Memory_ReadByte(hGTA, dwAddr + 6)
    third_byte := Memory_ReadByte(hGTA, dwAddr + 60)
    if first_byte not between 0 and 1
    {
        if second_byte not between 0 and 1
        return third_byte
        return second_byte
    }
    return first_byte
}
ClearTextDialog()
{
    if(!checkHandles())
    return ""
    dwAddress := dwSAMP + SAMP_DIALOG_TEXT
    sUsername := writeString(hGTA, dwAddress, "")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
setDialogIndex(index, enter := 1, fix := 0)
{
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeMemory(hGTA, dwPointer + 0x143, index - 1, 1, "Byte")
    if (!enter)
    Return
    sleep, 100
    if (fix)
    {
        WinGet, p_id, pid, GTA:SA:MP
    ControlSend,, {enter}, ahk_pid %p_id%
    }
    Else
Send, {ENTER}
}
GetChatText() {
    if(!checkHandles())
    return -1
    sUsername := readString(hGTA, dwSAMP + SAMP_DIALOG_TEXT, 256)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -2
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
setimg(InData) {
    DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
    , UInt,StrLen(InData), UInt,1, UInt,0, UIntP,Bytes, Int,0, Int,0, "CDECL Int" )
    VarSetCapacity( OutData, Req := Bytes * ( A_IsUnicode ? 2 : 1 ) )
    DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
    , UInt,StrLen(InData), UInt,1, Str,OutData, UIntP,Req, Int,0, Int,0, "CDECL Int" )
    File := FileOpen(A_Temp "\Pic.png", "w"), File.length := 0, File.RawWrite(OutData, Bytes)
    File.Close(), VarSetcapacity( OutData, 0)
    Return A_Temp "\Pic.png"
}
rus()
{
    SendMessage, 0x50,, 0x4190419,, A
}
eng()
{
    SendMessage, 0x50,, 0x4090409,, A
}
getLastDamagePed(ByRef Ped := "", ByRef Weapon := "")
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    if(!dwPed := readDWORD(hGTA, CPed + 0x764))
    return -1
    Ped := getIdByPed(dwPed)
    Weapon := readMem(hGTA, CPed + 0x760, 4, "int")
    return dwPed
}
setFireImmunity(state)
{
    if(!checkHandles())
    return
    writeMemory(hGTA, 0xB7CEE6, (state ? 1 : 0), 1, "byte")
}
setInfiniteRun(state)
{
    if(!checkHandles())
    return
    writeMemory(hGTA, 0xB7CEE4, (state ? 1 : 0), 1, "byte")
}
isMarkerSetup()
{
    if(!checkHandles())
    return -1
    return readMem(hGTA, 0xBA6774, 1, "byte")
}
getWeaponAmmo(ByRef Ammo := "", ByRef Clip := "", slot := -1)
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    if slot not between 0 and 12
    {
        VarSetCapacity(slot, 1)
        DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", CPed + 0x718, "Str", slot, "UInt", 1, "UInt*", 0)
        slot := NumGet(slot, 0, "short")
        if slot >= 12544
        slot -= 12544
    }
    struct := CPed + 0x5AC
    VarSetCapacity(Ammo, 4)
    VarSetCapacity(Clip, 4)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot), "Str", Ammo, "UInt", 4, "UInt*", 0)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot) - 0x4, "Str", Clip, "UInt", 4, "UInt*", 0)
    Ammo := NumGet(Ammo, 0, "int")
    Clip := NumGet(Clip, 0, "int")
    return Ammo
}
getWeaponSlotById(id)
{
    if id between 2 and 9
    slot := 1
    if id between 10 and 15
    slot := 10
    if id in 16,17,18,39
    slot := 8
    if id between 22 and 24
    slot := 2
    if id between 25 and 27
    slot := 3
    if id in 28,29,32
    slot := 4
    if id in 30,31
    slot := 5
    if id in 33,34
    slot := 6
    if id between 35 and 38
    slot := 7
    if id == 40
    slot := 12
    if id between 41 and 43
    slot := 9
    if id between 44 and 46
    slot := 11
}
isPlayerCrouch()
{
    if(!checkHandles())
    return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
    return -1
    state := readMem(hGTA, CPed + 0x46F, 1, "byte")
    if(state == 132)
    return 1
    if(state == 128)
    return 0
    return -1
}
setDialogState(tog)
{
    if(!checkHandles())
    return false
    dwPointer := getDialogStructPtr()
    if(ErrorLevel || !dwPointer)
    return false
    writeMemory(hGTA, dwPointer + 0x28, (tog ? 1 : 0), 1, "byte")
    if(!tog)
Send {f6}{esc}
    return true
}
toggleUnlimitedAmmo(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x7428E6, 1, "byte")
    if((tog == -1 && byte == 255) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428E6, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428E6, "FF4E0C")
        return false
    }
    return -1
}
toggleNoReload(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x7428B0, 1, "byte")
    if((tog == -1 && byte == 137) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428B0, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428B0, "894608")
        return false
    }
    return -1
}
toggleNoRecoil(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x740450, 1, "byte")
    if((tog == -1 && byte == 216) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x740450, "90909090909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x740450, "D80D3C8B8500D84C241C")
        return false
    }
    return -1
}
getclist(server, color)
{
    if (server == "erp")
    {
        for k, v in clist_erp
        if (v == color)
        Return k-1
    }
}
toggleAntiBikeFall(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x4BA3B9, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x4BA3B9, "E9A703000090")
        return true
    } else if((tog == -1 && byte == 233) || !tog)
    {
        writeBytes(hGTA, 0x4BA3B9, "0F84A6030000")
        return false
    }
    return -1
}
toggleAntiCarEject(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x146E0, 1, "byte")
    if((tog == -1 && byte == 233) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "C390909090")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "E9D7722700")
        return false
    }
    return -1
}
toggleObjectDrawMode(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, dwSAMP + 0x69529, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "0F84AE000000")
        return false
    }
    return -1
}
toggleMotionBlur(tog := -1)
{
    if(!checkHandles())
    return -1
    byte := readMem(hGTA, 0x704E8A, 1, "byte")
    if((tog == -1 && byte == 144) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x704E8A, "E811E2FFFF")
        return true
    } else if((tog == -1 && byte == 232) || !tog)
    {
        writeBytes(hGTA, 0x704E8A, "9090909090")
        return false
    }
    return -1
}
writeBytes(handle, address, bytes)
{
    length := strlen(bytes) / 2
    VarSetCapacity(toInject, length, 0)
    Loop %length%
    {
        byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
        NumPut(byte, toInject, A_Index - 1, "uchar")
    }
    return writeRaw(handle, address, &toInject, length)
}
setHP(hp) {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    writeFloat(hGTA, dwAddr, hp)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return true
}
getsexbyskin(skin := -1)
{
    if (skin == -1)
    skin := getSkinID()
    if skin in 1,2,3,4,5,6,7,8,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,42,43,44,45,46,47,48,49,50,51,52,57,58,59,60,61,62,66,67,68,70,71,72,73,79,80,81,82,83,84,86,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,132,133,134,135,136,137,142,143,144,146,147,149,153,154,155,156,158,159,160,161,162,163,164,165,166,167,168,170,171,173,174,175,176,177,179,180,181,182,183,184,185,186,187,188,189,200,202,203,204,206,208,209,210,212,213,217,220,221,222,223,227,228,229,230,234,235,236,239,240,241,242,247,248,249,250,252,253,254,255,258,259,260,261,262,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,299,300,301,302,303,304,305,310,311
    return 1
    if skin in 9,10,11,12,13,31,38,39,40,41,53,54,55,56,63,64,65,69,75,76,77,85,87,88,89,90,91,92,93,129,130,131,138,139,140,141,143,144,145,148,150,151,152,157,169,172,178,190,191,192,193,194,195,196,197,198,199,201,205,207,211,214,215,216,218,219,224,225,226,231,232,233,237,238,243,244,245,246,251,256,257,263,298,306,307,308,309
    return 2
    else
    return 0
}
getDialogLineNumber() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINENUMBER_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    return count//16777216+1
}
getServerHour() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Hour := readMem(hGTA, 0xB70153, 1, "Int")
    if (Hour <= 9) {
        FixHour = 0%Hour%
        return FixHour
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Hour
}
getServerMinute() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Minute := readMem(hGTA, 0xB70152, 1, "Int")
    if (Minute <= 9) {
        FixMinute = 0%Minute%
        return FixMinute
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Minute
}
getCameraCoordinates() {
    if(!checkHandles())
    return false
    fX := readFloat(hGTA, 0xB6F9CC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, 0xB6F9D0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, 0xB6F9D4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
getPlayerPosById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return getPedCoordinates(oScoreboardData[dwId].PED)
            if(oScoreboardData[dwId].HasKey("MPOS"))
            return oScoreboardData[dwId].MPOS
        }
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return getPedCoordinates(oScoreboardData[dwId].PED)
        if(oScoreboardData[dwId].HasKey("MPOS"))
        return oScoreboardData[dwId].MPOS
    }
    return ""
}
HexToDecOne(Hex)
{
    if (InStr(Hex, "0x") != 1)
    Hex := "0x" Hex
    return, Hex + 0
}
HexToDecTwo(hex)
{
    VarSetCapacity(dec, 66, 0)
    , val := DllCall("msvcrt.dll\_wcstoui64", "Str", hex, "UInt", 0, "UInt", 16, "CDECL Int64")
    , DllCall("msvcrt.dll\_i64tow", "Int64", val, "Str", dec, "UInt", 10, "CDECL")
    return dec
}
hex2rgb(CR)
{
    NumPut((InStr(CR, "#") ? "0x" SubStr(CR, 2) : "0x") SubStr(CR, -5), (V := "000000"))
    return NumGet(V, 2, "UChar") "," NumGet(V, 1, "UChar") "," NumGet(V, 0, "UChar")
}
rgb2hex(R, G, B, H := 1)
{
    static U := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static V := A_IsUnicode ? "_i64tow"    : "_i64toa"
    rgb := ((R << 16) + (G << 8) + B)
    H := ((H = 1) ? "#" : ((H = 2) ? "0x" : ""))
    VarSetCapacity(S, 66, 0)
    value := DllCall("msvcrt.dll\" U, "Str", rgb , "UInt", 0, "UInt", 10, "CDECL Int64")
    DllCall("msvcrt.dll\" V, "Int64", value, "Str", S, "UInt", 16, "CDECL")
    return H S
}
GetCoordsSamp(ByRef ResX, ByRef ResY)
{
    MouseGetPos, PosX, PosY
    PosXProc := (PosX*100)/A_ScreenWidth
    PosYProc := (PosY*100)/A_ScreenHeight
    ResX := PosXProc*8
    ResY := PosYProc*6
}
getVehicleIdServer(address=0x13C298, datatype="int", length=4, offset=0)
{
    if (isPlayerDriver() != "-1" or isPlayerInAnyVehicle() != "0")
    {
        Process, Exist, gta_sa.exe
        PID_GTA := ErrorLevel
        VarSetCapacity(me32, 548, 0)
        NumPut(548, me32)
        snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", 0x00000008, "Uint", PID_GTA)
        If (snapMod = -1)
        Return 0
        If (DllCall("Module32First", "Uint", snapMod, "Uint", &me32))
        {
            Loop
            {
                If (!DllCall("lstrcmpi", "Str", "samp.dll", "UInt", &me32 + 32)) {
                    DllCall("CloseHandle", "UInt", snapMod)
                    key:= NumGet(&me32 + 20)
                    WinGet, PID_SAMP, PID, GTA:SA:MP
                    hwnd_samp := DllCall("OpenProcess","Uint",0x1F0FFF,"int",0,"int", PID_SAMP)
                    VarSetCapacity(readvalue,length, 0)
                    DllCall("ReadProcessMemory","Uint",hwnd_samp,"Uint",key+address+offset,"Str",readvalue,"Uint",length,"Uint *",0)
                    finalvalue := NumGet(readvalue,0,datatype)
                    DllCall("CloseHandle", "int", hwnd_samp)
                    return finalvalue
                }
            }
            Until !DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)
        }
        DllCall("CloseHandle", "Uint", snapMod)
    }
    else
    Return 0
}
setPlayerName(playerid, newnick) {
    if(!checkHandles() || !strlen(newnick))
    return 0
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+playerid*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(dwRemoteplayer==0)
    return 0
    dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf)
    {
        sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, newnick)
    }
    else {
        dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
        if(ErrorLevel || dwAddress==0) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwAddress, newnick)
    }
    ErrorLevel := ERROR_OK
    return 1
}
initZonesAndCities() {
    AddCity("LV", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("SF", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("SF", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("SF", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("LS", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("LS", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("TR", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("RC", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("FC", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("WS", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
    AddCube("A-1", -3000.000000,2750.000000,-500,-2750.000000,3000.000000,500)
    AddCube("A-2", -2750.000000,2750.000000,-500,-2500.000000,3000.000000,500)
    AddCube("A-3", -2500.000000,2750.000000,-500,-2250.000000,3000.000000,500)
    AddCube("A-4", -2250.000000,2750.000000,-500,-2000.000000,3000.000000,500)
    AddCube("A-5", -2000.000000,2750.000000,-500,-1750.000000,3000.000000,500)
    AddCube("A-6", -1750.000000,2750.000000,-500,-1500.000000,3000.000000,500)
    AddCube("A-7", -1500.000000,2750.000000,-500,-1250.000000,3000.000000,500)
    AddCube("A-8", -1250.000000,2750.000000,-500,-1000.000000,3000.000000,500)
    AddCube("A-9", -1000.000000,2750.000000,-500,-750.000000,3000.000000,500)
    AddCube("A-10", -750.000000,2750.000000,-500,-500.000000,3000.000000,500)
    AddCube("A-11", -500.000000,2750.000000,-500,-250.000000,3000.000000,500)
    AddCube("A-12", -250.000000,2750.000000,-500,0.000000,3000.000000,500)
    AddCube("A-13", 0.000000,2750.000000,-500,250.000000,3000.000000,500)
    AddCube("A-14", 250.000000,2750.000000,-500,500.000000,3000.000000,500)
    AddCube("A-15", 500.000000,2750.000000,-500,750.000000,3000.000000,500)
    AddCube("A-16", 750.000000,2750.000000,-500,1000.000000,3000.000000,500)
    AddCube("A-17", 1000.000000,2750.000000,-500,1250.000000,3000.000000,500)
    AddCube("A-18", 1250.000000,2750.000000,-500,1500.000000,3000.000000,500)
    AddCube("A-19", 1500.000000,2750.000000,-500,1750.000000,3000.000000,500)
    AddCube("A-20", 1750.000000,2750.000000,-500,2000.000000,3000.000000,500)
    AddCube("A-21", 2000.000000,2750.000000,-500,2250.000000,3000.000000,500)
    AddCube("A-22", 2250.000000,2750.000000,-500,2500.000000,3000.000000,500)
    AddCube("A-23", 2500.000000,2750.000000,-500,2750.000000,3000.000000,500)
    AddCube("A-24", 2750.000000,2750.000000,-500,3000.000000,3000.000000,500)
    AddCube("Б-1", -3000.000000,2500.000000,-500,-2750.000000,2750.000000,500)
    AddCube("Б-2", -2750.000000,2500.000000,-500,-2500.000000,2750.000000,500)
    AddCube("Б-3", -2500.000000,2500.000000,-500,-2250.000000,2750.000000,500)
    AddCube("Б-4", -2250.000000,2500.000000,-500,-2000.000000,2750.000000,500)
    AddCube("Б-5", -2000.000000,2500.000000,-500,-1750.000000,2750.000000,500)
    AddCube("Б-6", -1750.000000,2500.000000,-500,-1500.000000,2750.000000,500)
    AddCube("Б-7", -1500.000000,2500.000000,-500,-1250.000000,2750.000000,500)
    AddCube("Б-8", -1250.000000,2500.000000,-500,-1000.000000,2750.000000,500)
    AddCube("Б-9", -1000.000000,2500.000000,-500,-750.000000,2750.000000,500)
    AddCube("Б-10", -750.000000,2500.000000,-500,-500.000000,2750.000000,500)
    AddCube("Б-11", -500.000000,2500.000000,-500,-250.000000,2750.000000,500)
    AddCube("Б-12", -250.000000,2500.000000,-500,0.000000,2750.000000,500)
    AddCube("Б-13", 0.000000,2500.000000,-500,250.000000,2750.000000,500)
    AddCube("Б-14", 250.000000,2500.000000,-500,500.000000,2750.000000,500)
    AddCube("Б-15", 500.000000,2500.000000,-500,750.000000,2750.000000,500)
    AddCube("Б-16", 750.000000,2500.000000,-500,1000.000000,2750.000000,500)
    AddCube("Б-17", 1000.000000,2500.000000,-500,1250.000000,2750.000000,500)
    AddCube("Б-18", 1250.000000,2500.000000,-500,1500.000000,2750.000000,500)
    AddCube("Б-19", 1500.000000,2500.000000,-500,1750.000000,2750.000000,500)
    AddCube("Б-20", 1750.000000,2500.000000,-500,2000.000000,2750.000000,500)
    AddCube("Б-21", 2000.000000,2500.000000,-500,2250.000000,2750.000000,500)
    AddCube("Б-22", 2250.000000,2500.000000,-500,2500.000000,2750.000000,500)
    AddCube("Б-23", 2500.000000,2500.000000,-500,2750.000000,2750.000000,500)
    AddCube("Б-24", 2750.000000,2500.000000,-500,3000.000000,2750.000000,500)
    AddCube("В-1", -3000.000000,2250.000000,-500,-2750.000000,2500.000000,500)
    AddCube("В-2", -2750.000000,2250.000000,-500,-2500.000000,2500.000000,500)
    AddCube("В-3", -2500.000000,2250.000000,-500,-2250.000000,2500.000000,500)
    AddCube("В-4", -2250.000000,2250.000000,-500,-2000.000000,2500.000000,500)
    AddCube("В-5", -2000.000000,2250.000000,-500,-1750.000000,2500.000000,500)
    AddCube("В-6", -1750.000000,2250.000000,-500,-1500.000000,2500.000000,500)
    AddCube("В-7", -1500.000000,2250.000000,-500,-1250.000000,2500.000000,500)
    AddCube("В-8", -1250.000000,2250.000000,-500,-1000.000000,2500.000000,500)
    AddCube("В-9", -1000.000000,2250.000000,-500,-750.000000,2500.000000,500)
    AddCube("В-10", -750.000000,2250.000000,-500,-500.000000,2500.000000,500)
    AddCube("В-11", -500.000000,2250.000000,-500,-250.000000,2500.000000,500)
    AddCube("В-12", -250.000000,2250.000000,-500,0.000000,2500.000000,500)
    AddCube("В-13", 0.000000,2250.000000,-500,250.000000,2500.000000,500)
    AddCube("В-14", 250.000000,2250.000000,-500,500.000000,2500.000000,500)
    AddCube("В-15", 500.000000,2250.000000,-500,750.000000,2500.000000,500)
    AddCube("В-16", 750.000000,2250.000000,-500,1000.000000,2500.000000,500)
    AddCube("В-17", 1000.000000,2250.000000,-500,1250.000000,2500.000000,500)
    AddCube("В-18", 1250.000000,2250.000000,-500,1500.000000,2500.000000,500)
    AddCube("В-19", 1500.000000,2250.000000,-500,1750.000000,2500.000000,500)
    AddCube("В-20", 1750.000000,2250.000000,-500,2000.000000,2500.000000,500)
    AddCube("В-21", 2000.000000,2250.000000,-500,2250.000000,2500.000000,500)
    AddCube("В-22", 2250.000000,2250.000000,-500,2500.000000,2500.000000,500)
    AddCube("В-23", 2500.000000,2250.000000,-500,2750.000000,2500.000000,500)
    AddCube("В-24", 2750.000000,2250.000000,-500,3000.000000,2500.000000,500)
    AddCube("Г-1", -3000.000000,2000.000000,-500,-2750.000000,2250.000000,500)
    AddCube("Г-2", -2750.000000,2000.000000,-500,-2500.000000,2250.000000,500)
    AddCube("Г-3", -2500.000000,2000.000000,-500,-2250.000000,2250.000000,500)
    AddCube("Г-4", -2250.000000,2000.000000,-500,-2000.000000,2250.000000,500)
    AddCube("Г-5", -2000.000000,2000.000000,-500,-1750.000000,2250.000000,500)
    AddCube("Г-6", -1750.000000,2000.000000,-500,-1500.000000,2250.000000,500)
    AddCube("Г-7", -1500.000000,2000.000000,-500,-1250.000000,2250.000000,500)
    AddCube("Г-8", -1250.000000,2000.000000,-500,-1000.000000,2250.000000,500)
    AddCube("Г-9", -1000.000000,2000.000000,-500,-750.000000,2250.000000,500)
    AddCube("Г-10", -750.000000,2000.000000,-500,-500.000000,2250.000000,500)
    AddCube("Г-11", -500.000000,2000.000000,-500,-250.000000,2250.000000,500)
    AddCube("Г-12", -250.000000,2000.000000,-500,0.000000,2250.000000,500)
    AddCube("Г-13", 0.000000,2000.000000,-500,250.000000,2250.000000,500)
    AddCube("Г-14", 250.000000,2000.000000,-500,500.000000,2250.000000,500)
    AddCube("Г-15", 500.000000,2000.000000,-500,750.000000,2250.000000,500)
    AddCube("Г-16", 750.000000,2000.000000,-500,1000.000000,2250.000000,500)
    AddCube("Г-17", 1000.000000,2000.000000,-500,1250.000000,2250.000000,500)
    AddCube("Г-18", 1250.000000,2000.000000,-500,1500.000000,2250.000000,500)
    AddCube("Г-19", 1500.000000,2000.000000,-500,1750.000000,2250.000000,500)
    AddCube("Г-20", 1750.000000,2000.000000,-500,2000.000000,2250.000000,500)
    AddCube("Г-21", 2000.000000,2000.000000,-500,2250.000000,2250.000000,500)
    AddCube("Г-22", 2250.000000,2000.000000,-500,2500.000000,2250.000000,500)
    AddCube("Г-23", 2500.000000,2000.000000,-500,2750.000000,2250.000000,500)
    AddCube("Г-24", 2750.000000,2000.000000,-500,3000.000000,2250.000000,500)
    AddCube("Д-1", -3000.000000,1750.000000,-500,-2750.000000,2000.000000,500)
    AddCube("Д-2", -2750.000000,1750.000000,-500,-2500.000000,2000.000000,500)
    AddCube("Д-3", -2500.000000,1750.000000,-500,-2250.000000,2000.000000,500)
    AddCube("Д-4", -2250.000000,1750.000000,-500,-2000.000000,2000.000000,500)
    AddCube("Д-5", -2000.000000,1750.000000,-500,-1750.000000,2000.000000,500)
    AddCube("Д-6", -1750.000000,1750.000000,-500,-1500.000000,2000.000000,500)
    AddCube("Д-7", -1500.000000,1750.000000,-500,-1250.000000,2000.000000,500)
    AddCube("Д-8", -1250.000000,1750.000000,-500,-1000.000000,2000.000000,500)
    AddCube("Д-9", -1000.000000,1750.000000,-500,-750.000000,2000.000000,500)
    AddCube("Д-10", -750.000000,1750.000000,-500,-500.000000,2000.000000,500)
    AddCube("Д-11", -500.000000,1750.000000,-500,-250.000000,2000.000000,500)
    AddCube("Д-12", -250.000000,1750.000000,-500,0.000000,2000.000000,500)
    AddCube("Д-13", 0.000000,1750.000000,-500,250.000000,2000.000000,500)
    AddCube("Д-14", 250.000000,1750.000000,-500,500.000000,2000.000000,500)
    AddCube("Д-15", 500.000000,1750.000000,-500,750.000000,2000.000000,500)
    AddCube("Д-16", 750.000000,1750.000000,-500,1000.000000,2000.000000,500)
    AddCube("Д-17", 1000.000000,1750.000000,-500,1250.000000,2000.000000,500)
    AddCube("Д-18", 1250.000000,1750.000000,-500,1500.000000,2000.000000,500)
    AddCube("Д-19", 1500.000000,1750.000000,-500,1750.000000,2000.000000,500)
    AddCube("Д-20", 1750.000000,1750.000000,-500,2000.000000,2000.000000,500)
    AddCube("Д-21", 2000.000000,1750.000000,-500,2250.000000,2000.000000,500)
    AddCube("Д-22", 2250.000000,1750.000000,-500,2500.000000,2000.000000,500)
    AddCube("Д-23", 2500.000000,1750.000000,-500,2750.000000,2000.000000,500)
    AddCube("Д-24", 2750.000000,1750.000000,-500,3000.000000,2000.000000,500)
    AddCube("Ж-1", -3000.000000,1500.000000,-500,-2750.000000,1750.000000,500)
    AddCube("Ж-2", -2750.000000,1500.000000,-500,-2500.000000,1750.000000,500)
    AddCube("Ж-3", -2500.000000,1500.000000,-500,-2250.000000,1750.000000,500)
    AddCube("Ж-4", -2250.000000,1500.000000,-500,-2000.000000,1750.000000,500)
    AddCube("Ж-5", -2000.000000,1500.000000,-500,-1750.000000,1750.000000,500)
    AddCube("Ж-6", -1750.000000,1500.000000,-500,-1500.000000,1750.000000,500)
    AddCube("Ж-7", -1500.000000,1500.000000,-500,-1250.000000,1750.000000,500)
    AddCube("Ж-8", -1250.000000,1500.000000,-500,-1000.000000,1750.000000,500)
    AddCube("Ж-9", -1000.000000,1500.000000,-500,-750.000000,1750.000000,500)
    AddCube("Ж-10", -750.000000,1500.000000,-500,-500.000000,1750.000000,500)
    AddCube("Ж-11", -500.000000,1500.000000,-500,-250.000000,1750.000000,500)
    AddCube("Ж-12", -250.000000,1500.000000,-500,0.000000,1750.000000,500)
    AddCube("Ж-13", 0.000000,1500.000000,-500,250.000000,1750.000000,500)
    AddCube("Ж-14", 250.000000,1500.000000,-500,500.000000,1750.000000,500)
    AddCube("Ж-15", 500.000000,1500.000000,-500,750.000000,1750.000000,500)
    AddCube("Ж-16", 750.000000,1500.000000,-500,1000.000000,1750.000000,500)
    AddCube("Ж-17", 1000.000000,1500.000000,-500,1250.000000,1750.000000,500)
    AddCube("Ж-18", 1250.000000,1500.000000,-500,1500.000000,1750.000000,500)
    AddCube("Ж-19", 1500.000000,1500.000000,-500,1750.000000,1750.000000,500)
    AddCube("Ж-20", 1750.000000,1500.000000,-500,2000.000000,1750.000000,500)
    AddCube("Ж-21", 2000.000000,1500.000000,-500,2250.000000,1750.000000,500)
    AddCube("Ж-22", 2250.000000,1500.000000,-500,2500.000000,1750.000000,500)
    AddCube("Ж-23", 2500.000000,1500.000000,-500,2750.000000,1750.000000,500)
    AddCube("Ж-24", 2750.000000,1500.000000,-500,3000.000000,1750.000000,500)
    AddCube("З-1", -3000.000000,1250.000000,-500,-2750.000000,1500.000000,500)
    AddCube("З-2", -2750.000000,1250.000000,-500,-2500.000000,1500.000000,500)
    AddCube("З-3", -2500.000000,1250.000000,-500,-2250.000000,1500.000000,500)
    AddCube("З-4", -2250.000000,1250.000000,-500,-2000.000000,1500.000000,500)
    AddCube("З-5", -2000.000000,1250.000000,-500,-1750.000000,1500.000000,500)
    AddCube("З-6", -1750.000000,1250.000000,-500,-1500.000000,1500.000000,500)
    AddCube("З-7", -1500.000000,1250.000000,-500,-1250.000000,1500.000000,500)
    AddCube("З-8", -1250.000000,1250.000000,-500,-1000.000000,1500.000000,500)
    AddCube("З-9", -1000.000000,1250.000000,-500,-750.000000,1500.000000,500)
    AddCube("З-10", -750.000000,1250.000000,-500,-500.000000,1500.000000,500)
    AddCube("З-11", -500.000000,1250.000000,-500,-250.000000,1500.000000,500)
    AddCube("З-12", -250.000000,1250.000000,-500,0.000000,1500.000000,500)
    AddCube("З-13", 0.000000,1250.000000,-500,250.000000,1500.000000,500)
    AddCube("З-14", 250.000000,1250.000000,-500,500.000000,1500.000000,500)
    AddCube("З-15", 500.000000,1250.000000,-500,750.000000,1500.000000,500)
    AddCube("З-16", 750.000000,1250.000000,-500,1000.000000,1500.000000,500)
    AddCube("З-17", 1000.000000,1250.000000,-500,1250.000000,1500.000000,500)
    AddCube("З-18", 1250.000000,1250.000000,-500,1500.000000,1500.000000,500)
    AddCube("З-19", 1500.000000,1250.000000,-500,1750.000000,1500.000000,500)
    AddCube("З-20", 1750.000000,1250.000000,-500,2000.000000,1500.000000,500)
    AddCube("З-21", 2000.000000,1250.000000,-500,2250.000000,1500.000000,500)
    AddCube("З-22", 2250.000000,1250.000000,-500,2500.000000,1500.000000,500)
    AddCube("З-23", 2500.000000,1250.000000,-500,2750.000000,1500.000000,500)
    AddCube("З-24", 2750.000000,1250.000000,-500,3000.000000,1500.000000,500)
    AddCube("И-1", -3000.000000,1000.000000,-500,-2750.000000,1250.000000,500)
    AddCube("И-2", -2750.000000,1000.000000,-500,-2500.000000,1250.000000,500)
    AddCube("И-3", -2500.000000,1000.000000,-500,-2250.000000,1250.000000,500)
    AddCube("И-4", -2250.000000,1000.000000,-500,-2000.000000,1250.000000,500)
    AddCube("И-5", -2000.000000,1000.000000,-500,-1750.000000,1250.000000,500)
    AddCube("И-6", -1750.000000,1000.000000,-500,-1500.000000,1250.000000,500)
    AddCube("И-7", -1500.000000,1000.000000,-500,-1250.000000,1250.000000,500)
    AddCube("И-8", -1250.000000,1000.000000,-500,-1000.000000,1250.000000,500)
    AddCube("И-9", -1000.000000,1000.000000,-500,-750.000000,1250.000000,500)
    AddCube("И-10", -750.000000,1000.000000,-500,-500.000000,1250.000000,500)
    AddCube("И-11", -500.000000,1000.000000,-500,-250.000000,1250.000000,500)
    AddCube("И-12", -250.000000,1000.000000,-500,0.000000,1250.000000,500)
    AddCube("И-13", 0.000000,1000.000000,-500,250.000000,1250.000000,500)
    AddCube("И-14", 250.000000,1000.000000,-500,500.000000,1250.000000,500)
    AddCube("И-15", 500.000000,1000.000000,-500,750.000000,1250.000000,500)
    AddCube("И-16", 750.000000,1000.000000,-500,1000.000000,1250.000000,500)
    AddCube("И-17", 1000.000000,1000.000000,-500,1250.000000,1250.000000,500)
    AddCube("И-18", 1250.000000,1000.000000,-500,1500.000000,1250.000000,500)
    AddCube("И-19", 1500.000000,1000.000000,-500,1750.000000,1250.000000,500)
    AddCube("И-20", 1750.000000,1000.000000,-500,2000.000000,1250.000000,500)
    AddCube("И-21", 2000.000000,1000.000000,-500,2250.000000,1250.000000,500)
    AddCube("И-22", 2250.000000,1000.000000,-500,2500.000000,1250.000000,500)
    AddCube("И-23", 2500.000000,1000.000000,-500,2750.000000,1250.000000,500)
    AddCube("И-24", 2750.000000,1000.000000,-500,3000.000000,1250.000000,500)
    AddCube("К-1", -3000.000000,750.000000,-500,-2750.000000,1000.000000,500)
    AddCube("К-2", -2750.000000,750.000000,-500,-2500.000000,1000.000000,500)
    AddCube("К-3", -2500.000000,750.000000,-500,-2250.000000,1000.000000,500)
    AddCube("К-4", -2250.000000,750.000000,-500,-2000.000000,1000.000000,500)
    AddCube("К-5", -2000.000000,750.000000,-500,-1750.000000,1000.000000,500)
    AddCube("К-6", -1750.000000,750.000000,-500,-1500.000000,1000.000000,500)
    AddCube("К-7", -1500.000000,750.000000,-500,-1250.000000,1000.000000,500)
    AddCube("К-8", -1250.000000,750.000000,-500,-1000.000000,1000.000000,500)
    AddCube("К-9", -1000.000000,750.000000,-500,-750.000000,1000.000000,500)
    AddCube("К-10", -750.000000,750.000000,-500,-500.000000,1000.000000,500)
    AddCube("К-11", -500.000000,750.000000,-500,-250.000000,1000.000000,500)
    AddCube("К-12", -250.000000,750.000000,-500,0.000000,1000.000000,500)
    AddCube("К-13", 0.000000,750.000000,-500,250.000000,1000.000000,500)
    AddCube("К-14", 250.000000,750.000000,-500,500.000000,1000.000000,500)
    AddCube("К-15", 500.000000,750.000000,-500,750.000000,1000.000000,500)
    AddCube("К-16", 750.000000,750.000000,-500,1000.000000,1000.000000,500)
    AddCube("К-17", 1000.000000,750.000000,-500,1250.000000,1000.000000,500)
    AddCube("К-18", 1250.000000,750.000000,-500,1500.000000,1000.000000,500)
    AddCube("К-19", 1500.000000,750.000000,-500,1750.000000,1000.000000,500)
    AddCube("К-20", 1750.000000,750.000000,-500,2000.000000,1000.000000,500)
    AddCube("К-21", 2000.000000,750.000000,-500,2250.000000,1000.000000,500)
    AddCube("К-22", 2250.000000,750.000000,-500,2500.000000,1000.000000,500)
    AddCube("К-23", 2500.000000,750.000000,-500,2750.000000,1000.000000,500)
    AddCube("К-24", 2750.000000,750.000000,-500,3000.000000,1000.000000,500)
    AddCube("Л-1", -3000.000000,500.000000,-500,-2750.000000,750.000000,500)
    AddCube("Л-2", -2750.000000,500.000000,-500,-2500.000000,750.000000,500)
    AddCube("Л-3", -2500.000000,500.000000,-500,-2250.000000,750.000000,500)
    AddCube("Л-4", -2250.000000,500.000000,-500,-2000.000000,750.000000,500)
    AddCube("Л-5", -2000.000000,500.000000,-500,-1750.000000,750.000000,500)
    AddCube("Л-6", -1750.000000,500.000000,-500,-1500.000000,750.000000,500)
    AddCube("Л-7", -1500.000000,500.000000,-500,-1250.000000,750.000000,500)
    AddCube("Л-8", -1250.000000,500.000000,-500,-1000.000000,750.000000,500)
    AddCube("Л-9", -1000.000000,500.000000,-500,-750.000000,750.000000,500)
    AddCube("Л-10", -750.000000,500.000000,-500,-500.000000,750.000000,500)
    AddCube("Л-11", -500.000000,500.000000,-500,-250.000000,750.000000,500)
    AddCube("Л-12", -250.000000,500.000000,-500,0.000000,750.000000,500)
    AddCube("Л-13", 0.000000,500.000000,-500,250.000000,750.000000,500)
    AddCube("Л-14", 250.000000,500.000000,-500,500.000000,750.000000,500)
    AddCube("Л-15", 500.000000,500.000000,-500,750.000000,750.000000,500)
    AddCube("Л-16", 750.000000,500.000000,-500,1000.000000,750.000000,500)
    AddCube("Л-17", 1000.000000,500.000000,-500,1250.000000,750.000000,500)
    AddCube("Л-18", 1250.000000,500.000000,-500,1500.000000,750.000000,500)
    AddCube("Л-19", 1500.000000,500.000000,-500,1750.000000,750.000000,500)
    AddCube("Л-20", 1750.000000,500.000000,-500,2000.000000,750.000000,500)
    AddCube("Л-21", 2000.000000,500.000000,-500,2250.000000,750.000000,500)
    AddCube("Л-22", 2250.000000,500.000000,-500,2500.000000,750.000000,500)
    AddCube("Л-23", 2500.000000,500.000000,-500,2750.000000,750.000000,500)
    AddCube("Л-24", 2750.000000,500.000000,-500,3000.000000,750.000000,500)
    AddCube("М-1", -3000.000000,250.000000,-500,-2750.000000,500.000000,500)
    AddCube("М-2", -2750.000000,250.000000,-500,-2500.000000,500.000000,500)
    AddCube("М-3", -2500.000000,250.000000,-500,-2250.000000,500.000000,500)
    AddCube("М-4", -2250.000000,250.000000,-500,-2000.000000,500.000000,500)
    AddCube("М-5", -2000.000000,250.000000,-500,-1750.000000,500.000000,500)
    AddCube("М-6", -1750.000000,250.000000,-500,-1500.000000,500.000000,500)
    AddCube("М-7", -1500.000000,250.000000,-500,-1250.000000,500.000000,500)
    AddCube("М-8", -1250.000000,250.000000,-500,-1000.000000,500.000000,500)
    AddCube("М-9", -1000.000000,250.000000,-500,-750.000000,500.000000,500)
    AddCube("М-10", -750.000000,250.000000,-500,-500.000000,500.000000,500)
    AddCube("М-11", -500.000000,250.000000,-500,-250.000000,500.000000,500)
    AddCube("М-12", -250.000000,250.000000,-500,0.000000,500.000000,500)
    AddCube("М-13", 0.000000,250.000000,-500,250.000000,500.000000,500)
    AddCube("М-14", 250.000000,250.000000,-500,500.000000,500.000000,500)
    AddCube("М-15", 500.000000,250.000000,-500,750.000000,500.000000,500)
    AddCube("М-16", 750.000000,250.000000,-500,1000.000000,500.000000,500)
    AddCube("М-17", 1000.000000,250.000000,-500,1250.000000,500.000000,500)
    AddCube("М-18", 1250.000000,250.000000,-500,1500.000000,500.000000,500)
    AddCube("М-19", 1500.000000,250.000000,-500,1750.000000,500.000000,500)
    AddCube("М-20", 1750.000000,250.000000,-500,2000.000000,500.000000,500)
    AddCube("М-21", 2000.000000,250.000000,-500,2250.000000,500.000000,500)
    AddCube("М-22", 2250.000000,250.000000,-500,2500.000000,500.000000,500)
    AddCube("М-23", 2500.000000,250.000000,-500,2750.000000,500.000000,500)
    AddCube("М-24", 2750.000000,250.000000,-500,3000.000000,500.000000,500)
    AddCube("Н-1", -3000.000000,0.000000,-500,-2750.000000,250.000000,500)
    AddCube("Н-2", -2750.000000,0.000000,-500,-2500.000000,250.000000,500)
    AddCube("Н-3", -2500.000000,0.000000,-500,-2250.000000,250.000000,500)
    AddCube("Н-4", -2250.000000,0.000000,-500,-2000.000000,250.000000,500)
    AddCube("Н-5", -2000.000000,0.000000,-500,-1750.000000,250.000000,500)
    AddCube("Н-6", -1750.000000,0.000000,-500,-1500.000000,250.000000,500)
    AddCube("Н-7", -1500.000000,0.000000,-500,-1250.000000,250.000000,500)
    AddCube("Н-8", -1250.000000,0.000000,-500,-1000.000000,250.000000,500)
    AddCube("Н-9", -1000.000000,0.000000,-500,-750.000000,250.000000,500)
    AddCube("Н-10", -750.000000,0.000000,-500,-500.000000,250.000000,500)
    AddCube("Н-11", -500.000000,0.000000,-500,-250.000000,250.000000,500)
    AddCube("Н-12", -250.000000,0.000000,-500,0.000000,250.000000,500)
    AddCube("Н-13", 0.000000,0.000000,-500,250.000000,250.000000,500)
    AddCube("Н-14", 250.000000,0.000000,-500,500.000000,250.000000,500)
    AddCube("Н-15", 500.000000,0.000000,-500,750.000000,250.000000,500)
    AddCube("Н-16", 750.000000,0.000000,-500,1000.000000,250.000000,500)
    AddCube("Н-17", 1000.000000,0.000000,-500,1250.000000,250.000000,500)
    AddCube("Н-18", 1250.000000,0.000000,-500,1500.000000,250.000000,500)
    AddCube("Н-19", 1500.000000,0.000000,-500,1750.000000,250.000000,500)
    AddCube("Н-20", 1750.000000,0.000000,-500,2000.000000,250.000000,500)
    AddCube("Н-21", 2000.000000,0.000000,-500,2250.000000,250.000000,500)
    AddCube("Н-22", 2250.000000,0.000000,-500,2500.000000,250.000000,500)
    AddCube("Н-23", 2500.000000,0.000000,-500,2750.000000,250.000000,500)
    AddCube("Н-24", 2750.000000,0.000000,-500,3000.000000,250.000000,500)
    AddCube("О-1", -3000.000000,-250.000000,-500,-2750.000000,0.000000,500)
    AddCube("О-2", -2750.000000,-250.000000,-500,-2500.000000,0.000000,500)
    AddCube("О-3", -2500.000000,-250.000000,-500,-2250.000000,0.000000,500)
    AddCube("О-4", -2250.000000,-250.000000,-500,-2000.000000,0.000000,500)
    AddCube("О-5", -2000.000000,-250.000000,-500,-1750.000000,0.000000,500)
    AddCube("О-6", -1750.000000,-250.000000,-500,-1500.000000,0.000000,500)
    AddCube("О-7", -1500.000000,-250.000000,-500,-1250.000000,0.000000,500)
    AddCube("О-8", -1250.000000,-250.000000,-500,-1000.000000,0.000000,500)
    AddCube("О-9", -1000.000000,-250.000000,-500,-750.000000,0.000000,500)
    AddCube("О-10", -750.000000,-250.000000,-500,-500.000000,0.000000,500)
    AddCube("О-11", -500.000000,-250.000000,-500,-250.000000,0.000000,500)
    AddCube("О-12", -250.000000,-250.000000,-500,0.000000,0.000000,500)
    AddCube("О-13", 0.000000,-250.000000,-500,250.000000,0.000000,500)
    AddCube("О-14", 250.000000,-250.000000,-500,500.000000,0.000000,500)
    AddCube("О-15", 500.000000,-250.000000,-500,750.000000,0.000000,500)
    AddCube("О-16", 750.000000,-250.000000,-500,1000.000000,0.000000,500)
    AddCube("О-17", 1000.000000,-250.000000,-500,1250.000000,0.000000,500)
    AddCube("О-18", 1250.000000,-250.000000,-500,1500.000000,0.000000,500)
    AddCube("О-19", 1500.000000,-250.000000,-500,1750.000000,0.000000,500)
    AddCube("О-20", 1750.000000,-250.000000,-500,2000.000000,0.000000,500)
    AddCube("О-21", 2000.000000,-250.000000,-500,2250.000000,0.000000,500)
    AddCube("О-22", 2250.000000,-250.000000,-500,2500.000000,0.000000,500)
    AddCube("О-23", 2500.000000,-250.000000,-500,2750.000000,0.000000,500)
    AddCube("О-24", 2750.000000,-250.000000,-500,3000.000000,0.000000,500)
    AddCube("П-1", -3000.000000,-500.000000,-500,-2750.000000,-250.000000,500)
    AddCube("П-2", -2750.000000,-500.000000,-500,-2500.000000,-250.000000,500)
    AddCube("П-3", -2500.000000,-500.000000,-500,-2250.000000,-250.000000,500)
    AddCube("П-4", -2250.000000,-500.000000,-500,-2000.000000,-250.000000,500)
    AddCube("П-5", -2000.000000,-500.000000,-500,-1750.000000,-250.000000,500)
    AddCube("П-6", -1750.000000,-500.000000,-500,-1500.000000,-250.000000,500)
    AddCube("П-7", -1500.000000,-500.000000,-500,-1250.000000,-250.000000,500)
    AddCube("П-8", -1250.000000,-500.000000,-500,-1000.000000,-250.000000,500)
    AddCube("П-9", -1000.000000,-500.000000,-500,-750.000000,-250.000000,500)
    AddCube("П-10", -750.000000,-500.000000,-500,-500.000000,-250.000000,500)
    AddCube("П-11", -500.000000,-500.000000,-500,-250.000000,-250.000000,500)
    AddCube("П-12", -250.000000,-500.000000,-500,0.000000,-250.000000,500)
    AddCube("П-13", 0.000000,-500.000000,-500,250.000000,-250.000000,500)
    AddCube("П-14", 250.000000,-500.000000,-500,500.000000,-250.000000,500)
    AddCube("П-15", 500.000000,-500.000000,-500,750.000000,-250.000000,500)
    AddCube("П-16", 750.000000,-500.000000,-500,1000.000000,-250.000000,500)
    AddCube("П-17", 1000.000000,-500.000000,-500,1250.000000,-250.000000,500)
    AddCube("П-18", 1250.000000,-500.000000,-500,1500.000000,-250.000000,500)
    AddCube("П-19", 1500.000000,-500.000000,-500,1750.000000,-250.000000,500)
    AddCube("П-20", 1750.000000,-500.000000,-500,2000.000000,-250.000000,500)
    AddCube("П-21", 2000.000000,-500.000000,-500,2250.000000,-250.000000,500)
    AddCube("П-22", 2250.000000,-500.000000,-500,2500.000000,-250.000000,500)
    AddCube("П-23", 2500.000000,-500.000000,-500,2750.000000,-250.000000,500)
    AddCube("П-24", 2750.000000,-500.000000,-500,3000.000000,-250.000000,500)
    AddCube("Р-1", -3000.000000,-750.000000,-500,-2750.000000,-500.000000,500)
    AddCube("Р-2", -2750.000000,-750.000000,-500,-2500.000000,-500.000000,500)
    AddCube("Р-3", -2500.000000,-750.000000,-500,-2250.000000,-500.000000,500)
    AddCube("Р-4", -2250.000000,-750.000000,-500,-2000.000000,-500.000000,500)
    AddCube("Р-5", -2000.000000,-750.000000,-500,-1750.000000,-500.000000,500)
    AddCube("Р-6", -1750.000000,-750.000000,-500,-1500.000000,-500.000000,500)
    AddCube("Р-7", -1500.000000,-750.000000,-500,-1250.000000,-500.000000,500)
    AddCube("Р-8", -1250.000000,-750.000000,-500,-1000.000000,-500.000000,500)
    AddCube("Р-9", -1000.000000,-750.000000,-500,-750.000000,-500.000000,500)
    AddCube("Р-10", -750.000000,-750.000000,-500,-500.000000,-500.000000,500)
    AddCube("Р-11", -500.000000,-750.000000,-500,-250.000000,-500.000000,500)
    AddCube("Р-12", -250.000000,-750.000000,-500,0.000000,-500.000000,500)
    AddCube("Р-13", 0.000000,-750.000000,-500,250.000000,-500.000000,500)
    AddCube("Р-14", 250.000000,-750.000000,-500,500.000000,-500.000000,500)
    AddCube("Р-15", 500.000000,-750.000000,-500,750.000000,-500.000000,500)
    AddCube("Р-16", 750.000000,-750.000000,-500,1000.000000,-500.000000,500)
    AddCube("Р-17", 1000.000000,-750.000000,-500,1250.000000,-500.000000,500)
    AddCube("Р-18", 1250.000000,-750.000000,-500,1500.000000,-500.000000,500)
    AddCube("Р-19", 1500.000000,-750.000000,-500,1750.000000,-500.000000,500)
    AddCube("Р-20", 1750.000000,-750.000000,-500,2000.000000,-500.000000,500)
    AddCube("Р-21", 2000.000000,-750.000000,-500,2250.000000,-500.000000,500)
    AddCube("Р-22", 2250.000000,-750.000000,-500,2500.000000,-500.000000,500)
    AddCube("Р-23", 2500.000000,-750.000000,-500,2750.000000,-500.000000,500)
    AddCube("Р-24", 2750.000000,-750.000000,-500,3000.000000,-500.000000,500)
    AddCube("С-1", -3000.000000,-1000.000000,-500,-2750.000000,-750.000000,500)
    AddCube("С-2", -2750.000000,-1000.000000,-500,-2500.000000,-750.000000,500)
    AddCube("С-3", -2500.000000,-1000.000000,-500,-2250.000000,-750.000000,500)
    AddCube("С-4", -2250.000000,-1000.000000,-500,-2000.000000,-750.000000,500)
    AddCube("С-5", -2000.000000,-1000.000000,-500,-1750.000000,-750.000000,500)
    AddCube("С-6", -1750.000000,-1000.000000,-500,-1500.000000,-750.000000,500)
    AddCube("С-7", -1500.000000,-1000.000000,-500,-1250.000000,-750.000000,500)
    AddCube("С-8", -1250.000000,-1000.000000,-500,-1000.000000,-750.000000,500)
    AddCube("С-9", -1000.000000,-1000.000000,-500,-750.000000,-750.000000,500)
    AddCube("С-10", -750.000000,-1000.000000,-500,-500.000000,-750.000000,500)
    AddCube("С-11", -500.000000,-1000.000000,-500,-250.000000,-750.000000,500)
    AddCube("С-12", -250.000000,-1000.000000,-500,0.000000,-750.000000,500)
    AddCube("С-13", 0.000000,-1000.000000,-500,250.000000,-750.000000,500)
    AddCube("С-14", 250.000000,-1000.000000,-500,500.000000,-750.000000,500)
    AddCube("С-15", 500.000000,-1000.000000,-500,750.000000,-750.000000,500)
    AddCube("С-16", 750.000000,-1000.000000,-500,1000.000000,-750.000000,500)
    AddCube("С-17", 1000.000000,-1000.000000,-500,1250.000000,-750.000000,500)
    AddCube("С-18", 1250.000000,-1000.000000,-500,1500.000000,-750.000000,500)
    AddCube("С-19", 1500.000000,-1000.000000,-500,1750.000000,-750.000000,500)
    AddCube("С-20", 1750.000000,-1000.000000,-500,2000.000000,-750.000000,500)
    AddCube("С-21", 2000.000000,-1000.000000,-500,2250.000000,-750.000000,500)
    AddCube("С-22", 2250.000000,-1000.000000,-500,2500.000000,-750.000000,500)
    AddCube("С-23", 2500.000000,-1000.000000,-500,2750.000000,-750.000000,500)
    AddCube("С-24", 2750.000000,-1000.000000,-500,3000.000000,-750.000000,500)
    AddCube("Т-1", -3000.000000,-1250.000000,-500,-2750.000000,-1000.000000,500)
    AddCube("Т-2", -2750.000000,-1250.000000,-500,-2500.000000,-1000.000000,500)
    AddCube("Т-3", -2500.000000,-1250.000000,-500,-2250.000000,-1000.000000,500)
    AddCube("Т-4", -2250.000000,-1250.000000,-500,-2000.000000,-1000.000000,500)
    AddCube("Т-5", -2000.000000,-1250.000000,-500,-1750.000000,-1000.000000,500)
    AddCube("Т-6", -1750.000000,-1250.000000,-500,-1500.000000,-1000.000000,500)
    AddCube("Т-7", -1500.000000,-1250.000000,-500,-1250.000000,-1000.000000,500)
    AddCube("Т-8", -1250.000000,-1250.000000,-500,-1000.000000,-1000.000000,500)
    AddCube("Т-9", -1000.000000,-1250.000000,-500,-750.000000,-1000.000000,500)
    AddCube("Т-10", -750.000000,-1250.000000,-500,-500.000000,-1000.000000,500)
    AddCube("Т-11", -500.000000,-1250.000000,-500,-250.000000,-1000.000000,500)
    AddCube("Т-12", -250.000000,-1250.000000,-500,0.000000,-1000.000000,500)
    AddCube("Т-13", 0.000000,-1250.000000,-500,250.000000,-1000.000000,500)
    AddCube("Т-14", 250.000000,-1250.000000,-500,500.000000,-1000.000000,500)
    AddCube("Т-15", 500.000000,-1250.000000,-500,750.000000,-1000.000000,500)
    AddCube("Т-16", 750.000000,-1250.000000,-500,1000.000000,-1000.000000,500)
    AddCube("Т-17", 1000.000000,-1250.000000,-500,1250.000000,-1000.000000,500)
    AddCube("Т-18", 1250.000000,-1250.000000,-500,1500.000000,-1000.000000,500)
    AddCube("Т-19", 1500.000000,-1250.000000,-500,1750.000000,-1000.000000,500)
    AddCube("Т-20", 1750.000000,-1250.000000,-500,2000.000000,-1000.000000,500)
    AddCube("Т-21", 2000.000000,-1250.000000,-500,2250.000000,-1000.000000,500)
    AddCube("Т-22", 2250.000000,-1250.000000,-500,2500.000000,-1000.000000,500)
    AddCube("Т-23", 2500.000000,-1250.000000,-500,2750.000000,-1000.000000,500)
    AddCube("Т-24", 2750.000000,-1250.000000,-500,3000.000000,-1000.000000,500)
    AddCube("У-1", -3000.000000,-1500.000000,-500,-2750.000000,-1250.000000,500)
    AddCube("У-2", -2750.000000,-1500.000000,-500,-2500.000000,-1250.000000,500)
    AddCube("У-3", -2500.000000,-1500.000000,-500,-2250.000000,-1250.000000,500)
    AddCube("У-4", -2250.000000,-1500.000000,-500,-2000.000000,-1250.000000,500)
    AddCube("У-5", -2000.000000,-1500.000000,-500,-1750.000000,-1250.000000,500)
    AddCube("У-6", -1750.000000,-1500.000000,-500,-1500.000000,-1250.000000,500)
    AddCube("У-7", -1500.000000,-1500.000000,-500,-1250.000000,-1250.000000,500)
    AddCube("У-8", -1250.000000,-1500.000000,-500,-1000.000000,-1250.000000,500)
    AddCube("У-9", -1000.000000,-1500.000000,-500,-750.000000,-1250.000000,500)
    AddCube("У-10", -750.000000,-1500.000000,-500,-500.000000,-1250.000000,500)
    AddCube("У-11", -500.000000,-1500.000000,-500,-250.000000,-1250.000000,500)
    AddCube("У-12", -250.000000,-1500.000000,-500,0.000000,-1250.000000,500)
    AddCube("У-13", 0.000000,-1500.000000,-500,250.000000,-1250.000000,500)
    AddCube("У-14", 250.000000,-1500.000000,-500,500.000000,-1250.000000,500)
    AddCube("У-15", 500.000000,-1500.000000,-500,750.000000,-1250.000000,500)
    AddCube("У-16", 750.000000,-1500.000000,-500,1000.000000,-1250.000000,500)
    AddCube("У-17", 1000.000000,-1500.000000,-500,1250.000000,-1250.000000,500)
    AddCube("У-18", 1250.000000,-1500.000000,-500,1500.000000,-1250.000000,500)
    AddCube("У-19", 1500.000000,-1500.000000,-500,1750.000000,-1250.000000,500)
    AddCube("У-20", 1750.000000,-1500.000000,-500,2000.000000,-1250.000000,500)
    AddCube("У-21", 2000.000000,-1500.000000,-500,2250.000000,-1250.000000,500)
    AddCube("У-22", 2250.000000,-1500.000000,-500,2500.000000,-1250.000000,500)
    AddCube("У-23", 2500.000000,-1500.000000,-500,2750.000000,-1250.000000,500)
    AddCube("У-24", 2750.000000,-1500.000000,-500,3000.000000,-1250.000000,500)
    AddCube("Ф-1", -3000.000000,-1750.000000,-500,-2750.000000,-1500.000000,500)
    AddCube("Ф-2", -2750.000000,-1750.000000,-500,-2500.000000,-1500.000000,500)
    AddCube("Ф-3", -2500.000000,-1750.000000,-500,-2250.000000,-1500.000000,500)
    AddCube("Ф-4", -2250.000000,-1750.000000,-500,-2000.000000,-1500.000000,500)
    AddCube("Ф-5", -2000.000000,-1750.000000,-500,-1750.000000,-1500.000000,500)
    AddCube("Ф-6", -1750.000000,-1750.000000,-500,-1500.000000,-1500.000000,500)
    AddCube("Ф-7", -1500.000000,-1750.000000,-500,-1250.000000,-1500.000000,500)
    AddCube("Ф-8", -1250.000000,-1750.000000,-500,-1000.000000,-1500.000000,500)
    AddCube("Ф-9", -1000.000000,-1750.000000,-500,-750.000000,-1500.000000,500)
    AddCube("Ф-10", -750.000000,-1750.000000,-500,-500.000000,-1500.000000,500)
    AddCube("Ф-11", -500.000000,-1750.000000,-500,-250.000000,-1500.000000,500)
    AddCube("Ф-12", -250.000000,-1750.000000,-500,0.000000,-1500.000000,500)
    AddCube("Ф-13", 0.000000,-1750.000000,-500,250.000000,-1500.000000,500)
    AddCube("Ф-14", 250.000000,-1750.000000,-500,500.000000,-1500.000000,500)
    AddCube("Ф-15", 500.000000,-1750.000000,-500,750.000000,-1500.000000,500)
    AddCube("Ф-16", 750.000000,-1750.000000,-500,1000.000000,-1500.000000,500)
    AddCube("Ф-17", 1000.000000,-1750.000000,-500,1250.000000,-1500.000000,500)
    AddCube("Ф-18", 1250.000000,-1750.000000,-500,1500.000000,-1500.000000,500)
    AddCube("Ф-19", 1500.000000,-1750.000000,-500,1750.000000,-1500.000000,500)
    AddCube("Ф-20", 1750.000000,-1750.000000,-500,2000.000000,-1500.000000,500)
    AddCube("Ф-21", 2000.000000,-1750.000000,-500,2250.000000,-1500.000000,500)
    AddCube("Ф-22", 2250.000000,-1750.000000,-500,2500.000000,-1500.000000,500)
    AddCube("Ф-23", 2500.000000,-1750.000000,-500,2750.000000,-1500.000000,500)
    AddCube("Ф-24", 2750.000000,-1750.000000,-500,3000.000000,-1500.000000,500)
    AddCube("Х-1", -3000.000000,-2000.000000,-500,-2750.000000,-1750.000000,500)
    AddCube("Х-2", -2750.000000,-2000.000000,-500,-2500.000000,-1750.000000,500)
    AddCube("Х-3", -2500.000000,-2000.000000,-500,-2250.000000,-1750.000000,500)
    AddCube("Х-4", -2250.000000,-2000.000000,-500,-2000.000000,-1750.000000,500)
    AddCube("Х-5", -2000.000000,-2000.000000,-500,-1750.000000,-1750.000000,500)
    AddCube("Х-6", -1750.000000,-2000.000000,-500,-1500.000000,-1750.000000,500)
    AddCube("Х-7", -1500.000000,-2000.000000,-500,-1250.000000,-1750.000000,500)
    AddCube("Х-8", -1250.000000,-2000.000000,-500,-1000.000000,-1750.000000,500)
    AddCube("Х-9", -1000.000000,-2000.000000,-500,-750.000000,-1750.000000,500)
    AddCube("Х-10", -750.000000,-2000.000000,-500,-500.000000,-1750.000000,500)
    AddCube("Х-11", -500.000000,-2000.000000,-500,-250.000000,-1750.000000,500)
    AddCube("Х-12", -250.000000,-2000.000000,-500,0.000000,-1750.000000,500)
    AddCube("Х-13", 0.000000,-2000.000000,-500,250.000000,-1750.000000,500)
    AddCube("Х-14", 250.000000,-2000.000000,-500,500.000000,-1750.000000,500)
    AddCube("Х-15", 500.000000,-2000.000000,-500,750.000000,-1750.000000,500)
    AddCube("Х-16", 750.000000,-2000.000000,-500,1000.000000,-1750.000000,500)
    AddCube("Х-17", 1000.000000,-2000.000000,-500,1250.000000,-1750.000000,500)
    AddCube("Х-18", 1250.000000,-2000.000000,-500,1500.000000,-1750.000000,500)
    AddCube("Х-19", 1500.000000,-2000.000000,-500,1750.000000,-1750.000000,500)
    AddCube("Х-20", 1750.000000,-2000.000000,-500,2000.000000,-1750.000000,500)
    AddCube("Х-21", 2000.000000,-2000.000000,-500,2250.000000,-1750.000000,500)
    AddCube("Х-22", 2250.000000,-2000.000000,-500,2500.000000,-1750.000000,500)
    AddCube("Х-23", 2500.000000,-2000.000000,-500,2750.000000,-1750.000000,500)
    AddCube("Х-24", 2750.000000,-2000.000000,-500,3000.000000,-1750.000000,500)
    AddCube("Ц-1", -3000.000000,-2250.000000,-500,-2750.000000,-2000.000000,500)
    AddCube("Ц-2", -2750.000000,-2250.000000,-500,-2500.000000,-2000.000000,500)
    AddCube("Ц-3", -2500.000000,-2250.000000,-500,-2250.000000,-2000.000000,500)
    AddCube("Ц-4", -2250.000000,-2250.000000,-500,-2000.000000,-2000.000000,500)
    AddCube("Ц-5", -2000.000000,-2250.000000,-500,-1750.000000,-2000.000000,500)
    AddCube("Ц-6", -1750.000000,-2250.000000,-500,-1500.000000,-2000.000000,500)
    AddCube("Ц-7", -1500.000000,-2250.000000,-500,-1250.000000,-2000.000000,500)
    AddCube("Ц-8", -1250.000000,-2250.000000,-500,-1000.000000,-2000.000000,500)
    AddCube("Ц-9", -1000.000000,-2250.000000,-500,-750.000000,-2000.000000,500)
    AddCube("Ц-10", -750.000000,-2250.000000,-500,-500.000000,-2000.000000,500)
    AddCube("Ц-11", -500.000000,-2250.000000,-500,-250.000000,-2000.000000,500)
    AddCube("Ц-12", -250.000000,-2250.000000,-500,0.000000,-2000.000000,500)
    AddCube("Ц-13", 0.000000,-2250.000000,-500,250.000000,-2000.000000,500)
    AddCube("Ц-14", 250.000000,-2250.000000,-500,500.000000,-2000.000000,500)
    AddCube("Ц-15", 500.000000,-2250.000000,-500,750.000000,-2000.000000,500)
    AddCube("Ц-16", 750.000000,-2250.000000,-500,1000.000000,-2000.000000,500)
    AddCube("Ц-17", 1000.000000,-2250.000000,-500,1250.000000,-2000.000000,500)
    AddCube("Ц-18", 1250.000000,-2250.000000,-500,1500.000000,-2000.000000,500)
    AddCube("Ц-19", 1500.000000,-2250.000000,-500,1750.000000,-2000.000000,500)
    AddCube("Ц-20", 1750.000000,-2250.000000,-500,2000.000000,-2000.000000,500)
    AddCube("Ц-21", 2000.000000,-2250.000000,-500,2250.000000,-2000.000000,500)
    AddCube("Ц-22", 2250.000000,-2250.000000,-500,2500.000000,-2000.000000,500)
    AddCube("Ц-23", 2500.000000,-2250.000000,-500,2750.000000,-2000.000000,500)
    AddCube("Ц-24", 2750.000000,-2250.000000,-500,3000.000000,-2000.000000,500)
    AddCube("Ч-1", -3000.000000,-2500.000000,-500,-2750.000000,-2250.000000,500)
    AddCube("Ч-2", -2750.000000,-2500.000000,-500,-2500.000000,-2250.000000,500)
    AddCube("Ч-3", -2500.000000,-2500.000000,-500,-2250.000000,-2250.000000,500)
    AddCube("Ч-4", -2250.000000,-2500.000000,-500,-2000.000000,-2250.000000,500)
    AddCube("Ч-5", -2000.000000,-2500.000000,-500,-1750.000000,-2250.000000,500)
    AddCube("Ч-6", -1750.000000,-2500.000000,-500,-1500.000000,-2250.000000,500)
    AddCube("Ч-7", -1500.000000,-2500.000000,-500,-1250.000000,-2250.000000,500)
    AddCube("Ч-8", -1250.000000,-2500.000000,-500,-1000.000000,-2250.000000,500)
    AddCube("Ч-9", -1000.000000,-2500.000000,-500,-750.000000,-2250.000000,500)
    AddCube("Ч-10", -750.000000,-2500.000000,-500,-500.000000,-2250.000000,500)
    AddCube("Ч-11", -500.000000,-2500.000000,-500,-250.000000,-2250.000000,500)
    AddCube("Ч-12", -250.000000,-2500.000000,-500,0.000000,-2250.000000,500)
    AddCube("Ч-13", 0.000000,-2500.000000,-500,250.000000,-2250.000000,500)
    AddCube("Ч-14", 250.000000,-2500.000000,-500,500.000000,-2250.000000,500)
    AddCube("Ч-15", 500.000000,-2500.000000,-500,750.000000,-2250.000000,500)
    AddCube("Ч-16", 750.000000,-2500.000000,-500,1000.000000,-2250.000000,500)
    AddCube("Ч-17", 1000.000000,-2500.000000,-500,1250.000000,-2250.000000,500)
    AddCube("Ч-18", 1250.000000,-2500.000000,-500,1500.000000,-2250.000000,500)
    AddCube("Ч-19", 1500.000000,-2500.000000,-500,1750.000000,-2250.000000,500)
    AddCube("Ч-20", 1750.000000,-2500.000000,-500,2000.000000,-2250.000000,500)
    AddCube("Ч-21", 2000.000000,-2500.000000,-500,2250.000000,-2250.000000,500)
    AddCube("Ч-22", 2250.000000,-2500.000000,-500,2500.000000,-2250.000000,500)
    AddCube("Ч-23", 2500.000000,-2500.000000,-500,2750.000000,-2250.000000,500)
    AddCube("Ч-24", 2750.000000,-2500.000000,-500,3000.000000,-2250.000000,500)
    AddCube("Ш-1", -3000.000000,-2750.000000,-500,-2750.000000,-2500.000000,500)
    AddCube("Ш-2", -2750.000000,-2750.000000,-500,-2500.000000,-2500.000000,500)
    AddCube("Ш-3", -2500.000000,-2750.000000,-500,-2250.000000,-2500.000000,500)
    AddCube("Ш-4", -2250.000000,-2750.000000,-500,-2000.000000,-2500.000000,500)
    AddCube("Ш-5", -2000.000000,-2750.000000,-500,-1750.000000,-2500.000000,500)
    AddCube("Ш-6", -1750.000000,-2750.000000,-500,-1500.000000,-2500.000000,500)
    AddCube("Ш-7", -1500.000000,-2750.000000,-500,-1250.000000,-2500.000000,500)
    AddCube("Ш-8", -1250.000000,-2750.000000,-500,-1000.000000,-2500.000000,500)
    AddCube("Ш-9", -1000.000000,-2750.000000,-500,-750.000000,-2500.000000,500)
    AddCube("Ш-10", -750.000000,-2750.000000,-500,-500.000000,-2500.000000,500)
    AddCube("Ш-11", -500.000000,-2750.000000,-500,-250.000000,-2500.000000,500)
    AddCube("Ш-12", -250.000000,-2750.000000,-500,0.000000,-2500.000000,500)
    AddCube("Ш-13", 0.000000,-2750.000000,-500,250.000000,-2500.000000,500)
    AddCube("Ш-14", 250.000000,-2750.000000,-500,500.000000,-2500.000000,500)
    AddCube("Ш-15", 500.000000,-2750.000000,-500,750.000000,-2500.000000,500)
    AddCube("Ш-16", 750.000000,-2750.000000,-500,1000.000000,-2500.000000,500)
    AddCube("Ш-17", 1000.000000,-2750.000000,-500,1250.000000,-2500.000000,500)
    AddCube("Ш-18", 1250.000000,-2750.000000,-500,1500.000000,-2500.000000,500)
    AddCube("Ш-19", 1500.000000,-2750.000000,-500,1750.000000,-2500.000000,500)
    AddCube("Ш-20", 1750.000000,-2750.000000,-500,2000.000000,-2500.000000,500)
    AddCube("Ш-21", 2000.000000,-2750.000000,-500,2250.000000,-2500.000000,500)
    AddCube("Ш-22", 2250.000000,-2750.000000,-500,2500.000000,-2500.000000,500)
    AddCube("Ш-23", 2500.000000,-2750.000000,-500,2750.000000,-2500.000000,500)
    AddCube("Ш-24", 2750.000000,-2750.000000,-500,3000.000000,-2500.000000,500)
    AddCube("Я-1", -3000.000000,-3000.000000,-500,-2750.000000,-2750.000000,500)
    AddCube("Я-2", -2750.000000,-3000.000000,-500,-2500.000000,-2750.000000,500)
    AddCube("Я-3", -2500.000000,-3000.000000,-500,-2250.000000,-2750.000000,500)
    AddCube("Я-4", -2250.000000,-3000.000000,-500,-2000.000000,-2750.000000,500)
    AddCube("Я-5", -2000.000000,-3000.000000,-500,-1750.000000,-2750.000000,500)
    AddCube("Я-6", -1750.000000,-3000.000000,-500,-1500.000000,-2750.000000,500)
    AddCube("Я-7", -1500.000000,-3000.000000,-500,-1250.000000,-2750.000000,500)
    AddCube("Я-8", -1250.000000,-3000.000000,-500,-1000.000000,-2750.000000,500)
    AddCube("Я-9", -1000.000000,-3000.000000,-500,-750.000000,-2750.000000,500)
    AddCube("Я-10", -750.000000,-3000.000000,-500,-500.000000,-2750.000000,500)
    AddCube("Я-11", -500.000000,-3000.000000,-500,-250.000000,-2750.000000,500)
    AddCube("Я-12", -250.000000,-3000.000000,-500,0.000000,-2750.000000,500)
    AddCube("Я-13", 0.000000,-3000.000000,-500,250.000000,-2750.000000,500)
    AddCube("Я-14", 250.000000,-3000.000000,-500,500.000000,-2750.000000,500)
    AddCube("Я-15", 500.000000,-3000.000000,-500,750.000000,-2750.000000,500)
    AddCube("Я-16", 750.000000,-3000.000000,-500,1000.000000,-2750.000000,500)
    AddCube("Я-17", 1000.000000,-3000.000000,-500,1250.000000,-2750.000000,500)
    AddCube("Я-18", 1250.000000,-3000.000000,-500,1500.000000,-2750.000000,500)
    AddCube("Я-19", 1500.000000,-3000.000000,-500,1750.000000,-2750.000000,500)
    AddCube("Я-20", 1750.000000,-3000.000000,-500,2000.000000,-2750.000000,500)
    AddCube("Я-21", 2000.000000,-3000.000000,-500,2250.000000,-2750.000000,500)
    AddCube("Я-22", 2250.000000,-3000.000000,-500,2500.000000,-2750.000000,500)
    AddCube("Я-23", 2500.000000,-3000.000000,-500,2750.000000,-2750.000000,500)
    AddCube("Я-24", 2750.000000,-3000.000000,-500,3000.000000,-2750.000000,500)
}
HexToDec(str)
{
    local newStr := ""
static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
    StringLower, str, str
    str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
    Loop, % StrLen(str)
    newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
    newStr := StrSplit(newStr, "")
    local ret := 0
    for i,char in newStr
    ret += comp[char]*(16**(i-1))
    return ret
}
calculateCube(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    Loop % nCube-1
    {
        if (posX >= cube%A_Index%_x1) && (posY >= cube%A_Index%_y1) && (posZ >= cube%A_Index%_z1) && (posX <= cube%A_Index%_x2) && (posY <= cube%A_Index%_y2) && (posZ <= cube%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return cube%A_Index%_name
        }
    }
    ErrorLevel := ERROR_CUBE_NOT_FOUND
    return "Unbekannt"
}
AddCube(sName, x1, y1, z1, x2, y2, z2) {
    global
    cube%nCube%_name := sName
    cube%nCube%_x1 := x1
    cube%nCube%_y1 := y1
    cube%nCube%_z1 := z1
    cube%nCube%_x2 := x2
    cube%nCube%_y2 := y2
    cube%nCube%_z2 := z2
    nCube := nCube + 1
}
getPlayerCube()
{
    aktPos := getCoordinates()
    return calculateCube(aktPos[1], aktPos[2], aktPos[3])
}
connect(IP) {
    setIP(IP)
    restartGameEx()
    disconnectEx()
    Sleep 1000
    setrestart()
    Return
}
WriteProcessMemory(title,addresse,wert,size)
{
    VarSetCapacity(idvar,32,0)
    VarSetCapacity(processhandle,32,0)
    VarSetCapacity(value, 32, 0)
    NumPut(wert,value,0,Uint)
    address=%addresse%
    WinGet ,idvar,PID,%title%
    processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
    Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint",size,"Uint",0)
}
setCoordinates(x, y, z, Interior) {
    if(!checkHandles())
    return False
    dwAddress := readMem(hGTA, ADDR_SET_POSITION)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }
    dwAddress := readMem(hGTA, dwAddress + ADDR_SET_POSITION_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }
    Sleep 100
    writeByte(hGTA, ADDR_SET_INTERIOR_OFFSET, Interior)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_X_OFFSET, x)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Y_OFFSET, y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Z_OFFSET, z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }
    Return True
}
colorhud(colorhud)
{
    VarSetCapacity(idvar,32,0)
    VarSetCapacity(processhandle,32,0)
    VarSetCapacity(value, 32, 0)
    NumPut(colorhud,value,0,Uint)
    address=0xBAB230
    WinGet ,idvar,PID,GTA:SA:MP
    processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
    Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint","4","Uint",0)
}
getIP() {
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ipAddr := readString(hGTA, dwAddress + SAMP_SZIP_OFFSET, 257)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    return ipAddr
}
setIP(IP) {
    if(!checkHandles())
    return False
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }
    writeString(hGTA, dwAddress + SAMP_SZIP_OFFSET, IP)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }
    return True
}
getHostname() {
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    hostname := readString(hGTA, dwAddress + SAMP_SZHOSTNAME_OFFSET, 259)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    return hostname
}
setUsername(Username) {
    if(!checkHandles())
    return False
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    writeString(hGTA, dwAddress, Username)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }
    ErrorLevel := ERROR_OK
    return True
}
setChatLine(line, msg) {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA,dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    writeString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), msg)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return True
}
getTagNameDistance() {
    if(!checkHandles())
    return -1
    dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    distance := readFloat(hGTA, dwSAMPInfoSettings + 0x27)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return distance
}
setTagNameDistance(status, distance) {
    if(!checkHandles())
    return -1
    status := status ? 1 : 0
    dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    writeByte(hGTA, dwSAMPInfoSettings + 0x38, 1)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    writeByte(hGTA, dwSAMPInfoSettings + 0x2F, status)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    writeFloat(hGTA, dwSAMPInfoSettings + 0x27, distance)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return
}
setTime(hour)
{
    if(!checkHandles())
    return
    VarSetCapacity(nop, 6, 0)
    Loop 6 {
        NumPut(0x90, nop, A_INDEX-1, "UChar")
    }
    writeRaw(hGTA, 0x52D168, &nop, 6)
    VarSetCapacity(time, 1, 0)
    NumPut(hour, time, 0, "Int")
    writeRaw(hGTA, 0xB70153, &time, 1)
}
setWeather(id)
{
    if(!checkHandles())
    return
    VarSetCapacity(weather, 1, 0)
    NumPut(id, weather, 0, "Int")
    writeRaw(hGTA, 0xC81320, &weather, 1)
    if(ErrorLevel)
    return false
    return true
}
getDialogTitle()
{
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    text := readString(hGTA, dwAddress + 0x40, 128)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return text
}
setPlayerColor(id,color)
{
    id += 0
    color +=0
    if(!checkHandles())
    return
    VarSetCapacity(bla, 4, 0)
    NumPut(color,bla,0,"UInt")
    writeRaw(hGTA, dwSAMP + 0x216378 + 4*id, &bla, 4)
}
colorToStr(color)
{
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if (StrLen(color) == 5)
    color := "0"color
return "{" color "}"
}
GetInterior()
{
    dwAddress := readDWORD(hGTA, ADDR_SET_INTERIOR_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }
    return True
}
writeFloat(hProcess, dwAddress, wFloat) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    wFloat := FloatToHex(wFloat)
    dwRet := DllCall(   "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt *", wFloat
    , "UInt", 4
    , "UInt *", 0)
    ErrorLevel := ERROR_OK
    return true
}
writeByte(hProcess, dwAddress, wInt) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    wInt := IntToHex(wInt)
    dwRet := DllCall(     "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt *", wInt
    , "UInt", 1
    , "UInt *", 0)
}
FloatToHex(value) {
    format := A_FormatInteger
    SetFormat, Integer, H
    result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
    SetFormat, Integer, %format%
    return, result
}
IntToHex(int)
{
    CurrentFormat := A_FormatInteger
    SetFormat, integer, hex
    int += 0
    SetFormat, integer, %CurrentFormat%
    return int
}
setrestart()
{
    VarSetCapacity(old, 4, 0)
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    NumPut(9,old,0,"Int")
    writeRaw(hGTA, dwAddress + 957, &old, 4)
}
getIdsInAnyVehicle()
{
    if (isPlayerInAnyVehicle())
    {
        cVeh := readDWORD(hGTA, 0xB79530)
        ids := []
        index := 0
        Loop, 8
        {
            playerId := getIdByPed(readDWORD(hGTA, cVeh + (1120 + index)))
            ids[A_Index] := playerId
            index := 4 * A_Index
        }
        return ids
    }
    return -1
}
isPlayerInStreamById(player_id, radius := 150)
{
    NAME := ""
    check := []
    p := getStreamedInPlayersInfo()
    if (!p)
    return 0
    For i, o in p
    {
        if (Floor(getDist(getCoordinates(), o.POS)) <= radius)
        {
            NAME .= o.NAME ", "
        }
    }
    NAME := Trim(NAME, ", ")
    if (IsObject(player_id))
    {
        for k, v in player_id
        {
            Loop, Parse, % NAME, % ",", % " ,.`n`r"
            {
                if (A_LoopField == getPlayerNameById(v))
                {
                    i := 1
                    break
                }
            }
            if (i)
            {
                check[v] := 1
            }
            else
            {
                check[v] := 0
            }
        }
        return check
    }
    else if (!IsObject(player_id))
    {
        if (!getPlayerNameById(player_id))
        return -1
        Loop, Parse, % NAME, % ",", % " ,.`n`r"
        {
            if (A_LoopField == getPlayerNameById(player_id))
            {
                return 1
            }
        }
        return 0
    }
}
IsSAMPAvailable() {
    if(!checkHandles())
    return false
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(dwChatInfo == 0 || dwChatInfo == "ERROR")
    {
        return false
    }
    else
    {
        return true
    }
}
isInChat() {
    if(!checkHandles())
    return -1
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}
ProcessReadMemory(address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
    return -1
    if !processHandle := DllCall("OpenProcess", "Int", 24, "UInt", 0, "UInt", processID, "Ptr")
    return -1
    result := DllCall("ReadProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "PtrP", numBytesRead, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
    return -1
    if !result
    return -1
    if !numBytesRead
    return -1
    return (type = "Str") ? StrGet(&buf, numBytes) : NumGet(buf, type)
}
ProcessWriteMemory(data, address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    (type = "Str") ? StrPut(data, &buf, numBytes) : NumPut(data, buf, type)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
    return
    if !processHandle := DllCall("OpenProcess", "Int", 40, "UInt", 0, "UInt", processID, "Ptr")
    throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
    result := DllCall("WriteProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "UInt", 0, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
    throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
    if !result
    return
    return result
}
patchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}
unPatchRadio()
{
    if(!checkHandles())
    return false
    VarSetCapacity(old, 4, 0)
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}
blockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
unBlockChatInput() {
    if(!checkHandles())
    return false
    VarSetCapacity(nop, 2, 0)
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    return true
}
getWeatherName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}
isTargetDriverbyId(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwAddrVPtr := getVehiclePointerByPed(dwPedPointer)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwVal := readDWORD(hGTA, dwAddrVPtr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal == dwPedPointer)
}
getTargetPed() {
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddress)
    return 0
    dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
calcScreenCoors(fX,fY,fZ)
{
    if(!checkHandles())
    return false
    dwM := 0xB6FA2C
    m_11 := readFloat(hGTA, dwM + 0*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    m_12 := readFloat(hGTA, dwM + 1*4)
    m_13 := readFloat(hGTA, dwM + 2*4)
    m_21 := readFloat(hGTA, dwM + 4*4)
    m_22 := readFloat(hGTA, dwM + 5*4)
    m_23 := readFloat(hGTA, dwM + 6*4)
    m_31 := readFloat(hGTA, dwM + 8*4)
    m_32 := readFloat(hGTA, dwM + 9*4)
    m_33 := readFloat(hGTA, dwM + 10*4)
    m_41 := readFloat(hGTA, dwM + 12*4)
    m_42 := readFloat(hGTA, dwM + 13*4)
    m_43 := readFloat(hGTA, dwM + 14*4)
    dwLenX := readDWORD(hGTA, 0xC17044)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwLenY := readDWORD(hGTA, 0xC17048)
    frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
    frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
    frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
    fRecip := 1.0/frZ
    frX *= fRecip * dwLenX
    frY *= fRecip * dwLenY
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
    return [frX,frY,frZ]
}
ConvertCarColor(Color)
{
    ArrayRGB := ["0xF5F5F5FF", "0x2A77A1FF", "0x840410FF", "0x263739FF", "0x86446EFF", "0xD78E10FF", "0x4C75B7FF", "0xBDBEC6FF", "0x5E7072FF", "0x46597AFF", "0x656A79FF", "0x5D7E8DFF", "0x58595AFF", "0xD6DAD6FF", "0x9CA1A3FF", "0x335F3FFF", "0x730E1AFF", "0x7B0A2AFF", "0x9F9D94FF", "0x3B4E78FF", "0x732E3EFF", "0x691E3BFF", "0x96918CFF", "0x515459FF", "0x3F3E45FF", "0xA5A9A7FF", "0x635C5AFF", "0x3D4A68FF", "0x979592FF", "0x421F21FF", "0x5F272BFF", "0x8494ABFF", "0x767B7CFF", "0x646464FF", "0x5A5752FF", "0x252527FF", "0x2D3A35FF", "0x93A396FF", "0x6D7A88FF", "0x221918FF", "0x6F675FFF", "0x7C1C2AFF", "0x5F0A15FF", "0x193826FF", "0x5D1B20FF", "0x9D9872FF", "0x7A7560FF", "0x989586FF", "0xADB0B0FF", "0x848988FF", "0x304F45FF", "0x4D6268FF", "0x162248FF", "0x272F4BFF", "0x7D6256FF", "0x9EA4ABFF", "0x9C8D71FF", "0x6D1822FF", "0x4E6881FF", "0x9C9C98FF", "0x917347FF", "0x661C26FF", "0x949D9FFF", "0xA4A7A5FF", "0x8E8C46FF", "0x341A1EFF", "0x6A7A8CFF", "0xAAAD8EFF", "0xAB988FFF", "0x851F2EFF", "0x6F8297FF", "0x585853FF", "0x9AA790FF", "0x601A23FF", "0x20202CFF", "0xA4A096FF", "0xAA9D84FF", "0x78222BFF", "0x0E316DFF", "0x722A3FFF", "0x7B715EFF", "0x741D28FF", "0x1E2E32FF", "0x4D322FFF", "0x7C1B44FF", "0x2E5B20FF", "0x395A83FF", "0x6D2837FF", "0xA7A28FFF", "0xAFB1B1FF", "0x364155FF", "0x6D6C6EFF", "0x0F6A89FF", "0x204B6BFF", "0x2B3E57FF", "0x9B9F9DFF", "0x6C8495FF", "0x4D8495FF", "0xAE9B7FFF", "0x406C8FFF", "0x1F253BFF", "0xAB9276FF", "0x134573FF", "0x96816CFF", "0x64686AFF", "0x105082FF", "0xA19983FF", "0x385694FF", "0x525661FF", "0x7F6956FF", "0x8C929AFF", "0x596E87FF", "0x473532FF", "0x44624FFF", "0x730A27FF", "0x223457FF", "0x640D1BFF", "0xA3ADC6FF", "0x695853FF", "0x9B8B80FF", "0x620B1CFF", "0x5B5D5EFF", "0x624428FF", "0x731827FF", "0x1B376DFF", "0xEC6AAEFF", "0x000000FF"]
    ArrayRGBNew := ["0x177517FF", "0x210606FF", "0x125478FF", "0x452A0DFF", "0x571E1EFF", "0x010701FF", "0x25225AFF", "0x2C89AAFF", "0x8A4DBDFF", "0x35963AFF", "0xB7B7B7FF", "0x464C8DFF", "0x84888CFF", "0x817867FF", "0x817A26FF", "0x6A506FFF", "0x583E6FFF", "0x8CB972FF", "0x824F78FF", "0x6D276AFF", "0x1E1D13FF", "0x1E1306FF", "0x1F2518FF", "0x2C4531FF", "0x1E4C99FF", "0x2E5F43FF", "0x1E9948FF", "0x1E9999FF", "0x999976FF", "0x7C8499FF", "0x992E1EFF", "0x2C1E08FF", "0x142407FF", "0x993E4DFF", "0x1E4C99FF", "0x198181FF", "0x1A292AFF", "0x16616FFF", "0x1B6687FF", "0x6C3F99FF", "0x481A0EFF", "0x7A7399FF", "0x746D99FF", "0x53387EFF", "0x222407FF", "0x3E190CFF", "0x46210EFF", "0x991E1EFF", "0x8D4C8DFF", "0x805B80FF", "0x7B3E7EFF", "0x3C1737FF", "0x733517FF", "0x781818FF", "0x83341AFF", "0x8E2F1CFF", "0x7E3E53FF", "0x7C6D7CFF", "0x020C02FF", "0x072407FF", "0x163012FF", "0x16301BFF", "0x642B4FFF", "0x368452FF", "0x999590FF", "0x818D96FF", "0x99991EFF", "0x7F994CFF", "0x839292FF", "0x788222FF", "0x2B3C99FF", "0x3A3A0BFF", "0x8A794EFF", "0x0E1F49FF", "0x15371CFF", "0x15273AFF", "0x375775FF", "0x060820FF", "0x071326FF", "0x20394BFF", "0x2C5089FF", "0x15426CFF", "0x103250FF", "0x241663FF", "0x692015FF", "0x8C8D94FF", "0x516013FF", "0x090F02FF", "0x8C573AFF", "0x52888EFF", "0x995C52FF", "0x99581EFF", "0x993A63FF", "0x998F4EFF", "0x99311EFF", "0x0D1842FF", "0x521E1EFF", "0x42420DFF", "0x4C991EFF", "0x082A1DFF", "0x96821DFF", "0x197F19FF", "0x3B141FFF", "0x745217FF", "0x893F8DFF", "0x7E1A6CFF", "0x0B370BFF", "0x27450DFF", "0x071F24FF", "0x784573FF", "0x8A653AFF", "0x732617FF", "0x319490FF", "0x56941DFF", "0x59163DFF", "0x1B8A2FFF", "0x38160BFF", "0x041804FF", "0x355D8EFF", "0x2E3F5BFF", "0x561A28FF", "0x4E0E27FF", "0x706C67FF", "0x3B3E42FF", "0x2E2D33FF", "0x7B7E7DFF", "0x4A4442FF", "0x28344EFF"]
    if (Color > 0) and (Color < 128)
    RGB := ArrayRGB[Color]
    if (Color > 127) and (Color < 256)
    {
        RGB := ArrayRGBNew[Color + 127]
    }
    StringLeft, RGBTemp, RGB, 8
    StringRight, RGB, RGBTemp, 6
    if Color = 0
    RGB := "000000"
    return RGB
}
getPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return 0
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
        }
        return 0
    }
    if(!updateOScoreboardData())
    return 0
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return oScoreboardData[dwId].PED
    }
    return 0
}
getIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
    if(!dwPed)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                if(o.PED==dwPed)
                return i
            }
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            if(o.PED==dwPed)
            return i
        }
    }
    return -1
}
IsInAFK()
{
    res := ProcessReadMemory(0xBA6748 + 0x5C, "gta_sa.exe")
    if (res==-1)
    return -1
    WinGet, win, MinMax, GTA:SA:MP
    if ((res=0) and (win=-1)) or res=1
    return 1
    return 0
}
getStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := getPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    if(!updateOScoreboardData())
    return ""
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := getPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}
callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
    return false
    p := getStreamedInPlayersInfo()
    if(!p)
    return false
    if(dist<0x7fffffff)
    {
        lpos := getCoordinates()
        if(!lpos)
        return false
        For i, o in p
        {
            if(dist>getDist(lpos,o.POS))
            %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
        %cfunc%(o)
    }
    return true
}
getDist(pos1,pos2) {
    if(!pos1 || !pos2)
    return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getDist2D(pos1, pos2)
{
    if(!pos1 || !pos2)
    return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2]))
}
getClosestPlayerPed() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := getPedById(id)
    return PED
}
getClosestPlayerId() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}
CountOnlinePlayers()
{
    if(!checkHandles())
    return -1
    dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
    if(ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    if(ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return OnlinePlayers
}
getPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return ""
    if(!checkHandles())
    return ""
    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
getTargetPos(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
            return getPedCoordinates(oScoreboardData[dwId].PED)
            if(oScoreboardData[dwId].HasKey("MPOS"))
            return oScoreboardData[dwId].MPOS
        }
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
        return getPedCoordinates(oScoreboardData[dwId].PED)
        if(oScoreboardData[dwId].HasKey("MPOS"))
        return oScoreboardData[dwId].MPOS
    }
    return ""
}
getTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
    return -1
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
NearPlayerInCar(dist)
{
    TempDist := 100
    if not dist dist := TempDist
    p := getStreamedInPlayersInfo()
    if(!p)
    return
    lpos := getCoordinates()
    if(!lpos)
    return
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<=dist)
        {
            if (t < TempDist) and ( t > 5 ) and getTargetVehicleModelNameById(i)
            {
                TempId := i
                TempDist := t
            }
        }
    }
    return TempId
}
getVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
    return 0
    if(!checkHandles())
    return 0
    dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
getVehiclePointerById(dwId) {
    if(!dwId)
    return 0
    if(!checkHandles())
    return 0
    dwPed_By_Id := getPedById(dwId)
    dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwAddress
}
isTargetInAnyVehicleByPed(dwPED)
{
    if(!checkHandles())
    return -1
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
isTargetInAnyVehiclebyId(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}
getTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerByPed(dwPed)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleHealthById(dwId) {
    if(!checkHandles())
    return -1
    dwVehPtr := getVehiclePointerById(dwId)
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleTypeById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
            return 5
        }
        return 1
    }
    else if(cVal==5)
    return 2
    else if(cVal==6)
    return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
            return 6
        }
        return 4
    }
    return 0
}
getTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleModelNameByPed(dwPED) {
    id := getTargetVehicleModelIdByPed(dwPED)
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getTargetVehicleColor1byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor1byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byPed(dwPED) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerByPed(dwPED)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleColor2byId(dwId) {
    if(!checkHandles())
    return 0
    dwAddr := getVehiclePointerById(dwId)
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getTargetVehicleSpeedByPed(dwPED) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerByPed(dwPED)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
    return -1
    dwAddr := getVehiclePointerById(dwId)
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
}
getPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].NAME
    return ""
}
getPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
            return i
        }
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
        return i
    }
    return -1
}
getPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return ""
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
        return ""
    }
    if(!updateOScoreboardData())
    return ""
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].SCORE
    return ""
}
getPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].PING
    return -1
}
isNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
    return -1
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
        return -1
    }
    if(!updateOScoreboardData())
    return -1
    if(oScoreboardData[dwId])
    return oScoreboardData[dwId].ISNPC
    return -1
}
updateScoreboardDataEx() {
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    VarSetCapacity(injectData, 11, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
updateOScoreboardData() {
    if(!checkHandles())
    return 0
    oScoreboardData := []
    if(!updateScoreboardDataEx())
    return 0
    iRefreshScoreboard := A_TickCount
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayer==0)
        continue
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)
        continue
        dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwAddress)
        {
            ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            o.MPOS := [ix, iy, iz]
        }
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)
        continue
        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
        continue
        o.PED := dwPed
        fHP := readFloat(hGTA, dwRemoteplayerData + 444)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        o.HP := fHP
        o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
    chatindex := 0
    FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    loop, Parse, file, `n, `r
    {
        if(A_LoopField)
        chatindex := A_Index
    }
    loop, Parse, file, `n, `r
    {
        if(A_Index = chatindex - line){
            output := A_LoopField
            break
        }
    }
    file := ""
    if(!timestamp)
output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
    if(!color)
output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
    return
}
getPlayerInteriorId() {
    if(!checkHandles())
    return -1
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return iid
}
getPlayerSkinID() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return SkinID
}
getPlayerMoney() {
    if(!checkHandles())
    return ""
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return money
}
getPlayerWanteds()
{
    if(!checkHandles())
    return -1
    return ProcessReadMemory(0x58DB60, "gta_sa.exe", "Byte", 1)
}
getPlayerWeaponId() {
    if(!checkHandles())
    return 0
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return WaffenId
}
getPlayerWeaponName() {
    id := getPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}
IsPlayerInMenu() {
    if(!checkHandles())
    return -1
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IsInMenu
}
getPlayerMapPosX() {
    if(!checkHandles())
    return -1
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosX
}
getPlayerMapPosY() {
    if(!checkHandles())
    return -1
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapPosY
}
getPlayerMapZoom() {
    if(!checkHandles())
    return -1
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return MapZoom
}
IsPlayerFreezed() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return IPF
}
getVehicleModelId() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    if(!dwAddr)
    return 0
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return sVal
}
getVehicleModelName() {
    id:=getVehicleModelId()
    if(id > 399 && id < 612)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getVehicleLightState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}
getVehicleEngineState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}
getVehicleSirenState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_SIRENSTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (cVal==-48)
}
getVehicleLockState() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getPlayerRadiostationID() {
    if(!checkHandles())
    return -1
    if(isPlayerInAnyVehicle() == 0)
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return RadioStationID
}
getPlayerRadiostationName() {
    if(isPlayerInAnyVehicle() == 0)
    return -1
    id := getPlayerRadiostationID()
    if(id == 0)
    return -1
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}
disableCheckpoint()
{
    if(!checkHandles())
    return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}
IsMarkerCreated(){
    If(!checkHandles())
    return false
    active := readMem(hGTA, CheckpointCheck, 1, "byte")
    If(!active)
    return 0
    else return 1
}
CoordsFromRedmarker(){
    if(!checkhandles())
    return false
    for i, v in rmaddrs
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}
getDialogStructPtr() {
    if (!checkHandles()) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwPointer
}
getDialogLine__(index) {
    if (getDialogLineCount > index)
    return ""
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
    line := readString(hGTA, dwLineAddress, 128)
    ErrorLevel := ERROR_OK
    return line
}
getDialogLines() {
    text := getDialogText()
    if (text == "")
    return -1
    lines := StrSplit(text, "`n")
    return lines
}
isDialogButtonSelected(btn := 1)
{
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    offset := [[0x160 + 0x05, 0x1168 + 0x5], 0x12C8 + 05]
    if (btn == 1)
    {
        sel := readMem(hGTA, dwPointer + offset[1][1], 1, "Byte")
        if (sel != 1 && sel != 0)
        sel := readMem(hGTA, dwPointer + offset[1][2], 1, "Byte")
    }
    else
    sel := readMem(hGTA, dwPointer + offset[2], 1, "Byte")
    if (sel > 1)
    sel := 0
    return sel
}
isDialogButton1Selected() {
    return isDialogButtonSelected(1)
}
isDialogButton2Selected() {
    return isDialogButtonSelected(2)
}
getDialogLines__() {
    count := getDialogLineCount()
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    lines := []
    Loop %count% {
        dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
        lines[A_Index] := readString(hGTA, dwLineAddress, 128)
    }
    ErrorLevel := ERROR_OK
    return lines
}
calculateZone(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Неизвестно"
}
calculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Неизвестно"
    currentCitySize := 0
    smallestCitySize := 0
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Неизвестно") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    if(smallestCity == "Неизвестно") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}
AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}
AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
    GetPlayerPos_(posX, posY, posZ)
    X := posX - _posX
    Y := posY - _posY
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
    return TRUE
    return FALSE
}
getPlayerZone()
{
    aktPos := getCoordinates()
    return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}
getPlayerCity()
{
    aktPos := getCoordinates()
    return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}
AntiCrash(){
    If(!checkHandles())
    return false
    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}
writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    VarSetCapacity(finalvalue,length, 0)
    NumPut(writevalue,finalvalue,0,datatype)
    dwRet :=  DllCall(  "WriteProcessMemory"
    ,"Uint",hProcess
    ,"Uint",address
    ,"Uint",&finalvalue
    ,"Uint",length
    ,"Uint",0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
    , "UInt", dwRights
    , "int",  0
    , "UInt", dwPID
    , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    ErrorLevel := ERROR_OK
    return hProcess
}
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CloseHandle"
    , "Uint", hProcess
    , "UInt")
    ErrorLevel := ERROR_OK
}
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwSize = 1024*4
    VarSetCapacity(hMods, dwSize)
    VarSetCapacity(cbNeeded, 4)
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
    , "UInt", hProcess
    , "UInt", &hMods
    , "UInt", dwSize
    , "UInt*", cbNeeded
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    dwMods := cbNeeded / 4
    i := 0
    VarSetCapacity(hModule, 4)
    VarSetCapacity(sCurModule, 260)
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
        , "UInt", hProcess
        , "UInt", hModule
        , "Str", sCurModule
        , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sRead
    , "UInt", dwLen
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    if A_IsUnicode
    return __ansiToUnicode(sRead)
    return sRead
}
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, 4)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  4
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
    , "UInt",  hProcess
    , "UInt",  dwAddress
    , "Str",   dwRead
    , "UInt",  dwLen
    , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    sString := wString
    if A_IsUnicode
    sString := __unicodeToAnsi(wString)
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "Str", sString
    , "UInt", StrLen(wString) + 1
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    dwRet := DllCall(    "WriteProcessMemory"
    , "UInt", hProcess
    , "UInt", dwAddress
    , "UInt", pBuffer
    , "UInt", dwLen
    , "UInt", 0
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
Memory_ReadByte(process_handle, address) {
    VarSetCapacity(value, 1, 0)
    DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
    return, NumGet(value, 0, "Byte")
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    i := aParams.MaxIndex()
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
    dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualAllocEx"
    , "UInt", hProcess
    , "UInt", 0
    , "UInt", dwSize
    , "UInt", flAllocationType
    , "UInt", flProtect
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "VirtualFreeEx"
    , "UInt", hProcess
    , "UInt", lpAddress
    , "UInt", dwSize
    , "UInt", dwFreeType
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "CreateRemoteThread"
    , "UInt", hProcess
    , "UInt", lpThreadAttributes
    , "UInt", dwStackSize
    , "UInt", lpStartAddress
    , "UInt", lpParameter
    , "UInt", dwCreationFlags
    , "UInt", lpThreadId
    , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    dwRet := DllCall(    "WaitForSingleObject"
    , "UInt", hThread
    , "UInt", dwMilliseconds
    , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    ErrorLevel := ERROR_OK
    return dwRet
}
__ansiToUnicode(sString, nLen = 0) {
    If !nLen
    {
        nLen := DllCall("MultiByteToWideChar"
        , "Uint", 0
        , "Uint", 0
        , "Uint", &sString
        , "int",  -1
        , "Uint", 0
        , "int",  0)
    }
    VarSetCapacity(wString, nLen * 2)
    DllCall("MultiByteToWideChar"
    , "Uint", 0
    , "Uint", 0
    , "Uint", &sString
    , "int",  -1
    , "Uint", &wString
    , "int",  nLen)
    return wString
}
__unicodeToAnsi(wString, nLen = 0) {
    pString := wString + 1 > 65536 ? wString : &wString
    If !nLen
    {
        nLen := DllCall("WideCharToMultiByte"
        , "Uint", 0
        , "Uint", 0
        , "Uint", pString
        , "int",  -1
        , "Uint", 0
        , "int",  0
        , "Uint", 0
        , "Uint", 0)
    }
    VarSetCapacity(sString, nLen)
    DllCall("WideCharToMultiByte"
    , "Uint", 0
    , "Uint", 0
    , "Uint", pString
    , "int",  -1
    , "str",  sString
    , "int",  nLen
    , "Uint", 0
    , "Uint", 0)
    return sString
}
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
    BOM = 3
    Else
    BOM = 0
    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "UInt", &UniBuf, "Int", UniSize)
    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Int", 0, "Int", 0
    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Str", AnsiString, "Int", AnsiSize
    , "Int", 0, "Int", 0)
    Return AnsiString
}
getAttacker(bReset := false)
{
    if (!checkHandles())
    return 0
    dwLocalPED := readDWORD(hGTA, ADDR_CPED_PTR)
    dwAttacker := readDWORD(hGTA, dwLocalPED + 0x764)
    if (!dwAttacker)
    return -1
    for i, o in oScoreboardData
    {
        if (!o.PED || o.ISNPC || dwAttacker != o.PED)
        continue
        if (bReset)
        writeMemory(hGTA, dwLocalPED + 0x764, 0, 4, "UInt")
        return o.ID
    }
    return -1
}
RusToTextDraw(str)
{
array := {"а": "a", "А": "A", "б": "—", "Б": "Ђ", "в": "ў", "В": "‹", "г": "™", "Г": "‚", "д": "љ", "Д": "ѓ", "е": "e", "Е": "E", "ё": "e", "Ё": "E", "ж": "›", "Ж": "„", "з": "џ", "З": "€", "и": "њ", "И": "…", "й": "ќ", "Й": "…", "к": "k", "К": "K", "л": "ћ", "Л": "‡", "м": "Ї", "М": "M", "н": "®", "Н": "H", "о": "o", "О": "O", "п": "Ј", "П": "Њ", "р": "p", "Р": "P", "с": "c", "С": "C", "т": "¦", "Т": "Џ", "у": "y", "У": "Y", "ф": "?", "Ф": "Ѓ", "х": "x", "Х": "X", "ц": "$", "Ц": "‰", "ч": "¤", "Ч": "Ќ", "ш": "Ґ", "Ш": "Ћ", "щ": "Ў", "Щ": "Љ", "ь": "©", "Ь": "’", "ъ": "ђ", "Ъ": "§", "ы": "Ё", "Ы": "‘", "э": "Є", "Э": "“", "ю": "«", "Ю": "”", "я": "¬", "Я": "•"}
    newStr := ""
    for k, v in strSplit(str)
    {
        newStr .= (array[v] ? array[v] : v)
    }
    return newStr
}
getClosestPlayerId1() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
        {
            t:=getDist(lpos,o.POS)
            if(t<dist)
            {
                dist := t
                id := i
            }
        }
    }
    return id
}
getClosestPlayerId2() {
    dist := 0x7fffffff
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer" and getTargetVehicleModelNameById(i)!="PoliceRanger" and getTargetVehicleModelNameById(i)!="FBIRancher" and getTargetVehicleModelNameById(i)!="FBITruck" and getTargetVehicleModelNameById(i)!="SWAT")
        {
            t:=getDist(lpos,o.POS)
            if(t<dist and t<100)
            {
                dist := t
                id := i
            }
        }
    }
    return id
}
in_car_not_cop(id)
{
    if(getTargetVehicleModelNameById(id)!="PoliceCar" and getTargetVehicleModelNameById(id)!="HPV1000" and getTargetVehicleModelNameById(id)!="Enforcer" and getTargetVehicleModelNameById(id)!="PoliceRanger" and getTargetVehicleModelNameById(id)!="FBIRancher" and getTargetVehicleModelNameById(id)!="FBITruck" and getTargetVehicleModelNameById(id)!="SWAT")
    return 1
    else
    return 0
}
person_passenger(id,id2)
{
    t:=getDist(getPedCoordinates(getPedById(id)),getPedCoordinates(getPedById(id2)))
    if(1.2>t)
    return 1
    else
    return -1
}
getTargetVehicleColor2NameById(dwId) {
    id := getTargetVehicleColor2ById(dwId)
    if (id > -1 && id < 127)
    {
        return color21namecars[id+1]
    }
    if (id > 127 && id < 256)
    {
        return color22namecars[id-127]
    }
    return ""
}
getTargetVehicleColor1NameById(dwId) {
    id := getTargetVehicleColor1ById(dwId)
    if (id > -1 && id < 127)
    {
        return color11namecars[id+1]
    }
    if (id > 127 && id < 256)
    {
        return color12namecars[id-127]
    }
    return ""
}
GetUTC1() {
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("GET", "http://www.unn.ru/time/")
    WebRequest.Send()
    return RegExReplace(WebRequest.ResponseText, ".*.*<div.*servertime. >\n(.*).......<d.*", "$1")
}
limits:=0
zavers:=0
pou:=1
sbros=1
k:=0
su:=-1
start_time:=0
start_time1:=0
start_time2:=0
start_time3:=0
restarting:=0
Gosub, ReadSettingsInfo
{
    if (Name == "ERROR") or (Name == "")
    {
        Name := "Ваше Имя."
    }
    if (Surname == "ERROR") or (Surname == "")
    {
        Surname := "Ваша Фамилия."
    }
    if (Ida == "ERROR") or (Ida == "")
    {
        Ida := "Ид."
    }
    if (Marking == "ERROR") or (Marking == "")
    {
        Marking := "Маркировка."
    }
    if (Rank == "ERROR") or (Rank == "")
    {
        Rank := "Сокращенное звание."
    }
    if (Sex == "ERROR") or (Sex == "")
    {
        Sex := "Мужчина"
    }
    if (Organ == "ERROR") or (Organ == "")
    {
        Organ := "SAPD"
    }
    if (Tag == "ERROR") or (Tag == "")
    {
        Tag := "[Ваш тэг]:"
    }
    if (Sleepingtime == "ERROR") or (Sleepingtime == "")
    {
        Sleepingtime := "2000"
    }
    if (Timeweap == "ERROR") or (Timeweap == "")
    {
        Timeweap := "2500"
    }
    if (RadioGroup1 == "ERROR") or (RadioGroup1 == "")
    {
        RadioGroup1 := "1"
    }
    if (RadioGroup2 == "ERROR") or (RdioGroup2 == "")
    {
        RadioGroup2 := "0"
    }
    if (Ch1 == "ERROR") or (Ch1 == "")
    {
        Ch1 := "Checked"
    }
    if (Ch3 == "ERROR") or (Ch3 == "")
    {
        Ch3 := "Checked"
    }
    if (EngVer == "ERROR") or (EngVer == "")
    {
        EngVer := "1"
    }
    if (PartnerSurname == "ERROR") or (PartnerSurname == "")
    {
        PartnerSurname := "0"
    }
    if (PartnerId == "ERROR") or (PartnerId == "")
    {
        PartnerId := "0"
    }
    if (PartnerPost == "ERROR") or (PartnerPost == "")
    {
        PartnerPost := "0"
    }
    if (Partner == "ERROR") or (Partner == "")
    {
        Partner := "0"
    }
    if (HotKey1 == "ERROR") or (HotKey1 == "")
    {
        HotKey1 := "!1"
    }
    if (Hotkey2 == "ERROR") or (HotKey2 == "")
    {
        Hotkey2 := "!2"
    }
    if (Hotkey3 == "ERROR") or (HotKey3 == "")
    {
        Hotkey3 := "!3"
    }
    if (Hotkey4 == "ERROR") or (HotKey4 == "")
    {
        Hotkey4 := "!4"
    }
    if (Hotkey5 == "ERROR") or (HotKey5 == "")
    {
        Hotkey5 := "NumpadSub"
    }
    if (Hotkey6 == "ERROR") or (HotKey6 == "")
    {
        Hotkey6 := "NumpadMult"
    }
    else
    if (Hotkey7 = "ERROR") or (HotKey7 = "") or (HotKey7 = "!я")
    {
        Hotkey7 := "!z"
    }
    if (Hotkey8 = "ERROR") or (HotKey8 = "") or (HotKey8 = "!ч")
    {
        Hotkey8 := "!x"
    }
    if (Hotkey9 == "ERROR") or (HotKey9 == "")
    {
        Hotkey9 := "f1"
    }
    if (Hotkey10 == "ERROR") or (HotKey10 == "")
    {
        Hotkey10 := "!5"
    }
    if (Hotkey11 == "ERROR") or (HotKey11 == "")
    {
        Hotkey11 := "!6"
    }
    if (limit == "ERROR") or (limit == "")
    {
        limit := "60"
    }
    if (Page == "ERROR") or (Page == "")
    {
        Page := "12"
    }
    if (Page <= "11")
    {
        Page := "12"
    }
    if (Guion == "ERROR") or (Guion == "")
    {
        Guion := "без интерфейса на котором вы сейчас"
    }
    if (Autorun == "ERROR") or (Autorun == "")
    {
        Autorun := "0"
    }
    if (guiyep == "ERROR") or (Guiyep == "")
    {
        guiyep := "0"
    }
    if (weapon == "ERROR") or (weapon == "")
    {
        weapon := "1"
    }
    IniWrite, %Name%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Name
    IniWrite, %Surname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Surname
    IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
    IniWrite, %Rank%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Rank
    IniWrite, %Sex%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sex
    sleep, 100
    IniWrite, %Organ%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Organ
    IniWrite, %Tag%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Tag
    IniWrite, %Sleepingtime%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sleepingtime
    IniWrite, %Timeweap%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Timeweap
    IniWrite, %partnerSurname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
    IniWrite, %partnerId%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
    IniWrite, %partnerPost%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
    sleep, 100
    IniWrite, %RadioGroup1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, One
    IniWrite, %RadioGroup2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Two
    IniWrite, %EngVer%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Eng
    IniWrite, %HotKey1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey1
    IniWrite, %HotKey2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey2
    IniWrite, %HotKey3%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey3
    IniWrite, %HotKey4%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey4
    IniWrite, %HotKey5%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey5
    IniWrite, %HotKey6%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey6
    IniWrite, %HotKey7%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey7
    sleep, 100
    IniWrite, %HotKey8%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey8
    IniWrite, %HotKey9%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey9
    IniWrite, %HotKey10%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey10
    IniWrite, %HotKey11%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey11
    IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
    IniWrite, %Page%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Chat, Page
    IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
    IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
    IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
    IniWrite, %weapon%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Weapon
    if guiyep = 1
    {
        gosub, open
    }
    if (RadioGroup1 == 1){
        Ch1 = Checked
    }
    if (RadioGroup2 == 1){
        Ch2 = Checked
    }
    if (EngVer == 1){
        Ch3 = Checked
    }
    if (Autorun == 1){
        Ch4 = Checked
    }
    if (Weapon == 1){
        Ch5 = Checked
    }
    if (sex = Мужщина){
        IniWrite, Мужчина, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sex
    }
}
if (guiyep != "1")
{
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    Gui, +hwndhGui1
    IniRead nextbackground, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Background, Number
    nextbackground++
    IniWrite, %nextbackground%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Background, Number
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
        IniWrite, %nextbackground%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Background, Number
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
    Gui, Add, GroupBox, x222 y109 w110 h50 , Интервал между строк(в м\с).
    Gui, Add, Edit, x232 y129 w90 h20 vSleepingtime, %sleepingtime%
    Gui, Add, DropDownList, x362 y29 w100 h370 vOrgan, SAPD|SWAT|LSPD|SFPD|LVPD|FBI|CIA
    GuiControl, ChooseString, Organ, %Organ%
    Gui, Add, GroupBox, x12 y109 w203 h50 , Тэговый вариант рации
    Gui, Add, Button, x12 y219 w20 h80 gAnimation, <
    Gui, Add, GroupBox, x5 y339 w270 h70 , Автостарт
    Gui, Add, GroupBox, x12 y159 w203 h50 , Авто-ган
    Gui, Add, Edit, x102 y179 w40 h20 vTimeweap, %Timeweap%
    Gui, Add, CheckBox, x22 y179 w80 h20 vWeapon %Ch5%, ВКЛ\ВЫКЛ
    Gui, Add, Edit, x232 y179 w90 h20 vPage, %page%
    Gui, Add, GroupBox, x222 y159 w110 h50 , Кол-во строк в чате. Не меньше 12.
    Gui, Add, CheckBox, x12 y349 w20 h40 vAutorun %Ch4%,
    Gui, Add, GroupBox, x5 y339 w270 h74 , Автостарт
    Gui, Add, Text, x32 y362 w240 h20 , Запускать биндер вместе с запуском windows
    Gui, Add, DropDownList, x32 y379 w230 h80 vGuion, без интерфейса на котором вы сейчас|с интерфейсом на котором вы сейчас
    GuiControl, ChooseString, Guion, %Guion%
    Gui, 2:Add, Hotkey, x12 y19 w50 h20 vHotKey9, %HotKey9%
    Gui, 2:Add, Text, x72 y19 w140 h30 , - Игровое меню биндера.
    Gui, 2:Add, Hotkey, x12 y59 w50 h20 vHotKey1, %HotKey1%
    Gui, 2:Add, Text, x72 y59 w180 h50 , - Ситуация
    Gui, 2:Add, Text, x128 y59 w180 h50 cFF0000 , "Трафик-Стоп".
    Gui, 2:Add, Hotkey, x12 y99 w50 h20 vHotKey2, %HotKey2%
    Gui, 2:Add, Text, x72 y99 w180 h50, - Ситуация
    Gui, 2:Add, Text, x128 y99 w180 h50 cFF0000, "Арест (57v, 66)"
    .
    Gui, 2:Add, Hotkey, x12 y139 w50 h20 vHotKey3, %HotKey3%
    Gui, 2:Add, Text, x72 y139 w130 h20 , - Ситуация
    Gui, 2:Add, Text, x128 y139 w180 h50 cFF0000 , "Теракт".
    Gui, 2:Add, Hotkey, x12 y179 w50 h20 vHotKey4, %HotKey4%
    Gui, 2:Add, Text, x72 y179 w140 h20 , - Меню
    Gui, 2:Add, Text, x110 y179 w180 h50 cFF0000 , "Рация".
    Gui, 2:Add, Hotkey, x12 y219 w50 h20 vHotKey10, %HotKey10%
    Gui, 2:Add, Text, x72 y219 w140 h35 , - Меню
    Gui, 2:Add, Text, x110 y219 w180 h50 cFF0000 , "Собеседование".
    Gui, 2:Add, Hotkey, x12 y259 w50 h20 vHotKey11, %HotKey11%
    Gui, 2:Add, Text, x72 y259 w180 h45 , - Меню
    Gui, 2:Add, Text, x110 y259 w180 h50 cFF0000 , "Гос. Волна (/GOV)".
    Gui, 2:Add, Hotkey, x12 y299 w50 h20 vHotKey7, %HotKey7%
    Gui, 2:Add, Text, x72 y299 w140 h20 , - Лимит
    Gui, 2:Add, Edit, x122 y299 w30 h20 vlimit, %limit%
    Gui, 2:Add, Text, x162 y299 w40 h20 , км\час
    Gui, 2:Add, Hotkey, x12 y339 w50 h20 vHotKey8, %HotKey8%
    Gui, 2:Add, Text, x72 y339 w140 h20 , - Отыгровка часов + F8
    Gui, 2:Add, Hotkey, x12 y379 w50 h20 vHotKey6, %HotKey6%
    Gui, 2:Add, Text, x72 y379 w140 h20 , - Фиксация на машине.
    Gui, 2:Add, Hotkey, x12 y419 w50 h20 vHotKey5, %HotKey5%
    Gui, 2:Add, Text, x72 y419 w140 h30 , - Сброс данных о машине.
    Gui, Font, S9 Default,
    Gui, Add, Text, x146 y181 w70 h25 +BackgroundTrans , м\с реакция
    Gui, Font, S8 Default,
    Gui, Font,, Comic Sans MS
    Gui, 2:Font,, Comic Sans MS
    Gui, 2:Add, Button, x80 y449 w160 h30 gSaveButton, СОХРАНИТЬ КЛАВИШИ
    Gui, Add, Button, x12 y519 w100 h30  gButtonSave, СОХРАНИТЬ!
    Gui, Add, Button, x12 y479 w100 h30 gDownloadSamp, СКАЧАТЬ SAMP
    Gui, Add, Button, x122 y519 w100 h30 gOpen, ЗАПУСК!!!
    Gui, Font, CBlack, Counter new
    Gui, Add, Text, x42 y249 w75 h30 +Center, НАСТРОЙКА КЛАВИШ
    Gui, Font, CRed Italic, Verdana
    Gui, Add, Text, x115 y489 w210 h40 +BackgroundTrans, - Игровое меню - %HotKey9%
    Gui, Font, CBlack Italic, Verdana
    Gui, Add, Text, x12 y429 w210 h40 , - Не работает %HotKey9% или весь биндер ? - Скачай нашу версию SAMP'a нажав на кнопку...
    Gui, Show, w788 h565, Adjutant by Cooper << %vupd% >>
    return
    animation:
    Gui, Submit, NoHide
    WinGetPos, X, Y, W,, ahk_id %hGui1%
    Gui, +AlwaysOnTop
    Loop
    {
        Sleep, 10
        Gui, 2:Show, % "x" (x2 := X - A_Index*4) " y" Y+35 " w" 250 " h" 490 " NA", Настройки
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
}
ReadSettingsInfo:
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСканирую данные
sleep, 1000
SplashTextoff
IniRead, Name, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Name
IniRead, Surname, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Surname
IniRead, Marking, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
IniRead, Rank, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Rank
IniRead, Sex, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sex
IniRead, Organ, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Organ
IniRead, Tag, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Tag
IniRead, Sleepingtime, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sleepingtime
IniRead, Timeweap, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Timeweap
IniRead, RadioGroup1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, One
IniRead, RadioGroup2, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Two
IniRead, EngVer, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Eng
IniRead, PartnerSurname, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
IniRead, PartnerId, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
IniRead, PartnerPost, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
IniRead, HotKey1, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey1
IniRead, HotKey2, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey2
IniRead, HotKey3, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey3
IniRead, HotKey4, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey4
IniRead, HotKey5, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey5
IniRead, HotKey6, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey6
IniRead, HotKey7, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey7
IniRead, HotKey8, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey8
IniRead, HotKey9, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey9
IniRead, HotKey10, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey10
IniRead, HotKey11, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey11
IniRead, limit, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, Limit
IniRead, Page, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Chat, Page
IniRead, guiyep, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, guiyep
IniRead, Autorun, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
IniRead, Guion, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
IniRead, Weapon, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Weapon
return
ButtonSave:
Gui, Submit, NoHide
IniWrite, %Name%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Name
IniWrite, %Surname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Surname
IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
IniWrite, %Rank%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Rank
IniWrite, %Sex%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sex
IniWrite, %Organ%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Organ
IniWrite, %Tag%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Tag
IniWrite, %Sleepingtime%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sleepingtime
IniWrite, %Timeweap%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Timeweap
IniWrite, %Weapon%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Weapon
sleep, 200
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСканирую данные
sleep, 1000
IniWrite, %partnerSurname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
IniWrite, %partnerId%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
IniWrite, %partnerPost%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
sleep, 200
IniWrite, %RadioGroup1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, One
IniWrite, %RadioGroup2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Two
IniWrite, %EngVer%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Radio, Eng
IniWrite, %Page%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Chat, Page
sleep, 200
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСохранил всю информацию
sleep, 1000
SplashTextoff
Return
SaveButton:
Gui, Submit, NoHide
IniWrite, %HotKey1%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey1
IniWrite, %HotKey2%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey2
IniWrite, %HotKey3%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey3
IniWrite, %HotKey4%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey4
IniWrite, %HotKey5%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey5
IniWrite, %HotKey6%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey6
IniWrite, %HotKey7%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey7
IniWrite, %HotKey8%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey8
IniWrite, %HotKey9%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey9
IniWrite, %HotKey10%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey10
IniWrite, %HotKey11%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Keys, HotKey11
IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
SplashTextOn, , 60, Менеджер сохранений,  Ожидайте`n------------------------`nСохранил всю информацию
sleep, 1000
SplashTextoff
return
Open:
if (guiyep != "1")
{
    GuiControlGet, Page,, Page
    if Page <= 11
    {
        MsgBox, 16, Запустить биндер не возможно!., Значение /pagesize меньше 12-и. `nТекущее значение - %Page%. `nИзмените значение и повторите попытку!
        return
    }
}
TrayTip, Officer Adjutant by Cooper, Вы запустили биндер!                                               Нажмите в игре %HotKey9% для того что-бы попасть в меню.,4,1
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
HotKey, %Hotkey9%, Off, UseErrorLevel
HotKey, %Hotkey9%, Active9, On, UseErrorLevel
HotKey, %Hotkey10%, Off, UseErrorLevel
HotKey, %Hotkey10%, Active10, On, UseErrorLevel
HotKey, %Hotkey11%, Off, UseErrorLevel
HotKey, %Hotkey11%, Active11, On, UseErrorLevel
loop, 11
if Hotkey%A_Index% not contains "!", "+", "^", "#"
{
    NameKey%A_Index% := Hotkey%A_Index%
}
loop, 11
if Hotkey%A_Index% contains !
{
    NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "!(.*)", "alt + $1")
}
loop, 11
if Hotkey%A_Index% contains +
{
    NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "+(.*)", "shift + $1")
}
loop, 11
if Hotkey%A_Index% contains ^
{
    NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "^(.*)", "ctrl + $1")
}
loop, 11
if Hotkey%A_Index% contains #
{
    NameKey%A_Index% := RegExReplace("" Hotkey%A_Index% "", "#(.*)", "win + $1")
}
if Hotkey9 == "F1"
{
    HotKey, %HotKey9%, Off, UseErrorLevel
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
    Female12 = 'a
    Female13 = ен
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
    Female12 =
    Female13 = на
}
if Organ = SAPD
{
    if (organis == "ERROR") or (organis == "")
    {
        organis := "PD"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Департамента Полиции Сан-Андреас"
    }
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
    if (organis == "ERROR") or (organis == "")
    {
        organis := "FBI"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Федерального Бюро Расследований"
    }
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
    if (organis == "ERROR") or (organis == "")
    {
        organis := "PD"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Департамента Спец. Подразделения SWAT"
    }
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
if Organ = LSPD
{
    if (organis == "ERROR") or (organis == "")
    {
        organis := "PD"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Департамента Полиции Лос-Сантос"
    }
    Org = полиции
    Org1 = LSPD
    Org2 = Управления Полиции SA
    Org3 = Офицер Полиции Los Santos
    Org4 = Управление полиции Los-Santos
    Org5 = сотрудник Управления Полиции LS
    Org7 = ПОЛИЦИЯ
    if (engver = 1)
    {
        Org6 := "PDHQ"
    }
    else
    Org6 = гаража ЛСПД
}
if Organ = SFPD
{
    if (organis == "ERROR") or (organis == "")
    {
        organis := "PD"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Департамента Полиции Сан-Фиерро"
    }
    Org = полиции
    Org1 = SFPD
    Org2 = Управления Полиции SF
    Org3 = Офицер Полиции San Fierro
    Org4 = Управление полиции San-Fierro
    Org5 = сотрудник Управления Полиции SF
    Org7 = ПОЛИЦИЯ
    if (engver = 1)
    {
        Org6 := "PDHQ"
    }
    else
    Org6 = гаража СФПД
}
if Organ = LVPD
{
    if (organis == "ERROR") or (organis == "")
    {
        organis := "PD"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Департамента Полиции Лас-Вентурас"
    }
    Org = полиции
    Org1 = LVPD
    Org2 = Управления Полиции LV
    Org3 = Офицер Полиции Las Venturas
    Org4 = Управление полиции Las-Venturas
    Org5 = сотрудник Управления Полиции LV
    Org7 = ПОЛИЦИЯ
    if (engver = 1)
    {
        Org6 := "PDHQ"
    }
    else
    Org6 = гаража ЛВПД
}
if Organ = CIA
{
    if (organis == "ERROR") or (organis == "")
    {
        organis := "CIA"
    }
    if (press == "ERROR") or (press == "")
    {
        press := "Пресс-Центр Центрального Разведовательного Агенства"
    }
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
if (PartnerSurname == 0) or (PartnerSurname == "None")
{
    PartnerSurname := "None"
    Partner := 0
}
if (PartnerId == 0) or (PartnerId == "None")
{
    PartnerId := "None"
    Partner := 0
}
if (PartnerPost == 0) or (PartnerPost == "None")
{
    PartnerPost := "None"
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
if (weapon == "0")
{
    pou:=0
    statusd:=false
statusautog := "{00FF00}отключён{FFFFFF}"
}
else if (weapon == "1")
{
    pou:=1
    statusd:=true
statusautog := "{00FF00}включён{FFFFFF}"
}
if (autorun == "1") and (guion == "без интерфейса на котором вы сейчас")
{
    FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
    guiyep := "1"
autozag := "{00FF00}включёна{FFFFFF}"
    IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
    IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
    IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
}
if (autorun == "1") and (guion == "с интерфейсом на котором вы сейчас")
{
    FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
    Guiyep := "0"
autozag := "{00FF00}включёна{FFFFFF}"
    IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
    IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
    IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
}
if (autorun == "0")
{
    FileDelete, %A_Startup%\Officer Adjutant.lnk
    Guiyep := "0"
autozag := "{00FF00}отключёна{FFFFFF}"
    IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
    IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
    IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
}
gosub, autoweapons
#If WinActive("GTA:SA:MP")
Active5:
o1:=Object()
o1:=GetCoordinates()
k:=-1
kid := Object("0", "1", "2", "3")
kid[0]:=-1
kid[1]:=-1
kid[2]:=-1
kid[3]:=-1
kid[0]:=getClosestPlayerId1()
if(kid[0]!=-1)
{
    k:=0
    p := getStreamedInPlayersInfo()
    M:=getTargetVehicleModelNameById(kid[k])
    N:=getPlayerNameById(kid[k])
    For i, o in p
    {
        if(getTargetVehicleModelNameById(i)==M and (kid[0]!=i) and in_car_not_cop(i)==1 and person_passenger(i,kid[0])==1)
        {
            k:=k+1
            kid[k]:=i
        }
    }
    if(getDist(o1,getPedCoordinates(getPedById(kid[0])))<61 and kid[0]!=-1)
    {
        Speed:=getTargetVehicleSpeedById(kid[0])-60
        Speed:=Ceil(Speed)
        if(Speed<0)
        Speed:=0
        if(k==0)
        {
            Ids := NearPlayerInCar(90)
            CarCol := getTargetVehicleColor2NameById(ids)
            CarNameN := getTargetVehicleModelNameById(ids)
            IdschelN := getPedById (ids)
            City := getPlayerCity()
            sleep, 50
        addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
        addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
        addChatMessage("{FFFFFF}           - Имя фамилия водителя: {F63939}" N " [" kid[0]"]" )
            sleep, 50
        addChatMessage("{FFFFFF}                 - Скорость автомобиля: {F63939}" Speed " Км/ч"  )
        addChatMessage("{FFFFFF}                - Транспортное средство: {F63939}" M )
        addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
            su:=kid[0]
            sbros:=0
        }
        else
        {
            k:=0
            sleep, 50
        addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
        addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
        addChatMessage("{FFFFFF}Мы установили информацию о машине. {F63939}Выберите водителя машины:" )
            sleep, 50
            While(k<4)
            {
            addChatMessage("{FFFFFF}{F63939}Нажмите{FFFFFF} '{00BFFF}Numpad " k+1 "{FFFFFF}' для выбора - {F63939}" getPlayerNameById(kid[k])" ["kid[k]"]" )
                k++
            }
        addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
            sbros:=1
            obratka1:
            loop
            {
                If (!isInChat())
                {
                Input , OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}
                }
                if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4")
                break
            }
            if ErrorLevel = EndKey:Numpad1
            {
                if(k>0)
                Ids := NearPlayerInCar(90)
                CarCol := getTargetVehicleColor2NameById(ids)
                CarName := getTargetVehicleModelNameById(ids)
                Idschel := getPedById (ids)
                G := getPlayerCity()
                sleep, 50
            addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
            addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
            addChatMessage("{FFFFFF}           - Имя фамилия водителя: {F63939}" getPlayerNameById(kid[0]) " [" kid[0]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - Скорость автомобиля: {F63939}" Speed " Км/ч"  )
            addChatMessage("{FFFFFF}                - Транспортное средство: {F63939}" M )
            addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
                su:=kid[0]
                sbros:=0
            }
            else
            if ErrorLevel = EndKey:Numpad2
            {
                if(k>0)
                Ids := NearPlayerInCar(90)
                CarCol := getTargetVehicleColor2NameById(ids)
                CarName := getTargetVehicleModelNameById(ids)
                Idschel := getPedById (ids)
                G := getPlayerCity()
                sleep, 50
            addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
            addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
            addChatMessage("{FFFFFF}           - Имя фамилия водителя: {F63939}" getPlayerNameById(kid[1]) " [" kid[1]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - Скорость автомобиля: {F63939}" Speed " Км/ч"  )
            addChatMessage("{FFFFFF}                - Транспортное средство: {F63939}" M )
            addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
                su:=kid[1]
                sbros:=0
            }
            else
            if ErrorLevel = EndKey:Numpad3
            {
                if(k>0)
                Ids := NearPlayerInCar(90)
                CarCol := getTargetVehicleColor2NameById(ids)
                CarName := getTargetVehicleModelNameById(ids)
                Idschel := getPedById (ids)
                G := getPlayerCity()
                sleep, 50
            addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
            addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
            addChatMessage("{FFFFFF}           - Имя фамилия водителя: {F63939}" getPlayerNameById(kid[2]) " [" kid[2]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - Скорость автомобиля: {F63939}" Speed " Км/ч"  )
            addChatMessage("{FFFFFF}                - Транспортное средство: {F63939}" M )
            addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
                su:=kid[2]
                sbros:=0
            }
            else
            if ErrorLevel = EndKey:Numpad4
            {
                if(k>0)
                Ids := NearPlayerInCar(90)
                CarCol := getTargetVehicleColor2NameById(ids)
                CarName := getTargetVehicleModelNameById(ids)
                Idschel := getPedById (ids)
                G := getPlayerCity()
                sleep, 50
            addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
            addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
            addChatMessage("{FFFFFF}           - Имя фамилия водителя: {F63939}" getPlayerNameById(kid[3]) " [" kid[3]"]" )
            addChatMessage("{FFFFFF}                 - Скорость автомобиля: {F63939}" Speed " Км/ч"  )
                sleep, 50
            addChatMessage("{FFFFFF}                - Транспортное средство: {F63939}" M )
            addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
                su:=kid[3]
                sbros:=0
            }
        }
    }
    else
    {
    addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
    addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
    addChatMessage("{FFFFFF} В радиусе есть люди, но они не определяються / {F63939}Подъедьте ближе. " )
        sleep, 50
    addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
        sbros:=1
    }
}
else
{
addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
addChatMessage("{FFFFFF} Транспортное средство не обнаружено / {F63939}Подъедьте ближе. " )
    sleep, 50
addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
    sbros:=1
}
Return
Active6:
if (sbros==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы не имели никакой информации о водителе и транспорте. {F63939}Don't fuck the system.")
}
else
{
    sbros:=1
    su:=-1
    k:=0
    start_time:=0
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Информация об водителе и транспорте была {00FF00}сброшена.")
}
Return
autoweapons:
ListLines Off
SetBatchLines -1
SetKeyDelay 0
checkfile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
global TazerTo  := -1
global TazerIn  := 0
global TazerOut := 0
Loop
{
    autoweaponsloop:
    if (statusd == false)
    {
        sleep, 2500
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
            SetTimer TakeGun, % timeweap / 2
        }
        if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
            if not TazerIn
            {
                TazerIn := 1
                SetTimer TakeGun, % timeweap / 2
            }
        }
        if (TempWeapon = 0)
        {
            if (TazerOut > 1) and (TazerTo)
            {
                TazerTo := 0
                SetTimer UnloadGun, % timeweap / 2
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
    Sleep, % timeweap / 2
}
return
TakeGun:
TempWeapon := getPlayerWeaponId()
if (TempWeapon = 24) and (TazerOut != 2) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do Пистолет *Baretta 92* находится в кобуре у сотрудни" Female1 " " Org ".")
        Sleep, %sleepingtime%
        SendChat("/me обхватив рукоятку пистолета марки *Baretta 92* вытащил его из кобуры.")
        TazerOut:=2
    }
    if (randt = 2) {
        SendChat("/do В кобуре сотрудни" Female1 " " Org ", находится пистолет *Beretta 92*.")
        Sleep, %sleepingtime%
        SendChat("/me резко правой рукой отстегнул" Female " кобуру, после чего вынул" Female " пистолет.")
        TazerOut:=2
    }
}
if (TempWeapon = 3) and (TazerOut != 3) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me быстрым движением руки обхватил" Female " рукоятку дубинки и сорвал" Female " её с пояса.")
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
        SendChat("/me достал" Female " дробовик из-за спины и крепко сжал" Female ".")
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
        SendChat("/me достал" Female " карабин M16A4, положил" Female " палец на курок сняв предохранитель.")
        Sleep, %sleepingtime%
        SendChat("/do Автомат лежал в руках сотрудни" Female1 " " Org ", в полной готовности.")
        TazerOut:=7
    }
    if (randt = 2) {
        SendChat("/do На правом плече висит штурмовая винтовка *M16A4*.")
        Sleep, %sleepingtime%
        SendChat("/me движением правой руки снял" Female " винтовку с плеча передёрнув затвор.")
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
        SendChat("/do На поясе сотрудни" Female1 " " Org ", закреплена кобура с логотипом *" Org1 "*.")
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
        SendChat("/me отключил" Female " электрошокер *Tazer* и закрепил" Female " его в чехол, на пояс.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 5)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do В обеих руках сотрудни" Female1 " " Org2 ", находится дробовик.")
        Sleep, %sleepingtime%
        SendChat("/me приподняв нос дробовика перевернул" Female " его и вернул" Female " его на спину.")
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
        SendChat("/me открыл" Female " кобуру одной рукой и положил" Female " автомат обратно.")
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
Active7:
active := !active
SendChat((active ? "/limit " limit "":"/limit"))
Return
Active8:
random, randt, 1, 2
if (randt == 1)
{
    SendChat("/me закатал" Female " рукав, взглянул" Female " на часы марки *G-Shock* с гравировкой *FRAPS*.")
    Sleep, %sleepingtime%
    SendChat("/time")
    sleep, 200
Sendinput, {f8}{Enter}
}
if (randt == 2)
{
    SendChat("/me пафосным видом согнул" Female " правую руку к лицу, после чего посмотрел" Female " на свои *iTimes*")
    Sleep, %sleepingtime%
    SendChat("/time")
    sleep, 200
Sendinput, {f8}{Enter}
}
return
:?:/mask::
FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
Sleep, 100
SendChat("/mask")
checkfile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
FileRead, info, %checkfile%
text = %info%
if text contains Ваше местоположение на карте
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
    FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
}
else if text contains Вы сняли маску
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
    FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
}
return
:?:/offmask::
FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
Sleep, 100
SendChat("/offmask")
checkfile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
FileRead, info, %checkfile%
text = %info%
if text contains Вы {B00000}потеряли{FF9900} маску
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
    else
    {
        SendChat("/do У " surname "'а лежала маска на лице которая напоминала балаклаву.")
        Sleep, %sleepingtime%
        SendChat("/me растегнул" Female " пиджак после снял" Female " маску с лица и положил" Female " её в пиджак.")
        Sleep, %sleepingtime%
    }
    FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
}
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        if isInChat() = 0
        {
            55с := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
                SendChat("/r " Marking " to DISP: *55, Code *four*, *20 " getPlayerZone() ", " M ", nRFR, OVER SAY **")
            }
            else if (Radio1 = 1 and EngVer = 0)
            {
                SendChat("/r " Marking " to DISP: *55, Код *четыре*, *20 " getPlayerZone() ", " M ", недоступен, конец**")
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
        goto, obratka4
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            if (sbros == 1)
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
                    SendChat("/m - Не выходите из своего транспортного средства и приготовьте документы сидящих в машине!")
                }
                else if (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
                {
                    SendChat("/m - Водитель грузовика, немедленно прижмитесь к обочине, это " Org1 "!")
                    Sleep, %sleepingtime%
                    SendChat("/m - Положите все нужные документы на торпеду, а руки на руль. Выходить из грузовика - запрещено!")
                }
                else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer")
                {
                    SendChat("/m - Водитель мотоцикла " M ", немедленно прижмитесь к обочине, это " Org1 "!")
                    Sleep, %sleepingtime%
                    SendChat("/m - Приготовьте документы свои документы, и ожидайте меня возле мотоцикла!")
                }
                else if (M = "Quad")
                {
                    SendChat("/m - Водитель квадроцикла, немедленно прижмитесь к обочине, это " Org1 "!")
                    Sleep, %sleepingtime%
                    SendChat("/m - Приготовьте документы свои документы, и ожидайте меня возле квадроцикла!")
                }
                else
                {
                    Random, randt, 1, 3
                    if (randt = 1) {
                        SendChat("/m - Говорит сотрудник " Org2 ". Водитель автомобиля марки - *" M "*.")
                        Sleep, %sleepingtime%
                        SendChat("/m - Приготовьте документы сидящих в машине, и не выходите из своего транспортного средства.")
                    }
                    if (randt = 2) {
                        SendChat("/m - Говорит " Org1 "! Водитель *" M "*. Остановитесь у обочины и заглушите двигатель!")
                        Sleep, %sleepingtime%
                        SendChat("/m - Не выходите из своего транспортного средства и приготовьте документы сидящих в машине!")
                    }
                    if (randt = 3) {
                        SendChat("/m - Водитель автомобиля *" M "*, прижмитесь к обочине и заглушите двигательно.")
                        Sleep, %sleepingtime%
                        SendChat("/m - Положите документы на торпеду, а руки на руль. Выходить из машины - запрещено!")
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
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("/me отслонил" Female " рацию мегафона со рта, после чего закрепил" Female " её.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к кнопки ремня отстегнул" Female " ремень и открыл" Female " дверь.")
            }
            if (randt = 2) {
                SendChat("/me отстегнул" Female " ремень, потянулся к двери, потянув ручку открыл" Female " дверь.")
                Sleep, %sleepingtime%
                SendChat("/me вышел" Female " из крузера, после чего направил" Female4 " к машине рядом.")
            }
            if (randt = 3) {
                SendChat("/me сняв ремень безопасности проверил" Female " тактильным ощущением оружие в кобуре.")
                Sleep, %sleepingtime%
                SendChat("/me правой рукой открыл" Female " дверь крузера, после чего выш" Female7 " из машины.")
            }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("/me проходя, торкнул" Female4 " пальцем к багажнику, тем самим оставил" Female " отпечаток.")
            }
            if (randt = 2) {
                SendChat("/me направляясь к водителю, провел" Female " рукой по багажнику, оставил" Female " отпечаток.")
            }
            if (randt = 3) {
                SendChat("/me оставил" Female " отпечаток на багажнике, глазком посматривая на задние съедения.")
            }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            SendChat("/me согнув указательный палец, аккуратно постучал" Female " в окно двери водителя.")
            Sleep, %sleepingtime%
            SendChat("/todo Опустите окно пожалуйста. *показывая жестами человеку в машине о том что нужно открыть окно.")
            Sleep, %sleepingtime%
            SendChat("/me пытается рассмотреть лицо водителя, после салон автомобиля.")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
        {
            SendMessage, 0x50,, 0x4190419,,A
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("Здравствуйте, " Org5 ": " name " " surname " беспокоит.")
                Sleep, %sleepingtime%
                SendChat("/anim 17")
                Sleep, %sleepingtime%
                SendChat("/me достал" Female " удостоверение сотрудника " Org ".")
                Sleep, 1000
            }
            if (randt = 2) {
                SendChat("Добрый день уважаемый, ваше время заберёт сотрудник " Org ": " name " " surname ".")
                Sleep, %sleepingtime%
                SendChat("/me правой рукой открыл" Female " пафосным видом удостоверение сотрудника " Org ".")
                Sleep, %sleepingtime%
                SendChat("/anim 17")
                Sleep, 1000
            }
            if (randt = 3) {
                SendChat("Здравствуйте, Вас беспокоит сотрудник " Org2 " - " surname ".")
                Sleep, %sleepingtime%
                SendChat("/do Верхнем кармашке жилета лежит удостоверение.")
                Sleep, %sleepingtime%
                SendChat("/anim 17")
                Sleep, %sleepingtime%
                SendChat("/me движением руки вытащил" Female " удостоверение, показав его человеку напротив.")
                Sleep, 1000
            }
        SendInput {F6}/showudost{space}
            KeyWait, Enter, D
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
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
                    SendChat("/me заш" Female7 " в базу разыскиваемых, посмотрел" Female " нужную информацию.")
                    Sleep, %sleepingtime%
                    SendChat("/do Компактный Бортовой Компютер издал звук блокировки.")
                    Sleep, 500
                    SendChat("/wanted")
                }
                if (randt = 2) {
                    SendChat("/do В автомобиле установлен бортовой компьютер.")
                    Sleep, %sleepingtime%
                    SendChat("/me нажатием кнопки по экрану компьютера, зашел в базу *staff wanted criminals*.")
                    Sleep, %sleepingtime%
                    SendChat("/me тыкая по клавиатуре ввёл инфомрацию о водителе читая её с документа.")
                    Sleep, %sleepingtime%
                    SendChat("/do Информация о водителе высветилась на бортовом компютере.")
                    Sleep, 500
                    SendChat("/wanted")
                }
            }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("/do В руке у " name "а был включённый коммуникатор.")
                Sleep, %sleepingtime%
                SendChat("/me вош" Female7 " в раздел Лицензии, после чего ввёл" Female " данные о нарушителе.")
                Sleep, %sleepingtime%
                SendChat("/me заполнив данные, нажал" Female " на Enter, после чего выключил" Female " Коммуникатор.")
                Sleep, 1000
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
                Sleep, 1000
                SendChat("/take")
            }
            if (randt = 3) {
                SendChat("/me достал из внутреннего кармана пиджака пакетик для улик.")
                Sleep, %sleepingtime%
                SendChat("/me забрал у нарушителя запрещенные предметы, положив их в пакетик.")
                Sleep, 1000
                SendChat("/take")
            }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
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
            Sleep, 1000
        SendInput {F6}/ticket{space}
            KeyWait, Enter, D
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        if isInChat() = 0
        {
            SendChat("Хорошо, на этот раз я Вас отпускаю, но еще раз увижу, дам по шапке.")
            Sleep, %sleepingtime%
            SendChat("/todo Счастливой дороги. И да, я слежу за Вами. *символизировал жест двумя пальцами с глаза на глаз.")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 150
    Input , OutputVar, L1 V, {F2}{F3}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{End}
        if (ErrorLevel = "EndKey:F2") or (ErrorLevel = "EndKey:F3") or (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:F2
    {
        if isInChat() = 0
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
                    SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
                    SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M ", nRFR, OVER SAY **")
                }
                else if (Radio1 = 1 and EngVer = 0)
                {
                    SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M ", недоступен, конец**")
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
        }
        goto, obratka3
    }
    if ErrorLevel = EndKey:F3
    {
        if isInChat() = 0
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
                    SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
                    SendChat("/r " Marking " to DISP: *66, Code *one*, *20 " getPlayerZone() ", " M ", nRFR, OVER SAY**")
                }
                else if (Radio1 = 1 and EngVer = 0)
                {
                    SendChat("/r " Marking " to DISP: *66, Код*один*, *20 " getPlayerZone() ", " M ", недост., конец**")
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
        }
        goto, obratka3
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
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
                        SendChat("/m - Прижмитесь к обочине и заглушите двигатель!")
                        Sleep, %sleepingtime%
                        SendChat("/m - В противном случае мы можем открыть огонь.")
                    }
                    else if (randt == 2)
                    {
                        SendChat("/m - Говорит " Org1 "! Водитель *" M "*. Остановитесь у обочины, или мы откроем огонь!")
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
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
                SendChat("/m - Вытащите ключ из зажигания, откройте окно и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Водитель и пассажиры, если имеються, медленно выйдите на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Затем ложитесь на дорогу и никаких резких движений.")
            }
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer") or (M = "Quad")
            {
                SendChat("/m - Вытащите ключ из замка зажигания и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Поднимите руки, и слезайте с транспортного средства.")
                Sleep, %sleepingtime%
                SendChat("/m - Не оборачиваясь и ложитесь на асфальт, руки положите на голову!")
            }
            else
            {
                SendChat("/m - Вытащите ключ из зажигания, откройте окно и выкиньте ключ на дорогу.")
                Sleep, %sleepingtime%
                SendChat("/m - Водитель и пассажир, если такой имеется, вытащите руки из окна...")
                Sleep, %sleepingtime%
                SendChat("/m - ...затем откройте боковую дверь снаружи. Выйдите из автомобиля,")
                Sleep, %sleepingtime%
                SendChat("/m - и медленно пройдите спиной ко мне к центру дороги.")
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            zones:=getPlayerZone()
            Random, randt, 1, 6
            if (randt = 1) {
                SendChat("/me навали" Female2 " на человека, достает наручники с ручного держателя.")
                Sleep, %sleepingtime%
                SendChat("/me заводит" Female3 " обе его руки за спину, надевает наручники.")
            }
            if (randt = 2) {
                SendChat("/me накинул" Female4 " на человека, складывая обе руки приступника за спину.")
                Sleep, %sleepingtime%
                SendChat("/me достал" Female " наручникии с поясного держателя, после чего одел" Female " их на него.")
            }
            if (randt = 3) {
                SendChat("/do На поясе у " surname "а висят наручники.")
                Sleep, %sleepingtime%
                SendChat("/me навали" Female2 " на человека, правой рукой снял" Female " наручники с держателя.")
            }
            if (randt = 4) {
                SendChat("/do Наручники на поясе у " surname "а.")
                Sleep, %sleepingtime%
                SendChat("/me лёгким движением руки снял" Female " наручники с пояса и надел" Female " на задержанного.")
            }
            if (randt = 5) {
                SendChat("/do Наручники в кармане бронежилета у " surname "а.")
                Sleep, %sleepingtime%
                SendChat("/me отстигнул" Female " застешку от кармана бронижелета, затем достал" Female " наручники.")
                Sleep, %sleepingtime%
                SendChat("/me навали" Female2 " на человека, заводит" Female3 " обе его руки за спину надевая наручники.")
            }
            if (randt = 6) {
                SendChat("/me заломал" Female " руки преступнику, после надел" Female " на него наручники.")
                Sleep, %sleepingtime%
                SendChat("/todo Не дергайся!*ударив дубинкой по колену.")
            }
            id := getClosestPlayerId()
            ped := getTargetPed()
            Sleep, 1000
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 4
            if (randt = 1) {
                SendChat("/me вцепившись за туловише человека, потащил" Female " его за собой.")
            }
            if (randt = 2) {
                SendChat("/me взял" Female " за затылок человека, держа в левой оружие, после повел" Female " человека.")
            }
            if (randt = 3) {
                SendChat("/me ухватил" Female4 " за плечо человека, после повел" Female " его перед собой.")
            }
            if (randt = 4) {
                SendChat("/me вывернул" Female " руки человеку напротив, заломал" Female " его и повел" Female " за собой.")
            }
            id := getClosestPlayerId()
            ped := getTargetPed()
            Sleep, 1000
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
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
                SendChat("/me подойдя с преступником к автомобилю, положил" Female " его на каркас автомобиля.")
                Sleep, %sleepingtime%
                SendChat("/me открыл" Female " дверь автомобиля держа преступника правой рукой.")
                Sleep, %sleepingtime%
                SendChat("/do У " name "a на лице было ярко выражено ненависть, но " Female5 " сдерживал" Female " себя.")
                Sleep, %sleepingtime%
                SendChat("/me ухватил" Female4 " за голову преступника левой рукой и помог" Female6 " усадить его.")
                Sleep, %sleepingtime%
                SendChat("/me после того как усадил" Female " преступника, захлопнул" Female " дверь автомобиля.")
            }
            Sleep, 1000
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Примечание* - {FFFFFF}Сядьте в автомобиль сейчас-же, комманда сейчас введеться в чат!")
            Sleep, 5000
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
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
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            SendMessage, 0x50,, 0x4190419,,A
            Random, randt, 1, 2
            if (randt = 1) {
                SendChat("/do Через некоторое время преступник был заведён в депортамент.")
            }
            if (randt = 2) {
                SendChat("/me левой рукой открыл" Female " водительскую дверь и выш" Female7 " из машины и подойдя к задней двери достал" Female " преступника и повел" Female " его в участок.")
            }
            Sleep, 1000
            if (id > -1)
            {
                SendChat("/ceject " id "")
            }
            if (id <= -1)
            {
            SendInput {F6}/ceject{space}
                KeyWait, Enter, D
            }
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
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
                SendChat("/me достал" Female " ключи от наручников, после чего снял" Female " их с нарушителя.")
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
                SendChat("/do Высветилось сообщение в КПК - *дело закрыто*.")
                Sleep, %sleepingtime%
                SendChat("/me выключил" Female " КПК, после чего снял" Female " наручники у подозреваемого.")
                Sleep, %sleepingtime%
                SendChat("/me открыл" Female " дверь, пихнул" Female " человека в участок.")
            }
            if (randt = 3) {
                SendChat("/me прижав преступника лицом к стене, снял" Female " ключ и вставил" Female " его в скважину.")
                Sleep, %sleepingtime%
                SendChat("/me провернув ключ открыл" Female " камеру и снял" Female " с преступника наручники.")
                Sleep, %sleepingtime%
                SendChat("/todo Ожидайте адвоката, если что - кричите*закинув преступника за решётку")
                Sleep, %sleepingtime%
                SendChat("/do Ключи от камеры все еще находился в скважине.")
                Sleep, %sleepingtime%
                SendChat("/me закрыв камеру на ключ повернув им повесил" Female " связку с наручниками на пояс.")
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
        }
    }
    else
    if ErrorLevel = EndKey:End and isInChat()=0
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 150
    Input, OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{End}
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
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
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
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
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("/s " Org1 ", НЕМЕДЛЕННО ЛЕЧЬ НА ЗЕМЛЮ И НЕ ДВИГАТЬСЯ!")
                Sleep, %sleepingtime%
                SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление.")
            }
            if (randt = 2) {
                SendChat("/s ЭТО " Org1 ", ВСЕМ ЛЕЧЬ НА ЗЕМЛЮ, ЖИВО!")
                Sleep, %sleepingtime%
                SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление.")
            }
            if (randt = 3) {
                SendChat("/s " Org7 ", ВСЕМ ЛЕЧЬ НА ЗЕМЛЮ, БЫСТРО!")
                Sleep, %sleepingtime%
                SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление.")
            }
            if (randt = 4) {
                SendChat("/s МОРДОЙ В ЗЕМЛЮ, РУКИ ЗА ГОЛОВУ, " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/b /anim 11 | Если прописал, значит сдался. Если нет - сопротивление.")
            }
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 2
            if (randt = 1) {
                SendChat("/do В руках у " name "а был набор *для сапёра* с логотипом *" Org1 "*.")
                Sleep, %sleepingtime%
                SendChat("/do На бомбе было видно крышку, с 4 болтиками которые прикрывали детонатор.")
                Sleep, %sleepingtime%
                SendChat("/me увидил" Female " на крышке бомбы 4 болта.")
                Sleep, %sleepingtime%
                SendChat("/me достал" Female " отвертку из чемодана с набором сапера.")
                Sleep, %sleepingtime%
                SendChat("/do У " name "а в руках отвертка, которую " Female5 " приготовился использовать.")
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
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если разминирование бомбы неудачно - {F63939}*Numpad 5*")
            }
            if (randt = 2) {
                SendChat("/do На поясе " surname " прикреплен сапёрский набор. ")
                Sleep, %sleepingtime%
                SendChat("/me резким движением отщелкнул" Female " набор с держателя, поставил" Female " его на пол.")
                Sleep, %sleepingtime%
                SendChat("/me достал" Female " из чемоданчика отвертку и жидкий азот.")
                Sleep, %sleepingtime%
                SendChat("/do На корпусе бомбы находится 2-а цензура.")
                Sleep, %sleepingtime%
                SendChat("/me открутил" Female " первый цензураик с крышки бомбы и открутил" Female " второй цензураик.")
                Sleep, %sleepingtime%
                SendChat("/me резким движением закинул" Female " отвертку обратно в чемоданчик.")
                Sleep, %sleepingtime%
                SendChat("/me аккуратно приоткрыл" Female " крышку бомбы.")
                Sleep, %sleepingtime%
                SendChat("/do Видна детонирующая часть.")
                Sleep, %sleepingtime%
                SendChat("/do " surname " внимательно осмотрел бомбу, затем взял" Female " из чемоданчика кусачки.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female " на себя красный провод, перекусил" Female " его кусачками.")
                Sleep, %sleepingtime%
                SendChat("/do Таймер остановился, тиканья со стороны бомбы не слышно.")
                Sleep, %sleepingtime%
                SendChat("/try разминировал" Female " бомбу, которая лежит на полу")
                Sleep, 200
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если разминирование бомбы неудачно - {F63939}*Numpad 5*")
            }
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
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
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
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
                Sleep, 1000
            SendInput {F6}/frisk{Space}
                KeyWait, Enter, D
                Sleep, 1000
                SendChat("/do Документы при себе имеются ?")
            }
            if (randt = 2) {
                SendChat("/me достал" Female " из кармана пиджака прорезиненные перчатки и надевает их.")
                Sleep, %sleepingtime%
                SendChat("/me похлопал" Female " по торсу, спине человека, затем по карманам одежды.")
                Sleep, %sleepingtime%
                SendChat("/me похлопал" Female " по ногам, по карманам брюк.")
                Sleep, %sleepingtime%
                SendChat("/do Пройшло некоторое время, после того как " name "  провела обыск.")
                Sleep, 1000
            SendInput {F6}/frisk{Space}
                KeyWait, Enter, D
                Sleep, 1000
                SendChat("/me снял" Female " перчатки с рук, убрал" Female " их обратно в карман.")
                Sleep, %sleepingtime%
                SendChat("/do Документы при себе имеются ?")
            }
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
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
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - Оповестить диспетчера о нарушителе, используя /su.")
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 150
    Input , OutputVar, L1 V, {Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        if (ErrorLevel = "EndKey:Numpad0") or (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad0
    {
        if isInChat() = 0
        {
            idskr:=getIdsInAnyVehicle()
            if (idskr == -1)
            {
                SendMessage, 0x50,, 0x4190419,,A
                SendChat("/me опустил" Female " руку в нагрудный карман, после достал" Female " от туда *КПК*.")
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
    }
    else
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
                SendChat("/r " Rank "#" idtvoi " to DISP: Leave from " Org6 ", on marking - " Marking ", RFR, OVER SAY **")
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
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
else if (Zavers = 0 and EngVer = 0 and Radio1 = 1)
{
    zavers:=1
    city:=getPlayerCity()
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - Оповестить диспетчера о нарушителе, используя /su.")
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 150
    Input, OutputVar, L1 V, {Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad0
    {
        if isInChat() = 0
        {
            SendMessage, 0x50,, 0x4190419,,A
            idskr:=getIdsInAnyVehicle()
            if (idskr == -1)
            {
                SendChat("/me опустил" Female " руку в нагрудный карман, после достал" Female " от туда *КПК*.")
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
    }
    else
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
            SendChat("/r " Marking " to DISP: МэйДей, МэйДей *70, *20 " getPlayerZone() ", код *ноль*,  конец**")
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
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 150
    Input , OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{End}
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:Numpad5") or (ErrorLevel = "EndKey:Numpad6") or (ErrorLevel = "EndKey:Numpad7") or (ErrorLevel = "EndKey:Numpad8") or (ErrorLevel = "EndKey:Numpad9") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    Else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad6 and
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
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
    }
    else
    if ErrorLevel = EndKey:Nmmpad9
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do На груди " name "" Female12 " висела полицейская рация.")
                Sleep, %sleepingtime%
                SendChat("/me потянул" Female4 " рукой к рации, зажал" Female " кнопку *R* и что-то произнес" Female6 "")
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
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
Active10:
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
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F2]{FFFFFF} - Смена ранга сотруднику который напротив вас(/rang).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F3]{FFFFFF} - Смена формы для сотрудника напротив вас(/changeskin).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Приветствие с гражданским, который пришел на собеседование.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Продолжить собеседование спросив о РП термине в IC.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Якобы ошибиться и подтолкнуть на ошибку того кому проводите собеседование.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Поправиться, когда вас увлечат в нарушении.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - Попросить НАПИСАТЬ на бумаге что-либо.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - Спросить РП термины в /b chat ( OOC )")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - Отказать человеку в собеседовании.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - Принять человека и выдать форму.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню ситуации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    obratka10:
    Loop
    {
        if (statusd == false)
        {
            sleep, 750
            goto, obratka10
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        if isInChat() = 0
        {
            SendMessage, 0x50,, 0x4190419,, A
            SendChat("/do В правой руке " name " был крепко сжата упаковка с нашивками.")
            Sleep, %sleepingtime%
            SendChat("/me взял упаковку в две руки, затем открыл её и достал от туда новую нашивку.")
            Sleep, %sleepingtime%
            SendChat("/todo Вот Ваши нашивки, держите их.*передавая некий предмет человеку напротив.")
            Sleep, 500
        SendInput, {F6}/rang{space}
            KeyWait, Enter, D
            SendChat("/me прикрыл упаковку так что-бы от туда ничего не выпало, после сжал её в правой руке.")
        }
        goto, obratka10
    }
    if ErrorLevel = EndKey:F3
    {
        if isInChat() = 0
        {
            SendMessage, 0x50,, 0x4190419,, A
            SendChat("/do В правой руке " name " был крепко сжата упаковка с формой.")
            Sleep, %sleepingtime%
            SendChat("/me взял упаковку в две руки, затем открыл её и достал от туда новую форму.")
            Sleep, %sleepingtime%
            SendChat("/todo Вот Ваши форма, держите её.*передавая одежду человеку напротив.")
            Sleep, 500
        SendInput, {F6}/changeskin{space}
            KeyWait, Enter, D
            SendChat("/me прикрыл упаковку так что-бы от туда ничего не выпало, после сжал её в правой руке.")
        }
        goto, obratka10
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            Random, randt, 1, 7
            if (randt = 1) {
                SendMessage, 0x50,, 0x4190419,, A
                Sleep 50
                SendChat("Здравсвуйте, будьте добры, ваши документы.")
            }
            if (randt = 2) {
                SendMessage, 0x50,, 0x4190419,, A
                Sleep 50
                SendChat("Я Вас приветстую, пожалуйста... Ваши документы, сэр.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Добрый день, пожалуйста, предоставьте мне Ваши документы.")
            }
            if (randt = 4) {
                Sleep 50
                SendChat("Здравствуйте, Ваши документы пожалуйста, сэр.")
            }
            if (randt = 5) {
                Sleep 50
                SendChat("Приветствую, будьте добры, положите Ваши документы. Я осмотрю их.")
            }
            if (randt = 6) {
                Sleep 50
                SendChat("Добрый день, Ваши документы пожалуйста, сэр.")
            }
            if (randt = 7) {
                Sleep 50
                SendChat("Доброе время суток, не правда ли ? Будьте добры, Ваши документы пожалуйста.")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            Random, randt, 1, 7
            if (randt = 1) {
                Sleep 50
                SendChat("Замечательно. Что такое РК?")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("Отлично. ТК - что такое?")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Хорошо. Расскажите, что такое ДМ?")
            }
            if (randt = 4) {
                Sleep 50
                SendChat("Что же, отлично. Расшифруйте, 'МГ' - что такое?")
            }
            if (randt = 5) {
                Sleep 50
                SendChat("Документы в порядке. Теперь расскажите, что такое ДБ?")
            }
            if (randt = 6) {
                Sleep 50
                SendChat("Отлично, с документами все в порядке. Расшифруйте аббревиатуру 'СК'.")
            }
            if (randt = 7) {
                Sleep 50
                SendChat("По документам вы нам подходите. Теперь расскажите, что такое РП?")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            Random, randt, 1, 7
            if (randt = 1) {
                Sleep 50
                SendChat("Хорошо. Теперь хотелось бы узнать, есть ли у Вас ТимСпик, ибо он нужен для работы у нас.")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("Отлично. Теперь скажите, есть ли у Вас РэйдКолл, он необходим для нашей работы.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Хорошо. Скажите свой скайп, там мы закончим собеседование.")
            }
            if (randt = 4) {
                Sleep 50
                SendChat("Ладно, теперь давайте свой скайп, добавлю в конференцию.")
            }
            if (randt = 5) {
                Sleep 50
                SendChat("Обзвон готовы пройти? Если да, давайте скайп.")
            }
            if (randt = 6) {
                Sleep 50
                SendChat("Скажите Ваш ID, инвайт пропишу.")
            }
            if (randt = 7) {
                Sleep 50
                SendChat("Какой цвет у моего ника? Желтый или синий?")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                Sleep 50
                SendChat("Прошу прощения, голова болит, за языком не слежу.")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("Извиняюсь, всю ночь не спал, не думаю уже что говорю.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Прошу прощения, заработался, не обращайте внимания.")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                Sleep 50
                SendChat("Хорошо, напишите пожалуйста мне Ваш телефон.")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("Будьте добры, напишите название нашего Штата.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Напишите Ваше имя, пожалуйста.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Отлично, напишите мне пожалуйста город в котором мы находимся.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Превосходно, будьте добры, напишите пожалуйста то в чем я одет.")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        if isInChat() = 0
        {
            Random, randt, 1, 7
            if (randt = 1) {
                Sleep 50
                SendChat("/b Мне в смс DB, TK, MG")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("/b Мне в смс DM, MG, RK")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("/b Мне в смс SK, TK, MG")
            }
            if (randt = 4) {
                Sleep 50
                SendChat("/b Мне в смс RP, SK, TK")
            }
            if (randt = 5) {
                Sleep 50
                SendChat("/b Мне в смс TK, SK, MG")
            }
            if (randt = 6) {
                Sleep 50
                SendChat("/b Мне в смс DM, TK, RP")
            }
            if (randt = 7) {
                Sleep 50
                SendChat("/b Мне в смс DB, DM, MG")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                Sleep 50
                SendChat("Печально, но вы не подходите нам. Покиньте пожалуйста очередь.")
            }
            if (randt = 2) {
                Sleep 50
                SendChat("Извините, но вы нам не подходите. Уйдите из очереди.")
            }
            if (randt = 3) {
                Sleep 50
                SendChat("Вы не подходите для этой работы. Оставьте очередь.")
            }
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        if isInChat() = 0
        {
            Random, randt, 1, 3
            if (randt = 1) {
                SendChat("Поздравляю, вы нам подходите, держите форму и рация.")
            }
            if (randt = 2) {
                SendChat("Отлично. вы успешно прошли собеседование, вот ваши рация и форма.")
            }
            if (randt = 3) {
                SendChat("Поздравляю, вы прошли собеседование. вот ваша форма и рация.")
            }
            Sleep, %sleepingtime%
            SendChat("/me спустившись под скамью достал" Female " пакет с рабочей формой и положил" Female " его на стол.")
            Sleep 700
        SendInput, {F6}/invite{Space}
        }
        goto, obratka10
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
Active11:
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
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - Объявление о электронных заявлениях в /gov.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - Объявление о начале собеседования.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - Объявление о продолжении собеседования.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - Объявление о окончании собеседования.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - Выйти из меню ситуации. {F63939}'НАЖИМАТЬ ОБЯЗАТЕЛЬНО ЕСЛИ ХОТИТЕ ВЫЙТИ'.")
    obratka11:
    Loop
    {
        if (statusd == false)
        {
            sleep, 750
            goto, obratka11
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
                SetTimer TakeGun, % timeweap / 2
            }
            if (TempWeapon = 24) or (TempWeapon = 25) or (TempWeapon = 29) or (TempWeapon = 31) or (TempWeapon = 17) or (TempWeapon = 1) or (TempWeapon = 5) or (TempWeapon = 14) or (TempWeapon = 30) or (TempWeapon = 33) or (TempWeapon = 34) or (TempWeapon = 43) or (TempWeapon = 46) or (TempWeapon = 15) or (TempWeapon = 36) or (TempWeapon = 2)  {
                if not TazerIn
                {
                    TazerIn := 1
                    SetTimer TakeGun, % timeweap / 2
                }
            }
            if (TempWeapon = 0)
            {
                if (TazerOut > 1) and (TazerTo)
                {
                    TazerTo := 0
                    SetTimer UnloadGun, % timeweap / 2
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
        sleep, 75
        If !isInChat()
        {
            sleep, 75
        Input , OutputVar, L1 V, {Numpad1}{Numpad2}{Numpad3}{Numpad4}{End}
        }
        if (ErrorLevel = "EndKey:Numpad1") or (ErrorLevel = "EndKey:Numpad2") or (ErrorLevel = "EndKey:Numpad3") or (ErrorLevel = "EndKey:Numpad4") or (ErrorLevel = "EndKey:End")
        break
    }
    if ErrorLevel = EndKey:Numpad1
    {
        if isInChat() = 0
        {
            RegExMatch(GetUTC1(), "(\d+):(\d+)", hourandmin)
            hour := hourandmin1
            min := hourandmin2
            if (hour >= 12 && hour <= 24)
            {
                pmam:="PM"
            }
            else
            {
                pmam:="AM"
            }
            SendChat("/d to OG: Занимаю государственную волну вещаний, пожалуйста не используйте её.")
            Sleep, %sleepingtime%
            SendChat("/gov Уважаемые жители и гости штата San Andreas, просим минуту внимания.")
            Sleep, %sleepingtime%
            SendChat("/gov " press " уведомляет вас о том...")
            Sleep, %sleepingtime%
            SendChat("/gov Что на нашем сайте вы сможете подать заявление в нашу академию.")
            Sleep, %sleepingtime%
            SendChat("/gov Спасибо за внимание / " organis " Public Affairs, " hour ":" min "" pmam ".")
            Sleep, %sleepingtime%
            SendChat("/d to OG: Освободил государственную волну, спасибо.")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        if isInChat() = 0
        {
            RegExMatch(GetUTC1(), "(\d+):(\d+)", hourandmin)
            hour := hourandmin1
            min := hourandmin2
            if (hour >= 12 && hour <= 24)
            {
                pmam:="PM"
            }
            else
            {
                pmam:="AM"
            }
            SendChat("/d to OG: Занимаю государственную волну вещаний, пожалуйста не используйте её.")
            Sleep, %sleepingtime%
            SendChat("/gov Уважаемые жители и гости штата San Andreas, просим минуту внимания.")
            Sleep, %sleepingtime%
            SendChat("/gov " press " уведомляет вас о том...")
            Sleep, %sleepingtime%
            SendChat("/gov Что в офисе нашей организации проходит собеседование. Каждый желающий может попытаться..")
            Sleep, %sleepingtime%
            SendChat("/gov ..пройти его. Спасибо за внимание / " organis " Public Affairs, " hour ":" min "" pmam ".")
            Sleep, %sleepingtime%
            SendChat("/d to OG: Освободил государственную волну, спасибо.")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        if isInChat() = 0
        {
            RegExMatch(GetUTC1(), "(\d+):(\d+)", hourandmin)
            hour := hourandmin1
            min := hourandmin2
            if (hour >= 12 && hour <= 24)
            {
                pmam:="PM"
            }
            else
            {
                pmam:="AM"
            }
            SendChat("/d to OG: Занимаю государственную волну вещаний, пожалуйста не используйте её.")
            Sleep, %sleepingtime%
            SendChat("/gov Уважаемые жители и гости штата San Andreas, просим минуту внимания.")
            Sleep, %sleepingtime%
            SendChat("/gov " press " напоминает вам о том..")
            Sleep, %sleepingtime%
            SendChat("/gov Что в офисе нашей организации проходит собеседование. Каждый желающий может попытаться..")
            Sleep, %sleepingtime%
            SendChat("/gov ..пройти его. Спасибо за внимание / " organis " Public Affairs, " hour ":" min "" pmam ".")
            Sleep, %sleepingtime%
            SendChat("/d to OG: Освободил государственную волну, спасибо.")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        if isInChat() = 0
        {
            RegExMatch(GetUTC1(), "(\d+):(\d+)", hourandmin)
            hour := hourandmin1
            min := hourandmin2
            if (hour >= 12 && hour <= 24)
            {
                pmam:="PM"
            }
            else
            {
                pmam:="AM"
            }
            SendChat("/d to OG: Занимаю государственную волну вещаний, пожалуйста не используйте её.")
            Sleep, %sleepingtime%
            SendChat("/gov Уважаемые жители и гости штата San Andreas, просим минуту внимания.")
            Sleep, %sleepingtime%
            SendChat("/gov " press " напоминает вам о том..")
            Sleep, %sleepingtime%
            SendChat("/gov Собеседование в нашу организацию на данный момент объявленно закрытым.")
            Sleep, %sleepingtime%
            SendChat("/gov Спасибо за внимание / " organis " Public Affairs, " hour ":" min "" pmam ".")
            Sleep, %sleepingtime%
            SendChat("/d to OG: Освободил государственную волну, спасибо.")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
        if isInChat() = 0
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ожидайте, выходим из меню...")
        }
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы автоматически выйшли из меню рации. {00FF00}Продолжайте работу.")
    zavers:=0
}
return
~sc01::
~sc40::
menu:=0
return
sc3B::
{
    if (Hotkey9 == "F1")
    {
        menu:=0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
    Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - Помощь по функциям биндера.", "{FF0000}[1]{FFFFFF} - Информация о забинденых клавишах.`n{FF0000}[2]{FFFFFF} - Помощь по роли сотрудника " Organis ".`n{FF0000}[3]{FFFFFF} - Единичные\Десятичные коды.`n{FF0000}[4]{FFFFFF} - 'Авто-ган' " statusautog ", нажмите чтоб изменить.`n{FF0000}[5]{FFFFFF} - Смена маркировки. | Сейчас у вас: {00FF00} " marking "`n{FF0000}[6]{FFFFFF} - Смена скорости /limit. | Сейчас у вас:{00FF00} " limit "{FFFFFF}.`n{FF0000}[7]{FFFFFF} - Меню 'Напарник'{FFFFFF}.`n{FF0000}[8]{FFFFFF} - Меню 'Собеседование'.`n{FF0000}[9]{FFFFFF} - Автор и связь с ним.`n{FF0000}[10]{FFFFFF} - Перезагрузка биндера.`n{FF0000}[11]{FFFFFF} - Автозагрузка " autozag ", нажмите чтоб изменить.", "ВЫБОР")
        menu:=1
    }
    else
    {
        return
    }
}
return
Active9:
{
    menu:=0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - Помощь по функциям биндера.", "{FF0000}[1]{FFFFFF} - Информация о забинденых клавишах.`n{FF0000}[2]{FFFFFF} - Помощь по роли сотрудника " Organis ".`n{FF0000}[3]{FFFFFF} - Единичные\Десятичные коды.`n{FF0000}[4]{FFFFFF} - 'Авто-ган' " statusautog ", нажмите чтоб изменить.`n{FF0000}[5]{FFFFFF} - Смена маркировки. | Сейчас у вас: {00FF00} " marking "`n{FF0000}[6]{FFFFFF} - Смена скорости /limit. | Сейчас у вас:{00FF00} " limit "{FFFFFF}.`n{FF0000}[7]{FFFFFF} - Меню 'Напарник'{FFFFFF}.`n{FF0000}[8]{FFFFFF} - Меню 'Собеседование'.`n{FF0000}[9]{FFFFFF} - Автор и связь с ним.`n{FF0000}[10]{FFFFFF} - Перезагрузка биндера.`n{FF0000}[11]{FFFFFF} - Автозагрузка " autozag ", нажмите чтоб изменить.", "ВЫБОР")
    menu:=1
}
return
~LButton::
Time := A_TickCount
while(isDialogOpen())
{
    if (A_TickCount - Time > 500)
    {
        Return
    }
}
checkdialogMenu:
if (isDialogButtonSelected() == "1")
{
    menu := 0
}
ifWinNotActive, GTA:SA:MP
{
    return
}
testdi:
if (menu == 1)
{
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    if (Organ == "SAPD") or (Organ == "LSPD") or (Organ == "SFPD") or (Organ == "LVPD")
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ИНФОРМАЦИЯ О КЛАВИШАХ", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - Ситуация 'Трафик-стоп' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - Ситуация 'Арест правонарушителя'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - Ситуация 'Теракт'.`n{FFFF00}" NameKey4 "{FFFFFF} - Меню 'Рация'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - Зафиксироваться на ближайшей машине, по бортовому компютеру.`n{FFFF00}" NameKey6 "{FFFFFF} - Снять фиксацию машины из бортового компютера.`n`n{FFFF00}" NameKey7 "{FFFFFF} - Установить лимит машине '" limit "' км\час.`n{FFFF00}" NameKey8 "{FFFFFF} - Отыграть часы + автоматическое F8.`n`n{FFFF00}/mask{FFFFFF} - Отыграть маску и одеть её.`n{FFFF00}/reps{FFFFFF} - Попросить администрацию проследить за вами\ситуацией.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
            menu := 0
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК SAPD (1 стр).", "{FFFFFF}=============================================================================================`n{00BFFF}Правила Дорожного Движения:`n`n{FFFF00}1. {FFFFFF}Движение пешеходов по проезжей части, по рельсовым путям запрещено.`n{FFFF00}2. {FFFFFF}Движение транспортного средства должно проходить по право-сторонней линии.`n{FFFF00}3. {FFFFFF}Запрещается движение по тротуарам, обочинам, по трамвайным рельсам и ж/д путям.`n{FFFF00}4. {FFFFFF}Запрещается движение транспортных средств по путям встречного направления, кроме случаев обгона.`n{FFFF00}5. {FFFFFF}Запрещается управлять транспортным средством в наркотическом или алкогольном опьянении.`n{FFFF00}6. {FFFFFF}Водители обязаны предоставлять свое ТС офицеру полиции, солдату национальной гвардии, агенту ФБР или`n    сотруднику ДПС, если оно требуется для исполнения его служебных обязанностей.`n{FFFF00}7. {FFFFFF}Скорость передвижение:`n {FFFFFF}В {FF0000}жилых{FFFFFF} и пешеходных районах не больше{FF0000} - {00FF00}20 км\ч.`n {FFFFFF}На {FF0000}населённом{FFFFFF} пункте максимально {FF0000}- {00FF00}60 км\ч.`n {FFFFFF}За {FF0000}городом{FFFFFF} допустимая скорость {FF0000}- {00FF00}110 км\ч. `n{FFFFFF}=============================================================================================`n{00BFFF}Траффик стоп – {FFFFFF}это остановка автомобиля с причиной проверки водителя.`n`n{FFFFFF}При каких случаях разрешается проводить траффик стоп:`n{FFFF00}1. {FFFFFF}Если водитель {FF0000}водит крайне неаккуратно{FFFFFF}, то есть виляет в разные стороны.`n{FFFF00}2. {FFFFFF}Транспорт или же сидящие в нем люди находятся {FF0000}в розыске.`n{FFFF00}3. {FFFFFF}Если водитель нарушил {FF0000}ПДД.`n`n{FFFFFF}Первым делом, вы должны включить {FF0000}спец. сигналы и попросить водителя снизить скорость{FFFFFF} и`n{FFFFFF}прижаться к обочине{FFFFFF}. Если после двух требований остановиться `n{00FF00}(Интервал между требованиями 15секунд) {FFFFFF}водитель {FF0000}не отреагировал, то объявляется преследование.`n`n{FFFFFF}Если же водитель остановился после {FF0000}1-2-го требования{FFFFFF}, то смело приступаем к траффик стопу.`n`n{FFFFFF}Первое, что вы должны сделать – {00FF00}попросить водителя заглушить двигатель{FFFFFF}, приготовить документы`nи держать руки на руле.`n`n{FFFFFF}Далее выходите из машины, руки сразу же ставите на кобуру и двигайтесь к задней части авто. `n{FFFFFF}Оставляйте на фаре отпечаток пальца (для того, чтобы провести анализ, в случае того, если вас `n{FFFFFF}убьют.) и двигайтесь к водителю. Осматривайте салон и водителя, просите его показать `n{FFFFFF}документы. Далее, если у вас есть напарник, просите его пробить человека по базе данных, `n{FFFFFF}если же его нет, берете документы и едете в круизер и проверяйте один.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=============================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
            menu := 0
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ДЕСЯТИЧНЫЕ КОДЫ (1 стр).", "{FFFFFF}=================================================================================================`n{00BFFF}ДЕСЯТИЧНЫЕ КОДЫ`n{FFFFFF}{FFFF00}10-1{FFFFFF} - Встреча всех офицеров на дежурстве (включая локацию и код).`n{FFFF00}10-3{FFFFFF} - Радиомолчание (для срочных сообщений).`n{FFFF00}10-4{FFFFFF} - Принято.`n{FFFF00}10-5{FFFFFF} - Повторите последнее сообщение.`n{FFFF00}10-6{FFFFFF} - Не принято/не верно/нет.`n{FFFF00}10-7{FFFFFF} - Ожидайте.`n{FFFF00}10-8{FFFFFF} - В настоящее время занят/не доступен.`n{FFFF00}10-9{FFFFFF} - В настоящее время занят/не доступен (детективы на ситуации).`n{FFFF00}10-14{FFFFFF} - Запрос транспортировки (включая локацию и цель транспортировки).`n{FFFF00}10-15{FFFFFF} - Подозреваемые арестованы (включая кол-во подозреваемых, локацию).`n{FFFF00}10-20{FFFFFF} - Локация.`n{FFFF00}10-21{FFFFFF} - Сообщение о статусе и местонахождении, описание ситуации.`n{FFFF00}10-22{FFFFFF} - Направляйтесь в 'локация' (обращение к конкретному офицеру).`n{FFFF00}*27{FFFFFF} - Меняю маркировку патруля (включая старую и новую маркировку).`n{FFFF00}10-40{FFFFFF} - Большое скопление людей (4 и больше).`n{FFFF00}10-41{FFFFFF} - Нелегальная активность.`n{FFFF00}10-46{FFFFFF} - Провожу обыск.`n{FFFF00}10-55{FFFFFF} - Траффик-стоп.`n{FFFF00}10-56{FFFFFF} - Запрашиваю информацию (включая номер авто/имя подозреваемого).`n{FFFF00}10-57 VICTOR{FFFFFF} - Погоня за автомобилем (включая модель авто, цвет, местонахождение).`n{FFFF00}10-57 FOXTROT{FFFFFF} - Пешая погоня (включая внешность подозреваемого, оружие (если имеется))`n{FFFF00}10-60{FFFFFF} - Информация об автомобиле (включая название авто, цвет, количество людей внутри).`n{FFFF00}10-61{FFFFFF} - Информация о пешем подозреваемом (включая расу, одежду).`n{FFFF00}10-66{FFFFFF} - Остановка повышенного риска (если известно, что подозреваемый в авто вооружен/совершил преступление. `nЕсли остановка произошла после погони).`n{FFFF00}10-70{FFFFFF} - Запрос поддержки (включая количество юнитов, код).`n{FFFF00}10-71{FFFFFF} - Запрос медицинской поддержки.`n{FFFF00}10-99{FFFFFF} - Ситуация урегулирована.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=================================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 5
            return
        }
        else if (line_num == 4)
        {
            goto, pauseme
        }
        else if (line_num == 5)
        {
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА МАРКИРОВКИ", "{FFFFFF}Введите новою маркировку. {FF0000}|{FFFFFF}  Пример: {00FFFF}1-A-3 {FFFFFF}или  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы удачно сменили свою маркировку на - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, на " newmarking ", доступен, конец связи **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены маркировки, Ваша маркировка - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            return
        }
        else if (line_num == 10)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Скрипт будет перезагружен.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
        }
        else if (line_num == 9){
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Создателем данного скрипта является: Даниел, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если у вас возникают вопросы/проблемы: обращайтесь ко мне в VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Мой Discord: {FF0000}TupaFeil#2416{FFFFFF} | Мой VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 7){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ НАПАРНИКА", "{FF0000}[1]{FFFFFF} - Фамилия напарника |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id напарника | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - Должность напарника | {00FF00}" partnerPost "`n                            -`n{FF0000}[4]{FFFFFF} - {00FF00}Сохранить {FFFFFF}напарника`n{FF0000}[5]{FFFFFF} - {FF0000}Удалить {FFFFFF}напарника", "ВЫБОР")
            menu := 6
            sleep, 500
        }
        else if (line_num == 6){
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА /limit", "{FFFFFF}Введите новое значение скорости. {FF0000}|{FFFFFF}  Пример: {00FFFF}60{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
            menu := 0
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили новое значение для команды /limit - {00FFFF}" limit "{FFFFFF} км\час.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены значения /limit. Ваш лимит - {00FFFF}" limit "{FFFFFF} км\час.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            menu:=0
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ СОБЕСЕДОВАНИЙ", "{FF0000}[1]{FFFFFF} - ОРГАНИЗАЦИЯ. | {00FF00}" organis "`n{FF0000}[2]{FFFFFF} - Пресс-Центр. | {00FF00}" press "`n{FF0000}[3]{FFFFFF} - {00FF00}Сохранить настройки`n{FF0000}[4]{FFFFFF} - {FF0000}Удалить настройки", "ВЫБОР")
            menu := 7
            sleep, 500
            return
        }
        else if (line_num == 11){
            menu:=0
            if (guiyep == "1")
            {
                FileDelete, %A_Startup%\Officer Adjutant.lnk
                guiyep := "0"
                autorun := "0"
            autozag := "{00FF00}отключёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {00FF00}отключили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            else
            {
                FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
                guiyep := "1"
                autorun := "1"
                guion := "без интерфейса на котором вы сейчас"
            autozag := "{00FF00}включёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}включили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            menu := 0
            return
        }
        return
    }
    if Organ = FBI
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ИНФОРМАЦИЯ О КЛАВИШАХ", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - Ситуация 'Трафик-стоп' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - Ситуация 'Арест правонарушителя'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - Ситуация 'Теракт'.`n{FFFF00}" NameKey4 "{FFFFFF} - Меню 'Рация'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - Зафиксироваться на ближайшей машине, по бортовому компютеру.`n{FFFF00}" NameKey6 "{FFFFFF} - Снять фиксацию машины из бортового компютера.`n`n{FFFF00}" NameKey7 "{FFFFFF} - Установить лимит машине '" limit "' км\час.`n{FFFF00}" NameKey8 "{FFFFFF} - Отыграть часы + автоматическое F8.`n`n{FFFF00}/mask{FFFFFF} - Отыграть маску и одеть её.`n{FFFF00}/reps{FFFFFF} - Попросить администрацию проследить за вами\ситуацией.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК FBI (1 стр).", "{FFFFFF}=============================================================================================`n{00BFFF}Правила Дорожного Движения:`n`n{FFFF00}1. {FFFFFF}Движение пешеходов по проезжей части, по рельсовым путям запрещено.`n{FFFF00}2. {FFFFFF}Движение транспортного средства должно проходить по право-сторонней линии.`n{FFFF00}3. {FFFFFF}Запрещается движение по тротуарам, обочинам, по трамвайным рельсам и ж/д путям.`n{FFFF00}4. {FFFFFF}Запрещается движение транспортных средств по путям встречного направления, кроме случаев обгона.`n{FFFF00}5. {FFFFFF}Запрещается управлять транспортным средством в наркотическом или алкогольном опьянении.`n{FFFF00}6. {FFFFFF}Водители обязаны предоставлять свое ТС офицеру полиции, солдату национальной гвардии, агенту ФБР или`n    сотруднику ДПС, если оно требуется для исполнения его служебных обязанностей.`n{FFFF00}7. {FFFFFF}Скорость передвижение:`n {FFFFFF}В {FF0000}жилых{FFFFFF} и пешеходных районах не больше{FF0000} - {00FF00}20 км\ч.`n {FFFFFF}На {FF0000}населённом{FFFFFF} пункте максимально {FF0000}- {00FF00}60 км\ч.`n {FFFFFF}За {FF0000}городом{FFFFFF} допустимая скорость {FF0000}- {00FF00}110 км\ч. `n{FFFFFF}=============================================================================================`n{00BFFF}Траффик стоп – {FFFFFF}это остановка автомобиля с причиной проверки водителя.`n`n{FFFFFF}При каких случаях разрешается проводить траффик стоп:`n{FFFF00}1. {FFFFFF}Если водитель {FF0000}водит крайне неаккуратно{FFFFFF}, то есть виляет в разные стороны.`n{FFFF00}2. {FFFFFF}Транспорт или же сидящие в нем люди находятся {FF0000}в розыске.`n{FFFF00}3. {FFFFFF}Если водитель нарушил {FF0000}ПДД.`n`n{FFFFFF}Первым делом, вы должны включить {FF0000}спец. сигналы и попросить водителя снизить скорость{FFFFFF} и`n{FFFFFF}прижаться к обочине {00FF00}( F2 ){FFFFFF}. Если после двух требований остановиться `n{00FF00}(Интервал между требованиями 15секунд) {FFFFFF}водитель {FF0000}не отреагировал, то объявляется преследование.{00FF00} (Alt+Num4) `n`n{FFFFFF}Если же водитель остановился после {FF0000}1-2-го требования{FFFFFF}, то смело приступаем к траффик стопу.`n`n{FFFFFF}Первое, что вы должны сделать – {00FF00}попросить водителя заглушить двигатель {00FF00}( F2 ){FFFFFF}, приготовить документы`nи держать руки на руле.`n`n{FFFFFF}Далее выходите из машины, руки сразу же ставите на кобуру {00FF00}( Alt + P ){FFFFFF} и двигайтесь к задней части авто. `n{FFFFFF}Оставляйте на фаре отпечаток пальца (для того, чтобы провести анализ, в случае того, если вас `n{FFFFFF}убьют.) и двигайтесь к водителю. Осматривайте салон и водителя, просите его показать `n{FFFFFF}документы {00FF00}(F3, Alt + Home){FFFFFF}. Далее, если у вас есть напарник, просите его пробить человека по базе данных, `n{FFFFFF}если же его нет, берете документы и едете в круизер и проверяйте один.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=============================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ДЕСЯТИЧНЫЕ КОДЫ (1 стр).", "{FFFFFF}=================================================================================================`n{00BFFF}ДЕСЯТИЧНЫЕ КОДЫ`n{FFFFFF}{FFFF00}10-1{FFFFFF} - Встреча всех офицеров на дежурстве (включая локацию и код).`n{FFFF00}10-3{FFFFFF} - Радиомолчание (для срочных сообщений).`n{FFFF00}10-4{FFFFFF} - Принято.`n{FFFF00}10-5{FFFFFF} - Повторите последнее сообщение.`n{FFFF00}10-6{FFFFFF} - Не принято/не верно/нет.`n{FFFF00}10-7{FFFFFF} - Ожидайте.`n{FFFF00}10-8{FFFFFF} - В настоящее время занят/не доступен.`n{FFFF00}10-9{FFFFFF} - В настоящее время занят/не доступен (детективы на ситуации).`n{FFFF00}10-14{FFFFFF} - Запрос транспортировки (включая локацию и цель транспортировки).`n{FFFF00}10-15{FFFFFF} - Подозреваемые арестованы (включая кол-во подозреваемых, локацию).`n{FFFF00}10-20{FFFFFF} - Локация.`n{FFFF00}10-21{FFFFFF} - Сообщение о статусе и местонахождении, описание ситуации.`n{FFFF00}10-22{FFFFFF} - Направляйтесь в 'локация' (обращение к конкретному офицеру).`n{FFFF00}*27{FFFFFF} - Меняю маркировку патруля (включая старую и новую маркировку).`n{FFFF00}10-40{FFFFFF} - Большое скопление людей (4 и больше).`n{FFFF00}10-41{FFFFFF} - Нелегальная активность.`n{FFFF00}10-46{FFFFFF} - Провожу обыск.`n{FFFF00}10-55{FFFFFF} - Траффик-стоп.`n{FFFF00}10-56{FFFFFF} - Запрашиваю информацию (включая номер авто/имя подозреваемого).`n{FFFF00}10-57 VICTOR{FFFFFF} - Погоня за автомобилем (включая модель авто, цвет, местонахождение).`n{FFFF00}10-57 FOXTROT{FFFFFF} - Пешая погоня (включая внешность подозреваемого, оружие (если имеется))`n{FFFF00}10-60{FFFFFF} - Информация об автомобиле (включая название авто, цвет, количество людей внутри).`n{FFFF00}10-61{FFFFFF} - Информация о пешем подозреваемом (включая расу, одежду).`n{FFFF00}10-66{FFFFFF} - Остановка повышенного риска (если известно, что подозреваемый в авто вооружен/совершил преступление. `nЕсли остановка произошла после погони).`n{FFFF00}10-70{FFFFFF} - Запрос поддержки (включая количество юнитов, код).`n{FFFF00}10-71{FFFFFF} - Запрос медицинской поддержки.`n{FFFF00}10-99{FFFFFF} - Ситуация урегулирована.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=================================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 5
            return
        }
        else if (line_num == 4)
        {
            goto, pauseme
            return
        }
        else if (line_num == 5)
        {
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА МАРКИРОВКИ", "{FFFFFF}Введите новою маркировку. {FF0000}|{FFFFFF}  Пример: {00FFFF}1-A-3 {FFFFFF}или  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы удачно сменили свою маркировку на - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, на " newmarking ", доступен, конец связи **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены маркировки, Ваша маркировка - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            return
        }
        else if (line_num == 10)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Скрипт будет перезагружен.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 9)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Создателем данного скрипта является: Даниел, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если у вас возникают вопросы/проблемы: обращайтесь ко мне в VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Мой Discord: {FF0000}TupaFeil#2416{FFFFFF} | Мой VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 7){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ НАПАРНИКА", "{FF0000}[1]{FFFFFF} - Фамилия напарника |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id напарника | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - Должность напарника | {00FF00}" partnerPost "`n                            -`n{FF0000}[4]{FFFFFF} - {00FF00}Сохранить {FFFFFF}напарника`n{FF0000}[5]{FFFFFF} - {FF0000}Удалить {FFFFFF}напарника", "ВЫБОР")
            menu := 6
            sleep, 500
        }
        else if (line_num == 6){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА /limit", "{FFFFFF}Введите новое значение скорости. {FF0000}|{FFFFFF}  Пример: {00FFFF}60{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили новое значение для команды /limit - {00FFFF}" limit "{FFFFFF} км\час.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены значения /limit. Ваш лимит - {00FFFF}" limit "{FFFFFF} км\час.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            menu:=0
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ СОБЕСЕДОВАНИЙ", "{FF0000}[1]{FFFFFF} - ОРГАНИЗАЦИЯ. |{00FF00} " organis "`n{FF0000}[2]{FFFFFF} - Пресс-Центр. | {00FF00}" press "`n{FF0000}[3]{FFFFFF} - {00FF00}Сохранить настройки`n{FF0000}[4]{FFFFFF} - {FF0000}Удалить настройки", "ВЫБОР")
            menu := 10
            sleep, 500
        }
        else if (line_num == 11){
            menu:=0
            if (guiyep == "1")
            {
                FileDelete, %A_Startup%\Officer Adjutant.lnk
                guiyep := "0"
                autorun := "0"
            autozag := "{00FF00}отключёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {00FF00}отключили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            else
            {
                FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
                guiyep := "1"
                autorun := "1"
                guion := "без интерфейса на котором вы сейчас"
            autozag := "{00FF00}включёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}включили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            menu := 0
            return
        }
        return
    }
    if Organ = SWAT
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ИНФОРМАЦИЯ О КЛАВИШАХ", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - Ситуация 'Трафик-стоп' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - Ситуация 'Арест правонарушителя'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - Ситуация 'Теракт'.`n{FFFF00}" NameKey4 "{FFFFFF} - Меню 'Рация'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - Зафиксироваться на ближайшей машине, по бортовому компютеру.`n{FFFF00}" NameKey6 "{FFFFFF} - Снять фиксацию машины из бортового компютера.`n`n{FFFF00}" NameKey7 "{FFFFFF} - Установить лимит машине '" limit "' км\час.`n{FFFF00}" NameKey8 "{FFFFFF} - Отыграть часы + автоматическое F8.`n`n{FFFF00}/mask{FFFFFF} - Отыграть маску и одеть её.`n{FFFF00}/reps{FFFFFF} - Попросить администрацию проследить за вами\ситуацией.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК SWAT", "{FFFFFF}====================================================================================================================`n{00BFFF}>Оцепление территории (Система)<`n`n{FFFF00}-{FFFFFF} При спец. задании, где нужно оцеплять территорию: митинг, авария или другое;`n{FFFF00}-{FFFFFF} Используйте барьеры! Все барьеры лежат в автомобилях S.W.A.T. - {00FF00}( Alt + N ){FFFFFF};`n{FFFF00}-{FFFFFF} Просто так барьеры ставить запрещено!`n{FFFF00}-{FFFFFF} Карается выговором, вплоть до увольнения!`n`n{00BFFF}>Основные задачи S.W.A.T.<`n`n{FFFF00}-{FFFFFF} Спасение заложников;`n{FFFF00}-{FFFFFF} Обеспечение периметра безопасности против снайперов во время визитов государственных лиц;`n{FFFF00}-{FFFFFF} Обеспечение превосходящей огневой мощи в некоторых ситуациях, в том числе против забаррикадировавшихся подозреваемых;`n{FFFF00}-{FFFFFF} Спасение полицейских и гражданских, попавших под обстрел;`n{FFFF00}-{FFFFFF} Контртеррористические операции в городах штата Atlantic;`n{FFFF00}-{FFFFFF} Разрешение ситуаций, характеризующихся высоким риском при минимуме смертей, ранений и повреждений собственности;`n{FFFF00}-{FFFFFF} Разрешение ситуаций с забаррикадировавшимися личностями;`n{FFFF00}-{FFFFFF} Стабилизация ситуаций, характеризующихся высоким риском с самоубийцами;`n{FFFF00}-{FFFFFF} Обеспечение поддержки при рейдах против наркомафии, арестах по судебному ордеру, обысках подозреваемых (Помощь FBI, CIA, SAPD);`n{FFFF00}-{FFFFFF} Обеспечение поддержки при особых событиях;`n{FFFF00}-{FFFFFF} Стабилизация опасных ситуаций при столкновении с преступниками (такими как расисты, серийные убийцы, гангстеры);`n{FFFF00}-{FFFFFF} Борьба с уличными беспорядками;`n`n{00BFFF}>Чем отличается спец. подразделение S.W.A.T. от остальных организаций, таких как SAPD или FBI?<`n`n{FFFF00}-{FFFFFF} Начнем со сравнения нашего спец. подразделения с гос. структурой San Andreas Police Department...`n  Для начала, S.W.A.T. не занимается патрулем или ловлей преступников (не считая особо опасных,`n  которых не в силах поймать сотрудники полиции), спец. подразделение S.W.A.T. - это элитное`n  подразделение, оно занимается делами намного важными, нежели обычная Полиция штата;`n`n{00BFFF}>Устранение Митинга<`n`n{FFFF00}-{FFFFFF} В случае митинга, строго запрещено использовать огнестрельное оружие! (Только если это не вооруженные митингующие);`n{FFFF00}-{FFFFFF} Обязательная отыгровка RP;`n{FFFF00}-{FFFFFF} Необходимо осуществить оцепление территории и выстроиться в определенный ряд;`n{FFFF00}-{FFFFFF} После этого необходимо с помощью Мегафона [/m] или крика [/s];`n{FFFF00}-{FFFFFF} Попытаться устранить митинг, если бастующие отказываются действовать по указанному плану или сопротивляются,`n  то применяется сила (использовать дубинки), после этого подаем на человека в розыск и одеваем наручники!`n  Так делаем с каждым! Убираем свои заграждения и везем преступников в КПЗ!`n{FFFFFF}====================================================================================================================`n", "X")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ДЕСЯТИЧНЫЕ КОДЫ (1 стр).", "{FFFFFF}=================================================================================================`n{00BFFF}ДЕСЯТИЧНЫЕ КОДЫ`n{FFFFFF}{FFFF00}10-1{FFFFFF} - Встреча всех офицеров на дежурстве (включая локацию и код).`n{FFFF00}10-3{FFFFFF} - Радиомолчание (для срочных сообщений).`n{FFFF00}10-4{FFFFFF} - Принято.`n{FFFF00}10-5{FFFFFF} - Повторите последнее сообщение.`n{FFFF00}10-6{FFFFFF} - Не принято/не верно/нет.`n{FFFF00}10-7{FFFFFF} - Ожидайте.`n{FFFF00}10-8{FFFFFF} - В настоящее время занят/не доступен.`n{FFFF00}10-9{FFFFFF} - В настоящее время занят/не доступен (детективы на ситуации).`n{FFFF00}10-14{FFFFFF} - Запрос транспортировки (включая локацию и цель транспортировки).`n{FFFF00}10-15{FFFFFF} - Подозреваемые арестованы (включая кол-во подозреваемых, локацию).`n{FFFF00}10-20{FFFFFF} - Локация.`n{FFFF00}10-21{FFFFFF} - Сообщение о статусе и местонахождении, описание ситуации.`n{FFFF00}10-22{FFFFFF} - Направляйтесь в 'локация' (обращение к конкретному офицеру).`n{FFFF00}*27{FFFFFF} - Меняю маркировку патруля (включая старую и новую маркировку).`n{FFFF00}10-40{FFFFFF} - Большое скопление людей (4 и больше).`n{FFFF00}10-41{FFFFFF} - Нелегальная активность.`n{FFFF00}10-46{FFFFFF} - Провожу обыск.`n{FFFF00}10-55{FFFFFF} - Траффик-стоп.`n{FFFF00}10-56{FFFFFF} - Запрашиваю информацию (включая номер авто/имя подозреваемого).`n{FFFF00}10-57 VICTOR{FFFFFF} - Погоня за автомобилем (включая модель авто, цвет, местонахождение).`n{FFFF00}10-57 FOXTROT{FFFFFF} - Пешая погоня (включая внешность подозреваемого, оружие (если имеется))`n{FFFF00}10-60{FFFFFF} - Информация об автомобиле (включая название авто, цвет, количество людей внутри).`n{FFFF00}10-61{FFFFFF} - Информация о пешем подозреваемом (включая расу, одежду).`n{FFFF00}10-66{FFFFFF} - Остановка повышенного риска (если известно, что подозреваемый в авто вооружен/совершил преступление. `nЕсли остановка произошла после погони).`n{FFFF00}10-70{FFFFFF} - Запрос поддержки (включая количество юнитов, код).`n{FFFF00}10-71{FFFFFF} - Запрос медицинской поддержки.`n{FFFF00}10-99{FFFFFF} - Ситуация урегулирована.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=================================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 5
            return
        }
        else if (line_num == 4)
        {
            goto, pauseme
            return
        }
        else if (line_num == 5)
        {
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА МАРКИРОВКИ", "{FFFFFF}Введите новою маркировку. {FF0000}|{FFFFFF}  Пример: {00FFFF}1-A-3 {FFFFFF}или  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы удачно сменили свою маркировку на - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, на " newmarking ", доступен, конец связи **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены маркировки, Ваша маркировка - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            return
        }
        else if (line_num == 10)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Скрипт будет перезагружен.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 9)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Создателем данного скрипта является: Даниел, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если у вас возникают вопросы/проблемы: обращайтесь ко мне в VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Мой Discord: {FF0000}TupaFeil#2416{FFFFFF} | Мой VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 7){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ НАПАРНИКА", "{FF0000}[1]{FFFFFF} - Фамилия напарника |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id напарника | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - Должность напарника | {00FF00}" partnerPost "`n                            -`n{FF0000}[4]{FFFFFF} - {00FF00}Сохранить {FFFFFF}напарника`n{FF0000}[5]{FFFFFF} - {FF0000}Удалить {FFFFFF}напарника", "ВЫБОР")
            menu := 6
            sleep, 500
        }
        else if (line_num == 6){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА /limit", "{FFFFFF}Введите новое значение скорости. {FF0000}|{FFFFFF}  Пример: {00FFFF}60{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили новое значение для команды /limit - {00FFFF}" limit "{FFFFFF} км\час.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены значения /limit. Ваш лимит - {00FFFF}" limit "{FFFFFF} км\час.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            menu:=0
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ СОБЕСЕДОВАНИЙ", "{FF0000}[1]{FFFFFF} - ОРГАНИЗАЦИЯ. |{00FF00} " organis "`n{FF0000}[2]{FFFFFF} - Пресс-Центр. | {00FF00}" press "`n{FF0000}[3]{FFFFFF} - {00FF00}Сохранить настройки`n{FF0000}[4]{FFFFFF} - {FF0000}Удалить настройки", "ВЫБОР")
            menu := 10
            sleep, 500
        }
        else if (line_num == 11){
            menu:=0
            if (guiyep == "1")
            {
                FileDelete, %A_Startup%\Officer Adjutant.lnk
                guiyep := "0"
                autorun := "0"
            autozag := "{00FF00}отключёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {00FF00}отключили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            else
            {
                FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
                guiyep := "1"
                autorun := "1"
                guion := "без интерфейса на котором вы сейчас"
            autozag := "{00FF00}включёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}включили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            menu := 0
            return
        }
        return
    }
    if Organ = CIA
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ИНФОРМАЦИЯ О КЛАВИШАХ", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - Ситуация 'Трафик-стоп' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - Ситуация 'Арест правонарушителя'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - Ситуация 'Теракт'.`n{FFFF00}" NameKey4 "{FFFFFF} - Меню 'Рация'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - Зафиксироваться на ближайшей машине, по бортовому компютеру.`n{FFFF00}" NameKey6 "{FFFFFF} - Снять фиксацию машины из бортового компютера.`n`n{FFFF00}" NameKey7 "{FFFFFF} - Установить лимит машине '" limit "' км\час.`n{FFFF00}" NameKey8 "{FFFFFF} - Отыграть часы + автоматическое F8.`n`n{FFFF00}/mask{FFFFFF} - Отыграть маску и одеть её.`n{FFFF00}/reps{FFFFFF} - Попросить администрацию проследить за вами\ситуацией.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК CIA (1 стр).", "{FFFFFF}=============================================================================================`n{00BFFF}Правила Дорожного Движения:`n`n{FFFF00}1. {FFFFFF}Движение пешеходов по проезжей части, по рельсовым путям запрещено.`n{FFFF00}2. {FFFFFF}Движение транспортного средства должно проходить по право-сторонней линии.`n{FFFF00}3. {FFFFFF}Запрещается движение по тротуарам, обочинам, по трамвайным рельсам и ж/д путям.`n{FFFF00}4. {FFFFFF}Запрещается движение транспортных средств по путям встречного направления, кроме случаев обгона.`n{FFFF00}5. {FFFFFF}Запрещается управлять транспортным средством в наркотическом или алкогольном опьянении.`n{FFFF00}6. {FFFFFF}Водители обязаны предоставлять свое ТС офицеру полиции, солдату национальной гвардии, агенту ФБР или`n    сотруднику ДПС, если оно требуется для исполнения его служебных обязанностей.`n{FFFF00}7. {FFFFFF}Скорость передвижение:`n {FFFFFF}В {FF0000}жилых{FFFFFF} и пешеходных районах не больше{FF0000} - {00FF00}20 км\ч.`n {FFFFFF}На {FF0000}населённом{FFFFFF} пункте максимально {FF0000}- {00FF00}60 км\ч.`n {FFFFFF}За {FF0000}городом{FFFFFF} допустимая скорость {FF0000}- {00FF00}110 км\ч. `n{FFFFFF}=============================================================================================`n{00BFFF}Траффик стоп – {FFFFFF}это остановка автомобиля с причиной проверки водителя.`n`n{FFFFFF}При каких случаях разрешается проводить траффик стоп:`n{FFFF00}1. {FFFFFF}Если водитель {FF0000}водит крайне неаккуратно{FFFFFF}, то есть виляет в разные стороны.`n{FFFF00}2. {FFFFFF}Транспорт или же сидящие в нем люди находятся {FF0000}в розыске.`n{FFFF00}3. {FFFFFF}Если водитель нарушил {FF0000}ПДД.`n`n{FFFFFF}Первым делом, вы должны включить {FF0000}спец. сигналы и попросить водителя снизить скорость{FFFFFF} и`n{FFFFFF}прижаться к обочине {00FF00}( F2 ){FFFFFF}. Если после двух требований остановиться `n{00FF00}(Интервал между требованиями 15секунд) {FFFFFF}водитель {FF0000}не отреагировал, то объявляется преследование.{00FF00} (Alt+Num4) `n`n{FFFFFF}Если же водитель остановился после {FF0000}1-2-го требования{FFFFFF}, то смело приступаем к траффик стопу.`n`n{FFFFFF}Первое, что вы должны сделать – {00FF00}попросить водителя заглушить двигатель {00FF00}( F2 ){FFFFFF}, приготовить документы`nи держать руки на руле.`n`n{FFFFFF}Далее выходите из машины, руки сразу же ставите на кобуру {00FF00}( Alt + P ){FFFFFF} и двигайтесь к задней части авто. `n{FFFFFF}Оставляйте на фаре отпечаток пальца (для того, чтобы провести анализ, в случае того, если вас `n{FFFFFF}убьют.) и двигайтесь к водителю. Осматривайте салон и водителя, просите его показать `n{FFFFFF}документы {00FF00}(F3, Alt + Home){FFFFFF}. Далее, если у вас есть напарник, просите его пробить человека по базе данных, `n{FFFFFF}если же его нет, берете документы и едете в круизер и проверяйте один.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=============================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ДЕСЯТИЧНЫЕ КОДЫ (1 стр).", "{FFFFFF}=================================================================================================`n{00BFFF}ДЕСЯТИЧНЫЕ КОДЫ`n{FFFFFF}{FFFF00}10-1{FFFFFF} - Встреча всех офицеров на дежурстве (включая локацию и код).`n{FFFF00}10-3{FFFFFF} - Радиомолчание (для срочных сообщений).`n{FFFF00}10-4{FFFFFF} - Принято.`n{FFFF00}10-5{FFFFFF} - Повторите последнее сообщение.`n{FFFF00}10-6{FFFFFF} - Не принято/не верно/нет.`n{FFFF00}10-7{FFFFFF} - Ожидайте.`n{FFFF00}10-8{FFFFFF} - В настоящее время занят/не доступен.`n{FFFF00}10-9{FFFFFF} - В настоящее время занят/не доступен (детективы на ситуации).`n{FFFF00}10-14{FFFFFF} - Запрос транспортировки (включая локацию и цель транспортировки).`n{FFFF00}10-15{FFFFFF} - Подозреваемые арестованы (включая кол-во подозреваемых, локацию).`n{FFFF00}10-20{FFFFFF} - Локация.`n{FFFF00}10-21{FFFFFF} - Сообщение о статусе и местонахождении, описание ситуации.`n{FFFF00}10-22{FFFFFF} - Направляйтесь в 'локация' (обращение к конкретному офицеру).`n{FFFF00}*27{FFFFFF} - Меняю маркировку патруля (включая старую и новую маркировку).`n{FFFF00}10-40{FFFFFF} - Большое скопление людей (4 и больше).`n{FFFF00}10-41{FFFFFF} - Нелегальная активность.`n{FFFF00}10-46{FFFFFF} - Провожу обыск.`n{FFFF00}10-55{FFFFFF} - Траффик-стоп.`n{FFFF00}10-56{FFFFFF} - Запрашиваю информацию (включая номер авто/имя подозреваемого).`n{FFFF00}10-57 VICTOR{FFFFFF} - Погоня за автомобилем (включая модель авто, цвет, местонахождение).`n{FFFF00}10-57 FOXTROT{FFFFFF} - Пешая погоня (включая внешность подозреваемого, оружие (если имеется))`n{FFFF00}10-60{FFFFFF} - Информация об автомобиле (включая название авто, цвет, количество людей внутри).`n{FFFF00}10-61{FFFFFF} - Информация о пешем подозреваемом (включая расу, одежду).`n{FFFF00}10-66{FFFFFF} - Остановка повышенного риска (если известно, что подозреваемый в авто вооружен/совершил преступление. `nЕсли остановка произошла после погони).`n{FFFF00}10-70{FFFFFF} - Запрос поддержки (включая количество юнитов, код).`n{FFFF00}10-71{FFFFFF} - Запрос медицинской поддержки.`n{FFFF00}10-99{FFFFFF} - Ситуация урегулирована.`n`n{FFFFFF}Продолжение на {FF0000}<2-ой странице>`n{FFFFFF}=================================================================================================`n", "ВЫХОД", "2 СТР")
            menu := 5
            return
        }
        else if (line_num == 4)
        {
            goto, pauseme
            return
        }
        else if (line_num == 5)
        {
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА МАРКИРОВКИ", "{FFFFFF}Введите новою маркировку. {FF0000}|{FFFFFF}  Пример: {00FFFF}1-A-3 {FFFFFF}или  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы удачно сменили свою маркировку на - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: *27, на " newmarking ", доступен, конец связи **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены маркировки, Ваша маркировка - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            return
        }
        else if (line_num == 10)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Скрипт будет перезагружен.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 9)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Создателем данного скрипта является: Даниел, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Если у вас возникают вопросы/проблемы: обращайтесь ко мне в VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Мой Discord: {FF0000}TupaFeil#2416{FFFFFF} | Мой VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
        }
        else if (line_num == 7){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ НАПАРНИКА", "{FF0000}[1]{FFFFFF} - Фамилия напарника |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id напарника | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - Должность напарника | {00FF00}" partnerPost "`n                            -`n{FF0000}[4]{FFFFFF} - {00FF00}Сохранить {FFFFFF}напарника`n{FF0000}[5]{FFFFFF} - {FF0000}Удалить {FFFFFF}напарника", "ВЫБОР")
            menu := 6
            sleep, 500
        }
        else if (line_num == 6){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - СМЕНА /limit", "{FFFFFF}Введите новое значение скорости. {FF0000}|{FFFFFF}  Пример: {00FFFF}60{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили новое значение для команды /limit - {00FFFF}" limit "{FFFFFF} км\час.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню смены значения /limit. Ваш лимит - {00FFFF}" limit "{FFFFFF} км\час.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
            }
            menu:=0
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - МЕНЮ СОБЕСЕДОВАНИЙ", "{FF0000}[1]{FFFFFF} - ОРГАНИЗАЦИЯ. |{00FF00} " organis "`n{FF0000}[2]{FFFFFF} - Пресс-Центр. | {00FF00}" press "`n{FF0000}[3]{FFFFFF} - {00FF00}Сохранить настройки`n{FF0000}[4]{FFFFFF} - {FF0000}Удалить настройки", "ВЫБОР")
            menu := 10
            sleep, 500
        }
        else if (line_num == 11){
            menu:=0
            if (guiyep == "1")
            {
                FileDelete, %A_Startup%\Officer Adjutant.lnk
                guiyep := "0"
                autorun := "0"
            autozag := "{00FF00}отключёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {00FF00}отключили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            else
            {
                FileCreateShortcut, %A_ScriptDir%\%A_ScriptName%, %A_Startup%\Officer Adjutant.lnk, %A_Startup%, "%A_ScriptFullPath%", Скрипт запущен, %A_ScriptDir%\%A_ScriptName%, i
                guiyep := "1"
                autorun := "1"
                guion := "без интерфейса на котором вы сейчас"
            autozag := "{00FF00}включёна{FFFFFF}"
                IniWrite, %guiyep%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guiyep
                IniWrite, %autorun%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Autorun
                IniWrite, %guion%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Autoruns, Guion
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}включили{FFFFFF} автозагрузку биндера вместе с WINDOWS.")
            }
            menu := 0
            return
        }
    }
}
else if (menu == 4)
{
    if (Organ == "SAPD") or (Organ == "LSPD") or (Organ == "SFPD") or (Organ == "LVPD")
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК PD (2 стр).", "{FFFFFF}=============================================================================================`n {00BFFF}Что требуется для составления протокола ?`n{FF0000}( Составляется при арресте наруштеля в участке депортамента )`n`n{FFFF00}1. {FFFFFF}Протокол № *Любая 3-ех значная цифра*`n{FFFF00}2. {FFFFFF}Дата составления протокола, время задержания подозреваемого.`n{FFFF00}3. {FFFFFF}Место составления протокола, место задержания подозреваемого.`n{FFFF00}4. {FFFFFF}Нарушение.`n{FFFF00}5. {FFFFFF}Имя, фамилия подозреваемого.`n{FFFF00}6. {FFFFFF}Имя, фамилия офицеа\офицеров которые провели задержание.`n{FFFF00}7. {FFFFFF}Прикрепленные документы подозреваемого. ( Если документов нету при `n{FFFFFF}    нарушителе, пробить по компютеру и розпечатать).`n{FFFF00}8. {FFFFFF}Подпись ознакомления протоколом (Для подозреваемого).`n{FFFFFF}=============================================================================================`n", "ВЫХОД", "1 СТР")
        menu := 1
    }
    if Organ = FBI
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК FBI (2 стр).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "ВЫХОД", "1 СТР")
        menu := 1
    }
    if Organ = SWAT
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК SWAT (2 стр).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "ВЫХОД", "1 СТР")
        menu := 1
    }
    if Organ = CIA
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP СОТРУДНИК CIA (2 стр).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "ВЫХОД", "1 СТР")
        menu := 1
    }
}
else if (menu == 5)
{
    menu := 0
showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ЕДИНИЧНЫЕ КОДЫ (2 стр).", "=================================================================================================`n{00BFFF}ЕДИНИЧНЫЕ КОДЫ`n{FFFFFF}{FFFF00}Code 0{FFFFFF} - Необходима немедленная поддержка. Все офицеры на дежурстве обязаны бросить все, чем занимаются `nв данный момент (не важно погоня это или арест) и направиться на место, где объявлен КОД 0.`n{FFFF00}Code 1{FFFFFF} - Офицер в бедственном положении. Повышенный КОД 3, где офицеру срочно требуется помощь, `nоднако ситуация не настолько серьезная, чтобы объявлять КОД 0.`n{FFFF00}Code 2{FFFFFF} - Приоритетный вызов (без сирен/стробоскопов).`n{FFFF00}Code 3{FFFFFF} - Срочный вызов (сирены, стробоскопы).`n{FFFF00}Code 4{FFFFFF} - Помощь не требуется. ( все стабильно )`n{FFFF00}Code 4 ADAM{FFFFFF} - Помощь не требуется, при этом подозреваемый потерян. Дополнительные юниты, которые прибыли, `nобъявляется для (ASD) Air Support Division, для места где летающие средства департамента `nмогут быть подвержены повреждениям, а так же химическому разрушению, либо наблюдение за данной `nзоной невозможно из-за сильного задымления.`n{FFFF00}Code 5{FFFFFF} - Зона заново свободна и доступна для патрулирования, всем `nпатрулям разрешено посещать данную местность.`n{FFFF00}Code 6{FFFFFF} - Задерживаюсь на месте (включая локацию и причину (например, 911)).`n{FFFF00}Code 7{FFFFFF} - Перерыв на обед.`n{FFFF00}Code 8{FFFFFF} - Объявляется при обнаружении сильного пожара, при котором есть угроза жизни населению, либо персоналу.`n{FFFF00}Code 9{FFFFFF} - Объявляется при случае, когда требуется свободная чистота для вещания, при котором офицер:`n- Запрашивает информацию о ордерах на арест на личность.`n- Запрашивает информацию о транспортном средстве.`n- Идентифицирует себя самого либо свой номер юнита.`n{FFFF00}Code 10{FFFFFF} - Объявляется при необычном или странном дорожно-транспортном происшествии или событии, `nкоторое может затронуть общественность.`n=================================================================================================`n", "ВЫХОД", "1 СТР")
    menu := 1
    return
}
else if (menu == 6)
{
    SendMessage, 0x50,, 0x4090409,, A
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
    if (line_num == 1)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ФАМИЛИЯ НАПАРНИКА", "{FFFFFF}Введите фамилию напарника, по формату: {00FFFF}Surname{FFFFFF}.  {FF0000}|{FFFFFF}  Пример: {00FFFF}Cooper{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того что-бы выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
    input, ps, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню 'фамилия напарника'. Фамилия напарника была не указана!")
        }
        else
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnersurname:=ps
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили фамилию напарника - {00FFFF}" partnersurname "")
            partner := 1
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
        }
        menu:=0
        return
    }
    else if (line_num == 2)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ID НАПАРНИКА", "{FFFFFF}Введите id напарника, по формату: {00FFFF}цыфра(1-999){FFFFFF}.  {FF0000}|{FFFFFF}  Пример: {00FFFF}35{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того что-бы выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
    input, paid, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnerid:=paid
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили ID напарника - {00FFFF}" partnerid "")
            Partner:=2
        }
        else
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню 'ID напарника'. ID напарника не был указан!")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
        }
        menu:=0
        return
    }
    else if (line_num == 3)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ДОЛЖНОСТЬ НАПАРНИКА", "{FFFFFF}Введите должность напарника, по формату: {00FFFF}сокрощенное звание (PO-I) - Police Officer I{FFFFFF}.  {FF0000}|{FFFFFF}  Пример: {00FFFF}PO-II{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того чтоб просто выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
    input, ppost, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnerpost:=ppost
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили должность напарника - {00FFFF}" partnerpost "")
            Partner:=3
            return
        }
        else
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню 'должность напарника'. Должность напарника не была указана!")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
        }
        menu:=0
        return
    }
    else if (line_num == 5)
    {
        IniWrite, %partnerSurname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
        IniWrite, %partnerId%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
        IniWrite, %partnerPost%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ваш напарник - {00FFFF}" partnerSurname "{FFFFFF}, с {00FFFF}" partnerId "{FFFFFF} id и должностью {00FFFF}" partnerPost "{FFFFFF}.")
        menu:=0
    }
    else if (line_num == 6)
    {
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
        partner:=0
        partnersurname:="None"
        partnerid:="None"
        partnerpost:="None"
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}удалили {FFFFFF}информацию о своем напарнике.")
        menu:=0
    }
    menu := 0
}
else if (menu == 7)
{
    SendMessage, 0x50,, 0x4090409,, A
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
    if (line_num == 1)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ОРГАН", "{FFFFFF}Введите название организации, по формату: {00FFFF}ОРГАН{FFFFFF}.  {FF0000}|{FFFFFF}  Пример: {00FFFF}SAPD{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того что-бы выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
    input, og, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню 'организация'. Орган не был указан!")
        }
        else
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            organis:=og
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили название организации - {00FFFF}" organis ".")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
        }
        menu:=0
        return
    }
    else if (line_num == 2)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ПРЕСС", "{FFFFFF}Введите ваш пресс-центр, по формату: {00FFFF}Пресс-Центр та-та-та{FFFFFF}.  {FF0000}|{FFFFFF}  Пример: {00FFFF}Пресс-Центр Департамента Полиции Лос-Сантос{FFFFFF}.`n{FFFFFF}После чего что-бы принять изменение нажмите{32CD32} <Insert>`n{FFFFFF}А для того что-бы выйти из меню нажмите {FF0000}<Esc>", "НЕ ТРОЖ")
    input, pr, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            press:=pr
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы установили свое значение - {00FFFF}" press "")
            return
        }
        else
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы выйшли из меню 'Пресс-Центр'. Он не был указан!")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Повторите пожалуйста попытку нажав{32CD32} <Insert>{FFFFFF} что-бы применить настройки.")
        }
        menu:=0
        return
    }
    else if (line_num == 3)
    {
        IniWrite, %organis%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Sobes, Organis
        IniWrite, %press%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Sobes, Press
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Ваша организация - {00FFFF}"  Organ "{FFFFFF}, {00FFFF}" press "{FFFFFF}.")
        menu:=0
    }
    else if (line_num == 4)
    {
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Sobes, Organis
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Sobes, Press
        organ:="None"
        press:="None"
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы успешно {FF0000}удалили {FFFFFF}информацию о гос. волне.")
        menu:=0
    }
    menu := 0
}
return
~Enter::
gosub, checkdialogMenu
return
pauseme:
if (pou == "1") and (TempWeapon == "0")
{
    pou:=0
    statusd:=false
    Weapon:=0
statusautog := "{00FF00}отключён{FFFFFF}"
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы поставили паузу на отыгровку 'автогана'")
    IniWrite, %Weapon%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Weapon
}
else if (pou == "1") and (TempWeapon > 1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Уберите оружие из рук, и повторите попытку.")
}
else if (pou == "0")
{
    pou:=1
    statusd:=true
    Weapon:=1
statusautog := "{00FF00}включён{FFFFFF}"
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - Вы сняли паузу на отыгровку 'автогана'")
    IniWrite, %Weapon%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Weapon
}
return