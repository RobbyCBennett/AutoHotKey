#singleInstance force



; Stay on Stop

; Windows Space
#SPACE::
	; Stay on top
	WinSet, Alwaysontop, toggle, A
return



; Dark Mode

; Control + Shift + D
^+D::
	; Find out if light mode/dark mode
	RegRead, varLightMode, HKCU, SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize, AppsUseLightTheme

	If varLightMode {
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

; Alt D
!D::
	; Delete
	SendInput {Delete}
return



; Media Controls

; Right Control + Space
>^Space::
	; Play/Pause
	SendInput {Media_Play_Pause}
return

; Right Control + Left
>^Left::
	; Previous Song
	SendInput {Media_Prev}
return

; Right Control + Right
>^Right::
	; Next Song
	SendInput {Media_Next}
return

; Right Control + Up
>^Up::
	; Volume Up
	SendInput {Volume_Up}
return

; Right Control + Down
>^Down::
  	; Volume Down
	SendInput {Volume_Down}
return



; Text Navigation

; Alt J
!J::
	; Left arrow
	SendInput {Left}
return

; Alt K
!K::
	; Down arrow
	SendInput {Down}
return

; Alt J
!L::
	; Up arrow
	SendInput {Up}
return

; Alt Semicolon
!;::
	; Right arrow
	SendInput {Right}
return

; Ctrl Alt J
^!J::
	; Select left
	SendInput {ShiftDown}{Left}{ShiftUp}
return

; Ctrl Alt K
^!K::
	; Select down
	SendInput {ShiftDown}{Down}{ShiftUp}
return

; Ctrl Alt L
^!L::
	; Select up
	SendInput {ShiftDown}{Up}{ShiftUp}
return

; Ctrl Alt Semicolon
^!;::
	; Select right
	SendInput {ShiftDown}{Right}{ShiftUp}
return

; Alt H
!H::
	; Move to beginning of line
	SendInput {Home}
return

; Alt Single Quote
!'::
	; Move to end of line
	SendInput {End}
return

; Alt Shift K
!+K::
	; Move to bottom
	SendInput ^{End}
return

; Alt Shift L
!+L::
	; Move to top
	SendInput ^{Home}
return

; Ctrl Alt H
^!H::
	; Select to beginning of line
	SendInput {ShiftDown}{Home}{ShiftUp}
return

; Ctrl Alt Single Quote
^!'::
	; Select to end of line
	SendInput {ShiftDown}{End}{ShiftUp}
return

; Ctrl Alt Shift K
^!+K::
	; Select to bottom
	SendInput {ShiftDown}^{End}{ShiftUp}
return

; Ctrl Alt Shift L
^!+L::
	; Select to top
	SendInput {ShiftDown}^{Home}{ShiftUp}
return



; Adobe Document Switching

#ifWinActive ahk_class illustrator
; Alt ,
!,::
	; Previous Document
	SendInput ^+{F6}
return

; Alt .
!.::
	; Next Document
	SendInput ^{F6}
return

#ifWinActive ahk_class Photoshop
; Alt ,
!,::
	; Previous Document
	SendInput ^+{Tab}
return

; Alt .
!.::
	; Next Document
	SendInput ^{Tab}
return
