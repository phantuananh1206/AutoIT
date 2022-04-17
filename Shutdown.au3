#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName



#ce ----------------------------------------------------------------------------

#Region
#AutoIt3Wrapper_Icon=shutdown.ico
#EndRegion

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>

#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("Auto Shutdown", 478, 487, -1, -1)
GUISetFont(14, 400, 0, "Segoe UI")
Global $LabelSelectAction = GUICtrlCreateLabel("Select action:", 16, 16, 115, 29)
Global $ComboSelectAction = GUICtrlCreateCombo("", 16, 56, 161, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Shutdown|Restart", 'Shutdown')
Global $CheckboxForceClose = GUICtrlCreateCheckbox("Force running applications to close", 16, 112, 353, 33)
Global $CheckboxTimeout = GUICtrlCreateCheckbox("Set the time-out period before shutdown", 16, 176, 393, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $LabelTimeout = GUICtrlCreateLabel("Time-out", 16, 216, 81, 29)
Global $InputTimeout = GUICtrlCreateInput("30", 112, 216, 121, 33, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
Global $LabelSecond = GUICtrlCreateLabel("Seconds", 256, 216, 74, 29)
Global $ButtonTimePicker = GUICtrlCreateButton("Time Picker", 344, 216, 107, 33)
Global $LabelComment = GUICtrlCreateLabel("Comment:", 16, 272, 90, 29)
Global $EditComment = GUICtrlCreateEdit("", 8, 312, 433, 89)
GUICtrlSetData(-1, "")
Global $ButtonStart = GUICtrlCreateButton("Start", 16, 416, 179, 25)
Global $ButtonAbort = GUICtrlCreateButton("Abort", 232, 416, 179, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ### Form=
Global $FormTimePicker = GUICreate("FormTimePicker", 283, 129, 192, 124, -1, -1, $FormMain)
GUISetFont(14, 400, 0, "Segoe UI")
Global $DateTimePicker = GUICtrlCreateDate("", 16, 16, 250, 33, BitOR($DTS_UPDOWN,$DTS_TIMEFORMAT))

Global $sStyle = "yyyy/MM/dd HH:mm:ss"
GUICtrlSendMsg($DateTimePicker, $DTM_SETFORMATW, 0, $sStyle)

Global $ButtonOK = GUICtrlCreateButton("OK", 16, 80, 251, 25)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg(1)
	Switch $nMsg[0]
		Case $GUI_EVENT_CLOSE
			If $nMsg[1] = $FormMain Then
				Exit
			EndIf

			If $nMsg[1] = $FormTimePicker Then
				GUISetState(@SW_HIDE, $FormTimePicker)
			EndIf

		Case $CheckboxTimeout
			; Chỉ khi checkbox được tích: cho phép nhập timeout
			If GUICtrlRead($CheckboxTimeout) == $GUI_CHECKED Then
				toggleTimeout(True)
			Else
				toggleTimeout(False)
			EndIf
		Case $ButtonTimePicker
			GUISetState(@SW_SHOW, $FormTimePicker)

		Case $ButtonStart
			Run(generateCommand(), '', @SW_HIDE)
;~ 			MsgBox(0, 0, generateCommand())

		Case $ButtonAbort
			Run('shutdown -a', '', @SW_HIDE)
			MsgBox(64 + 262144, 'Thông báo', 'Đã hủy thành công!')

		Case $ButtonOK
			Local $dateTime = GUICtrlRead($DateTimePicker)
			local $seconds = _DateDiff('s', _NowCalc(), $dateTime)

			If $seconds <= 0 Then
				MsgBox(16 + 26144, 'Lỗi', 'Vui lòng chọn một thời gian hợp lệ!')
			Else
				GUICtrlSetData($InputTimeout, $seconds)
				GUISetState(@SW_HIDE, $FormTimePicker)
			EndIf
	EndSwitch
WEnd

Func generateCommand()
	Local $cmd = 'shutdown'

	; Kiểm tra các tùy chọn của người dùng

	; shutdown hay restart
	Local $action = GUICtrlRead($ComboSelectAction)
	$cmd &= ' ' & ($action == 'Shutdown' ? '-s' : '-r')

	; có đóng toàn bộ ứng dụng hay không?
	If GUICtrlRead($CheckboxForceClose) == $GUI_CHECKED Then
		$cmd &= ' -f'
	EndIf

	; có đặt thời gian chờ hay không?

	If GUICtrlRead($CheckboxTimeout) == $GUI_CHECKED Then
		Local $timeout = GUICtrlRead($InputTimeout)

		If Not $timeout Then
			$timeout = 30
			GUICtrlSetData($InputTimeout, 30)
		EndIf

		$cmd &= ' -t ' & $timeout
	EndIf

	; có nhập lời nhắn gì không?
	Local $comment = GUICtrlRead($EditComment)

	If $comment Then
		$cmd &= ' -c "' & $comment & '"'
	EndIf

	Return $cmd
EndFunc

Func toggleTimeout($enabled)
	Local $value = $enabled ? $GUI_ENABLE : $GUI_DISABLE

	GUICtrlSetState($LabelTimeout, $value)
	GUICtrlSetState($InputTimeout, $value)
	GUICtrlSetState($LabelSecond, $value)
	GUICtrlSetState($ButtonTimePicker, $value)

	If $value Then
		GUICtrlSetState($InputTimeout, $GUI_FOCUS)
	EndIf
EndFunc