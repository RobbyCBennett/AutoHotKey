#singleInstance force



; ; OpenRGB

; ; Alt + Number
; !1::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "1 Red.orp"
; return
; !2::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "2 Orange.orp"
; return
; !3::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "3 Yellow.orp"
; return
; !4::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "4 Green.orp"
; return
; !5::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "5 Teal.orp"
; return
; !6::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "6 Sky Blue.orp"
; return
; !7::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "7 Deep Blue.orp"
; return
; !8::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "8 Purple.orp"
; return
; !9::
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "9 Pink.orp"
; return
; !0::
; 	; Process, Close, "OpenRGB.exe"
; 	Run, "C:\Program Files\OpenRGB\OpenRGB.exe" --startminimized --server --profile "Off.orp"
; return




; Stay on Top

; Windows + Space
#SPACE::
	; Toggle always on top
	WinSet, Alwaysontop, toggle, A
return



; Dark Mode / Light Mode

; Control + Shift + D
^+D::
	; Find out if light mode/dark mode
	RegRead, lightMode, HKCU, SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize, AppsUseLightTheme

	if lightMode {
		; Write dark mode to the registry
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize, AppsUseLightTheme, 0

		; Change the accent color (B, G, R)
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\DWM, AccentColorInactive, 0x242120
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\DWM, ColorPrevalence, 1

		; You also have to manually set the following key for dark mode, just one time
		; Computer\HKEY_USERS\S-1-5-21-*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent, AccentColorMenu, 0x242120
	}
	else {
		; Write light mode to the registry
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize, AppsUseLightTheme, 1

		; Change the accent color (B, G, R)
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\DWM, AccentColorInactive, 0xffffff
		RegWrite, Reg_Dword, HKCU, SOFTWARE\Microsoft\Windows\DWM, ColorPrevalence, 0
	}

return



; Delete

; Alt + D
!D::
	; Delete
	SendInput {Delete}
return



; Media Controls

; Right Control + Space
; Right Alt + Space
>^Space::
>!Space::
	; Play/Pause
	SendInput {Media_Play_Pause}
return

; Right Control + Left
; Right Alt + Left
>^Left::
>!Left::
	; Previous Song
	SendInput {Media_Prev}
return

; Right Control + Right
; Right Alt + Right
>^Right::
>!Right::
	; Next Song
	SendInput {Media_Next}
return

; Right Control + Up
; Right Alt + Up
>^Up::
>!Up::
	; Volume Up
	SendInput {Volume_Up}
return

; Right Control + Down
; Right Alt + Down
>^Down::
>!Down::
	; Volume Down
	SendInput {Volume_Down}
return



; Text Navigation

; Alt + J
!J::
	; Left arrow
	SendInput {Left}
return

; Alt + K
!K::
	; Down arrow
	SendInput {Down}
return

; Alt + J
!L::
	; Up arrow
	SendInput {Up}
return

; Alt + Semicolon
!;::
	; Right arrow
	SendInput {Right}
return

; Control + Alt + J
^!J::
	; Select left
	SendInput {ShiftDown}{Left}{ShiftUp}
return

; Control + Alt + K
^!K::
	; Select down
	SendInput {ShiftDown}{Down}{ShiftUp}
return

; Control + Alt + L
^!L::
	; Select up
	SendInput {ShiftDown}{Up}{ShiftUp}
return

; Control + Alt + Semicolon
^!;::
	; Select right
	SendInput {ShiftDown}{Right}{ShiftUp}
return

; Alt + H
!H::
	; Move to beginning of line
	SendInput {Home}
return

; Alt + Single Quote
!'::
	; Move to end of line
	SendInput {End}
return

; Alt + Shift + K
!+K::
	; Move to bottom
	SendInput ^{End}
return

; Alt + Shift + L
!+L::
	; Move to top
	SendInput ^{Home}
return

; Control + Alt + H
^!H::
	; Select to beginning of line
	SendInput {ShiftDown}{Home}{ShiftUp}
return

; Control + Alt + Single Quote
^!'::
	; Select to end of line
	SendInput {ShiftDown}{End}{ShiftUp}
return

; Control + Alt  + Shift K
^!+K::
	; Select to bottom
	SendInput {ShiftDown}^{End}{ShiftUp}
return

; Control + Alt + Shift + L
^!+L::
	; Select to top
	SendInput {ShiftDown}^{Home}{ShiftUp}
return



; Adobe Document Switching

#ifWinActive ahk_class illustrator
; Alt + Comma
!,::
	; Previous Document
	SendInput ^+{F6}
return

; Alt + Period
!.::
	; Next Document
	SendInput ^{F6}
return

#ifWinActive ahk_class Photoshop
; Alt + Comma
!,::
	; Previous Document
	SendInput ^+{Tab}
return

; Alt + Period
!.::
	; Next Document
	SendInput ^{Tab}
return
