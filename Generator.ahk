menu, tray, NoStandard ; ������ ����������� ������ ����

Menu, tray, add, ���: ���.���� � ��, pTwelve
Menu, tray, add, ���: ��.����, pTen
Menu, tray, add, ���: ���.����������, pTen
Menu, tray, add, ���: ����������� ��.����, pTenI
Menu, tray, add
Menu, tray, add, ����: ���.���� � ��, pOGRNIP
Menu, tray, add, ����: ��.����, pOGRN
Menu, tray, add, ����: ���.����������, pOGRNGOS
Menu, tray, add, ����: ����������� ��.����, pOGRNI
Menu, tray, add
Menu, tray, add, ���: ���.���� � ��, pKPPIP
Menu, tray, add, ���: ��.����, pKPP
Menu, tray, add, ���: ���.����������, pKPP
Menu, tray, add, ���: ����������� ��.����, pKPPI
Menu, tray, add
Menu, tray, add, �������� �����, GuiShow
Menu, tray, add
Menu, tray, add, �����, pExit
menu, tray, Default, ���: ��.����
menu, Tray, Tip, ���: ��.����
; =====================================================================================================================
Gui, Add, Radio, x16 y4 w240 h20  altsubmit gButtonAction vMyRadio1, ���������� ���� � ���. ���������������
Gui, Add, Radio, x16 y24 w240 h20 altsubmit gButtonAction vMyRadio2 checked, ����������� ����
Gui, Add, Radio, x16 y44 w240 h20 altsubmit gButtonAction vMyRadio3, ��������������� ����������
Gui, Add, Radio, x16 y64 w240 h20 altsubmit gButtonAction vMyRadio5, ����������� ����������� ����

Gui, Add, Text, x16 y104 w50 h20 , ���
Gui, Add, Edit, x66 y104 w160 h20 -VScroll +Center Readonly vINN,
Gui, Add, Button, x226 y104 w20 h20 gButtonINN, +

Gui, Add, Text, x16 y124 w50 h20 , ����
Gui, Add, Edit, x66 y124 w160 h20 -VScroll +Center Readonly vOGRN,
Gui, Add, Button, x226 y124 w20 h20 gButtonOGRN, +

Gui, Add, Text, x16 y144 w50 h20 , ���
Gui, Add, Edit, x66 y144 w160 h20 -VScroll +Center Readonly vKPP,
Gui, Add, Button, x226 y144 w20 h20 gButtonKPP, +

Gui, Add, Button, x16 y174 w230 h30 gButtonAction, ������������� ������

Gui, +AlwaysOnTop

;Gui, Show, x131 y135 h215 w266, ��������� ����������

Goto, ButtonAction

return
; =====================================================================================================================
GuiShow:
Gui, Show, x131 y135 h215 w266, ��������� ����������
return
; =====================================================================================================================
GuiClose:
Gui, Hide
; ExitApp
return
; =====================================================================================================================
ButtonAction:
Loop, 5 ;
  GuiControlGet, MyRadio%A_Index%     ; ������������ �������� ����� MyRadio

if (MyRadio1 = 1) ; ���� �����/��
  {
    vINN := fTwelve()
    vOGRN := fOGRN(1, vINN)
    vKPP :=  fKPP(1, vINN)
  }
if (MyRadio2 = 1) ; ���� ����������� ����
  {
    vINN := fTen()
    vOGRN := fOGRN(2, vINN)
    vKPP :=  fKPP(2, vINN)
  }
if MyRadio3 ; ���� ��������������� ����������
  {
    vINN := fTen()
    vOGRN := fOGRN(3, vINN)
    vKPP := fKPP(3, vINN)
  }           ; ���� 10 ������
;if MyRadio4 ; ���� ���� �����
;  {
;    vINN := fTen()
;    vOGRN := fOGRN(4)
;    vKPP := fKPP(4, vOGRN)
;  }           ; ���� 10 ������
if MyRadio5 ; ���� ����������� ��.����
  {
    vINN := fTenI()
    vOGRN := fOGRN(5, vINN)
    vKPP := fKPP(5, vINN)
  }

    GuiControl,, INN, %vINN%
    GuiControl,, OGRN, %vOGRN%
    GuiControl,, KPP, %vKPP%
    GuiControlGet, INN     ; ������������ �������� ���� INN
    GuiControlGet, OGRN    ; ������������ �������� ���� INN
    GuiControlGet, KPP     ; ������������ �������� ���� INN

