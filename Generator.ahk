menu, tray, NoStandard ; уберем стандартные пункты меню

Menu, tray, add, ИНН: Физ.лицо и ИП, pTwelve
Menu, tray, add, ИНН: Юр.лицо, pTen
Menu, tray, add, ИНН: Гос.учреждения, pTen
Menu, tray, add, ИНН: Иностранные юр.лица, pTenI
Menu, tray, add
Menu, tray, add, ОГРН: Физ.лицо и ИП, pOGRNIP
Menu, tray, add, ОГРН: Юр.лицо, pOGRN
Menu, tray, add, ОГРН: Гос.учреждения, pOGRNGOS
Menu, tray, add, ОГРН: Иностранные юр.лица, pOGRNI
Menu, tray, add
Menu, tray, add, КПП: Физ.лицо и ИП, pKPPIP
Menu, tray, add, КПП: Юр.лицо, pKPP
Menu, tray, add, КПП: Гос.учреждения, pKPP
Menu, tray, add, КПП: Иностранные юр.лица, pKPPI
Menu, tray, add
Menu, tray, add, Показать форму, GuiShow
Menu, tray, add
Menu, tray, add, Выход, pExit
menu, tray, Default, ИНН: Юр.лицо
menu, Tray, Tip, ИНН: Юр.лицо
; =====================================================================================================================
Gui, Add, Radio, x16 y4 w240 h20  altsubmit gButtonAction vMyRadio1, Физическое лицо и Инд. Предприниматель
Gui, Add, Radio, x16 y24 w240 h20 altsubmit gButtonAction vMyRadio2 checked, Юридическое лицо
Gui, Add, Radio, x16 y44 w240 h20 altsubmit gButtonAction vMyRadio3, Государственное учреждение
Gui, Add, Radio, x16 y64 w240 h20 altsubmit gButtonAction vMyRadio5, Иностранное Юридическое лицо

Gui, Add, Text, x16 y104 w50 h20 , ИНН
Gui, Add, Edit, x66 y104 w160 h20 -VScroll +Center Readonly vINN,
Gui, Add, Button, x226 y104 w20 h20 gButtonINN, +

Gui, Add, Text, x16 y124 w50 h20 , ОГРН
Gui, Add, Edit, x66 y124 w160 h20 -VScroll +Center Readonly vOGRN,
Gui, Add, Button, x226 y124 w20 h20 gButtonOGRN, +

Gui, Add, Text, x16 y144 w50 h20 , КПП
Gui, Add, Edit, x66 y144 w160 h20 -VScroll +Center Readonly vKPP,
Gui, Add, Button, x226 y144 w20 h20 gButtonKPP, +

Gui, Add, Button, x16 y174 w230 h30 gButtonAction, Сгенерировать данные

Gui, +AlwaysOnTop

;Gui, Show, x131 y135 h215 w266, Генератор реквизитов

Goto, ButtonAction

return
; =====================================================================================================================
GuiShow:
Gui, Show, x131 y135 h215 w266, Генератор реквизитов
return
; =====================================================================================================================
GuiClose:
Gui, Hide
; ExitApp
return
; =====================================================================================================================
ButtonAction:
Loop, 5 ;
  GuiControlGet, MyRadio%A_Index%     ; перечитываем значение полей MyRadio

if (MyRadio1 = 1) ; если Физик/ИП
  {
    vINN := fTwelve()
    vOGRN := fOGRN(1, vINN)
    vKPP :=  fKPP(1, vINN)
  }
if (MyRadio2 = 1) ; если Юридическое лицо
  {
    vINN := fTen()
    vOGRN := fOGRN(2, vINN)
    vKPP :=  fKPP(2, vINN)
  }
if MyRadio3 ; если Государственное учреждение
  {
    vINN := fTen()
    vOGRN := fOGRN(3, vINN)
    vKPP := fKPP(3, vINN)
  }           ; если 10 знаков
;if MyRadio4 ; если Иные ГРНИП
;  {
;    vINN := fTen()
;    vOGRN := fOGRN(4)
;    vKPP := fKPP(4, vOGRN)
;  }           ; если 10 знаков
if MyRadio5 ; если Иностранное Юр.лицо
  {
    vINN := fTenI()
    vOGRN := fOGRN(5, vINN)
    vKPP := fKPP(5, vINN)
  }

    GuiControl,, INN, %vINN%
    GuiControl,, OGRN, %vOGRN%
    GuiControl,, KPP, %vKPP%
    GuiControlGet, INN     ; перечитываем значение поля INN
    GuiControlGet, OGRN    ; перечитываем значение поля INN
    GuiControlGet, KPP     ; перечитываем значение поля INN

