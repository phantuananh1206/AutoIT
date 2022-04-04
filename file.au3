#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; ghi dữ liệu ra file
;~ Global $filePath = FileSaveDialog('Save', @ScriptDir, 'Text files (*.txt)|All files (*.*)', 16, 'justin.txt')
;~ Global $fileHandle = FileOpen($filePath, 2 + 8 + 128)
;~ FileWrite($fileHandle, 'Hello World')
;~ FileClose($fileHandle)
;~ MsgBox(0, 0, $filePath)
;~ Exit

; Ghi dữ liệu vào file
;~ Local $fileHandle = FileOpen('abc\test.txt', 2 + 8)
;~ FileWrite($fileHandle, 'hello')
;~ FileClose($fileHandle)

; Đọc dữ liệu
Global $filePath = FileOpenDialog('Open', @ScriptDir, 'Plain text (*.txt)|All files (*.*)', 16, 'justin.txt')
Global $fileHandle = FileOpen($filePath, 128)
Global $data = FileRead($fileHandle)
FileClose($fileHandle)

MsgBox(0, 0, $data)
