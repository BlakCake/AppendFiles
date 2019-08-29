; It is HIGHLY recommended the use of ATOM Text Editor
; to review and edit this code
; Download ATOM here: https://atom.io/
; The following packages are also recommended:
; *language-autohotkey2
; *custom-folds
; Script by Christian Barsallo
#SingleInstance, Force
#NoEnv

CodeName=FileAppend

;Start code
ProgramIni:

Gui, Add, Text, x12 y9 w90 h20 , Input Folder
Gui, Add, Edit, vFolderInput x12 y29 w380 h20 , %A_MyDocuments%
Gui, Add, Button, x402 y29 w70 h20 , Browse
Gui, Add, Text, x12 y59 w90 h20 , Output File
Gui, Add, Edit, vFileOutput x12 y79 w380 h20 , %A_MyDocuments%
Gui, Add, Button, gSecondBrowse x402 y79 w70 h20 , Browse
Gui, Add, Button, x12 y109 w460 h30 , Append
Gui, Add, Checkbox, vNewLine x330 y9, Insert a new line every file?
Gui, Show, x730 y347 h152 w488, FileAppend
Return

GuiClose:
ExitApp

ButtonBrowse:
FileSelectFolder, SelectedFolder,,,Select the folder containing the files to append/consolidate
GuiControl,, FolderInput, %SelectedFolder%
Return

SecondBrowse:
FileSelectFile, SelectedOutput,S16,,Select save location, CSV Files (*.csv)
GuiControl,, FileOutput, %SelectedOutput%
return

ButtonAppend:
Gui, Submit, NoHide
;MsgBox, %NewLine%
;MsgBox, %FolderInput%
;MsgBox, %FileOutput%

Loop, %FolderInput%\*.csv

{
  FileRead, aFileContents, %A_LoopFileFullPath%
	ToolTip, Working... (%A_Index%)
  FileAppend, %aFileContents%, %FileOutput%
  if NewLine = 1
    FileAppend, `n, %FileOutput%
}
ToolTip
MsgBox, Done!`nFile saved to %FileOutput%

F1::
MsgBox,, Credits, Created by Christian Barsallo`nhttps://github.com/BlakCake/AppendFiles
return

Pause::Pause
