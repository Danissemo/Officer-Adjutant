; <COMPILER: v1.1.28.02>
updupd := "| *������ 1.0.1: ������� �� ����-���������� �������. `n| *������ 2.0.0: ���������� ����������. `n| *������ 2.0.5: ���������� ���� '��������'\�����. `n| *������ 2.1.0: ����� ����������. `n| *������ 2.5.0: ����� ����������. `n| *������ 2.6.0: ���� ������ ��������� �����. `n| *������ 2.8.0: ����� ���������. `n| *������ 2.9.0: ���������� �������� \ �����. `n| *������ 2.9.1\2: �����. `n| *������ 2.9.5 - �����\����� ���������. `n| *������ 2.9.6 - ������ Alt + C �� Shift + C. `n| *������ 2.9.7 - ������ ������� ����������. `n| *������ 2.9.8 - �����, ��������� Shift + C �� Alt + Z`n| *������ 2.9.9 - ����� ������� ���������, �������-��� � F1, ���� �������� �� ������� ( �� ������������ ���� � ��������, ���-�� ����������� ��� ������ ). ����� ���������� � ������...`n| *������ 3.0.0 - ���� ������� ���� ���������, ���������� ����� ��������� (�������� ����� �����������) ��� �� ������� ��������� ���� �����, ��� ����� ���� ������ �� ������ ���-�� ��������� ������� ������� ��� ��������� ��� ������ �������� ��� ��������� �������� ��������� � ���.`n| *������ 3.1.0: ���������� ������� ��������� /limit � ���� ����, ���-�� ����� ��������� ������.`n| *������ 3.2.0: ����� �������, ���������� ��������������� �������� � ����� � ������ 10-4.`n| *������ 3.3.5: ����� ������ 3.2.0 (������ �� ����� � ��� ��� ���� ����� ��� *99 � �� ����� � ������ ���� ����� ������� ��). ���� ����-����������� ��������(������ �� �������� ������� ������� �� � ������). ������� ������� ������� /su ���� ��� /cuff ����� ������ � ��� ��� ������� �� � �������.`n| *������ 3.3.9: ���� ������ /arrest , /cput, ��������� ������� =)."
updurl := "https://raw.githubusercontent.com/dan1654/Officer-Adjutant/master/Officer%20Adjutant.exe"
IniRead, vupd, %a_temp%\verlen.ini, UPD, v
SplashTextOn, , 60,�������� ����������, ��������`n------------------------`n����������� �������
RegRead, put2, HKEY_CURRENT_USER, SoftWare\SAMP, put2
sleep, 3000
SplashTextOn, , 60,�������� ����������, ��������`n------------------------`n��������� ����������
URLDownloadToFile, %updurl%, %put2%
SplashTextOn, , 60,�������� ����������, ��������`n------------------------`n��������� ������
sleep, 3000
SplashTextOff
sleep, 200
msgbox, 48, ������ ��������� ������ �� %vupd%, %updupd%
IfMsgBox OK
{
Run, % put2
ExitApp
}