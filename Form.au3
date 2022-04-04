#cs ----------------------------------------------------------------------------Ưhat ảe plán úing on mảket at thí time ỏ focú on building and developing ỏ getting c


 AutoIt Version: 3.3.16.0
 Author:         Justin

 Script Function:

	Template AutoIt script.


#ce ----------------------------------------------------------------------------


; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <DateTimeConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <GUIListBox.au3>
#include <ProgressConstants.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 1120, 603, 490, 324)
$MenuItem1 = GUICtrlCreateMenu("&File")
$MenuItem6 = GUICtrlCreateMenuItem("&Open", $MenuItem1)
$MenuItem8 = GUICtrlCreateMenuItem("&Save", $MenuItem1)
$MenuItem9 = GUICtrlCreateMenuItem("", $MenuItem1)
$MenuItem7 = GUICtrlCreateMenuItem("E&xit", $MenuItem1)
$MenuItem2 = GUICtrlCreateMenu("Edit")
$MenuItem3 = GUICtrlCreateMenu("View")
$MenuItem4 = GUICtrlCreateMenu("Options")
$MenuItem5 = GUICtrlCreateMenu("Tools")
GUISetFont(14, 400, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("Username", 88, 80, 91, 28)
$Input1 = GUICtrlCreateInput("", 208, 72, 121, 32)
$Label2 = GUICtrlCreateLabel("Password", 88, 136, 86, 28)
$Input2 = GUICtrlCreateInput("", 208, 128, 121, 32)
$Edit1 = GUICtrlCreateEdit("", 88, 208, 273, 169)
GUICtrlSetData(-1, "Edit1")
$Button1 = GUICtrlCreateButton("Login", 376, 72, 139, 33)
$Checkbox1 = GUICtrlCreateCheckbox("Remember", 376, 136, 113, 17)
$Radio1 = GUICtrlCreateRadio("Male", 88, 416, 113, 17)
$Radio2 = GUICtrlCreateRadio("Female", 88, 456, 113, 17)
$List1 = GUICtrlCreateList("", 417, 208, 183, 174)
GUICtrlSetData(-1, "Eric|Four|Justin")
$Slider1 = GUICtrlCreateSlider(408, 408, 150, 45)
$Progress1 = GUICtrlCreateProgress(88, 504, 150, 17)
$Combo1 = GUICtrlCreateCombo("Combo1", 224, 432, 145, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "123|456|789")
$IPAddress1 = _GUICtrlIpAddress_Create($Form1, 592, 72, 139, 28)
_GUICtrlIpAddress_Set($IPAddress1, "0.0.0.0")
$Date1 = GUICtrlCreateDate("2022/03/20 21:28:16", 648, 152, 378, 32)
$MonthCal1 = GUICtrlCreateMonthCal("2022/03/20", 712, 216, 229, 164)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
