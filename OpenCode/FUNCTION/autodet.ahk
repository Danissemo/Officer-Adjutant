﻿Active5:
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
    if(getDist(o1,getPedCoordinates(getPedById(kid[0])))>10 and kid[0]!=-1)
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