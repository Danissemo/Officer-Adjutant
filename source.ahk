; <COMPILER: v1.1.30.03>
#SingleInstance force
#NoEnv
buildscr = 54
downlurl := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/updt.exe"
downllen := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/verlen.ini"
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
WM_HELP(){
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    IniRead, desupd, %a_temp%\verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    msgbox, , ������ ��������� ������ %vupd%, %updupd%
    return
}
OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs
SplashTextOn, , 60, �������� ����������, �������� ����������`n------------------------`n��������
URLDownloadToFile, %downllen%, %a_temp%\verlen.ini
IniRead, buildupd, %a_temp%\verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 60, �������� ����������, ������ �����������`n------------------------`n��� ����� � ��������
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n����� ������ - %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%\verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    sleep, 2000
    put2 := % A_ScriptFullPath
    RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
    SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n��������� ������
    URLDownloadToFile, %downlurl%, %a_temp%\updt.exe
    sleep, 500
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
global ADDR_SET_POSITION                    := 0xB7CD98
global ADDR_SET_POSITION_OFFSET             := 0x14
global ADDR_SET_POSITION_X_OFFSET           := 0x30
global ADDR_SET_POSITION_Y_OFFSET           := 0x34
global ADDR_SET_POSITION_Z_OFFSET           := 0x38
global ADDR_SET_INTERIOR_OFFSET             := 0xB72914
global SAMP_SZIP_OFFSET                     := 0x20
global SAMP_INFO_SETTINGS_OFFSET            := 0x3C5
global SAMP_DIALOG_LINENUMBER_OFFSET        := 0x140
global ERROR_OK                             := 0
global ERROR_PROCESS_NOT_FOUND              := 1
global ERROR_OPEN_PROCESS                   := 2
global ERROR_INVALID_HANDLE                 := 3
global ERROR_MODULE_NOT_FOUND               := 4
global ERROR_ENUM_PROCESS_MODULES           := 5
global ERROR_ZONE_NOT_FOUND                 := 6
global ERROR_CITY_NOT_FOUND                 := 7
global ERROR_READ_MEMORY                    := 8
global ERROR_WRITE_MEMORY                   := 9
global ERROR_ALLOC_MEMORY                   := 10
global ERROR_FREE_MEMORY                    := 11
global ERROR_WAIT_FOR_OBJECT                := 12
global ERROR_CREATE_THREAD                  := 13
global ADDR_ZONECODE                        := 0xA49AD4
global ADDR_POSITION_X                      := 0xB6F2E4
global ADDR_POSITION_Y                      := 0xB6F2E8
global ADDR_POSITION_Z                      := 0xB6F2EC
global ADDR_CPED_PTR                        := 0xB6F5F0
global ADDR_CPED_HPOFF                      := 0x540
global ADDR_CPED_ARMOROFF                   := 0x548
global ADDR_CPED_MONEY                      := 0x0B7CE54
global ADDR_CPED_INTID                      := 0xA4ACE8
global ADDR_CPED_SKINIDOFF                  := 0x22
global ADDR_VEHICLE_PTR                     := 0xBA18FC
global ADDR_VEHICLE_HPOFF                   := 0x4C0
global ADDR_VEHICLE_DOORSTATE               := 0x4F8
global ADDR_VEHICLE_ENGINESTATE             := 0x428
global ADDR_VEHICLE_SIRENSTATE              := 0x1069
global ADDR_VEHICLE_SIRENSTATE2             := 0x1300
global ADDR_VEHICLE_LIGHTSTATE              := 0x584
global ADDR_VEHICLE_MODEL                   := 0x22
global ADDR_VEHICLE_TYPE                    := 0x590
global ADDR_VEHICLE_DRIVER                  := 0x460
global ADDR_VEHICLE_X                       := 0x44
global ADDR_VEHICLE_Y                       := 0x48
global ADDR_VEHICLE_Z                       := 0x4C
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Autobus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR","NRG","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT","DFT","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador", "SWAT", "Alpha", "Phoenix", "GlendaleShit","SadlerShit", "Luggage", "Luggage", "Stairs", "Boxville","Tiller","UtilityTrailer"]
global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","21Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global color11namecars :=["�����-", "����-", "������-", "������-", "����-", "������-", "��������-", "������-", "����-", "����-", "����-", "����-", "������-", "����-", "����-", "����-", "������-", "������-", "������-", "����-", "����-", "��������-", "��������-", "����-", "����-", "����-", "����-", "����-", "����-", "����-", "���������-", "���������-", "������-", "����-", "����-", "����-", "�����-", "�����-", "����-", "������-", "���������-", "����-", "������-", "������-", "������-", "������-", "������-","����-", "����-", "����-", "����-", "������-", "����-", "����-", "����-", "���������-", "����-", "���������-", "������-", "����-", "����-", "���������-", "������-", "����-", "����-", "�����-", "���������-", "������-", "�����-", "������-", "������-", "������-", "����-", "����-", "���������-", "�����-", "����-", "���������-", "������-", "����-", "������-", "���������-", "������-", "������-", "���������-", "������-", "������-", "������-", "������-", "����-", "������-����-", "����-", "����-", "������-", "����-", "����-", "����-", "����-", "����-", "���������-", "����-", "����-", "���������-", "����-", "���������-", "����-", "������-", "����-", "������-", "����-", "���������-", "����-", "������-", "���������-", "������-", "��������-", "����-", "������-", "����-", "���������-", "���������-", "������-", "����-", "�����-", "��������-", "����-", "������-"]
global color12namecars := ["���������", "����������", "�������", "���������", "�������-�������", "������", "����������", "������-�������", "�������", "����-���������", "�������", "������-����������", "��������", "��������", "������", "��������", "������-��������", "������-���������", "������-�������", "�������", "�����", "����-����������", "�����", "����-���������", "�������", "�����", "������-���������", "����-�������", "��������", "������-�����", "���������", "����������", "�����-�������", "���������-�������", "�����-�������", "������� �����", "�����-�����", "����-�������", "������-�������", "���������", "������� �������", "������-�������", "������-���������", "���������", "������� �������", "������� �������", "������-����������", "����� ����������", "������-����������", "������-��������", "������-�������", "�������", "������-���������", "������ ����������", "������ �������", "������-���������", "������-�������", "������-�����","�����-�������", "�������", "������-�������", "����-�������", "������ ����", "������-���������", "��������", "�����", "����������", "������-������", "�����", "������", "����-�������", "�����", "��������", "����-�����", "����-�������", "�����-�����", "��������", "�����-�����", "�����-�����", "�����", "�����", "����-�������", "������ ����-�������", "����������", "���������", "��������", "�����-�������", "������ �������", "�������", "������-�������", "����������", "������-���������", "�������� �������", "������-������", "���������-���������", "�����-�����", "������� �������", "�����", "���������", "�����-�������", "�������-������", "�������", "��������", "������-������", "������-�������", "������-���������", "�����-�������", "����-�������", "�����-�����", "��������", "��������", "���������", "�������", "�����-���������", "�����-���������", "������-�������", "����������", "�����-�������", "����-�������", "�����", "������� �������", "��������", "��������", "������-�����", "�����", "�������� �����", "�������-�����", "����-�����"]
global color21namecars :=["Black", "White", "Blue", "Red", "Dark Gray", "Purple", "Orange", "Gray-blue", "Light Gray", "Gray", "Gray-blue", "Gray", "Gray-blue", "Gray", "Light Gray"," Light Gray", "Light Gray", "Green", "Cherry", "Dark Crimson"," Light Gray", "Gray-blue", "Pale Crimson", "Dark Crimson", "Light Gray", "Gray", "Dark Gray", "Light Gray", "Gray", "Gray-blue", "Light Gray", "Dark Brown", "Light Blue", "Gray", "Gray", "Dark Gray", "Gray-green", "Gray", "Gray-blue", "Dark Brown", "Gray", " Pale Cherry", "Cherry", "Dark Green", "Brown-cherry", "Light Khaki", "Gray", "Light Gray", "Light Gray", "Gray", "Green-blue", "Gray", "Blue", "Pale Blue", "Cocoa", "Light Gray", "Light Khaki", "Dark Cherry", "Gray-blue", "Light Gray", "Dark Sand", "Dark Crimson", "Gray", "Gray", "Pale Green", "Dark Brown", "Gray-blue", "Light Khaki", "Cocoa With Milk", "Pale Cherry", "Blue", "Dark Gray", "Light Gray", "Dark Brown", "Dark Blue", "Light Gray", "Light Khakki", "Pale Cherry", "Blue", "Pale Crimson", "Mocha", "Dark-cherry", "Dark Green", "Milk Chocolate", "Raspberry", "Light Green", "Blue", "Pale Cherry", "Pale Khaki", "Light Gray", "Gray", "Gray", "Blue", "Light Shiny", "Blue", "Light Gray", "Gray", "Dark Gray", "Light Khaki", "Blue", "Dark Blue", "Light Khaki", "Blue", "Mocha", "Gray", "Dark Blue", "Sand", "Blue", "Dark Gray", "Cocoa", "Light Gray", "Blue", "Chocolate", "Khaki", "Magenta", "Blue", "Cherry", "Light Gray", "Cocoa", "Mocha", "Dark Cherry", "Dark Gray", "Mustard", "Dark Magenta", "Blue", "Pink"]
global color22namecars :=["Light Green", "Chocolate", "Blue", "Mustard", "Cream Pink", "Black", "Purple", "Light Blue", "Purple", "Bright Green", "Beige", "Purple", "Milky", "Cream", "Yellow", "Powdery", "Purple", "Pale Pink", "Pale Pink", "Pink", "Pink", "Pink", "Pink", "Gray-brown", "Gray", "Gray-light Green", "Blue", "Hakki", "Light Green", "Gray-blue", "Sand", "Light Gray", "Brick", "Brown", "Dark Green", "Peach Pink", "Dark Blue", "Sea Wave", "Dark Gray", "Gray-blue", "Pale Blue", " Violet", "Light Chocolate", "Pale Lilac", "Pale Purple", "Purple", "Dirty Green", "Light Chocolate", "Light Brown", "Bright Peach", "Pale Violet", "Pale Powdery", "Pale Pink", "Berry", "Light Mustard", "Dark Peach", "Dark Beige", "Light Brick", "Light Gray", "Light Gray", "Dark Green", "Green", "Light Green", "Gray-green", "Tea Rose", "Pale Green", "Milky", "White", "Yarkozhelty", "Pale Yellow", "White", "Egg", "Gray-blue", "Hakki", "Cream", "Gray-blue", "Gray-green", "Dark Gray", " Metallic", "Black And Blue", "Black And Gray", "Gray", "Gray", "Gray-blue", "Dark Gray-blue", "Purple", "Brick", "Milk", "Yellow-green", "Dark Green", "Beige", "Light Blue", "Peach", "Light Orange", "True Pink", "Light Yellow", "Peach Orange", "Dark Blue", "Light Chocolate", "Hakki", "Light Green", "Dark Green", "Cream Yellow", "Green", "Plum", "Dirty Yellow", "Purple-pink", "Light Crimson", "Dark Green", "Gray-green", "Dark Gray", "Powdery", "Sand", "Brick ", "Blue", "Yellow-green", "Dark Crimson", "Pale Green", "Chocolate", "Dark Green", "Gray-blue", "Gray", "Light Chocolate", "Cherry", "Milky", "Light Gray", "Gray", "Ivory", "Cream Gray", " Gray-blue"]
global IdInCar:=-1
global NumberPre:=0
global ADDR_SAMP_INCHAT_PTR                 := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF             := 0x55
global ADDR_SAMP_USERNAME                   := 0x219A6F
global FUNC_SAMP_SENDCMD                    := 0x65c60
global FUNC_SAMP_SENDSAY                    := 0x57f0
global FUNC_SAMP_ADDTOCHATWND               := 0x64520
global ADDR_SAMP_CHATMSG_PTR                := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT               := 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR               := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR               := 0x629a0
global DIALOG_STYLE_MSGBOX			        := 0
global DIALOG_STYLE_INPUT 			        := 1
global DIALOG_STYLE_LIST			        := 2
global DIALOG_STYLE_PASSWORD		        := 3
global DIALOG_STYLE_TABLIST			        := 4
global DIALOG_STYLE_TABLIST_HEADERS	        := 5
global SAMP_DIALOG_STRUCT_PTR				:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET				:= 0x1C
global SAMP_DIALOG_LINES_OFFSET 			:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET				:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:= 0x466
global SAMP_DIALOG_PTR2_OFFSET 				:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET			:= 0x150
global SAMP_DIALOG_OPEN_OFFSET				:= 0x28
global SAMP_DIALOG_STYLE_OFFSET				:= 0x2C
global SAMP_DIALOG_ID_OFFSET				:= 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET			:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET			:= 0x40
global FUNC_SAMP_SHOWDIALOG				 	:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG				:= 0x6C040
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global ADDR_SAMP_CRASHREPORT 				:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global SAMP_KILLSTAT_OFFSET                 := 0x21A0EC
global multVehicleSpeed_tick                := 0
global CheckpointCheck 						:= 0xC7DEEA
global rmaddrs 								:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SIZE_SAMP_CHATMSG                    := 0xFC
global hGTA                                 := 0x0
global dwGTAPID                             := 0x0
global dwSAMP                               := 0x0
global pMemory                              := 0x0
global pParam1                              := 0x0
global pParam2                              := 0x0
global pParam3                              := 0x0
global pParam4                              := 0x0
global pParam5                              := 0x0
global pInjectFunc                          := 0x0
global nZone                                := 1
global nCity                                := 1
global bInitZaC                             := 0
global iRefreshScoreboard                   := 0
global oScoreboardData                      := ""
global iRefreshHandles                      := 0
global iUpdateTick                          := 2500
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
getUsername() {
    if(!checkHandles())
    return ""
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return sUsername
}
getId() {
    s:=getUsername()
    return getPlayerIdByName(s)
}
SendChat(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    }
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    ErrorLevel := ERROR_OK
    return true
}
addChatMessage(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    return true
}
showGameText(wText, dwTime, dwSize) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwSize += 0
    dwSize := Floor(dwSize)
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
    ErrorLevel := ERROR_OK
    return true
}
playAudioStream(wUrl) {
    wUrl := "" wUrl
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
}
stopAudioStream() {
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    patchRadio()
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    unPatchRadio()
    ErrorLevel := ERROR_OK
    return true
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
getServerName() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerName := readString(hGTA, dwAdress + 0x121, 200)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerName
}
getServerIP() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerIP := readString(hGTA, dwAdress + 0x20, 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerIP
}
getServerPort() {
    if(!checkHandles())
    return -1
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAdress)
    return -1
    ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return ServerPort
}
getWeatherID() {
    if(!checkHandles())
    return -1
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    WeatherID := readMem(hGTA, dwGTA + 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return WeatherID
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
CountOnlinePlayers() {
    if(!checkHandles())
    return -1
    dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    if(ErrorLevel) {
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
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}
getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 399 && id < 611)
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
getPlayerHealth() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getPlayerArmor() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
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
getPlayerWanteds() {
    if(!checkHandles())
    return -1
    dwPtr := 0xB7CD9C
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Wanteds
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
getPlayerState() {
    if(!checkHandles())
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return State
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
isPlayerInAnyVehicle()
{
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return (dwVehPtr > 0)
}
isPlayerDriver() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}
getVehicleHealth() {
    if(!checkHandles())
    return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}
getVehicleType() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
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
    if(id > 400 && id < 611)
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
getVehicleColor1() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
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
getVehicleColor2() {
    if(!checkHandles())
    return 0
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
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
getVehicleSpeed() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
    return fVehicleSpeed
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
getCoordinates() {
    if(!checkHandles())
    return ""
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}
GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
    if(!checkHandles())
    return 0
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
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
    return "Unbekannt"
}
calculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unbekannt"
    currentCitySize := 0
    smallestCitySize := 0
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    if(smallestCity == "Unbekannt") {
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
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
    X := posX -_posX
    Y := posY -_posY
    Z := posZ -_posZ
    if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
    return TRUE
    return FALSE
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
    GetPlayerPos(posX, posY, posZ)
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
checkHandles() {
    if(iRefreshHandles+500>A_TickCount)
    return true
    iRefreshHandles:=A_TickCount
    if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
        return false
    } else {
        return true
    }
    return true
}
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {
        if(hGTA) {
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    if(!hGTA || (dwGTAPID != newPID)) {
        hGTA := openProcess(newPID)
        if(ErrorLevel) {
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}
refreshSAMP() {
    if(dwSAMP)
    return true
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
    return false
    return true
}
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
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
GetZona()
{
    o:=Object()
    o:=GetCoordinates()
    Zona:=CalculateZone(o[1],o[2],o[3])
    if(Zona=="Unbekannt")
    {
        o[1]:=o[1]-30
        if(Zona=="Unbekannt")
        {
            o:=GetCoordinates()
            o[1]:=o[1]+60
            if(Zona=="Unbekannt")
            {
                o:=GetCoordinates()
                o[1]:=o[1]-30
                o[2]:=o[2]-30
                if(Zona=="Unbekannt")
                {
                    o:=GetCoordinates()
                    o[2]:=o[2]+60
                    Zona:=CalculateZone(o[1],o[2],o[3])
                }
            }
        }
    }
    return Zona
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
addMessageToChatWindow(wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    return true
}
getClosestPlayerIdUnit() {
    dist := 4
    p := getStreamedInPlayersInfo()
    if(!p)
    return -1
    lpos := getCoordinates()
    if(!lpos)
    return -1
    id := -1
    For i, o in p
    {
        if (getTargetPlayerSkinIdById(i)!="76") and (getTargetPlayerSkinIdById(i)!="265") and (getTargetPlayerSkinIdById(i)!="266") and (getTargetPlayerSkinIdById(i)!="267") and (getTargetPlayerSkinIdById(i)!="280") and (getTargetPlayerSkinIdById(i)!="281") and (getTargetPlayerSkinIdById(i)!="282") and (getTargetPlayerSkinIdById(i)!="283") and (getTargetPlayerSkinIdById(i)!="284") and (getTargetPlayerSkinIdById(i)!="285") and (getTargetPlayerSkinIdById(i)!="288") and (getTargetPlayerSkinIdById(i)!="306") and (getTargetPlayerSkinIdById(i)!="307") and (getTargetPlayerSkinIdById(i)!="309") and (getTargetPlayerSkinIdById(i)!="141") and (getTargetPlayerSkinIdById(i)!="163") and (getTargetPlayerSkinIdById(i)!="164") and (getTargetPlayerSkinIdById(i)!="165") and (getTargetPlayerSkinIdById(i)!="166") and (getTargetPlayerSkinIdById(i)!="286")
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
isPlayerDriverMod() {
    if(!checkHandles())
    return -1
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(!dwAddr)
    return -1
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    t:=0
    if (dwVal==dwCPedPtr)
    {
        t:=1
    }
    return t
}
getClosestPlayerIdCar() {
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
            if (isTargetInAnyVehiclebyIdMod(i)==1)
            {
                if(t<dist)
                {
                    dist := t
                    id := i
                }
            }
        }
    }
    return id
}
isTargetInAnyVehiclebyIdMod(dwId)
{
    if(!checkHandles())
    return -1
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    dwVal := readDWORD(hGTA, dwVehiclePointer + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(dwPedPointer == dwVal)
    {
        return 1
    }
    else if(dwPedPointer != dwVal)
    {
        return 0
    }
    else
    {
        return -1
    }
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
TriZnakaVNomereId(dwId) {
    if (dwId<0 and dwId>999)
    return -1
    if (dwId>-1 and dwId<10)
    {
        k:= "00" dwId
        return k
    }
    if (dwId>9 and dwId<100)
    {
        k:= "0" dwId
        return k
    }
    if (dwId>99 and dwId<1000)
    return dwId
}
NearPlayerInCar(dist)
{
    TempDist := 100000
    if(!p := getStreamedInPlayersInfo())
    return false
    if(!lpos := getCoordinates())
    return false
    for i, o in p
    {
        t := getDist(lpos, o.POS)
        if(t <= dist)
        {
            if(t < TempDist && t > 5 && isTargetInAnyVehiclebyId(o.ID))
            TempId := i, TempDist := t
        }
    }
    return TempId
}
getIdsInAnyVehicle()
{
    if (isPlayerInAnyVehicle())
    {
        cVeh := readDWORD(hGTA, 0xB79530)
        playerCount := 0
        ids := []
        index := 0
        Loop, 8
        {
            playerId := getIdByPed(readDWORD(hGTA, cVeh + (1120 + index)))
            if (playerId != -1)
            {
                playerCount++
                ids.Push(playerId)
            }
            index := 4 * A_Index
        }
        if (!playerCount)
        return 0
        return ids
    }
    return -1
}
isDialogOpen() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return dwIsOpen ? true : false
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
getDialogStyle() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return style
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
getDialogID() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return -1
    id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    ErrorLevel := ERROR_OK
    return id
}
setDialogID(id) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
    if (ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return true
}
showDialog(style, caption, text, button1, button2 := "", id := 1) {
    style += 0
    style := Floor(style)
    id += 0
    id := Floor(id)
    caption := "" caption
    text := "" text
    button1 := "" button1
    button2 := "" button2
    if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
    return false
    if (!checkHandles())
    return false
    dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
    sleep 200
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
    if (ErrorLevel || !dwAddress) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeString(hGTA, pParam5, caption)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam1, text)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5 + 512, button1)
    if (ErrorLevel)
    return false
    writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
    if (ErrorLevel)
    return false
    dwLen := 5 + 7 * 5 + 5 + 1
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(1, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")
    NumPut(0x68, injectData, 15, "UChar")
    NumPut(pParam5 + 512, injectData, 16, "UInt")
    NumPut(0x68, injectData, 20, "UChar")
    NumPut(pParam1, injectData, 21, "UInt")
    NumPut(0x68, injectData, 25, "UChar")
    NumPut(pParam5, injectData, 26, "UInt")
    NumPut(0x68, injectData, 30, "UChar")
    NumPut(style, injectData, 31, "UInt")
    NumPut(0x68, injectData, 35, "UChar")
    NumPut(id, injectData, 36, "UInt")
    NumPut(0xE8, injectData, 40, "UChar")
    offset := dwFunc - (pInjectFunc + 45)
    NumPut(offset, injectData, 41, "Int")
    NumPut(0xC3, injectData, 45, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if (ErrorLevel)
    return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if (ErrorLevel)
    return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    return true
}
getDialogCaption() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogTextSize(dwAddress) {
    i := 0
    Loop, 4096 {
        i := A_Index - 1
        byte := Memory_ReadByte(hGTA, dwAddress + i)
        if (!byte)
        break
    }
    return i
}
getDialogText() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return ""
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    text := readString(hGTA, dwPointer, 4096)
    if (ErrorLevel) {
        text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
        if (ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return ""
        }
    }
    ErrorLevel := ERROR_OK
    return text
}
getDialogLineCount() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    ErrorLevel := ERROR_OK
    return count
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
getDialogLine(index) {
    lines := getDialogLines()
    if (index > lines.Length())
    return ""
    if (getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
    index++
    return lines[index]
}
getDialogLines() {
    text := getDialogText()
    if (text == "")
    return -1
    lines := StrSplit(text, "`n")
    return lines
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
isDialogButtonSelected(btn := 1) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
    return false
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    offset := (btn == 1 ? 0x165 : 0x2C5)
    sel := readMem(hGTA, dwPointer + offset, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    ErrorLevel := ERROR_OK
    return sel
}
GetCheckDialogButton()
{
    if (isDialogOpen() == 1)
    {
        Loop
        {
            if (GetKeyState("LButton","P"))
            {
                Loop
                {
                    if (isDialogButtonSelected(1) == 1)
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else if (GetKeyState("LButton","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else if (GetKeyState("Esc","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 0
                    }
                    else if (GetKeyState("Enter","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else
                    {
                        while (isDialogOpen() = 0)
                        return 0
                    }
                }
            }
            if (GetKeyState("Up","P") || GetKeyState("Down","P"))
            {
                Loop
                {
                    if (isDialogButtonSelected(1) == 1)
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else if (GetKeyState("LButton","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else if (GetKeyState("Esc","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 0
                    }
                    else if (GetKeyState("Enter","P"))
                    {
                        while (isDialogOpen() = 0)
                        return 1
                    }
                    else if (isDialogOpen() = 0)
                    return 0
                }
            }
            else if (GetKeyState("Esc", "P") && GetKeyState("Enter", "U"))
            {
                while (isDialogOpen() = 0)
                return 0
            }
            else if (GetKeyState("Enter", "P") && GetKeyState("Esc", "U"))
            {
                while (isDialogOpen() = 0)
                return 1
            }
            else if (GetKeyState("Enter", "P"))
            return 1
            else if (GetKeyState("Esc", "P"))
            return 0
            else if (isDialogOpen() = 0)
            return 1
        }
    }
    if (isDialogOpen() == 0)
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
carInfo(id)
{
    if (id = getid())
    {
        if (getVehicleHealth() <> -1)
        {
            color1 := PreobrColorCar(getVehicleColor1())
            color2 := PreobrColorCar(getVehicleColor2())
            CallCarFunc(id , getUsername(), getVehicleModelName(), getVehicleModelid(), getVehicleHealth(), color1, color2)
        }
    else addChatMessageEx("FFFFFF","� {AC0000}[������] {FFFFFF}�� �� ���������� � ����������.")
    }
    else
    {
        if (getPlayerPingByid(id) = 0) or (getPlayerPingByid(id) = -1) or (getTargetPlayerSkinidByid(id) = -1)
    addChatMessageEx("FFFFFF","� {AC0000}[������] {FFFFFF}����� ��������� ��� ���� ����������.")
        else
        {
            color1 := PreobrColorCar(getTargetVehicleColor1Byid(id))
            color2 := PreobrColorCar(getTargetVehicleColor2Byid(id))
            CallCarFunc(id , getPlayerNameByid(id), getTargetVehicleModelNameByid(id), getTargetVehicleModelidByid(id), getTargetVehicleHealthByid(id), color1, color2)
        }
    }
}
preobrColorCar(c) {
    if (c < 0)
    return c+256
    if (c >= 0) and (c <= 255)
    return c
    else if (c >= 256) and (c <= 511)
    return c-256
    else if c >= 512
    return c-512
}
callCarFunc(id , player, carname, carid, carhp, carcolorone, carcolortwo)
{
    addChatMessageEx("AAAAAA" , "��������������������������������������")
addChatMessageEx("FFFFFF" , "{33AA33}Player: {FFFFFF}" player " [" id "]")
addChatMessageEx("FFFFFF" , "{33AA33}�arName: {FFFFFF}" carname " [" carid "]")
addChatMessageEx("FFFFFF" , "{33AA33}CarHP: {FFFFFF}" carhp)
addChatMessageEx("FFFFFF" , "{33AA33}CarColorOne: {FFFFFF}" carcolorone)
addChatMessageEx("FFFFFF" , "{33AA33}CarColorTwo: {FFFFFF}" carcolortwo)
    addChatMessageEx("AAAAAA" , "��������������������������������������")
}
addChatMessageEx(Color, wText) {
    wText := "" wText
    if(!checkHandles())
    return false
    VarSetCapacity(data2, 4, 0)
    NumPut(Color,data2,0,"Int")
    Addrr := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
    VarSetCapacity(data1, 4, 0)
    NumPut(readDWORD(hGTA, Addrr + 0x12A), data1,0,"Int")
    WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
    ErrorLevel := ERROR_OK
    return true
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
    if (Name == "ERROR" or "")
    {
        Name := "���� ���."
    }
    if (Surname == "ERROR" or "")
    {
        Surname := "���� �������."
    }
    if (Ida == "ERROR" or "")
    {
        Ida := "��."
    }
    if (Marking == "ERROR" or "")
    {
        Marking := "����������."
    }
    if (Rank == "ERROR" or "")
    {
        Rank := "����������� ������."
    }
    if (Sex == "ERROR" or "")
    {
        Sex := "�������"
    }
    if (Organ == "ERROR" or "")
    {
        Organ := "SAPD"
    }
    if (Tag == "ERROR" or "")
    {
        Tag := "[��� ���]:"
    }
    if (Sleepingtime == "ERROR" or "")
    {
        Sleepingtime := "2000"
    }
    if (Timeweap == "ERROR" or "")
    {
        Timeweap := "2500"
    }
    if (RadioGroup1 == "ERROR" or "")
    {
        RadioGroup1 := "1"
    }
    if (RadioGroup2 == "ERROR" or "")
    {
        RadioGroup2 := "0"
    }
    if (Ch1 == "ERROR" or "")
    {
        Ch1 := "Checked"
    }
    if (Ch3 == "ERROR" or "")
    {
        Ch3 := "Checked"
    }
    if (EngVer == "ERROR" or "")
    {
        EngVer := "1"
    }
    if (PartnerSurname == "ERROR" or "")
    {
        PartnerSurname := "0"
    }
    if (PartnerId == "ERROR" or "")
    {
        PartnerId := "0"
    }
    if (PartnerPost == "ERROR" or "")
    {
        PartnerPost := "0"
    }
    if (Partner == "ERROR" or "")
    {
        Partner := "0"
    }
    if (HotKey1 == "ERROR" or "")
    {
        HotKey1 := "!1"
    }
    if (Hotkey2 == "ERROR" or "")
    {
        Hotkey2 := "!2"
    }
    if (Hotkey3 == "ERROR" or "")
    {
        Hotkey3 := "!3"
    }
    if (Hotkey4 == "ERROR" or "")
    {
        Hotkey4 := "!4"
    }
    if (Hotkey5 == "ERROR" or "")
    {
        Hotkey5 := "NumpadSub"
    }
    if (Hotkey6 == "ERROR" or "")
    {
        Hotkey6 := "NumpadMult"
    }
    if (Hotkey7 == "ERROR" or "")
    {
        Hotkey7 := "!z"
    }
    if (Hotkey8 == "ERROR" or "")
    {
        Hotkey8 := "!x"
    }
    if (limit == "ERROR" or "")
    {
        limit := "60"
    }
    if (Page == "ERROR" or "")
    {
        Page := "12"
    }
    if (Page <= "11")
    {
        Page := "12"
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
    IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
    IniWrite, %Page%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Chat, Page
}
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
Gui, Add, CheckBox, x242 y79 w100 h20 vEngVer %Ch3%, ����. ������
SoundPlay, %a_temp%\tuturu.mp3
Gui, Add, Edit, x22 y29 w100 h20 vName, %Name%
Gui, Add, Edit, x132 y29 w100 h20 vSurname, %Surname%
Gui, Add, DropDownList, x252 y29 w100 h180 vSex, �������|�������
GuiControl, ChooseString, Sex, %Sex%
Gui, Add, GroupBox, x12 y9 w460 h50 , ���������� � ������������
Gui, Add, Edit, x22 y79 w100 h20 vMarking, %Marking%
Gui, Add, Edit, x132 y79 w100 h20 vRank, %Rank%
Gui, Add, GroupBox, x12 y59 w410 h50 , ����� � ���������� ����������
Gui, Add, Edit, x22 y129 w100 h20 vTag, %Tag%
Gui, Add, GroupBox, x222 y109 w110 h50 , �������� ����� �����(� �\�).
Gui, Add, Edit, x232 y129 w90 h20 vSleepingtime, %sleepingtime%
Gui, Add, DropDownList, x362 y29 w100 h70 vOrgan, SAPD|FBI|SWAT|CIA
GuiControl, ChooseString, Organ, %Organ%
Gui, Add, GroupBox, x12 y109 w200 h50 , ������� ������� �����
Gui, Add, Button, x12 y219 w20 h80 gAnimation, <
Gui, Add, GroupBox, x12 y159 w110 h50 , ����� ������������ ������(� �\�).
Gui, Add, Edit, x22 y179 w90 h20 vTimeweap, %Timeweap%
Gui, Add, Edit, x232 y179 w90 h20 vPage, %page%
Gui, Add, GroupBox, x222 y159 w110 h50 , ���-�� ����� � ����. �� ������ 12.
Gui, 2:Add, Hotkey, x12 y19 w50 h20 vHotKey1, %HotKey1%
GuiControl, ChooseString, HotKey1, %HotKey1%
Gui, 2:Add, Text, x72 y19 w100 h30 , - �������� "������-����".
Gui, 2:Add, Hotkey, x12 y59 w50 h20 vHotKey2, %HotKey2%
Gui, 2:Add, Text, x72 y59 w110 h30 , - �������� "�����" (57v`, 66).
Gui, 2:Add, Hotkey, x12 y99 w50 h20 vHotKey3, %HotKey3%
Gui, 2:Add, Text, x72 y99 w130 h20 , - �������� "������".
Gui, 2:Add, Hotkey, x12 y139 w50 h20 vHotKey4, %HotKey4%
Gui, 2:Add, Text, x72 y139 w130 h20 , - ���� "�����".
Gui, 2:Add, Hotkey, x12 y179 w50 h20 vHotKey5, %HotKey5%
Gui, 2:Add, Hotkey, x12 y219 w50 h20 vHotKey6, %HotKey6%
Gui, 2:Add, Hotkey, x12 y259 w50 h20 vHotKey7, %HotKey7%
Gui, 2:Add, Hotkey, x12 y299 w50 h20 vHotKey8, %HotKey8%
Gui, 2:Add, Text, x72 y179 w140 h20 , - �������� �� ������.
Gui, 2:Add, Text, x72 y219 w140 h30 , - ����� ������ � ������.
Gui, 2:Add, Text, x72 y259 w50 h20 , - �����
Gui, 2:Add, Edit, x122 y259 w30 h20 vlimit, %limit%
Gui, 2:Add, Text, x162 y259 w40 h20 , ��\���
Gui, 2:Add, Text, x72 y299 w140 h20 , - ��������� ����� + F8
Gui, Font,, Comic Sans MS
Gui, 2:Font,, Comic Sans MS
Gui, 2:Add, Button, x80 y329 w160 h30 gSaveButton, ��������� �������
Gui, Add, Button, x12 y519 w100 h30  gButtonSave, ���������!
Gui, Add, Button, x12 y479 w100 h30 gDownloadSamp, ������� SAMP
Gui, Add, Button, x122 y519 w100 h30 gOpen, ������!!!
Gui, Font, CBlack, Counter new
Gui, Add, Text, x42 y249 w75 h30 +Center, ��������� ������
Gui, Font, CRed Italic, Verdana
Gui, Add, Text, x12 y399 w200 h30 , - ������ �� ������� � ���� - F1
Gui, Font, CBlack Italic, Verdana
Gui, Add, Text, x12 y429 w210 h40 , - �� �������� F1 ��� ���� ������ ? - ������ ���� ������ SAMP'a ����� �� ������...
Gui, Show, w788 h565, Adjutant by Cooper << %vupd% >>
return
animation:
Gui, Submit, NoHide
WinGetPos, X, Y, W,, ahk_id %hGui1%
Gui, +AlwaysOnTop
Loop
{
    Sleep, 10
    Gui, 2:Show, % "x" (x2 := X - A_Index*4) " y" Y+100 " w" 250 " h" 365 " NA", ���������
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
    SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n��������� SAMP
    URLDownloadToFile, https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/samp.exe, %a_temp%\samp.exe
    sleep, 500
    SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n��������� ����������
    sleep, 500
    SplashTextoff
    run, %a_temp%\samp.exe
}
return
Open:
GuiControlGet, Page,, Page
if Page <= 11
{
    MsgBox, 16, ��������� ������ �� ��������!., �������� /pagesize ������ 12-�. `n������� �������� - %Page%. `n�������� �������� � ��������� �������!
    return
}
TrayTip, Officer Adjutant by Cooper, �� ��������� ������!                                               ������� � ���� F1 ��� ���� ���-�� ������� � ����.,4,1
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
if Sex = �������
{
    Female =
    Female1 = ��
    Female2 = ������
    Female3 = ����
    Female4 = ��
    Female5 = ��
    Female6 =
    Female7 = ��
    Female8 = ��
    Female9 = ����
    Female10 = ���
    Female11 = ��
    Famele12 = 'a
    Famele13 = ��
}
if Sex = �������
{
    Female = �
    Female1 = ��
    Female2 = ����
    Female3 = ���
    Female4 = ���
    Female5 = ���
    Female6 = ��
    Female7 = ��
    Female8 = ���
    Female9 = ����
    Female10 = ���
    Female11 = ����
    Famele12 =
    Famele13 = ��
}
if Organ = SAPD
{
    Org = �������
    Org1 = SAPD
    Org2 = ���������� ������� SA
    Org3 = ������ ������� San Andreas
    Org4 = ���������� ������� San-Andreas
    Org5 = ��������� ���������� ������� SA
    Org7 = �������
    if (engver = 1)
    {
        Org6 := "PDHQ"
    }
    else
    Org6 = ������ ����
}
if Organ = FBI
{
    Org = ������������ ����
    Org1 = FBI
    Org2 = ������������ ����
    Org3 = ����� ������������ ���� �������������
    Org4 = ���������� ���� �������������
    Org5 = ����� ������������ ���� LS
    Org7 = ����������� ����
    if (engver = 1)
    {
        Org6 := "Garage FBI"
    }
    else
    Org6 = ������ ���
}
if Organ = SWAT
{
    Org = ������������ �������������
    Org1 = SWAT
    Org2 = C����������� �������������
    Org3 = ������ ������������ �������������
    Org4 = ����������� ������������� SA
    Org5 = ������ ����. ������������� SA
    Org7 = �������
    if (engver = 1)
    {
        Org6 := "Garage SWAT"
    }
    else
    Org6 = ������ ����
}
if Organ = CIA
{
    Org = ����������������� ���������
    Org1 = CIA
    Org2 = ����������������� ���������
    Org3 = ����� ����������������� ��������.
    Org4 = ����������� ���������������� ��������.
    Org5 = ����� ����������������� �������� SA.
    Org7 = ����������� ��������
    if (engver = 1)
    {
        Org6 := "Garage CIA"
    }
    else
    Org6 = ������ ���
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
ReadSettingsInfo:
SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n�������� ������
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
IniRead, limit, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, Limit
IniRead, Page, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Chat, Page
if (RadioGroup1 == 1){
    Ch1 = Checked
}
if (RadioGroup2 == 1){
    Ch2 = Checked
}
if (EngVer == 1){
    Ch3 = Checked
}
if (sex = �������){
    IniWrite, �������, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Sex
}
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
sleep, 200
SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n�������� ������
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
SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n�������� ��� ����������
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
IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
SplashTextOn, , 60, �������� ����������,  ��������`n------------------------`n�������� ��� ����������
sleep, 1000
SplashTextoff
return
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
        addChatMessage("{FFFFFF}           - ��� ������� ��������: {F63939}" N " [" kid[0]"]" )
            sleep, 50
        addChatMessage("{FFFFFF}                 - �������� ����������: {F63939}" Speed " ��/�"  )
        addChatMessage("{FFFFFF}                - ������������ ��������: {F63939}" M )
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
        addChatMessage("{FFFFFF}�� ���������� ���������� � ������. {F63939}�������� �������� ������:" )
            sleep, 50
            While(k<4)
            {
            addChatMessage("{FFFFFF}{F63939}�������{FFFFFF} '{00BFFF}Numpad " k+1 "{FFFFFF}' ��� ������ - {F63939}" getPlayerNameById(kid[k])" ["kid[k]"]" )
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
            addChatMessage("{FFFFFF}           - ��� ������� ��������: {F63939}" getPlayerNameById(kid[0]) " [" kid[0]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - �������� ����������: {F63939}" Speed " ��/�"  )
            addChatMessage("{FFFFFF}                - ������������ ��������: {F63939}" M )
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
            addChatMessage("{FFFFFF}           - ��� ������� ��������: {F63939}" getPlayerNameById(kid[1]) " [" kid[1]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - �������� ����������: {F63939}" Speed " ��/�"  )
            addChatMessage("{FFFFFF}                - ������������ ��������: {F63939}" M )
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
            addChatMessage("{FFFFFF}           - ��� ������� ��������: {F63939}" getPlayerNameById(kid[2]) " [" kid[2]"]" )
                sleep, 50
            addChatMessage("{FFFFFF}                 - �������� ����������: {F63939}" Speed " ��/�"  )
            addChatMessage("{FFFFFF}                - ������������ ��������: {F63939}" M )
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
            addChatMessage("{FFFFFF}           - ��� ������� ��������: {F63939}" getPlayerNameById(kid[3]) " [" kid[3]"]" )
            addChatMessage("{FFFFFF}                 - �������� ����������: {F63939}" Speed " ��/�"  )
                sleep, 50
            addChatMessage("{FFFFFF}                - ������������ ��������: {F63939}" M )
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
    addChatMessage("{FFFFFF} � ������� ���� ����, �� ��� �� ������������� / {F63939}��������� �����. " )
        sleep, 50
    addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
        sbros:=1
    }
}
else
{
addChatMessage("{FFFFFF} <<< ============= Officer {00FF00}Adjutant {FFFFFF}========== >>>"  )
addChatMessage("{FFFFFF}                          {00BFFF}P{FFFFFF}ocket {00BFFF}P{FFFFFF}ersonal {00BFFF}C{FFFFFF}omputer"  )
addChatMessage("{FFFFFF} ������������ �������� �� ���������� / {F63939}��������� �����. " )
    sleep, 50
addChatMessage("{FFFFFF} <<< ==================================== >>>"  )
    sbros:=1
}
Return
Active6:
if (sbros==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� �� ����� ������� ���������� � �������� � ����������. {F63939}Don't fuck the system.")
}
else
{
    sbros:=1
    su:=-1
    k:=0
    start_time:=0
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���������� �� �������� � ���������� ���� {00FF00}��������.")
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
    FileRead, info, %checkfile%
    text = %info%
    if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
    {
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        FileRead, info, %checkfile%
        text = %info%
    }
    if text contains 10-55,*55,'55
    {
        1055:=1
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
        showGameText("RADIO", 1000, 1)
        1057v:=0
        1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    }
    if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
    {
        1057v:=1
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
        showGameText("RADIO", 1000, 1)
        1055:=0
        1066:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    }
    if text contains 10-66,*66,'66
    {
        1066:=1
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
        showGameText("RADIO", 1000, 1)
        1057v:=0
        1055:=0
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    }
    if text contains �����
    {
        Sleep, 1500
        SendChat("/rb �")
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
    }
}
return
TakeGun:
TempWeapon := getPlayerWeaponId()
if (TempWeapon = 24) and (TazerOut != 2) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do ������������������� �������� *Baretta 92* ��������� � ������ � ��������" Female1 " " Org ".")
        Sleep, %sleepingtime%
        SendChat("/me �������� �������� ��������� ����� *Baretta 92* ������� ��� �� ������.")
        TazerOut:=2
    }
    if (randt = 2) {
        SendChat("/do � ������, ������� �� ����� ��������" Female1 " " Org ", ��������� �������� *Beretta 92*.")
        Sleep, %sleepingtime%
        SendChat("/me ������ ��������� ������ ���� ���������" Female " ������, ����� ���� �����" Female " ��������.")
        TazerOut:=2
    }
}
if (TempWeapon = 3) and (TazerOut != 3) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me ������� ��������� ����, ��������" Female " �������� �������, �� ��� ������" Female " � � �����.")
        Sleep, %sleepingtime%
        SendChat("/me ������ ���� ����, ��������� �������" Female " ��������������� �������.")
        TazerOut:=3
    }
    if (randt = 2) {
        SendChat("/do �� ����� ����� ��������������� �������.")
        Sleep, %sleepingtime%
        SendChat("/me ��������" Female " ��������������� ������� � �����, ����� ���� �������" Female " �.")
        TazerOut:=3
    }
}
if (TempWeapon = 23) and (TazerOut != 4) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me ����" Female " ������������ � ������ ������� ��� ���������� � �����.")
        TazerOut:=4
    }
    if (randt = 2) {
        SendChat("/do �� ����� ���������� ������������ *Tazer*, ����������� � �����.")
        Sleep, %sleepingtime%
        SendChat("/me ����������" Female " �����, ����� ���� �����" Female " *Tazer* �� ����.")
        TazerOut:=4
    }
}
if (TempWeapon = 25) and (TazerOut != 5) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do �� ������ ��������� �������� *Remington 1100 " Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me �������" Female " �������� ����� ������, ������" Female " ��� ��-�� ����� � ������ ����" Female ".")
        TazerOut:=5
    }
    if (randt = 2) {
        SendChat("/me �������" Female " �� �� ����� �������� *Remington 1100 " Org1 "* � �������.")
        Sleep, %sleepingtime%
        SendChat("/me �������� ����� �����������" Female " �������� ������.")
        TazerOut:=5
    }
}
if (TempWeapon = 29) and (TazerOut != 6) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do �� ����� ����� ����-������� MP-5.")
        Sleep, %sleepingtime%
        SendChat("/me ����" Female " MP-5 � ����, ����� ���� ����" Female " ����������� � ��������������.")
        TazerOut:=6
    }
    if (randt = 2) {
        SendChat("/me �������" Female " ��-�� ����� �������������� ������ MP-5.")
        Sleep, %sleepingtime%
        SendChat("/me ���������" Female " ������ �� �������������� ������.")
        TazerOut:=6
    }
}
if (TempWeapon = 31) and (TazerOut != 7) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me ������" Female " ������� M16A4, �������" Female " ����� �� �����, ����� ���� ����" Female " ��������������.")
        Sleep, %sleepingtime%
        SendChat("/do ������� ����� � ����� ��������" Female1 " " Org ", � ������ ����������.")
        TazerOut:=7
    }
    if (randt = 2) {
        SendChat("/do �� ������ ����� ����� ��������� �������� *M16A4*.")
        Sleep, %sleepingtime%
        SendChat("/me ��������� ������ ���� ����" Female " �������� � ����� ��������� ������ �� �������������� ������.")
        TazerOut:=7
    }
}
if (TempWeapon = 17) and (TazerOut != 8) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me �����" Female " ����������.")
        Sleep 2000
        SendChat("/me ������" Female " ������������ �������.")
        TazerOut:=8
    }
    if (randt = 2) {
        SendChat("/me �������" Female " � ����������� �� ����� ������� ������� *ESG 2*.")
        Sleep, %sleepingtime%
        SendChat("/me ��������" Female " ���� � ����������" Female4 " � ������.")
        TazerOut:=8
    }
}
if (TempWeapon = 1) and (TazerOut != 9) {
    SendChat("/me �����" Female " ������ �� ����.")
    TazerOut:=9
}
if (TempWeapon = 5) and (TazerOut != 10) {
    SendChat("/me ����" Female " ����������� ���� � ����.")
    TazerOut:=10
}
if (TempWeapon = 14) and (TazerOut != 11) {
    SendChat("/me ���������" Female " ����� ������.")
    TazerOut:=11
}
if (TempWeapon = 30) and (TazerOut != 12) {
    SendChat("/me ����" Female " ������� ��-47 � ����.")
    TazerOut:=12
}
if (TempWeapon = 33) and (TazerOut != 13) {
    SendChat("/me ����" Female " �������� � ����.")
    TazerOut:=13
}
if (TempWeapon = 34) and (TazerOut != 14) {
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me ������" Female " ����������� �������� ��-�� �����.")
        Sleep, %sleepingtime%
        SendChat("/me ����" Female " ����������� �������� � ��������������.")
        TazerOut:=14
    }
    if (randt = 2) {
        SendChat("/me �������" Female " �� �� ����� ����� ��� ����������� �������� � �������� *" Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me ������" Female " ����� � �������" Female " �� ���� ����������� �������� *M82A1*.")
        Sleep, %sleepingtime%
        SendChat("/me ���������" Female " ����������� ������ �� ������ ����.")
        Sleep, %sleepingtime%
        SendChat("/me �������" Female " � �������� ������� ������ ������� *12.7x99 ��* � ������� -����-.")
        TazerOut:=14
    }
}
if (TempWeapon = 43) and (TazerOut != 15) {
    SendChat("/me ������" Female " �����������.")
    TazerOut:=15
}
if (TempWeapon = 46) and (TazerOut != 16) {
    SendChat("/me ����" Female " ������� �� �����.")
    TazerOut:=16
}
if (TempWeapon = 15) and (TazerOut != 17) {
    SendChat("/me ������" Female " ���������� ������.")
    TazerOut:=17
}
if (TempWeapon = 36) and (TazerOut != 18) {
    SendChat("/me ����" Female " Stinger � ����.")
    TazerOut:=18
}
if (TempWeapon = 2) and (TazerOut != 19) {
    SendChat("/me ����" Female " ������ � ����.")
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
        SendChat("/do �� ����� ��������" Female1 " " Org ", ���������� ������� ������ � ��������� *" Org1 "*.")
        Sleep, %sleepingtime%
        SendChat("/me ����� ���� ������ ����� �����, �������" Female " �������� �������.")
    }
    if (randt = 2) {
        SendChat("/me ������" Female " �������� *Beretta 92* � ������, ����� ���� ���������" Female " �.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 3)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me ������ ��������" Female " ��������������� ������� �� �����.")
        Sleep, %sleepingtime%
        SendChat("/do ������� � ��������" Female1 " " Org " ��������� �� �����.")
    }
    if (randt = 2) {
        SendChat("/me ������" Female " ��������������� ������� �� ����, ������ �������� ��.")
    }
}
if not (TempWeapon = 23) and (TazerOut = 4)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me �������" Female " ������������ �� ����.")
    }
    if (randt = 2) {
        SendChat("/me ��������" Female " ������������ *Tazer*, ����� ���� ��������" Female " ��� � �����, �� ����.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 5)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do � ����� ����� ��������" Female1 " " Org2 ", ��������� ��������.")
        Sleep, %sleepingtime%
        SendChat("/me ������ ��������� ��� ��������� ����������" Female " ���, ����� ���� ������" Female " ��� �� �����.")
    }
    if (randt = 2) {
        SendChat("/me �����" Female " �� ����� �������� *Remington 1100*. � ����������� *" Org1 "*.")
    }
}
if not (TempWeapon = 3) and (TazerOut = 6)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/me �������" Female " *MP-5* �� �����.")
    }
    if (randt = 2) {
        SendChat("/me �����" Female " �������������� ������ *MP-5* �� �������.")
    }
}
if not (TempWeapon = 31) and (TazerOut = 7)
{
    Random, randt, 1, 2
    if (randt = 1) {
        SendChat("/do ������� ��������� �� ����, �� �������, ������� �������.")
        Sleep, %sleepingtime%
        SendChat("/me ����� ���� ������ ����� �����, ������" Female " ������ ����� ����� � �������" Female " ������� �������.")
    }
    if (randt = 2) {
        SendChat("/me �����" Female " �� ����� �������������� ������ *M16A4* � �������.")
    }
}
if not (TempWeapon = 1) and (TazerOut = 9)
{
    SendChat("/me ����" Female " ������.")
}
if not (TempWeapon = 5) and (TazerOut = 10)
{
    SendChat("/me �������" Female " ����.")
}
if not (TempWeapon = 14) and (TazerOut = 11)
{
    SendChat("/do ����� �� � �����.")
}
if not (TempWeapon = 30) and (TazerOut = 12)
{
    SendChat("/me �����" Female " ��-47 �� �����.")
}
if not (TempWeapon = 33) and (TazerOut = 13)
{
    SendChat("/me �����" Female " ��������.")
}
if not (TempWeapon = 34) and (TazerOut = 14)
{
    SendChat("/me ��������" Female " ����������� �������� �� ��������������.")
    Sleep, %sleepingtime%
    SendChat("/me �������" Female " ����������� �������� �� �����.")
}
if not (TempWeapon = 43) and (TazerOut = 15)
{
    SendChat("/me ������" Female " ��������� �������� ������������.")
}
if not (TempWeapon = 46) and (TazerOut = 16)
{
    SendChat("/me ����" Female " �������.")
}
TazerOut:=0
SetTimer UnloadGun, Off
return
Active7:
active := !active
SendChat((active ? "/limit " limit "":"/limit 0"))
Return
Active8:
random, randt, 1, 2
if (randt == 1)
{
    SendChat("/me �������" Female " �����, ��������" Female " �� ���� �����*G-Shock* � �����������*FRAPS*.")
    Sleep, %sleepingtime%
    SendChat("/time")
    sleep, 200
Sendinput, {f8}{Enter}
}
if (randt == 2)
{
    SendChat("/me �������� ����� ������" Female " ������ ���� � ����, ����� ���� ���������" Female " �� ����*iTimes*")
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
if text contains ���� �������������� �� ����� ������!
{
    random, randtmask, 1, 2
    if (randtmask == 1)
    {
        SendChat("/do � " name "'� �� ���������� ������� ������� ���� ���������.")
        Sleep, %sleepingtime%
        SendChat("/me �������" Female " ���� ������ ����� �� ����������� �������, ������� ��������� ������" Female " �.")
        Sleep, %sleepingtime%
    }
    if (randtmask == 2)
    {
        SendChat("/do � " surname "'� ���� ����� ������������ ��������� ������ �������.")
        Sleep, %sleepingtime%
        SendChat("/me ���������" Female " ������ ����� ���� ������" Female " �� ���� �����, ����� �����" Female " �.")
        Sleep, %sleepingtime%
    }
}
else if text contains �� ����� �����!
{
    if (randtmask == 1)
    {
        SendChat("/do � " name "'� �� ���� ������ ���������.")
        Sleep, %sleepingtime%
        SendChat("/me ����" Female11 " ��� ���� � ���� � ����" Female " ���������, ����� ���� �������" Female " � � ������.")
        Sleep, %sleepingtime%
    }
    if (randtmask == 2)
    {
        SendChat("/do � " surname "'� ������ ����� �� ���� ������� ���������� ���������.")
        Sleep, %sleepingtime%
        SendChat("/me ���������" Female " ������ ����� ����" Female " ����� � ���� � �������" Female " � � ������.")
        Sleep, %sleepingtime%
    }
}
FileDelete %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
return
:?:/reps::
random, randt, 1, 2
if (randt == 1)
{
    SendChat("/rep �������������, ����������, ���������� �� ����, ��� ��������� ������ ����.")
}
if (randt == 2)
{
    SendChat("/rep ���������� �� ����, ��� ��������� ������. ���� ��������" Female13 " ���� ����� ������� ��������.")
}
return
Active1:
SendInput, {F6}/pagesize %page%{Enter}
sleep, 75
if (zavers==1){
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������� �� ����������� ���� � ��������� �������.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F2]{FFFFFF} - ���������� ���������� � ������-�����. (c 55)")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - ���������� ��������, ������� ������-����, ��������� /m. (c 55)")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - ��������� ���������� ����� ������������ � ����� �� ������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - ��������� ���������� �� ������ ���� ������� �������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - ��������� ����� � ���� ���������� �� ������������ �����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - ��������� �������������, ��������� /showudost.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - ��������� �������� ���������� ��������. {F63939} '������ � ������'.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - ��������� �������� ���. ����, ��������� /take.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - ��������� ����������� ������, ��������� /ticket.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - ��������� ����������� ���������� {F63939}'�� ���������� ������������'.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� ��������. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
        55� := 1
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (Radio1 = 1 and EngVer = 1)
        {
            SendChat("/r " Marking " to DISP: *55, Code *four*, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY **")
        }
        else if (Radio1 = 1 and EngVer = 0)
        {
            SendChat("/r " Marking " to DISP: *55, ��� *������*, *20 " getPlayerZone() ", " M " [AT" su "" City "], ����������, �����**")
        }
        else if (Radio2 = 1)
        {
            if (partner>=1)
            {
                SendChat("/r " Tag " ����������� " surname " | ���������� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
            }
            else
            SendChat("/r " Tag " ����������� " surname " | ��������� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
        }
        restarting:=1
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
        goto, obratka4
    }
    if ErrorLevel = EndKey:Numpad1
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� �������� ���������� � �������� / {FFFFFF}������� [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do �� ������� ������������ ������� ����� �������.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " � �������, ����" Female " �������, ������" Female6 " ��� �� ���, ������" Female ":")
            }
            if (randt = 2)
            {
                SendChat("/do ����� ��������� ����� �������.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " � ��������, ����� ���� ����" Female " ��� �������" Female4 " �� ���� ������:")
            }
            if (randt = 3)
            {
                SendChat("/do �� ������� ��� ��������� �������.")
                Sleep, %sleepingtime%
                SendChat("/me ��������" Female " �������� ��������, ����� ���� ����" Female " ��� � �������.")
                Sleep, %sleepingtime%
                SendChat("/do ������� ��������� � ���� � " name "" Female12 ".")
            }
            Sleep, %sleepingtime%
            if (M = "Coach") or (M = "Bus")
            {
                SendChat("/m - �������� ��������, ���������� ���������� � �������, ��� " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - ����������� ��������� ������� � ��������, � �� �������� �� ��������.")
            }
            else if (M = "Cabbie") or (M = "Taxi")
            {
                SendChat("/m - �������� �����, ���������� ���������� � �������, ��� " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - �� �������� �� ������ ������������� �������� � ����������� ��������� ������� � ������!")
            }
            else if (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
            {
                SendChat("/m - �������� ���������, ���������� ���������� � �������, ��� " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - �������� ��� ������ ��������� �� �������, � ���� �� ����. �������� �� ��������� - ���������!")
            }
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer")
            {
                SendChat("/m - �������� ��������� " M ", ���������� ���������� � �������, ��� " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - ����������� ��������� ���� ���������, � �������� ���� ����� ���������!")
            }
            else if (M = "Quad")
            {
                SendChat("/m - �������� �����������, ���������� ���������� � �������, ��� " Org1 "!")
                Sleep, %sleepingtime%
                SendChat("/m - ����������� ��������� ���� ���������, � �������� ���� ����� �����������!")
            }
            else
            {
                Random, randt, 1, 3
                if (randt = 1) {
                    SendChat("/m - ������� ��������� " Org2 ". �������� ���������� ����� - *" M "*.")
                    Sleep, %sleepingtime%
                    SendChat("/m - ����������� ��������� ������� � ������, � �� �������� �� ������ ������������� ��������.")
                }
                if (randt = 2) {
                    SendChat("/m - ������� " Org1 "! �������� *" M "*. ������������ � ������� � ��������� ���������!")
                    Sleep, %sleepingtime%
                    SendChat("/m - �� �������� �� ������ ������������� �������� � ����������� ��������� ������� � ������!")
                }
                if (randt = 3) {
                    SendChat("/m - �������� ���������� *" M "*, ���������� � ������� � ��������� �����������.")
                    Sleep, %sleepingtime%
                    SendChat("/m - �������� ��������� �� �������, � ���� �� ����. �������� �� ������ - ���������!")
                }
            }
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/me �������� �������� �������" Female " ������� ������� �� �������.")
            }
            if (randt = 2)
            {
                SendChat("/me �����" Female6 " ���� ���������� �� ���������������, �������" Female " ������� �� �����.")
            }
            if (randt = 3)
            {
                SendChat("/me �������� ��������, ������" Female4 " � ������, ��������" Female " ������� �� �������.")
            }
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/me ��������" Female " ����� �������� �� ���, ����� ���� ��������" Female " � ����� ���������� ���������.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � ������ ����� ���������" Female " ������ ����� ���� ������" Female " �����.")
        }
        if (randt = 2) {
            SendChat("/me ���������" Female " ������, ��������� ����� � �����, ������� ����� �� ���� ������" Female " �����.")
            Sleep, %sleepingtime%
            SendChat("/me �����" Female " �� �������, ����� ���� ��������" Female4 " � ������ ������� ���� �����.")
        }
        if (randt = 3) {
            SendChat("/me ���� ������ ������������ ��������" Female " ���������� ��������� ������ ������������ � ������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ����� ������" Female " ����� �������, ����� ���� ���" Female7 " �� ������.")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("/me ������� ���� ����������, �������" Female4 " ������� � ���������, ��� ����� ������� ���������.")
        }
        if (randt = 2) {
            SendChat("/me ������������� � ���� ��������, ������" Female " ����� �� ���������, �������" Female " ���������.")
        }
        if (randt = 3) {
            SendChat("/me �������" Female " ��������� �� ��������� ����������, ����� ������� ����������� �� ������ ��������.")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        SendChat("/me ������ ������������ �����, ��������� ��������" Female " � ���� ����� ��������.")
        Sleep, %sleepingtime%
        SendChat("/todo �������� ���� ����������. *��������� ������� �������� � ������ � ��� ��� ����� ������� ����.")
        Sleep, %sleepingtime%
        SendChat("/me �������� ����������� ���� ��������, ����� ����� ����������.")
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 3
        if (randt = 1) {
            SendChat("������������, " Org5 ": " name " " surname " ���������.")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ������������� ���������� " Org ".")
            Sleep, %sleepingtime%
        }
        if (randt = 2) {
            SendChat("������ ���� ���������, ���� ����� ������ ��������� " Org ": " name " " surname ".")
            Sleep, %sleepingtime%
            SendChat("/me ������ ����� ������" Female " �������� ����� ������������� ���������� " Org ".")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
        }
        if (randt = 3) {
            SendChat("������������, ��� ��������� ��������� " Org2 " - " surname ".")
            Sleep, %sleepingtime%
            SendChat("/do ������� �������� ������ ����� �������������.")
            Sleep, %sleepingtime%
            SendChat("/anim 17")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ���� �������" Female " �������������, ������� ��� �������� ��������.")
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
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� � ������. / {F63939}������ � ������, � ��������� ��������.")
            goto, obratka4
        }
        else
        {
            Random, randt, 1, 2
            if (randt = 1) {
                SendChat("/do ���������� �������� �������� ����� " name "� � ������ ����������.")
                Sleep, %sleepingtime%
                SendChat("/me ������" Female " �� ��� ����� ���� � ����� �������" Female " ���.")
                Sleep, %sleepingtime%
                SendChat("/me ���" Female7 " � ���� �������������, ���������" Female " ������ ���������� ����� ���� �������� ���.")
                Sleep, %sleepingtime%
                SendChat("/do ���������� �������� �������� ����� ���� ����������.")
                Sleep, %sleepingtime%
                SendChat("/wanted")
            }
            if (randt = 2) {
                SendChat("/do � ���������� ���������� �������� ���������.")
                Sleep, %sleepingtime%
                SendChat("/me �������� ������ �� ������ ����������, ����� � ���� *Staff wanted criminalsl*.")
                Sleep, %sleepingtime%
                SendChat("/me ����� �� ���������� ��� ���������� � �������� ����� � � ���������.")
                Sleep, %sleepingtime%
                SendChat("/do ���������� � �������� ����������� �� �������� ���������.")
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
            SendChat("/do � ���� � " name "� ��� ���������� ������������.")
            Sleep, %sleepingtime%
            SendChat("/me ���" Female7 " � ������ ��������, ����� ���� ���" Female " ������ � ����������.")
            Sleep, %sleepingtime%
            SendChat("/me �������� ������, �����" Female " �� [Enter], ����� ���� ��������" Female " ������������.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        if (randt = 2) {
            SendChat("/me ������ ����� �� �������� ������� ������" Female " �����, ����� �����.")
            Sleep, %sleepingtime%
            SendChat("/do ����� � ����� � ����� � " name "�.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ����� ������, �������� ������ ��������.")
            Sleep, %sleepingtime%
            SendChat("/do ����� ��������� ����� ��������" Female " �����.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        if (randt = 3) {
            SendChat("/me ������ �� ����������� ������� ������� ������� ��� ����.")
            Sleep, %sleepingtime%
            SendChat("/me ������ � ���������� ����������� ��������, ������� �� � �������.")
            Sleep, %sleepingtime%
            SendChat("/take")
        }
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        SendMessage, 0x50,, 0x4190419,,A
        SendChat("/do �� ����� � " name "� ������� � ������� ��� �������.")
        Sleep, %sleepingtime%
        SendChat("/me ������ ��������� ����, ���������� ���� �����, ����� ���� ��� � ����.")
        Sleep, %sleepingtime%
        SendChat("/me ��������� ����� ���� ����� �� ���������� �������.")
        Sleep, %sleepingtime%
        SendChat("/do ����� ��������� ����� ��������" Female " ����� ���������.")
        Sleep, %sleepingtime%
        SendChat("/me �������" Female " �������� �������� ����������� �����.")
        Sleep, %sleepingtime%
    SendInput {F6}/ticket{space}
        KeyWait, Enter, D
        goto, obratka4
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        SendChat("������, �� ���� ��� � ��� ��������, �� ��� ��� �����, ��� �� �����.")
        Sleep, %sleepingtime%
        SendChat("/todo ���������� ������. � ��, � ����� �� ����. *�������������� ���� ����� �������� � ����� �� ����.")
        Sleep, %sleepingtime%
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������������� ������ �� ���� �����. {00FF00}����������� ������.")
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ��������. {00FF00}����������� ������.")
    }
    zavers:=0
}
return
Active2:
SendInput, {F6}/pagesize %page%{Enter}
sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������� �� ����������� ���� � ��������� �������.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F2]{FFFFFF} - ���������� ���������� � ����� � ������ (c 57v).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[F3]{FFFFFF} - ���������� ���������� � ����� � ��������� ����������� ����� (c 66).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - ���������� ���������� ������, ��������� /m - (c 57v) {F63939} *��� �����������*.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - ��������� �������� � ���������� ����� �� ������ � ���� �� �������, ��������� /m. (c 66).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - ��������� �� ����� ���������� ���������, ��������� /cuff.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - ������� ���������� �� �����, ��������� /gotome.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - �������� ����������� � ������, ��������� /cput.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - �������� ������� ������� ����������, � ������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - �������� ���������� � �������, ��������� /ceject.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - ������� ���, ����� ���� �������� ����������� �� ������� ��������� /arrest.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� ��������. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� �������� ���������� � �������� / {FFFFFF}������� [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            57v := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
            }
            if (randt = 2)
            {
                SendChat("/me ����" Female " ����������� ����� � �����������")
                Sleep, %sleepingtime%
                SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
            }
            if (randt = 3)
            {
                SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
                Sleep, %sleepingtime%
                SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
            }
            Sleep, %sleepingtime%
            if (Radio1 = 1 and EngVer = 1)
            {
                SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY **")
            }
            else if (Radio1 = 1 and EngVer = 0)
            {
                SendChat("/r " Marking " to DISP: *57V, *20 " getPlayerZone() ", " M " [AT" su "" City "], ����������, �����**")
            }
            else if (Radio2 = 1)
            {
                if (partner>=1)
                {
                    SendChat("/r " Tag " ����������� " surname " | ������ �� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
                }
                else
                SendChat("/r " Tag " ����������� " surname " | ������ ��  " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
            }
            restarting:=1
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
            }
            if (randt = 2)
            {
                SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
            }
            if (randt = 3)
            {
                SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
            }
        }
        goto, obratka3
    }
    if ErrorLevel = EndKey:F3
    {
        if (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� �������� ���������� � �������� / {FFFFFF}������� [{F63939}" NameKey6 "{FFFFFF}]")
        }
        else if (sbros == 0)
        {
            66c := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
            }
            if (randt = 2)
            {
                SendChat("/me ����" Female " ����������� ����� � �����������")
                Sleep, %sleepingtime%
                SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
            }
            if (randt = 3)
            {
                SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
                Sleep, %sleepingtime%
                SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
            }
            Sleep, %sleepingtime%
            if (Radio1 = 1 and EngVer = 1)
            {
                SendChat("/r " Marking " to DISP: *66, Code *one*, *20 " getPlayerZone() ", " M " [AT" su "" City "], nRFR, OVER SAY**")
            }
            else if (Radio1 = 1 and EngVer = 0)
            {
                SendChat("/r " Marking " to DISP: *66, ���*����*, *20 " getPlayerZone() ", " M " [AT" su "" City "], ������., �����**")
            }
            else if (Radio2 = 1)
            {
                if (partner>=1)
                {
                    SendChat("/r " Tag " ����������� " surname " | ���������� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
                }
                else
                SendChat("/r " Tag " ����������� " surname " | ��������� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
            }
            restarting:=1
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
            }
            if (randt = 2)
            {
                SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
            }
            if (randt = 3)
            {
                SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
            }
        }
        goto, obratka3
    }
    if ErrorLevel = EndKey:Numpad1
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� �������� ���������� � �������� / {FFFFFF}������� [{F63939}" NameKey6 "{FFFFFF}]")
            goto, obratka3
        }
        else if (sbros == 0)
        {
            57v := 1
            Random, randt, 1, 3
            if (randt = 1)
            {
                SendChat("/do �� ������� ������������ ������� ����� �������.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " � �������, ����" Female " �������, ����� ������" Female6 " ��� �� ���, ������:")
            }
            if (randt = 2)
            {
                SendChat("/do ����� ��������� ����� �������.")
                Sleep, %sleepingtime%
                SendChat("/me �������" Female4 " � ��������, ����� ���� ����" Female " ��� �������" Female4 " �� ����, ������:")
            }
            if (randt = 3)
            {
                SendChat("/do �� ������� ��� ��������� �������.")
                Sleep, %sleepingtime%
                SendChat("/me ��������" Female " �������� ��������, ����� ���� ����" Female " ��� � �������.")
                Sleep, %sleepingtime%
                SendChat("/do ������� ��������� � ���� � " name "" Female12 ".")
            }
            Sleep, %sleepingtime%
            if (M = "Coach") or (M = "Bus")
            SendChat("/m - �������� ��������, ���������� ���������� � �������, ��� " Org1 "!")
            else if (M = "Cabbie") or (M = "Taxi")
            SendChat("/m - �������� �����, ���������� ���������� � �������, ��� " Org1 "!")
            else if (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
            SendChat("/m - �������� ���������, ���������� ���������� � �������, ��� " Org1 "!")
            else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer")
            SendChat("/m - �������� ��������� " M ", ���������� ���������� � �������, ��� " Org1 "!")
            else if (M = "Quad")
            SendChat("/m - �������� �����������, ���������� ���������� � �������, ��� " Org1 "!")
            else
            Random, randt, 1, 2
            {
                if (randt == 1)
                {
                    SendChat("/m - ������� " Org3 ". �������� ���������� ����� - *" M "* ")
                    Sleep, %sleepingtime%
                    SendChat("/m - ���������� � ������� � ��������� ���������! � ��������� ������ �� ����� ������� �����.")
                }
                else if (randt == 2)
                {
                    SendChat("/m - ������� " Org1 "! �������� *" M "*. ������������ � �������, ��� �� ������� �����!")
                }
            }
            Sleep, %sleepingtime%
            if (randt = 1)
            {
                SendChat("/me �������� �������� �������" Female " ������� ������� �� �������.")
            }
            if (randt = 2)
            {
                SendChat("/me �����" Female6 " ���� ���������� �� ���������������, �������" Female " ������� �� �����.")
            }
            if (randt = 3)
            {
                SendChat("/me �������� ��������, ������" Female4 " � ������, ��������" Female " ������� �� �������.")
            }
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        If (sbros == 1)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}Error: {FFFFFF}�� �� �������� ���������� � �������� / {FFFFFF}������� [{F63939}" NameKey6 "{FFFFFF}]")
            goto, obratka3
        }
        else if (sbros == 0)
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ������� ������������ ������� ����� �������.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " � �������, ����" Female " �������, ����� ������" Female6 " ��� �� ���, ������:")
        }
        if (randt = 2)
        {
            SendChat("/do ����� ��������� ����� �������.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " � ��������, ����� ���� ����" Female " ��� �������" Female4 " �� ����, ������:")
        }
        if (randt = 3)
        {
            SendChat("/do �� ������� ��� ��������� �������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " �������� ��������, ����� ���� ����" Female " ��� � �������.")
            Sleep, %sleepingtime%
            SendChat("/do ������� ��������� � ���� � " name "" Female12 ".")
        }
        Sleep, %sleepingtime%
        if (M = "Coach") or (M = "Bus") or (M = "Tanker") or (M = "Linerunner")  or (M = "Roadtrain")
        {
            SendChat("/m - �������� ���� �� ����� ���������, �������� ���� � �������� ���� �� ������.")
            Sleep, %sleepingtime%
            SendChat("/m - �������� � ���������, ���� ����� ��������, �������� ������� �� ������.")
            Sleep, %sleepingtime%
            SendChat("/m - ����� �������� �� ������ � ������� ������ ��������.")
        }
        else if (M = "PCJ-600") or (M = "Faggio") or (M = "Freeway") or (M = "Sanchez") or (M = "FCR-900") or (M = "NRG") or (M = "BF-400") or (M = "Wayfarer") or (M = "Quad")
        {
            SendChat("/m - �������� ���� �� ����� ��������� � �������� ���� �� ������.")
            Sleep, %sleepingtime%
            SendChat("/m - ��������� ����, � �������� � ������������� ��������.")
            Sleep, %sleepingtime%
            SendChat("/m - �� ������������ �� ���� �������� �� �������, ���� �������� �� ������!")
        }
        else
        {
            SendChat("/m - �������� ���� �� ����� ���������, �������� ���� � �������� ���� �� ������.")
            Sleep, %sleepingtime%
            SendChat("/m - �������� � ��������, ���� ����� �������, �������� ���� �� ����...")
            Sleep, %sleepingtime%
            SendChat("/m - ...����� �������� ������� ����� �������.")
            Sleep, %sleepingtime%
            SendChat("/m - ������� �� ���������� � �������� �������� ������ �� ��� � ������ ������.")
            Sleep, %sleepingtime%
            SendChat("/m - ����� �������� �� ������ � ������� ������ ��������.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/me �������� �������� �������" Female " ������� ������� �� �������.")
        }
        if (randt = 2)
        {
            SendChat("/me �����" Female6 " ���� ���������� �� ���������������, �������" Female " ������� �� �����.")
        }
        if (randt = 3)
        {
            SendChat("/me �������� ��������, ������" Female4 " � ������, ��������" Female " ������� �� �������.")
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
            SendChat("/me ������" Female2 " �� ��������, ������� ��������� � ������� ���������.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female3 " ��� ��� ���� �� �����, �������� ���������.")
            Sleep, %sleepingtime%
        }
        if (randt = 2) {
            SendChat("/me �������" Female4 " �� ��������, ��������� ��� ���� ����������� �� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ���������� � �������� ���������, ����� ���� ����" Female " �� �� ����.")
            Sleep, %sleepingtime%
        }
        if (randt = 3) {
            SendChat("/do �� ����� � " surname "� ����� ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female2 " �� ��������, ������ ����� ����" Female " ��������� � ���������.")
            Sleep, %sleepingtime%
        }
        if (randt = 4) {
            SendChat("/do ��������� �� ����� � " surname "�.")
            Sleep, %sleepingtime%
            SendChat("/me ����� ��������� ���� ����" Female " ��������� � �����, ����� �����" Female " �� ������������.")
            Sleep, %sleepingtime%
        }
        if (randt = 5) {
            SendChat("/do ��������� � ������� ����������� � " surname "�.")
            Sleep, %sleepingtime%
            SendChat("/me ���������" Female " �������� �� ������� �����������, ����� ������" Female " ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female2 " �� ��������, �������" Female3 " ��� ��� ���� �� ����� ������� ���������.")
            Sleep, %sleepingtime%
        }
        if (randt = 6) {
            SendChat("/me �������" Female " ���� �����������, ����� �����" Female " �� ���� ���������.")
            Sleep, %sleepingtime%
            SendChat("/todo �� ��������!*������ �������� �� ������.")
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
        if text contains ����� �� ��������� � �������.
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
        SendInput, {F6}/r %Marking% to DISP: *15, �������� ����������, ��� *������*, *20 %zones%, ����������, �����**{SPACE}
        }
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 4
        if (randt = 1) {
            SendChat("/me ���������� �� �������� ��������, �������" Female " ��� �� �����.")
        }
        if (randt = 2) {
            SendChat("/me ����" Female " �� ������� �������� ������ �����, ����� � ����� ������, ����� �����" Female " ��������.")
        }
        if (randt = 3) {
            SendChat("/me �������" Female4 " �� ����� ��������, ����� �����" Female " ��� ����� �����.")
        }
        if (randt = 4) {
            SendChat("/me ����� ��������" Female " ���� �������� ��������, �������" Female " ���, ����� ���� ����" Female " �� �����.")
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
            SendChat("/me ������ ����� ����������� �� ����� ����� ������" Female " �.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �� ������ ����������� � ���������" Female " ����������� � ������.")
            Sleep, %sleepingtime%
            SendChat("/todo ������� �������. ��������.*�������" Female " ������� ������.")
        }
        if (randt = 2) {
            SendChat("/me ����� ������ ����� �����������, ����� ����� ������" Female " ����� ������.")
            Sleep, %sleepingtime%
            SendChat("�� ���, ��������, ���������� ? ���� � �� �������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ����� ������" Female " �������� � ������, ����� ������" Female " ����� ������.")
        }
        if (randt = 3) {
            SendChat("/me ������� � ������������ � ����������, ���������" Female " ��� �� ������ ����������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ����� ���������� ����� ����������� ������ �����, �����" Female " ��� � �����.")
            Sleep, %sleepingtime%
            SendChat("/do � " name "a �� ���� ���� ���� �������� ��������� � �����������, �� " Female5 " ���������" Female " ����.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� �������" Female4 " �� ������ ����������� ����� �����, �����" Female6 " ������� ��� � ����������.")
            Sleep, %sleepingtime%
            SendChat("/me ����� ���� ��� ������" Female " �����������, ���������" Female " ����� ����������.")
        }
        Sleep, 4100
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}����������* - {FFFFFF}������ � ���������� ������-��, �������� ������ ��������� � ���!")
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
        SendChat("�� ������ ����� ������� ��������.")
        Sleep, %sleepingtime%
        SendChat("��, ��� �� �������, ����� � ����� ������������ ������ ��� � ����.")
        Sleep, %sleepingtime%
        SendChat("��� ������� ����� �������������� ��� �������.")
        Sleep, %sleepingtime%
        SendChat("���� �� �� ������ �������� ������ ��������, �� ����� ������������ ��� ������������.")
        Sleep, %sleepingtime%
        SendChat("�� ��������� ���� ����� ?")
        goto, obratka3
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do ����� ��������� ����� ���������� ��� ������ � �����������.")
        }
        if (randt = 2) {
            SendChat("/me ���" Female7 " �� ������, ������" Female " ����� ������, �������" Female " �� ���� ����������� ���" Female8 " ��� � �������.")
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
            SendChat("/me ������" Female " ����� � ������ �� ������ �������� �������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ����� ������, �� ��������� ������� ��������.")
            Sleep, %sleepingtime%
            SendChat("/do ����� ��������� ����� ����� ��� ��������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " �� ������� ����� �� ����������, ����� ���� ����" Female " �� � ����������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " �������, ����� ���� ������" Female " �������� � �� ��.")
        }
        if (randt = 2) {
            SendChat("/do ��� � ������� � " surname "�.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ��� ����� ���� ������� ���, ������" Female " ���� ������ ���.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ������ � ����������� �����������.")
            Sleep, %sleepingtime%
            SendChat("/do ����������� ��������� � ��� - [���� �������].")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " ���, ����� ���� ����" Female " ��������� � ��������������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " �����, ������" Female " �������� � �������.")
        }
        if (randt = 3) {
            SendChat("/me ������ ����������� ����� � �����, ����" Female " ���� � �����, ����� �������" Female " ��� � ��������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ���� ������" Female " ������, ����" Female " � ����������� ���������, ��������" Female " ��� � ���.")
            Sleep, %sleepingtime%
            SendChat("/do ����� �� ������ ��� ��� ��������� � ��������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ������ �� ���� �������� ��, ����� ���� �������" Female " ������ � ����������� �� ����.")
            Sleep, %sleepingtime%
            SendChat("/do ������ ������� �� �����, ���� ������ ��������� � ����� " name "�.")
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
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������������� ������ �� ���� ��������. {00FF00}����������� ������.")
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ��������. {00FF00}����������� ������.")
    }
    zavers:=0
}
return
Active3:
SendInput, {F6}/pagesize %page%{Enter}
sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������� �� ����������� ���� � ��������� �������.")
}
else
{
    zavers:=1
addChatMessage("{FFFFFF} <<< ===============================  Officer {00FF00}Adjutant {FFFFFF}=============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - ��������� ���� ��� �� ����� ������ �� ����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - ��������� ���� ��� �� ����� �� ��������� ����������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - ���������� � /s, � ��� ��� �������� " Org1 ".")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - ��������� �������������� �����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - ��������� ������������� ����� {F63939}*���� ������������� ��������*.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - ����� ������������, ��������� /frisk.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� ��������. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
        SendChat("/me ������" Female " ����� �� ������� ���� ������ ���� ������.")
        Sleep, %sleepingtime%
        SendChat("/do �� ������ �����: Remington 1100 " Org1 ", ������������, ����������.")
        Sleep, %sleepingtime%
        SendChat("/me ����" Female " Remington 1100 " Org1 " � ����� �����, �������" Female " �� �����...")
        Sleep, %sleepingtime%
        SendChat("/me ...����� ���� ���� ������������ � �����, �������" Female " � ������.")
        Sleep, %sleepingtime%
        SendChat("/do �� " name "� ���� ����������� ������ ��� ������.")
        Sleep, %sleepingtime%
        SendChat("/me ����" Female " ���������� � �����, ����� ���� �������" Female " ��� �� ����.")
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/me ������ ���� �� ���������, �������" Female " � �������� ���, ��� ����� ������ ���.")
            Sleep, %sleepingtime%
            SendChat("/do � ��������� ���� ������ ���� ����������, ������� ����� ���� ������������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ������ ����������� �� ��������� ����� ���� ���" Female7 " ������������� ���.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female " ����������� �� �������, ����� ���� ����" Female7 ".")
        }
        if (randt = 2) {
            SendChat("/me ����� ���� � �����, ������" Female " ��������.")
            Sleep, %sleepingtime%
            SendChat("/do � ��������� �������� ���������� � ����, � �������������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ ���������� �� ��������� ���" Female11 " ��� � ������ �����.")
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
            SendChat("/s " Org1 ", ���������� ���� �� ����� � �� ���������!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | ���� ��������, ������ ������. ���� ��� - ������������� ��� ������.")
        }
        if (randt = 2) {
            SendChat("/s ��� " Org1 ", ���� ���� �� �����, ����!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | ���� ��������, ������ ������. ���� ��� - ������������� ��� ������.")
        }
        if (randt = 3) {
            SendChat("/s " Org7 ", ���� ���� �� �����, ������!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | ���� ��������, ������ ������. ���� ��� - ������������� ��� ������.")
        }
        if (randt = 4) {
            SendChat("/s ������ � �����, ���� �� ������, " Org1 "!")
            Sleep, %sleepingtime%
            SendChat("/b /anim 11 | ���� ��������, ������ ������. ���� ��� - ������������� ��� ������.")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do � ����� � " name "� ��� ����� [��� �����] � ��������� [" Org1 "].")
            Sleep, %sleepingtime%
            SendChat("/do �� ����� ���� ����� ������, � 4 ��������� ������� ���������� ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " �� ������ ����� 4 �����.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " �������� �� �������� � ������� ������.")
            Sleep, %sleepingtime%
            SendChat("/do � " name "� � ����� ���� ��������, ������� " Female5 " ������������ ������������.")
            Sleep, %sleepingtime%
            SendChat("/me ����������� ������� ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " ������� � ����� ��������� ������ �����.")
            Sleep, %sleepingtime%
            SendChat("/do � ���������� ���� 2-� �������. �������� � �����.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ��� � ���������� 2 �������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ����� � ����� ��������" Female " ������� ������.")
            Sleep, %sleepingtime%
            SendChat("/try ������������" Female " �����, ������� ����� �� ����")
            Sleep, 200
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� �������������� ����� �� ������ - {F63939}*Numpad 5*")
        }
        if (randt = 2) {
            SendChat("/do �� ����� " name " " surname " ���������� �������� �����. ")
            Sleep, %sleepingtime%
            SendChat("/me ������ ��������� ���������" Female " ����� � ���������, ����� ��������" Female " ��� �� ���, ������" Female ".")
            Sleep, %sleepingtime%
            SendChat("/do " name " " surname " ������" Female " �� ����������� �������� � ������ ����.")
            Sleep, %sleepingtime%
            SendChat("/do �� ������� ����� ��������� 2 �������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " ������ ��������� � ������ �����, ����� ��������" Female " ������ ���������, ����� ����...")
            Sleep, %sleepingtime%
            SendChat("/me ...������ ��������� �������" Female " �������� ������� � ����������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ���������" Female " ������ �����.")
            Sleep, %sleepingtime%
            SendChat("/do ����� ������������ �����.")
            Sleep, %sleepingtime%
            SendChat("/do " name " " surname " ����������� �������� �����, ����� ����" Female " �� ����������� �������.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female " �� ���� ������� ������, ���������" Female " ��� ���������.")
            Sleep, %sleepingtime%
            SendChat("/do ������ �����������, ������� �� ������� ����� �� ������.")
            Sleep, %sleepingtime%
            SendChat("/try ������������" Female " �����, ������� ����� �� ����")
            Sleep, 200
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� �������������� ����� �� ������ - {F63939}*Numpad 5*")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 2
        if (randt = 1) {
            Sleep, %sleepingtime%
            SendChat("/do ����� �� ����������, � ������ ��� ����� ���������� ����. ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female " ��������� �� ������ ��� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������� ���� ������" Female " ����� ���� ����� ������������� ��������.")
            Sleep, %sleepingtime%
            SendChat("/do ����� ��������� ����� ����� ���� ����������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ������ �� ����� �����, �����" Female6 " � � �����.")
        }
        if (randt = 2) {
            Sleep, %sleepingtime%
            SendChat("/do ����� �� ����������, � ������ ��� ����� ���������� ����. ���������.")
            Sleep, %sleepingtime%
            SendChat("/me ������� ����������� ����� � ������ ������ � ������������ ����� �����.")
            Sleep, %sleepingtime%
            SendChat("/do ������ ��������� ��� �� 10 ������.")
            Sleep, %sleepingtime%
            SendChat("/me ������ �������������� ��������� ����� �������� ����� � �����.")
            Sleep, %sleepingtime%
            SendChat("/do ����� ����������. ������ ������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������� ������ �� ����� �����, �����" Female6 " � � �����.")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        SendMessage, 0x50,, 0x4190419,,A
        Random, randt, 1, 2
        if (randt = 1) {
            SendChat("/do �������� ��� ������ � " surname "� ����� � ������ ������� ����.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " ������ ���� � ���������, ����� ���� �������" Female " ��, ����� �����" Female " ��.")
            Sleep, %sleepingtime%
            SendChat("/me ������� ����� � �������� �� ������, ������" Female " ��� ����, ����� ����" Female9 " ������ �� �����.")
            Sleep, %sleepingtime%
            SendChat("/do ������� ��������� �����, ����� ���� ��� " name " ���������" Female " ���� ��������.")
            Sleep, %sleepingtime%
            SendChat("/me ���������� ��� ���, ������" Female10 " ������� ����������� ���������, � ���-�� ������� ����������.")
            Sleep, %sleepingtime%
        SendInput {F6}/frisk{Space}
            KeyWait, Enter, D
            Sleep, %sleepingtime%
            SendChat("/do ��������� ��� ���� ������� ?")
        }
        if (randt = 2) {
            SendChat("/me ������" Female " �� ������� ������� ������������� ��������, �������� �� ���������� �� ����� ���.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " �� �����, ����� ��������, ����� �� �������� ������.")
            Sleep, %sleepingtime%
            SendChat("/me ��������" Female " �� �����, �� �������� ����.")
            Sleep, %sleepingtime%
            SendChat("/do ������� ��������� �����, ����� ���� ��� " name " ���������" Female " ���� ��������.")
            Sleep, %sleepingtime%
        SendInput {F6}/frisk{Space}
            KeyWait, Enter, D
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �������� � ���, �����" Female " �� ������� � ������.")
            Sleep, %sleepingtime%
            SendChat("/do ��������� ��� ���� ������� ?")
        }
        goto, obratka5
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ��������. {00FF00}����������� ������.")
    }
    zavers:=0
}
return
Active4:
SendInput, {F6}/pagesize %page%{Enter}
sleep, 75
if (zavers==1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������� �� ����������� ���� � ��������� �������.")
}
else if (Zavers==0 and EngVer==1 and Radio1==1)
{
    zavers:=1
    city:=getPlayerCity()
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - ���������� ���������� � ��� ��� �� �������� ����� � ���������\�����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - ���������� ���������� � ��� ��� �� ������������ " city ".")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - ���������� ���������� � ��� ��� �� ������� ��������� ����� ('10-4).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - ���������� ���������� � ��� ��� � �� ����� ������� �� ���� ( ��� '7').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - ���������� ���������� � ��� ��� �� � ����������� ��������� ( ��� '1').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - ���������� ���������� � ��� ��� �� ��� ������. ( ��� '0').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - ���������� ���������� � ��� ��� �������� ������������� ('99)")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - ���������� ���������� � ��� ��� �� ������������ ���������������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - ������� ����� ��������� � ����� � ����������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - ���������� ���������� � ����������, ��������� /su.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� �����. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
            SendChat("/me �������" Female " ���� � ��������� ������, ����� ������" Female " � �� ���� ����� � ����� *���*.")
            Sleep, %sleepingtime%
            SendChat("/me ���" Female " ������ � ���������������, ����� ���� ������ *���* �������.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me ������ ����� ������ �� ��������� ��������� ��� ������ � ����������")
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
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
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
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
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
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
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
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: Take the code *7*, nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *70, *20 " getPlayerZone() ", code *one*, need a help! nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: MAYDAY, MAYDAY, *70, *20 " getPlayerZone() ", code *null*, nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
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
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *14, on *20 " getPlayerZone() ", nRFR, OVER SAY **")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendMessage, 0x50,, 0x4190419,,A
    SendInput {F6}/r %Marking% to DISP: , RFR, OVER SAY **{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}
        KeyWait, Enter, D
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������, ������� �� ����...")
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������������� ������ �� ���� �����. {00FF00}����������� ������.")
    zavers:=0
}
else if (Zavers = 0 and EngVer = 0 and Radio1 = 1)
{
    zavers:=1
    city:=getPlayerCity()
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - ���������� ���������� � ��� ��� �� �������� ����� � ���������\�����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - ���������� ���������� � ��� ��� �� ������������ " city ".")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - ���������� ���������� � ��� ��� �� ������� ��������� ����� ('10-4).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - ���������� ���������� � ��� ��� � �� ����� ������� �� ���� ( ��� '7').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - ���������� ���������� � ��� ��� �� � ����������� ��������� ( ��� '1').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - ���������� ���������� � ��� ��� �� ��� ������. ( ��� '0').")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - ���������� ���������� � ��� ��� �������� ������������� ( *99 ).")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - ���������� ���������� � ��� ��� �� ������������ ���������������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - ������� ����� ��������� � ����� � ����������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 0]{FFFFFF} - ���������� ���������� � ����������, ��������� /su.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� �����. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
            SendChat("/me �������" Female " ���� � ��������� ������, ����� ������" Female " � �� ���� ����� � ����� *���*.")
            Sleep, %sleepingtime%
            SendChat("/me ���" Female " ������ � ���������������, ����� ���� ������ *���* �������.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendChat("/me ������ ����� ������ �� ��������� ��������� ��� ������ � ����������")
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
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner=3)
        {
            SendChat("/r " Rank "#" idtvoi " & " partnerPost "#" partnerId " to DISP: ������� �� �����, �� ���������� - " Marking ". ��������, �����**")
        }
        else
        {
            SendChat("/r " Rank "#" idtvoi " to DISP: ������ �� �����, �� ���������� - " Marking ", ��������, �����**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        city:=getPlayerCity()
        Sleep, %sleepingtime%
        if (city == "LS")
        {
            SendChat("/r " Marking " to DISP: �������� �������������� ����� ���-�������, ��������, �����**")
        }
        else if (city = "SF")
        {
            SendChat("/r " Marking " to DISP: �������� �������������� ����� ���-������, ��������, �����**")
        }
        else if (city = "LV")
        {
            SendChat("/r " Marking " to DISP: �������� �������������� ����� ���-���������, ��������, �����**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if 1055 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 ��� *55, ����������, �����**")
            1057v:=0
            1066:=0
            1055:=0
        }
        else if 1057v = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 ��� *57v, ����������, �����**")
            1055:=0
            1066:=0
            1057v:=0
        }
        else if 1066 = 1
        {
            SendChat("/r " Marking " to DISP: 10-4 ��� *66, ����������, �����**")
            1057v:=0
            1055:=0
            1066:=0
        }
        else
        {
            SendChat("/r " Marking " to DISP: 10-4 ��� ���������� ������, ����������, �����**")
        }
        FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: ���� ��� *7*, ����������, ����� �����**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *70, *20 " getPlayerZone() ", ���*����*, ����� ������! ����������, �����**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: ������, ������ *70, *20 " getPlayerZone() ", ���*����*,  �����**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (57v = 1)
        {
            SendChat("/r " Marking " to DISP: *99 ��� ���������� *57V, ��������, ����� �����**")
            57v := 0
        }
        else if (66c = 1)
        {
            SendChat("/r " Marking " to DISP: *99 ��� ���������� *66, ��������, ����� �����**")
            57f := 0
        }
        else if (code0 = 1)
        {
            SendChat("/r " Marking " to DISP: *99 ��� ���������� ���� *����* , ��������, ����� �����**")
            code0 := 0
        }
        else
        {
            SendChat("/r " Marking " to DISP: *99 ��� ���������� ������, ��������, ����� �����**")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendChat("/r " Marking " to DISP: *14, �� *20 " getPlayerZone() ", ����������, �����**")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad9
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        SendMessage, 0x50,, 0x4190419,,A
    SendInput {F6}/r %Marking% to DISP: , ��������, ����� �����**{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}
        KeyWait, Enter, D
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������, ������� �� ����...")
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������������� ������ �� ���� �����. {00FF00}����������� ������.")
    zavers:=0
}
else if (Radio2 = 1)
{
    zavers:=1
addChatMessage("{FFFFFF} <<< =============================== Police {00BFFF}Radio{FFFFFF} =============================== >>>"  )
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 1]{FFFFFF} - �������� � ��� ��� �� �������� �����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 2]{FFFFFF} - �������� � ��� ��� �� ������������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 3]{FFFFFF} - �������� � ��� ��� �� ������ �� �����.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 4]{FFFFFF} - �������� � ��� ��� �� ����� ��������� �������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 5]{FFFFFF} - �������� � ��� ��� �� �� �������� ���������������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 6]{FFFFFF} - �������� � ��� ��� ��� ����� �������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 7]{FFFFFF} - �������� � ��� ��� �� ��� ������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 8]{FFFFFF} - ���������� ���������� � ����������, ��������� /su.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[Numpad 9]{FFFFFF} - �������� � ��� ��� �� ����� ������.")
    sleep, 50
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - {F63939}[End]{FFFFFF} - ����� �� ���� �����. {F63939}'�������� ����������� ���� ������ �����'.")
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
        if text contains *99 for last *57V,*99 for last *66,*99 for last *55,10-4 ������������� �,10-4 for,10-4 ���,10-4,*99
        {
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
            FileRead, info, %checkfile%
            text = %info%
        }
        if text contains 10-55,*55,'55
        {
            1055:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-55 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-57v,10-57 victor,*57v,'57v,*57 victor,'57 victor
        {
            1057v:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-57 VICTOR {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1055:=0
            1066:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains 10-66,*66,'66
        {
            1066:=1
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� � {FF0000}10-66 {FFFFFF}������� ����� ��������� ���� �����...")
            showGameText("RADIO", 1000, 1)
            1057v:=0
            1055:=0
            FileDelete, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
        }
        if text contains �����
        {
            sleep, 750
            SendChat("/rb �")
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
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (Partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ��������: " partnerSurname " | ������: ������� �� " Org6 ".")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ��� ��������� | ������: ������ �� " Org6 ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    Else
    if ErrorLevel = EndKey:Numpad2
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | �������� ������� ������ " getPlayerZone() " | ������: ��������.")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ������� ������� ������ " getPlayerZone() " | ������: ��������.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad3
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ����: " getPlayerZone() " | ��������: " partnerSurname " | ������: ���������.")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ����: " getPlayerZone() " | ��� ��������� | ������: ���������.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad4
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ���� ��������� ������� ������ " getPlayerCity() " | ������: ���������.")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ���� ��������� ������� ������ " getPlayerCity() " | ������: ���������.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad5
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ��������������� ������� ���-�� � ������*" getPlayerZone() "*.")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ��������������� ������� ���-�� � ������*" getPlayerZone() "*.")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad6
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ��������: " partnerSurname " | ����� ������� �� " getPlayerZone() ".")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | �������� � ��������� ��������� �� " getPlayerZone() ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad7
    {
        Random, randt, 1, 3
        if (randt = 1)
        {
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner>=1)
        {
            SendChat("/r " Tag " ����������� " surname " | ��������: " partnerSurname " | ���������� ��������� �� " getPlayerZone() ".")
        }
        else
        {
            SendChat("/r " Tag " ����������� " surname " | ���������� ������� ��������� �� " getPlayerZone() ".")
        }
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����. ")
        }
    }
    else
    if ErrorLevel = EndKey:Numpad8
    {
        idskr:=getIdsInAnyVehicle()
        if (idskr == -1)
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me �������" Female " ���� � ��������� ������, ����� ������" Female " � �� ���� ����� � ����� *���*.")
            Sleep, %sleepingtime%
            SendChat("/me ���" Female " ������ � ���������������, ����� ���� ������ *���* �������.")
            Sleep, %sleepingtime%
        }
        else
        {
            SendMessage, 0x50,, 0x4190419,,A
            SendChat("/me ������ ����� ������ �� ��������� ��������� ��� ������ � ����������")
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
            SendChat("/do �� ����� " name "" Female12 " ������ ����������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me �������" Female4 " ����� � �����, �����" Female " ������ *R* �� �����. ����� ���-�� ��������" Female6 "")
        }
        if (randt = 2)
        {
            SendChat("/me ����" Female " ����������� ����� � �����������")
            Sleep, %sleepingtime%
            SendChat("/me ������" Female6 " ����������� ����� �� ���, ����� ��������" Female6 " ���-��")
        }
        if (randt = 3)
        {
            SendChat("/do �� ����� � " name ", ���� ���������� � ��������������� �����.")
            Sleep, %sleepingtime%
            SendChat("/me ����" Female " �����, ������" Female6 " � �� ���, ����� ��������" Female6 " ���-��")
        }
        Sleep, %sleepingtime%
        if (partner >= 1)
        {
            SendChat("/r " Tag " ����������� " surname " | ���� ������ �� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
        }
        else
        SendChat("/r " Tag " ����������� " surname " | ���� ������ �� " M " | ������: [AT" su "" City "] | �����: " getPlayerZone() ".")
        Sleep, %sleepingtime%
        if (randt = 1)
        {
            SendChat("/do �������� �������� " name " ��������" Female " �������� ������ *R*.")
        }
        if (randt = 2)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����������.")
        }
        if (randt = 3)
        {
            SendChat("/do �������� �������� " name " �������" Female " ����� ������� �� ����.")
        }
    }
    else
    if ErrorLevel = EndKey:End
    {
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������, ������� �� ����...")
    }
    sleep, 200
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������������� ������ �� ���� �����. {00FF00}����������� ������.")
    zavers:=0
}
return
~sc01::
~sc40::
menu:=0
return
sc3B::
{
    menu:=0
    line_num  := getDialogLineNumber()
    line_text  := getDialogLine(line_num)
    sleep, 50
Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ������ �� �������� �������.", "{FF0000}[1]{FFFFFF} - ���������� � ���������� ��������.`n{FF0000}[2]{FFFFFF} - ������ �� ���� ���������� " Organ ".`n{FF0000}[3]{FFFFFF} - ���������\���������� ����.`n{FF0000}[4]{FFFFFF} - ���������\����� ����� ��������� '��������'`n{FF0000}[5]{FFFFFF} - ����� ����������. | ������ � ���: {00FF00} " marking "`n{FF0000}[6]{FFFFFF} - ������������ �������.`n{FF0000}[7]{FFFFFF} - ����� � ����� � ���.`n{FF0000}[8]{FFFFFF} - ���� '��������'{FFFFFF}.`n{FF0000}[9]{FFFFFF} - ����� �������� /limit. | ������ � ���:{00FF00} " limit "{FFFFFF}.", "�����")
}
menu:=1
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
if (isDialogButtonSelected() == 1)
{
    menu := 0
}
ifWinNotActive, GTA:SA:MP
{
    return
}
if (menu == 1)
{
    IniRead, vupd, %a_temp%\verlen.ini, UPD, v
    if Organ = SAPD
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� � ��������", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - �������� '������-����' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - �������� '����� ���������������'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - �������� '������'.`n{FFFF00}" NameKey4 "{FFFFFF} - ���� '�����'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - ��������������� �� ��������� ������, �� ��������� ���������.`n{FFFF00}" NameKey6 "{FFFFFF} - ����� �������� ������ �� ��������� ���������.`n`n{FFFF00}" NameKey7 "{FFFFFF} - ���������� ����� ������ '" limit "' ��\���.`n{FFFF00}" NameKey8 "{FFFFFF} - �������� ���� + �������������� F8.`n`n{FFFF00}/mask{FFFFFF} - �������� ����� � ����� �.`n{FFFF00}/reps{FFFFFF} - ��������� ������������� ���������� �� ����\���������.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
            menu := 0
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� SAPD (1 ���).", "{FFFFFF}=============================================================================================`n{00BFFF}������� ��������� ��������:`n`n{FFFF00}1. {FFFFFF}�������� ��������� �� �������� �����, �� ��������� ����� ���������.`n{FFFF00}2. {FFFFFF}�������� ������������� �������� ������ ��������� �� �����-��������� �����.`n{FFFF00}3. {FFFFFF}����������� �������� �� ���������, ��������, �� ���������� ������� � �/� �����.`n{FFFF00}4. {FFFFFF}����������� �������� ������������ ������� �� ����� ���������� �����������, ����� ������� ������.`n{FFFF00}5. {FFFFFF}����������� ��������� ������������ ��������� � ������������� ��� ����������� ���������.`n{FFFF00}6. {FFFFFF}�������� ������� ������������� ���� �� ������� �������, ������� ������������ �������, ������ ��� ���`n    ���������� ���, ���� ��� ��������� ��� ���������� ��� ��������� ������������.`n{FFFF00}7. {FFFFFF}�������� ������������:`n {FFFFFF}� {FF0000}�����{FFFFFF} � ���������� ������� �� ������{FF0000} - {00FF00}20 ��\�.`n {FFFFFF}�� {FF0000}���������{FFFFFF} ������ ����������� {FF0000}- {00FF00}60 ��\�.`n {FFFFFF}�� {FF0000}�������{FFFFFF} ���������� �������� {FF0000}- {00FF00}110 ��\�. `n{FFFFFF}=============================================================================================`n{00BFFF}������� ���� � {FFFFFF}��� ��������� ���������� � �������� �������� ��������.`n`n{FFFFFF}��� ����� ������� ����������� ��������� ������� ����:`n{FFFF00}1. {FFFFFF}���� �������� {FF0000}����� ������ �����������{FFFFFF}, �� ���� ������ � ������ �������.`n{FFFF00}2. {FFFFFF}��������� ��� �� ������� � ��� ���� ��������� {FF0000}� �������.`n{FFFF00}3. {FFFFFF}���� �������� ������� {FF0000}���.`n`n{FFFFFF}������ �����, �� ������ �������� {FF0000}����. ������� � ��������� �������� ������� ��������{FFFFFF} �`n{FFFFFF}��������� � �������{FFFFFF}. ���� ����� ���� ���������� ������������ `n{00FF00}(�������� ����� ������������ 15������) {FFFFFF}�������� {FF0000}�� ������������, �� ����������� �������������.`n`n{FFFFFF}���� �� �������� ����������� ����� {FF0000}1-2-�� ����������{FFFFFF}, �� ����� ���������� � ������� �����.`n`n{FFFFFF}������, ��� �� ������ ������� � {00FF00}��������� �������� ��������� ���������{FFFFFF}, ����������� ���������`n� ������� ���� �� ����.`n`n{FFFFFF}����� �������� �� ������, ���� ����� �� ������� �� ������ � ���������� � ������ ����� ����. `n{FFFFFF}���������� �� ���� ��������� ������ (��� ����, ����� �������� ������, � ������ ����, ���� ��� `n{FFFFFF}�����.) � ���������� � ��������. ������������ ����� � ��������, ������� ��� �������� `n{FFFFFF}���������. �����, ���� � ��� ���� ��������, ������� ��� ������� �������� �� ���� ������, `n{FFFFFF}���� �� ��� ���, ������ ��������� � ����� � ������� � ���������� ����.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=============================================================================================`n", "2 ���")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
            menu := 0
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� ���� (1 ���).", "{FFFFFF}=================================================================================================`n{00BFFF}���������� ����`n{FFFFFF}{FFFF00}10-1{FFFFFF} - ������� ���� �������� �� ��������� (������� ������� � ���).`n{FFFF00}10-3{FFFFFF} - ������������� (��� ������� ���������).`n{FFFF00}10-4{FFFFFF} - �������.`n{FFFF00}10-5{FFFFFF} - ��������� ��������� ���������.`n{FFFF00}10-6{FFFFFF} - �� �������/�� �����/���.`n{FFFF00}10-7{FFFFFF} - ��������.`n{FFFF00}10-8{FFFFFF} - � ��������� ����� �����/�� ��������.`n{FFFF00}10-9{FFFFFF} - � ��������� ����� �����/�� �������� (��������� �� ��������).`n{FFFF00}10-14{FFFFFF} - ������ ��������������� (������� ������� � ���� ���������������).`n{FFFF00}10-15{FFFFFF} - ������������� ���������� (������� ���-�� �������������, �������).`n{FFFF00}10-20{FFFFFF} - �������.`n{FFFF00}10-21{FFFFFF} - ��������� � ������� � ���������������, �������� ��������.`n{FFFF00}10-22{FFFFFF} - ������������� � '�������' (��������� � ����������� �������).`n{FFFF00}10-27{FFFFFF} - ����� ���������� ������� (������� ������ � ����� ����������).`n{FFFF00}10-40{FFFFFF} - ������� ��������� ����� (4 � ������).`n{FFFF00}10-41{FFFFFF} - ����������� ����������.`n{FFFF00}10-46{FFFFFF} - ������� �����.`n{FFFF00}10-55{FFFFFF} - �������-����.`n{FFFF00}10-56{FFFFFF} - ���������� ���������� (������� ����� ����/��� ��������������).`n{FFFF00}10-57 VICTOR{FFFFFF} - ������ �� ����������� (������� ������ ����, ����, ���������������).`n{FFFF00}10-57 FOXTROT{FFFFFF} - ����� ������ (������� ��������� ��������������, ������ (���� �������))`n{FFFF00}10-60{FFFFFF} - ���������� �� ���������� (������� �������� ����, ����, ���������� ����� ������).`n{FFFF00}10-61{FFFFFF} - ���������� � ����� ������������� (������� ����, ������).`n{FFFF00}10-66{FFFFFF} - ��������� ����������� ����� (���� ��������, ��� ������������� � ���� ��������/�������� ������������. `n���� ��������� ��������� ����� ������).`n{FFFF00}10-70{FFFFFF} - ������ ��������� (������� ���������� ������, ���).`n{FFFF00}10-71{FFFFFF} - ������ ����������� ���������.`n{FFFF00}10-99{FFFFFF} - �������� �������������.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=================================================================================================`n", "2 ���")
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
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� ����������", "{FFFFFF}������� ����� ����������. {FF0000}|{FFFFFF}  ������: {00FFFF}1-A-3 {FFFFFF}���  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ ������� ���� ���������� �� - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, �� " newmarking ", ��������, ����� ����� **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� ����������, ���� ���������� - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            return
        }
        else if (line_num == 6)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������ ����� ������������.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
        }
        else if (line_num == 7){
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���������� ������� ������� ��������: ������, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� � ��� ��������� �������/��������: ����������� �� ��� � VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��� Discord: {FF0000}DanielCooper#2416{FFFFFF} | ��� VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ���� ���������", "{FF0000}[1]{FFFFFF} - ������� ���������. |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id ���������. | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - ��������� ���������. | {00FF00}" partnerPost "`n{FF0000}[4]{FFFFFF} - {00FF00}��������� ���������`n{FF0000}[5]{FFFFFF} - {FF0000}������� ���������", "�����")
            menu := 6
            sleep, 500
        }
        else if (line_num == 9){
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� /limit", "{FFFFFF}������� ����� �������� ��������. {FF0000}|{FFFFFF}  ������: {00FFFF}60{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
            menu := 0
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ����� �������� ��� ������� /limit - {00FFFF}" limit "{FFFFFF} ��\���.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� �������� /limit. ��� ����� - {00FFFF}" limit "{FFFFFF} ��\���.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            menu:=0
            return
        }
    }
    if Organ = FBI
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� � ��������", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - �������� '������-����' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - �������� '����� ���������������'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - �������� '������'.`n{FFFF00}" NameKey4 "{FFFFFF} - ���� '�����'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - ��������������� �� ��������� ������, �� ��������� ���������.`n{FFFF00}" NameKey6 "{FFFFFF} - ����� �������� ������ �� ��������� ���������.`n`n{FFFF00}" NameKey7 "{FFFFFF} - ���������� ����� ������ '" limit "' ��\���.`n{FFFF00}" NameKey8 "{FFFFFF} - �������� ���� + �������������� F8.`n`n{FFFF00}/mask{FFFFFF} - �������� ����� � ����� �.`n{FFFF00}/reps{FFFFFF} - ��������� ������������� ���������� �� ����\���������.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� FBI (1 ���).", "{FFFFFF}=============================================================================================`n{00BFFF}������� ��������� ��������:`n`n{FFFF00}1. {FFFFFF}�������� ��������� �� �������� �����, �� ��������� ����� ���������.`n{FFFF00}2. {FFFFFF}�������� ������������� �������� ������ ��������� �� �����-��������� �����.`n{FFFF00}3. {FFFFFF}����������� �������� �� ���������, ��������, �� ���������� ������� � �/� �����.`n{FFFF00}4. {FFFFFF}����������� �������� ������������ ������� �� ����� ���������� �����������, ����� ������� ������.`n{FFFF00}5. {FFFFFF}����������� ��������� ������������ ��������� � ������������� ��� ����������� ���������.`n{FFFF00}6. {FFFFFF}�������� ������� ������������� ���� �� ������� �������, ������� ������������ �������, ������ ��� ���`n    ���������� ���, ���� ��� ��������� ��� ���������� ��� ��������� ������������.`n{FFFF00}7. {FFFFFF}�������� ������������:`n {FFFFFF}� {FF0000}�����{FFFFFF} � ���������� ������� �� ������{FF0000} - {00FF00}20 ��\�.`n {FFFFFF}�� {FF0000}���������{FFFFFF} ������ ����������� {FF0000}- {00FF00}60 ��\�.`n {FFFFFF}�� {FF0000}�������{FFFFFF} ���������� �������� {FF0000}- {00FF00}110 ��\�. `n{FFFFFF}=============================================================================================`n{00BFFF}������� ���� � {FFFFFF}��� ��������� ���������� � �������� �������� ��������.`n`n{FFFFFF}��� ����� ������� ����������� ��������� ������� ����:`n{FFFF00}1. {FFFFFF}���� �������� {FF0000}����� ������ �����������{FFFFFF}, �� ���� ������ � ������ �������.`n{FFFF00}2. {FFFFFF}��������� ��� �� ������� � ��� ���� ��������� {FF0000}� �������.`n{FFFF00}3. {FFFFFF}���� �������� ������� {FF0000}���.`n`n{FFFFFF}������ �����, �� ������ �������� {FF0000}����. ������� � ��������� �������� ������� ��������{FFFFFF} �`n{FFFFFF}��������� � ������� {00FF00}( F2 ){FFFFFF}. ���� ����� ���� ���������� ������������ `n{00FF00}(�������� ����� ������������ 15������) {FFFFFF}�������� {FF0000}�� ������������, �� ����������� �������������.{00FF00} (Alt+Num4) `n`n{FFFFFF}���� �� �������� ����������� ����� {FF0000}1-2-�� ����������{FFFFFF}, �� ����� ���������� � ������� �����.`n`n{FFFFFF}������, ��� �� ������ ������� � {00FF00}��������� �������� ��������� ��������� {00FF00}( F2 ){FFFFFF}, ����������� ���������`n� ������� ���� �� ����.`n`n{FFFFFF}����� �������� �� ������, ���� ����� �� ������� �� ������ {00FF00}( Alt + P ){FFFFFF} � ���������� � ������ ����� ����. `n{FFFFFF}���������� �� ���� ��������� ������ (��� ����, ����� �������� ������, � ������ ����, ���� ��� `n{FFFFFF}�����.) � ���������� � ��������. ������������ ����� � ��������, ������� ��� �������� `n{FFFFFF}��������� {00FF00}(F3, Alt + Home){FFFFFF}. �����, ���� � ��� ���� ��������, ������� ��� ������� �������� �� ���� ������, `n{FFFFFF}���� �� ��� ���, ������ ��������� � ����� � ������� � ���������� ����.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=============================================================================================`n", "2 ���")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� ���� (1 ���).", "{FFFFFF}=================================================================================================`n{00BFFF}���������� ����`n{FFFFFF}{FFFF00}10-1{FFFFFF} - ������� ���� �������� �� ��������� (������� ������� � ���).`n{FFFF00}10-3{FFFFFF} - ������������� (��� ������� ���������).`n{FFFF00}10-4{FFFFFF} - �������.`n{FFFF00}10-5{FFFFFF} - ��������� ��������� ���������.`n{FFFF00}10-6{FFFFFF} - �� �������/�� �����/���.`n{FFFF00}10-7{FFFFFF} - ��������.`n{FFFF00}10-8{FFFFFF} - � ��������� ����� �����/�� ��������.`n{FFFF00}10-9{FFFFFF} - � ��������� ����� �����/�� �������� (��������� �� ��������).`n{FFFF00}10-14{FFFFFF} - ������ ��������������� (������� ������� � ���� ���������������).`n{FFFF00}10-15{FFFFFF} - ������������� ���������� (������� ���-�� �������������, �������).`n{FFFF00}10-20{FFFFFF} - �������.`n{FFFF00}10-21{FFFFFF} - ��������� � ������� � ���������������, �������� ��������.`n{FFFF00}10-22{FFFFFF} - ������������� � '�������' (��������� � ����������� �������).`n{FFFF00}10-27{FFFFFF} - ����� ���������� ������� (������� ������ � ����� ����������).`n{FFFF00}10-40{FFFFFF} - ������� ��������� ����� (4 � ������).`n{FFFF00}10-41{FFFFFF} - ����������� ����������.`n{FFFF00}10-46{FFFFFF} - ������� �����.`n{FFFF00}10-55{FFFFFF} - �������-����.`n{FFFF00}10-56{FFFFFF} - ���������� ���������� (������� ����� ����/��� ��������������).`n{FFFF00}10-57 VICTOR{FFFFFF} - ������ �� ����������� (������� ������ ����, ����, ���������������).`n{FFFF00}10-57 FOXTROT{FFFFFF} - ����� ������ (������� ��������� ��������������, ������ (���� �������))`n{FFFF00}10-60{FFFFFF} - ���������� �� ���������� (������� �������� ����, ����, ���������� ����� ������).`n{FFFF00}10-61{FFFFFF} - ���������� � ����� ������������� (������� ����, ������).`n{FFFF00}10-66{FFFFFF} - ��������� ����������� ����� (���� ��������, ��� ������������� � ���� ��������/�������� ������������. `n���� ��������� ��������� ����� ������).`n{FFFF00}10-70{FFFFFF} - ������ ��������� (������� ���������� ������, ���).`n{FFFF00}10-71{FFFFFF} - ������ ����������� ���������.`n{FFFF00}10-99{FFFFFF} - �������� �������������.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=================================================================================================`n", "2 ���")
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
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� ����������", "{FFFFFF}������� ����� ����������. {FF0000}|{FFFFFF}  ������: {00FFFF}1-A-3 {FFFFFF}���  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ ������� ���� ���������� �� - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, �� " newmarking ", ��������, ����� ����� **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� ����������, ���� ���������� - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            return
        }
        else if (line_num == 6)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������ ����� ������������.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 7)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���������� ������� ������� ��������: ������, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� � ��� ��������� �������/��������: ����������� �� ��� � VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��� Discord: {FF0000}DanielCooper#2416{FFFFFF} | ��� VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ���� ���������", "{FF0000}[1]{FFFFFF} - ������� ���������. |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id ���������. | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - ��������� ���������. | {00FF00}" partnerPost "`n{FF0000}[4]{FFFFFF} - {00FF00}��������� ���������`n{FF0000}[5]{FFFFFF} - {FF0000}������� ���������", "�����")
            menu := 6
            sleep, 500
        }
        else if (line_num == 9){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� /limit", "{FFFFFF}������� ����� �������� ��������. {FF0000}|{FFFFFF}  ������: {00FFFF}60{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ����� �������� ��� ������� /limit - {00FFFF}" limit "{FFFFFF} ��\���.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� �������� /limit. ��� ����� - {00FFFF}" limit "{FFFFFF} ��\���.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            menu:=0
            return
        }
    }
    if Organ = SWAT
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� � ��������", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - �������� '������-����' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - �������� '����� ���������������'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - �������� '������'.`n{FFFF00}" NameKey4 "{FFFFFF} - ���� '�����'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - ��������������� �� ��������� ������, �� ��������� ���������.`n{FFFF00}" NameKey6 "{FFFFFF} - ����� �������� ������ �� ��������� ���������.`n`n{FFFF00}" NameKey7 "{FFFFFF} - ���������� ����� ������ '" limit "' ��\���.`n{FFFF00}" NameKey8 "{FFFFFF} - �������� ���� + �������������� F8.`n`n{FFFF00}/mask{FFFFFF} - �������� ����� � ����� �.`n{FFFF00}/reps{FFFFFF} - ��������� ������������� ���������� �� ����\���������.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� SWAT", "{FFFFFF}====================================================================================================================`n{00BFFF}>��������� ���������� (�������)<`n`n{FFFF00}-{FFFFFF} ��� ����. �������, ��� ����� �������� ����������: ������, ������ ��� ������;`n{FFFF00}-{FFFFFF} ����������� �������! ��� ������� ����� � ����������� S.W.A.T. - {00FF00}( Alt + N ){FFFFFF};`n{FFFF00}-{FFFFFF} ������ ��� ������� ������� ���������!`n{FFFF00}-{FFFFFF} �������� ���������, ������ �� ����������!`n`n{00BFFF}>�������� ������ S.W.A.T.<`n`n{FFFF00}-{FFFFFF} �������� ����������;`n{FFFF00}-{FFFFFF} ����������� ��������� ������������ ������ ��������� �� ����� ������� ��������������� ���;`n{FFFF00}-{FFFFFF} ����������� ������������� ������� ���� � ��������� ���������, � ��� ����� ������ ��������������������� �������������;`n{FFFF00}-{FFFFFF} �������� ����������� � �����������, �������� ��� �������;`n{FFFF00}-{FFFFFF} ��������������������� �������� � ������� ����� Atlantic;`n{FFFF00}-{FFFFFF} ���������� ��������, ����������������� ������� ������ ��� �������� �������, ������� � ����������� �������������;`n{FFFF00}-{FFFFFF} ���������� �������� � ���������������������� ����������;`n{FFFF00}-{FFFFFF} ������������ ��������, ����������������� ������� ������ � ������������;`n{FFFF00}-{FFFFFF} ����������� ��������� ��� ������ ������ ����������, ������� �� ��������� ������, ������� ������������� (������ FBI, CIA, SAPD);`n{FFFF00}-{FFFFFF} ����������� ��������� ��� ������ ��������;`n{FFFF00}-{FFFFFF} ������������ ������� �������� ��� ������������ � ������������� (������ ��� �������, �������� ������, ���������);`n{FFFF00}-{FFFFFF} ������ � �������� ������������;`n`n{00BFFF}>��� ���������� ����. ������������� S.W.A.T. �� ��������� �����������, ����� ��� SAPD ��� FBI?<`n`n{FFFF00}-{FFFFFF} ������ �� ��������� ������ ����. ������������� � ���. ���������� San Andreas Police Department...`n  ��� ������, S.W.A.T. �� ���������� �������� ��� ������ ������������ (�� ������ ����� �������,`n  ������� �� � ����� ������� ���������� �������), ����. ������������� S.W.A.T. - ��� �������`n  �������������, ��� ���������� ������ ������� �������, ������ ������� ������� �����;`n`n{00BFFF}>���������� �������<`n`n{FFFF00}-{FFFFFF} � ������ �������, ������ ��������� ������������ ������������� ������! (������ ���� ��� �� ����������� �����������);`n{FFFF00}-{FFFFFF} ������������ ��������� RP;`n{FFFF00}-{FFFFFF} ���������� ����������� ��������� ���������� � ����������� � ������������ ���;`n{FFFF00}-{FFFFFF} ����� ����� ���������� � ������� �������� [/m] ��� ����� [/s];`n{FFFF00}-{FFFFFF} ���������� ��������� ������, ���� ��������� ������������ ����������� �� ���������� ����� ��� ��������������,`n  �� ����������� ���� (������������ �������), ����� ����� ������ �� �������� � ������ � ������� ���������!`n  ��� ������ � ������! ������� ���� ����������� � ����� ������������ � ���!`n{FFFFFF}====================================================================================================================`n", "X")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� ���� (1 ���).", "{FFFFFF}=================================================================================================`n{00BFFF}���������� ����`n{FFFFFF}{FFFF00}10-1{FFFFFF} - ������� ���� �������� �� ��������� (������� ������� � ���).`n{FFFF00}10-3{FFFFFF} - ������������� (��� ������� ���������).`n{FFFF00}10-4{FFFFFF} - �������.`n{FFFF00}10-5{FFFFFF} - ��������� ��������� ���������.`n{FFFF00}10-6{FFFFFF} - �� �������/�� �����/���.`n{FFFF00}10-7{FFFFFF} - ��������.`n{FFFF00}10-8{FFFFFF} - � ��������� ����� �����/�� ��������.`n{FFFF00}10-9{FFFFFF} - � ��������� ����� �����/�� �������� (��������� �� ��������).`n{FFFF00}10-14{FFFFFF} - ������ ��������������� (������� ������� � ���� ���������������).`n{FFFF00}10-15{FFFFFF} - ������������� ���������� (������� ���-�� �������������, �������).`n{FFFF00}10-20{FFFFFF} - �������.`n{FFFF00}10-21{FFFFFF} - ��������� � ������� � ���������������, �������� ��������.`n{FFFF00}10-22{FFFFFF} - ������������� � '�������' (��������� � ����������� �������).`n{FFFF00}10-27{FFFFFF} - ����� ���������� ������� (������� ������ � ����� ����������).`n{FFFF00}10-40{FFFFFF} - ������� ��������� ����� (4 � ������).`n{FFFF00}10-41{FFFFFF} - ����������� ����������.`n{FFFF00}10-46{FFFFFF} - ������� �����.`n{FFFF00}10-55{FFFFFF} - �������-����.`n{FFFF00}10-56{FFFFFF} - ���������� ���������� (������� ����� ����/��� ��������������).`n{FFFF00}10-57 VICTOR{FFFFFF} - ������ �� ����������� (������� ������ ����, ����, ���������������).`n{FFFF00}10-57 FOXTROT{FFFFFF} - ����� ������ (������� ��������� ��������������, ������ (���� �������))`n{FFFF00}10-60{FFFFFF} - ���������� �� ���������� (������� �������� ����, ����, ���������� ����� ������).`n{FFFF00}10-61{FFFFFF} - ���������� � ����� ������������� (������� ����, ������).`n{FFFF00}10-66{FFFFFF} - ��������� ����������� ����� (���� ��������, ��� ������������� � ���� ��������/�������� ������������. `n���� ��������� ��������� ����� ������).`n{FFFF00}10-70{FFFFFF} - ������ ��������� (������� ���������� ������, ���).`n{FFFF00}10-71{FFFFFF} - ������ ����������� ���������.`n{FFFF00}10-99{FFFFFF} - �������� �������������.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=================================================================================================`n", "2 ���")
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
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� ����������", "{FFFFFF}������� ����� ����������. {FF0000}|{FFFFFF}  ������: {00FFFF}1-A-3 {FFFFFF}���  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ ������� ���� ���������� �� - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, �� " newmarking ", ��������, ����� ����� **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� ����������, ���� ���������� - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            return
        }
        else if (line_num == 6)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������ ����� ������������.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 7)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���������� ������� ������� ��������: ������, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� � ��� ��������� �������/��������: ����������� �� ��� � VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��� Discord: {FF0000}DanielCooper#2416{FFFFFF} | ��� VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
            return
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ���� ���������", "{FF0000}[1]{FFFFFF} - ������� ���������. |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id ���������. | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - ��������� ���������. | {00FF00}" partnerPost "`n{FF0000}[4]{FFFFFF} - {00FF00}��������� ���������`n{FF0000}[5]{FFFFFF} - {FF0000}������� ���������", "�����")
            menu := 6
            sleep, 500
        }
        else if (line_num == 9){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� /limit", "{FFFFFF}������� ����� �������� ��������. {FF0000}|{FFFFFF}  ������: {00FFFF}60{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ����� �������� ��� ������� /limit - {00FFFF}" limit "{FFFFFF} ��\���.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� �������� /limit. ��� ����� - {00FFFF}" limit "{FFFFFF} ��\���.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            menu:=0
            return
        }
    }
    if Organ = CIA
    {
        menu := 0
        line_num  := getDialogLineNumber()
        line_text  := getDialogLine(line_num)
        if (line_num == 1)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� � ��������", "{FFFFFF}=============================================================================================`n{FFFF00}" NameKey1 "{FFFFFF} - �������� '������-����' (*55).`n{FFFF00}" NameKey2 "{FFFFFF} - �������� '����� ���������������'(*57v and *66).`n{FFFF00}" NameKey3 "{FFFFFF} - �������� '������'.`n{FFFF00}" NameKey4 "{FFFFFF} - ���� '�����'.`n`n{FFFF00}" NameKey5 "{FFFFFF} - ��������������� �� ��������� ������, �� ��������� ���������.`n{FFFF00}" NameKey6 "{FFFFFF} - ����� �������� ������ �� ��������� ���������.`n`n{FFFF00}" NameKey7 "{FFFFFF} - ���������� ����� ������ '" limit "' ��\���.`n{FFFF00}" NameKey8 "{FFFFFF} - �������� ���� + �������������� F8.`n`n{FFFF00}/mask{FFFFFF} - �������� ����� � ����� �.`n{FFFF00}/reps{FFFFFF} - ��������� ������������� ���������� �� ����\���������.`n{FFFFFF}=============================================================================================`n", "X")
            return
        }
        else if (line_num == 2)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� CIA (1 ���).", "{FFFFFF}=============================================================================================`n{00BFFF}������� ��������� ��������:`n`n{FFFF00}1. {FFFFFF}�������� ��������� �� �������� �����, �� ��������� ����� ���������.`n{FFFF00}2. {FFFFFF}�������� ������������� �������� ������ ��������� �� �����-��������� �����.`n{FFFF00}3. {FFFFFF}����������� �������� �� ���������, ��������, �� ���������� ������� � �/� �����.`n{FFFF00}4. {FFFFFF}����������� �������� ������������ ������� �� ����� ���������� �����������, ����� ������� ������.`n{FFFF00}5. {FFFFFF}����������� ��������� ������������ ��������� � ������������� ��� ����������� ���������.`n{FFFF00}6. {FFFFFF}�������� ������� ������������� ���� �� ������� �������, ������� ������������ �������, ������ ��� ���`n    ���������� ���, ���� ��� ��������� ��� ���������� ��� ��������� ������������.`n{FFFF00}7. {FFFFFF}�������� ������������:`n {FFFFFF}� {FF0000}�����{FFFFFF} � ���������� ������� �� ������{FF0000} - {00FF00}20 ��\�.`n {FFFFFF}�� {FF0000}���������{FFFFFF} ������ ����������� {FF0000}- {00FF00}60 ��\�.`n {FFFFFF}�� {FF0000}�������{FFFFFF} ���������� �������� {FF0000}- {00FF00}110 ��\�. `n{FFFFFF}=============================================================================================`n{00BFFF}������� ���� � {FFFFFF}��� ��������� ���������� � �������� �������� ��������.`n`n{FFFFFF}��� ����� ������� ����������� ��������� ������� ����:`n{FFFF00}1. {FFFFFF}���� �������� {FF0000}����� ������ �����������{FFFFFF}, �� ���� ������ � ������ �������.`n{FFFF00}2. {FFFFFF}��������� ��� �� ������� � ��� ���� ��������� {FF0000}� �������.`n{FFFF00}3. {FFFFFF}���� �������� ������� {FF0000}���.`n`n{FFFFFF}������ �����, �� ������ �������� {FF0000}����. ������� � ��������� �������� ������� ��������{FFFFFF} �`n{FFFFFF}��������� � ������� {00FF00}( F2 ){FFFFFF}. ���� ����� ���� ���������� ������������ `n{00FF00}(�������� ����� ������������ 15������) {FFFFFF}�������� {FF0000}�� ������������, �� ����������� �������������.{00FF00} (Alt+Num4) `n`n{FFFFFF}���� �� �������� ����������� ����� {FF0000}1-2-�� ����������{FFFFFF}, �� ����� ���������� � ������� �����.`n`n{FFFFFF}������, ��� �� ������ ������� � {00FF00}��������� �������� ��������� ��������� {00FF00}( F2 ){FFFFFF}, ����������� ���������`n� ������� ���� �� ����.`n`n{FFFFFF}����� �������� �� ������, ���� ����� �� ������� �� ������ {00FF00}( Alt + P ){FFFFFF} � ���������� � ������ ����� ����. `n{FFFFFF}���������� �� ���� ��������� ������ (��� ����, ����� �������� ������, � ������ ����, ���� ��� `n{FFFFFF}�����.) � ���������� � ��������. ������������ ����� � ��������, ������� ��� �������� `n{FFFFFF}��������� {00FF00}(F3, Alt + Home){FFFFFF}. �����, ���� � ��� ���� ��������, ������� ��� ������� �������� �� ���� ������, `n{FFFFFF}���� �� ��� ���, ������ ��������� � ����� � ������� � ���������� ����.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=============================================================================================`n", "2 ���")
            menu := 4
            return
        }
        else if (line_num == 3)
        {
        showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ���������� ���� (1 ���).", "{FFFFFF}=================================================================================================`n{00BFFF}���������� ����`n{FFFFFF}{FFFF00}10-1{FFFFFF} - ������� ���� �������� �� ��������� (������� ������� � ���).`n{FFFF00}10-3{FFFFFF} - ������������� (��� ������� ���������).`n{FFFF00}10-4{FFFFFF} - �������.`n{FFFF00}10-5{FFFFFF} - ��������� ��������� ���������.`n{FFFF00}10-6{FFFFFF} - �� �������/�� �����/���.`n{FFFF00}10-7{FFFFFF} - ��������.`n{FFFF00}10-8{FFFFFF} - � ��������� ����� �����/�� ��������.`n{FFFF00}10-9{FFFFFF} - � ��������� ����� �����/�� �������� (��������� �� ��������).`n{FFFF00}10-14{FFFFFF} - ������ ��������������� (������� ������� � ���� ���������������).`n{FFFF00}10-15{FFFFFF} - ������������� ���������� (������� ���-�� �������������, �������).`n{FFFF00}10-20{FFFFFF} - �������.`n{FFFF00}10-21{FFFFFF} - ��������� � ������� � ���������������, �������� ��������.`n{FFFF00}10-22{FFFFFF} - ������������� � '�������' (��������� � ����������� �������).`n{FFFF00}10-27{FFFFFF} - ����� ���������� ������� (������� ������ � ����� ����������).`n{FFFF00}10-40{FFFFFF} - ������� ��������� ����� (4 � ������).`n{FFFF00}10-41{FFFFFF} - ����������� ����������.`n{FFFF00}10-46{FFFFFF} - ������� �����.`n{FFFF00}10-55{FFFFFF} - �������-����.`n{FFFF00}10-56{FFFFFF} - ���������� ���������� (������� ����� ����/��� ��������������).`n{FFFF00}10-57 VICTOR{FFFFFF} - ������ �� ����������� (������� ������ ����, ����, ���������������).`n{FFFF00}10-57 FOXTROT{FFFFFF} - ����� ������ (������� ��������� ��������������, ������ (���� �������))`n{FFFF00}10-60{FFFFFF} - ���������� �� ���������� (������� �������� ����, ����, ���������� ����� ������).`n{FFFF00}10-61{FFFFFF} - ���������� � ����� ������������� (������� ����, ������).`n{FFFF00}10-66{FFFFFF} - ��������� ����������� ����� (���� ��������, ��� ������������� � ���� ��������/�������� ������������. `n���� ��������� ��������� ����� ������).`n{FFFF00}10-70{FFFFFF} - ������ ��������� (������� ���������� ������, ���).`n{FFFF00}10-71{FFFFFF} - ������ ����������� ���������.`n{FFFF00}10-99{FFFFFF} - �������� �������������.`n`n{FFFFFF}����������� �� {FF0000}<2-�� ��������>`n{FFFFFF}=================================================================================================`n", "2 ���")
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
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� ����������", "{FFFFFF}������� ����� ����������. {FF0000}|{FFFFFF}  ������: {00FFFF}1-A-3 {FFFFFF}���  {00FFFF}L-5{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
            SendMessage, 0x50,, 0x4090409,, A
        input, newmarking, V, {Insert}.{Escape}.{Enter}
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ ������� ���� ���������� �� - {00FFFF}" newmarking "{FFFFFF}.")
                Sleep, 1500
                if (EngVer = 1 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, on " newmarking ", RFR, OVER SAY **")
                }
                if (EngVer = 0 and Radio1 = 1){
                    SendChat("/r " Rank "#" idtvoi " to DISP: 10-27, �� " newmarking ", ��������, ����� ����� **")
                }
                marking:=newmarking
                IniWrite, %Marking%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Information, Marking
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� ����������, ���� ���������� - {00FFFF}" marking "{FFFFFF}.")
                newmarking:=-1
                menu := 0
                return
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            return
        }
        else if (line_num == 6)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������ ����� ������������.")
            Sleep 500
            showGameText("Reloaded", 3000, 4)
            Sleep 1500
            Reload
            return
        }
        else if (line_num == 7)
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���������� ������� ������� ��������: ������, {FF0000}Daniel Cooper.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ���� � ��� ��������� �������/��������: ����������� �� ��� � VK\Discord.")
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��� Discord: {FF0000}DanielCooper#2416{FFFFFF} | ��� VK: {FF0000}id380297165{FFFFFF} | Version: {FF0000}" vupd "")
        }
        else if (line_num == 8){
        Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ���� ���������", "{FF0000}[1]{FFFFFF} - ������� ���������. |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id ���������. | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - ��������� ���������. | {00FF00}" partnerPost "`n{FF0000}[4]{FFFFFF} - {00FF00}��������� ���������`n{FF0000}[5]{FFFFFF} - {FF0000}������� ���������", "�����")
            menu := 6
            sleep, 500
        }
        else if (line_num == 9){
            menu := 0
        showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ����� /limit", "{FFFFFF}������� ����� �������� ��������. {FF0000}|{FFFFFF}  ������: {00FFFF}60{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
        input, newlimit, V, {Insert}.{Escape}.{Enter}
            sleep, 50
            if ErrorLevel = EndKey:Insert
            {
                sleep, 100
            SendInput,{INSERT}
            SendInput,{ENTER}
                limit:=newlimit
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ����� �������� ��� ������� /limit - {00FFFF}" limit "{FFFFFF} ��\���.")
                IniWrite, %limit%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Auto, limit
                return
            }
            else
            if ErrorLevel = EndKey:Escape
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� ����� �������� /limit. ��� ����� - {00FFFF}" limit "{FFFFFF} ��\���.")
            }
            else
            if ErrorLevel = EndKey:Enter
            {
            addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
            }
            menu:=0
            return
        }
    }
}
else if (menu == 4)
{
    if Organ = SAPD
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� PD (2 ���).", "{FFFFFF}=============================================================================================`n {00BFFF}��� ��������� ��� ����������� ��������� ?`n{FF0000}( ������������ ��� ������� ��������� � ������� ������������ )`n`n{FFFF00}1. {FFFFFF}�������� � *����� 3-�� ������� �����*`n{FFFF00}2. {FFFFFF}���� ����������� ���������, ����� ���������� ��������������.`n{FFFF00}3. {FFFFFF}����� ����������� ���������, ����� ���������� ��������������.`n{FFFF00}4. {FFFFFF}���������.`n{FFFF00}5. {FFFFFF}���, ������� ��������������.`n{FFFF00}6. {FFFFFF}���, ������� ������\�������� ������� ������� ����������.`n{FFFF00}7. {FFFFFF}������������� ��������� ��������������. ( ���� ���������� ���� ��� `n{FFFFFF}    ����������, ������� �� ��������� � �����������).`n{FFFF00}8. {FFFFFF}������� ������������ ���������� (��� ��������������).`n{FFFFFF}=============================================================================================`n", "1 ���")
        menu := 1
    }
    if Organ = FBI
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� FBI (2 ���).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "1 ���")
        menu := 1
    }
    if Organ = SWAT
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� SWAT (2 ���).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "1 ���")
        menu := 1
    }
    if Organ = CIA
    {
        menu := 0
    showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - RP ��������� CIA (2 ���).", "{FFFFFF}=============================================================================================`n Text {FFFFFF}=============================================================================================`n", "1 ���")
        menu := 1
    }
}
else if (menu == 5)
{
    menu := 0
showDialog(0, "{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���� (2 ���).", "=================================================================================================`n{00BFFF}��������� ����`n{FFFFFF}{FFFF00}Code 0{FFFFFF} - ���������� ����������� ���������. ��� ������� �� ��������� ������� ������� ���, ��� ���������� `n� ������ ������ (�� ����� ������ ��� ��� �����) � ����������� �� �����, ��� �������� ��� 0.`n{FFFF00}Code 1{FFFFFF} - ������ � ����������� ���������. ���������� ��� 3, ��� ������� ������ ��������� ������, `n������ �������� �� ��������� ���������, ����� ��������� ��� 0.`n{FFFF00}Code 2{FFFFFF} - ������������ ����� (��� �����/������������).`n{FFFF00}Code 3{FFFFFF} - ������� ����� (������, �����������).`n{FFFF00}Code 4{FFFFFF} - ������ �� ���������. ( ��� ��������� )`n{FFFF00}Code 4 ADAM{FFFFFF} - ������ �� ���������, ��� ���� ������������� �������. �������������� �����, ������� �������, `n����������� ��� (ASD) Air Support Division, ��� ����� ��� �������� �������� ������������ `n����� ���� ���������� ������������, � ��� �� ����������� ����������, ���� ���������� �� ������ `n����� ���������� ��-�� �������� ����������.`n{FFFF00}Code 5{FFFFFF} - ���� ������ �������� � �������� ��� ��������������, ���� `n�������� ��������� �������� ������ ���������.`n{FFFF00}Code 6{FFFFFF} - ������������ �� ����� (������� ������� � ������� (��������, 911)).`n{FFFF00}Code 7{FFFFFF} - ������� �� ����.`n{FFFF00}Code 8{FFFFFF} - ����������� ��� ����������� �������� ������, ��� ������� ���� ������ ����� ���������, ���� ���������.`n{FFFF00}Code 9{FFFFFF} - ����������� ��� ������, ����� ��������� ��������� ������� ��� �������, ��� ������� ������:`n- ����������� ���������� � ������� �� ����� �� ��������.`n- ����������� ���������� � ������������ ��������.`n- �������������� ���� ������ ���� ���� ����� �����.`n{FFFF00}Code 10{FFFFFF} - ����������� ��� ��������� ��� �������� �������-������������ ������������ ��� �������, `n������� ����� ��������� ��������������.`n=================================================================================================`n", "1 ���")
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
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ������� ���������", "{FFFFFF}������� ������� ���������, �� �������: {00FFFF}Surname{FFFFFF}.  {FF0000}|{FFFFFF}  ������: {00FFFF}Cooper{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���-�� ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
    input, ps, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� '������� ���������'. ������� ��������� ���� �� �������!")
        }
        else
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnersurname:=ps
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ������� ��������� - {00FFFF}" partnersurname "")
            partner := 1
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
        }
        menu:=0
        return
    }
    else if (line_num == 2)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ID ���������", "{FFFFFF}������� id ���������, �� �������: {00FFFF}�����(1-999){FFFFFF}.  {FF0000}|{FFFFFF}  ������: {00FFFF}35{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���-�� ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
    input, paid, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnerid:=paid
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ID ��������� - {00FFFF}" partnerid "")
            Partner:=2
        }
        else
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� 'ID ���������'. ID ��������� �� ��� ������!")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
        }
        menu:=0
        return
    }
    else if (line_num == 3)
    {
    showDialog(1, "{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������", "{FFFFFF}������� ��������� ���������, �� �������: {00FFFF}����������� ������ (PO-I) - Police Officer I{FFFFFF}.  {FF0000}|{FFFFFF}  ������: {00FFFF}PO-II{FFFFFF}.`n{FFFFFF}����� ���� ���-�� ������� ��������� �������{32CD32} <Insert>`n{FFFFFF}� ��� ���� ���� ������ ����� �� ���� ������� {FF0000}<Esc>", "�� ����")
    input, ppost, V, {Insert}.{Escape}.{Enter}
        sleep, 50
        if ErrorLevel = EndKey:Insert
        {
        SendInput,{INSERT}
        SendInput,{ENTER}
            partnerpost:=ppost
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ���������� ��������� ��������� - {00FFFF}" partnerpost "")
            Partner:=3
            return
        }
        else
        if ErrorLevel = EndKey:Escape
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������ �� ���� '��������� ���������'. ��������� ��������� �� ���� �������!")
        }
        else
        if ErrorLevel = EndKey:Enter
        {
        addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��������� ���������� ������� �����{32CD32} <Insert>{FFFFFF} ���-�� ��������� ���������.")
        }
        menu:=0
        return
    }
    else if (line_num == 4)
    {
        IniWrite, %partnerSurname%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
        IniWrite, %partnerId%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
        IniWrite, %partnerPost%, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ��� �������� - {00FFFF}" partnerSurname "{FFFFFF}, � {00FFFF}" partnerId "{FFFFFF} id � ���������� {00FFFF}" partnerPost "{FFFFFF}.")
        menu:=0
    }
    else if (line_num == 5)
    {
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Surname
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Id
        IniWrite, None, %A_MyDocuments%\GTA San Andreas User Files\SAMP\configer.ini, Partner, Post
        partner:=0
        partnersurname:="None"
        partnerid:="None"
        partnerpost:="None"
    addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ������� {FF0000}������� {FFFFFF}���������� � ����� ���������.")
        menu:=0
    }
    menu := 0
}
else if (menu == 7){
Showdialog(2, "{00FF00}[ADJUTANT]{FFFFFF} - ���� ���������", "{FF0000}[1]{FFFFFF} - ������� ���������. |{00FF00} " partnerSurname "`n{FF0000}[2]{FFFFFF} - Id ���������. | {00FF00}" partnerId "`n{FF0000}[3]{FFFFFF} - ��������� ���������. | {00FF00}" partnerPost "`n{FF0000}[4]{FFFFFF} - {00FF00}��������� ���������`n{FF0000}[5]{FFFFFF} - {FF0000}������� ���������", "�����")
    menu := 6
    sleep, 500
}
return
~Enter::
gosub, checkdialogMenu
return
pauseme:
if (pou==1 and TempWeapon==0)
{
    pou:=0
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ��������� ����� �� ��������� '��������'")
    statusd:=false
}
else if (pou==1 and TempWeapon>=1)
{
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - ������� ������ �� ���, � ��������� �������.")
}
else if (pou==0)
{
    pou:=1
    statusd:=true
addChatMessage("{00FF00}[ADJUTANT]{FFFFFF} - �� ����� ����� �� ��������� '��������'")
}
return?PNG
