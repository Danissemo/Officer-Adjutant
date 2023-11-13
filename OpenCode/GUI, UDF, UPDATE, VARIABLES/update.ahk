buildscr = 60
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
    msgbox, , Список изменений версии %vupd%, %updupd%
    return
}
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
    sleep, 2000
    put2 := % A_ScriptFullPath
    RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
    SplashTextOn, , 60, Менеджер обновлений,  Ожидайте`n------------------------`nОбновляем скрипт
    URLDownloadToFile, %downlurl%, %a_temp%\updt.exe
    sleep, 500
    run, %a_temp%\updt.exe
    exitapp
}
SplashTextoff