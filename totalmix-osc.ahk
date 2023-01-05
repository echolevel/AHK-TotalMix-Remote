; This example sends OSC messages on key presses and works together with the simple_example.ahk
; and string_example.ahk. The messages are sent back to this PC by using the loopback IP adress
; 127.0.0.1, but of course normal IP addresses can be used too.

#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Until here, this is the default script template
; Get handle to this running script instance
Gui +LastFound
hWnd := WinExist()

; Load DLL
DllCall("LoadLibrary", "Str", "OSC2AHK.dll", "Ptr")


; Macropad layout:
; 0 1 2   Media keys
; 3 4 5   RightAlt+RightCtrl+RightShift + F7/F8/F9
; 6 7 8   RightAlt+RightCtrl+RightShift + F10/F11/F12


; 3   4      5
; ?   Recall PhMute
; 6    7     8
; Mic  Mono  Mute

; MIDDLE ROW

; MAIN SPEAKER B
^+!f7::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/1/mainSpeakerB"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return

; MAIN RECALL
^+!f8::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/1/mainRecall"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return

; PHONES MUTE
^+!f9::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/3/muteGroups/3/1"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return



; BOTTOM ROW

; MIC MUTE
^+!f10::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/2/mute"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return

; MAIN MONO
^+!f11::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/1/mainMono"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return

; MAIN MUTE
^+!f12::
ip := "127.0.0.1" ; Note that this is the "loopback" IP, so this gets sent back to our PC
port := 7001
addr := "/3/muteGroups/4/1"
data := 1.0
DllCall("OSC2AHK.dll\sendOscMessageFloat", AStr, ip, UInt, port, AStr, addr, Float, data)
return
