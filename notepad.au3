#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#Region ### START Koda GUI section ### Form=
Global $formMain = GUICreate("Untitle - Notepad", 620, 408, -1, -1, BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_TABSTOP))
Global $MenuItem1 = GUICtrlCreateMenu("&File")
Global $MenuItem3 = GUICtrlCreateMenuItem("New", $MenuItem1)
Global $MenuItem4 = GUICtrlCreateMenuItem("Open"&@TAB&"", $MenuItem1)
Global $MenuItem5 = GUICtrlCreateMenuItem("Save", $MenuItem1)
Global $MenuItem6 = GUICtrlCreateMenuItem(""&@TAB&"", $MenuItem1)
Global $MenuItem7 = GUICtrlCreateMenuItem("E&xit"&@TAB&"T", $MenuItem1)
Global $MenuItem2 = GUICtrlCreateMenu("&Help")
Global $MenuItem8 = GUICtrlCreateMenuItem("About"&@TAB&"Shift+0", $MenuItem2)
GUISetFont(14, 400, 0, "Segoe UI")
Global $Edit = GUICtrlCreateEdit("", 0, 0, 614, 416)
GUICtrlSetData(-1, "")
Global $formMain_AccelTable[2][2] = [["t", $MenuItem7],["+0", $MenuItem8]]
GUISetAccelerators($formMain_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $MenuItem3 ; New
			; Nếu không có dữ liệu: thì không làm gì
			; Nếu có dữ liệu: hỏi người dùng có muốn lưu lại không
			; - Nếu không lưu: xóa dữ liệu trong Edit
			; - Nếu có lưu: Lưu lại và xóa dữ liệu trong Edit
			Local $content = GUICtrlRead($Edit)

			If $content then
				Local $action = MsgBox(3 + 262144, 'Notedpad', 'Do you want to save changes to Untitled?', 0, $formMain)
				If $action == 6 Or $action == 7 Then
					If $action == 6 Then
						saveFile($content)
					EndIf
					; Xóa dữ liệu
					GUICtrlSetData($Edit, '')
				EndIf

			EndIf
		Case $MenuItem4 ; Open
			; Nếu không có dữ liệuL thì hiển thị hộp thoại mở file
			; Nếu có dữ liệu: hỏi người dùng có muốn lưu lại không
			; - Nếu không lưu: xóa dữ liệu trong Edit
			; - Nếu có lưu: lưu lại và hiển thị hộp thoại mở file
			Local $content = GUICtrlRead($Edit)

			If $content Then
				; Có dữ liệu
				saveFile($content)
			EndIf

			Local $filePath = openFile()

			updateTitle($filePath)
		Case $MenuItem5 ; Save
			; Hỏi người dùng có muốn lưu file không
			Local $content = GUICtrlRead($Edit)

			If $content Then
				Local $filePath = saveFile($content)
				updateTitle($filePath)
			EndIf
		Case $MenuItem7
			Exit
		Case $MenuItem8 ; About
			MsgBox(64 + 262144, 'About', 'Developed by JUSTIN_ERIC', 0, $formMain)
	EndSwitch
WEnd

Func saveFile($content)
	; Lưu file
	Local $fileHandle = FileSaveDialog('Save', @ScriptDir, 'Text files (*.txt)|All files (*.*)', 16, '', $formMain)

	If $fileHandle Then
		Local $filePath = FileOpen($fileHandle, 2)
		FileWrite($filePath, $content)
		FileClose($filePath)

		Return $fileHandle
	EndIf
EndFunc

Func openFile()
	Local $fileHandle = FileOpenDialog('Open', @ScriptDir, 'Text files (*.txt)|All files (*.*)', 1 + 2 + 8, '', $formMain)

	If $fileHandle Then
		Local $filePath = FileOpen($fileHandle, 128)
		Local $data = FileRead($filePath)
		FileClose($filePath)

		GUICtrlSetData($Edit, $data)

		Return $fileHandle
	EndIf
EndFunc

Func updateTitle($filePath)
	Local $drive, $dir, $fileName, $fileExt
	_PathSplit($filePath, $drive, $dir, $fileName, $fileExt)

	WinSetTitle($formMain, '', $fileName & $fileExt & ' - Notepad')
EndFunc