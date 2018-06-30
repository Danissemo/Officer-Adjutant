updurl := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/Officer%20Adjutant.exe"
SplashTextOn, , 60,Менеджер обновлений, Ожидайте`n------------------------`nНастраиваем систему
RegRead, put2, HKEY_CURRENT_USER, SoftWare\SAMP, put2
sleep, 5000
SplashTextOn, , 60,Менеджер обновлений, Ожидайте`n------------------------`nСкачиваем обновление
URLDownloadToFile, %updurl%, %put2%
SplashTextOn, , 60,Менеджер обновлений, Ожидайте`n------------------------`nЗапускаем скрипт
sleep, 3000
Run, % put2
ExitApp