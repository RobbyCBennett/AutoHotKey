; 2022/02/21

#SingleInstance force



; Dark Mode / Light Mode

; Control + Shift + D
^+D::
{
	; Find out if light mode/dark mode
	lightMode := RegRead("HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")

	if lightMode {
		; Write dark mode to the registry
		RegWrite(0, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")

		; Change the accent color (B, G, R)
		RegWrite(2367776, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\DWM", "AccentColorInactive")
		RegWrite(1, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\DWM", "ColorPrevalence")

		; You also have to manually set the following key for dark mode, just one time
		; Computer\HKEY_USERS\S-1-5-21-*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent, AccentColorMenu, 0x242120
	}
	else {
		; Write light mode to the registry
		RegWrite(1, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")

		; Change the accent color (B, G, R)
		RegWrite(16777215, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\DWM", "AccentColorInactive")
		RegWrite(0, "Reg_Dword", "HKCU\SOFTWARE\Microsoft\Windows\DWM", "ColorPrevalence")
	}

	return
}



; Select All, Cut, Copy, Paste, Paste Unformatted, Find, Undo, Redo, and Delete

; Alt + A
!A::
{
	; Control + A
	SendInput("^{a}")
	return
}

; Alt + X
!X::
{
	; Control + X
	SendInput("^{x}")
	return
}

; Alt + C
!C::
{
	; Control + C
	SendInput("^{c}")
	return
}

; Alt + V
!V::
{
	; Control + V
	SendInput("^{v}")
	return
}

; Alt + Shift + V
!+V::
{
	; Control + V
	SendInput("^{V}")
	return
}

; Alt + F
!F::
{
	; Control + F
	SendInput("^{f}")
	return
}

; Alt + U
!U::
{
	; Control + Z
	SendInput("^{z}")
	return
}

; Alt + I
!I::
{
	; Control + Shift + Z
	SendInput("^{Z}")
	return
}

; Alt + D
!D::
{
	; Delete
	SendInput("{Delete}")
	return
}



; Open, Close, and Re-open Tabs

; Alt + N
!N::
{
	; Control + T
	SendInput("^{t}")
	return
}

; Alt + M
!M::
{
	; Control + W
	SendInput("^{w}")
	return
}

; Alt + Shift + N
!+N::
{
	; Control + Shift + T
	SendInput("^{T}")
	return
}



; Media Controls

; Right Control + Space
; Right Alt + Space
>^Space::
>!Space::
{
	; Play/Pause
	SendInput("{Media_Play_Pause}")
	return
}

; Right Control + Left
; Right Alt + Left
>^Left::
>!Left::
{
	; Previous Song
	SendInput("{Media_Prev}")
	return
}

; Right Control + Right
; Right Alt + Right
>^Right::
>!Right::
{
	; Next Song
	SendInput("{Media_Next}")
	return
}

; Right Control + Up
; Right Alt + Up
>^Up::
>!Up::
{
	; Volume Up
	SendInput("{Volume_Up}")
	return
}

; Right Control + Down
; Right Alt + Down
>^Down::
>!Down::
{
	; Volume Down
	SendInput("{Volume_Down}")
	return
}



; Text Navigation

; Alt + J
!J::
{
	; Left arrow
	SendInput("{Left}")
	return
}

; Alt + K
!K::
{
	; Down arrow
	SendInput("{Down}")
	return
}

; Alt + L
!L::
{
	; Up arrow
	SendInput("{Up}")
	return
}

; Alt + Semicolon
!;::
{
	; Right arrow
	SendInput("{Right}")
	return
}

; Alt + Shift + J
!+J::
{
	; Move to start of word
	SendInput("{ControlDown}{Left}{ControlUp}")
	return
}

; Alt + Shift + Semicolon
!+;::
{
	; Move to end of word
	SendInput("{ControlDown}{Right}{ControlUp}")
	return
}

; Control + Alt + Shift + J
^!+J::
{
	; Select to start of word
	SendInput("{ControlDown}{ShiftDown}{Left}{ShiftUp}{ControlUp}")
	return
}

; Control + Alt + Shift + Semicolon
^!+;::
{
	; Select to end of word
	SendInput("{ControlDown}{ShiftDown}{Right}{ShiftUp}{ControlUp}")
	return
}

; Control + Alt + J
^!J::
{
	; Select left
	SendInput("{ShiftDown}{Left}{ShiftUp}")
	return
}

; Control + Alt + K
^!K::
{
	; Select down
	SendInput("{ShiftDown}{Down}{ShiftUp}")
	return
}

; Control + Alt + L
^!L::
{
	; Select up
	SendInput("{ShiftDown}{Up}{ShiftUp}")
	return
}

; Control + Alt + Semicolon
^!;::
{
	; Select right
	SendInput("{ShiftDown}{Right}{ShiftUp}")
	return
}

; Alt + H
!H::
{
	; Move to beginning of line
	SendInput("{Home}")
	return
}

; Alt + Single Quote
!'::
{
	; Move to end of line
	SendInput("{End}")
	return
}

; Alt + Shift + K
!+K::
{
	; Move to bottom
	SendInput("^{End}")
	return
}

; Alt + Shift + L
!+L::
{
	; Move to top
	SendInput("^{Home}")
	return
}

; Control + Alt + H
^!H::
{
	; Select to beginning of line
	SendInput("{ShiftDown}{Home}{ShiftUp}")
	return
}

; Control + Alt + Single Quote
^!'::
{
	; Select to end of line
	SendInput("{ShiftDown}{End}{ShiftUp}")
	return
}

; Control + Alt + Shift K
^!+K::
{
	; Select to bottom
	SendInput("{ShiftDown}^{End}{ShiftUp}")
	return
}

; Control + Alt + Shift + L
^!+L::
	; Select to top
{
	SendInput("{ShiftDown}^{Home}{ShiftUp}")
	return
}