return
; =====================================================================================================================
; =====                                                     ���                                                   =====
; =====================================================================================================================
pTen: ; ��������� INN ��.����� ����� ������
    vINN := fTen()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pTenI: ; ��������� INN ������������ ��.���� � ����� ������
    vINN := fTenI()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pTwelve: ; ��������� INN ���.���� � ����� ������
    vINN := fTwelve()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

; =====================================================================================================================
; =====                                                     ����                                                  =====
; =====================================================================================================================
pOGRNIP:  ; ���� ������
    vOGRN := fOGRN(1,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRN:    ; ���� �����
    vOGRN := fOGRN(2,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRNGOS: ; ���� ���
    vOGRN := fOGRN(3,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRNI:   ; ���� ����������� ����
    vOGRN := fOGRN(5,9909)
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

; =====================================================================================================================
; =====                                                     ���                                                   =====
; =====================================================================================================================
pKPPIP:
    vOGRN := fKPP(1,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pKPP:
    vOGRN := fKPP(2,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pKPPI:
    vOGRN := fKPP(5,9909)
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

; =====================================================================================================================
; =====                                             ������ �����������.                                           =====
; =====================================================================================================================
ButtonINN:
    clipboard = %vINN%
return
ButtonOGRN:
    clipboard = %vOGRN%
return
ButtonKPP:
    clipboard = %vKPP%
return
; =====================================================================================================================
pExit:
ExitApp
; =====================================================================================================================
fTen()             ; ������� ��� �������� 10-�������� ���
{
    N1_1 = 2
    N1_2 = 4
    N1_3 = 10
    N1_4 = 3
    N1_5 = 5
    N1_6 = 9
    N1_7 = 4
    N1_8 = 6
    N1_9 = 8
reTen:
    myVal =
    sum  := 0

    loop 9
    {
      if A_Index = 5 and myVal = 9909 ; ���� ����� ��������������� 9909
        Goto, reTen                    ; �� ������ � ������, �.�. 9909 - ��� ����������� ��.����
      Random, num, 0, 9
      myVal = %myVal%%num%
      sum += num*N1_%A_Index%
    }

    vMod := mod(sum,11)
      if vMod = 10
        vMod := 0

    myVal = %myVal%%vMod%

    return myVal
 }
; =====================================================================================================================
fTenI()             ; ������� ��� �������� 10-�������� ��� ������������ ��.����
{
    N1_1 = 5
    N1_2 = 9
    N1_3 = 4
    N1_4 = 6
    N1_5 = 8

    myVal = 9909
    sum  := 81

    loop 5
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
      sum += num*N1_%A_Index%
    }

    vMod := mod(sum,11)
      if vMod = 10
        vMod := 0

    myVal = %myVal%%vMod%

    return myVal
 }
; =====================================================================================================================
fTwelve()             ; ������� ��� �������� 12-�������� ���
{
    N2_1 = 7
    N2_2 = 2
    N2_3 = 4
    N2_4 = 10
    N2_5 = 3
    N2_6 = 5
    N2_7 = 9
    N2_8 = 4
    N2_9 = 6
    N2_10 = 8

    N1_1 = 3
    N1_2 = 7
    N1_3 = 2
    N1_4 = 4
    N1_5 = 10
    N1_6 = 3
    N1_7 = 5
    N1_8 = 9
    N1_9 = 4
    N1_10 = 6

    myVal =
    sum  = 0
    sum_ = 0


    loop 10
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
      sum  += num*N2_%A_Index%
      sum_ += num*N1_%A_Index%

      ; msgbox, %num%`n   %myVal%`n  %sum%
    }

    vMod := mod(sum,11)
      if vMod = 10
        vMod := 0

    myVal = %myVal%%vMod%

    sum_ += vMod*8

    vMod := mod(sum_,11)
      if vMod = 10
        vMod := 0

    myVal = %myVal%%vMod%

    return myVal
}
; =====================================================================================================================
fOGRN(TYPE, ByRef vINN)
{
  ; � � � � � � � � � � � � �
  ; � (1-� ����) � ������� ��������� ���������������� ���������������� ������ ������
  ;   - ��: 3
  ;   - ����: 1, 5
  ;   - ��������������� ����������:  2, 6, 7, 8, 9
  ;   - ���� �����: 4
  ; �� (�� 2-�� �� 3-� ����) � ��� ��������� ����� ���� �������� ������ � ��������������� ������
  ; �� (4-�, 5-� �����) � ���������� ����� �������� ���������� ��������� �� ������� ��������� ���������� ���������, �������������� ������� 65 ����������� ���������� ���������
  ; �� (� 6-�� �� 7-� ����) � ��� ��������� ���������
  ; ����� (� 8-�� �� 12-� ����) � ����� ������, ��������� � ��������������� ������ � ������� ����
  ; � (13-� ����) � ����������� �����: ������� ������ ������� �� ������� ����������� 12-�������� ����� �� 11, ���� ������� �� ������� ����� 10, �� ����������� ����� ����� 0 (����).

  myVal =

  ;������� ������ ��������� ��������� ���������������� ���������������� ������ ������ � ����������� �� ���� � ����� ����/������
  if (TYPE = 1)
  {
    ArrayC := Array(3)
    LenOGRN = 7
  } else if (TYPE = 2)
  {
    ArrayC := Array(1,5)
    LenOGRN = 5
  } else if (TYPE = 3)
  {
    ArrayC := Array(2,6,7,8,9)
    LenOGRN = 5
  } else if (TYPE = 5)
  {
    ArrayC := Array(4)
    LenOGRN = 5
  }

  ; �������� ������ �����
  Random, numC, 1, ArrayC.Length()
  num := ArrayC[numC]
  myVal = %myVal%%num%

  ; ������� ������ ��� �����
  loop 2
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  num := SubStr(vINN, 1, 4)
  myVal = %myVal%%num%

  ; ������� ��� ��������� ��������� � ����� ������, ��������� � ��������������� ������ � ������� ����.. 7 ��� ���� ��� 9 ������ ��� ��
  loop %LenOGRN%
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  ; � ������ ����� ���������� - ��������� �����
  if TYPE = 1 ; ��� ��
    vMod := mod(myVal,13)
  else        ; ��� ���� ���������
    vMod := mod(myVal,11)

  if vMod = 10
    vMod := 0

  myVal = %myVal%%vMod%

  return myVal
}
; =====================================================================================================================
fKPP(TYPE, ByRef vINN)
{
  ; NNNNPPXXX
  ;  - NNNN (4 �����) � ��� ���������� ������, � ������ ��������� � 4-7 ������� ����
  ;  - PP (2 �����) � ������� ���������� �� ���� (����� ��������)
  ;     - ��� ���������� ����������� �� 01 �� 50 (01 � �� ����� � ����������)
  ;     - ��� ����������� ����������� �� 51 �� 99
  ;  - XXX (3 �����) � ���������� ����� ���������� �� ���� (����� ��������) � ��������� ������ �� ���������������� ���������
  ;

  myVal =

  ; ������� �� ���� ������ ���� ���������� ������
  myVal := SubStr(vINN, 1, 4)

  ; ������� ���������� �� ����. ������ �����
  if TYPE = 5 ; ��� ����������� ��.���
    Random, num, 5, 9
  else        ; ��� ���� ���������
    Random, num, 0, 4
  myVal = %myVal%%num%

;  if TYPE = 2
;    {
;      Random, asc_code, 1, 26 
;      asc_code += 64 ; 65-90 (uppercase A-Z)
;      string := Chr(asc_code) 
;      myVal .= string
;    }
;  else
;    {
      Random, num, 0, 9
      myVal = %myVal%%num%
;    }

  ; ������� ���������� �� ����. ������ ����� � ��������� 3 ))
  loop 3
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  return myVal
}
; =====================================================================================================================
fNalogNum() ; ��� ����� ���������� ���������, ���� ��� �������� � ���
{
  ; ������ ����� ��������, ��� ����������������
  ArrayRegions := Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","83","86","87","89","91","92")
  ; � ��������� ��� � �����
  Random, numC, 1, ArrayRegions.Length()
  num := ArrayRegions[numC]
  myVal = %myVal%%num%

  ; ������� ���������� ��� ��������� ���������
  loop 2
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  return myVal
}