return
; =====================================================================================================================
; =====                                                     ИНН                                                   =====
; =====================================================================================================================
pTen: ; скопируем INN юр.лицав буфер обмена
    vINN := fTen()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pTenI: ; скопируем INN Иностранного юр.лица в буфер обмена
    vINN := fTenI()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pTwelve: ; скопируем INN физ.лица в буфер обмена
    vINN := fTwelve()
    clipboard = %vINN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

; =====================================================================================================================
; =====                                                     ОГРН                                                  =====
; =====================================================================================================================
pOGRNIP:  ; ОГРН физика
    vOGRN := fOGRN(1,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRN:    ; ОГРН юрика
    vOGRN := fOGRN(2,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRNGOS: ; ОГРН гос
    vOGRN := fOGRN(3,fNalogNum())
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

pOGRNI:   ; ОГРН иностранный юрик
    vOGRN := fOGRN(5,9909)
    clipboard = %vOGRN%
    menu, tray, Default, %A_ThisMenuItem%
    menu, Tray, Tip, %A_ThisMenuItem%
return

; =====================================================================================================================
; =====                                                     КПП                                                   =====
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
; =====                                             Кнопки копирования.                                           =====
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
fTen()             ; Функция для создания 10-значного ИНН
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
      if A_Index = 5 and myVal = 9909 ; если вдруг сгенерировалось 9909
        Goto, reTen                    ; то начнем с начала, т.к. 9909 - это иностранные Юр.лица
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
fTenI()             ; Функция для создания 10-значного ИНН Иностранного юр.лица
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
fTwelve()             ; Функция для создания 12-значного ИНН
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
  ; С Г Г К К Н Н Х Х Х Х Х Ч
  ; С (1-й знак) — признак отнесения государственного регистрационного номера записи
  ;   - ИП: 3
  ;   - юрик: 1, 5
  ;   - государственное учреждение:  2, 6, 7, 8, 9
  ;   - Иные ГРНИП: 4
  ; ГГ (со 2-го по 3-й знак) — две последние цифры года внесения записи в государственный реестр
  ; КК (4-й, 5-й знаки) — порядковый номер субъекта Российской Федерации по перечню субъектов Российской Федерации, установленному статьей 65 Конституции Российской Федерации
  ; НН (с 6-го по 7-й знак) — код налоговой инспекции
  ; ХХХХХ (с 8-го по 12-й знак) — номер записи, внесенной в государственный реестр в течение года
  ; Ч (13-й знак) — контрольное число: младший разряд остатка от деления предыдущего 12-значного числа на 11, если остаток от деления равен 10, то контрольное число равно 0 (нулю).

  myVal =

  ;Зададим массив признаков отнесения государственного регистрационного номера записи в зависимости от типа и длины ОГРН/ОГРНИП
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

  ; Вычислим первую цифру
  Random, numC, 1, ArrayC.Length()
  num := ArrayC[numC]
  myVal = %myVal%%num%

  ; Получим вторые две цифры
  loop 2
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  num := SubStr(vINN, 1, 4)
  myVal = %myVal%%num%

  ; Получим код налоговой инспекции и номер записи, внесенной в государственный реестр в течение года.. 7 для всех или 9 знаков для ИП
  loop %LenOGRN%
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  ; А теперь самое интересное - последняя цифра
  if TYPE = 1 ; Для ИП
    vMod := mod(myVal,13)
  else        ; Для всех остальных
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
  ;  - NNNN (4 знака) — код налогового органа, в идеале совпадают с 4-7 знаками ОГРН
  ;  - PP (2 знака) — причина постановки на учет (учёта сведений)
  ;     - для российской организации от 01 до 50 (01 — по месту её нахождения)
  ;     - для иностранной организации от 51 до 99
  ;  - XXX (3 знака) — порядковый номер постановки на учет (учета сведений) в налоговом органе по соответствующему основанию
  ;

  myVal =

  ; Заберем из ОГРН номера кода налогового органа
  myVal := SubStr(vINN, 1, 4)

  ; Причина постановки на учет. Первая цифра
  if TYPE = 5 ; Для Иностранных юр.лиц
    Random, num, 5, 9
  else        ; Для всех остальных
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

  ; Причина постановки на учет. Вторая цифра и последние 3 ))
  loop 3
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  return myVal
}
; =====================================================================================================================
fNalogNum() ; Для более уникальной генерации, если без привязки к ИНН
{
  ; Список кодов регионов, для правдоподобности
  ArrayRegions := Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","83","86","87","89","91","92")
  ; И добавляем код в номер
  Random, numC, 1, ArrayRegions.Length()
  num := ArrayRegions[numC]
  myVal = %myVal%%num%

  ; Получим двузначный код налоговой инспекции
  loop 2
    {
      Random, num, 0, 9
      myVal = %myVal%%num%
    }

  return myVal
}
