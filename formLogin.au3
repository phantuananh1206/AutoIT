#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("FormMain", 578, 371, -1, -1)
GUISetFont(14, 400, 0, "Segoe UI")
Global $LabelUsername = GUICtrlCreateLabel("Username", 32, 24, 97, 29)
Global $InputUsername = GUICtrlCreateInput("", 152, 16, 329, 33)
Global $LabelPassword = GUICtrlCreateLabel("Password", 32, 80, 84, 29)
Global $InputPassword = GUICtrlCreateInput("", 152, 72, 329, 33, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
Global $ButtonLogin = GUICtrlCreateButton("Login", 152, 136, 331, 57, $BS_DEFPUSHBUTTON)
GUICtrlSetCursor(-1, 0)
Global $ButtonExit = GUICtrlCreateButton("Exit", 152, 232, 331, 57)
GUICtrlSetCursor(-1, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $ButtonLogin
			Local $username = GUICtrlRead($InputUsername)
			Local $password = GUICtrlRead($InputPassword)

			If $username = 'admin' And $password = '123123' Then
				MsgBox(64 + 262144, 'Thông báo', 'Đăng nhập thành công!')
			Else
				MsgBox(16 + 262144, 'Thông báo', 'Tên người dùng hoặc mật khẩu không đúng!')
			EndIf

		Case $ButtonExit
			Exit
	EndSwitch
WEnd
