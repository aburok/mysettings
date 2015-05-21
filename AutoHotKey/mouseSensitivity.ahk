; GET INTIAL MOUSE SPEED: 
; 0x70 (SPI_GETMOUSESPEED), third parameter is the speed (range is 1-20, 10 is default) 
DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UIntP, Mouse_Speed_Orig, UInt, 0) 

Mouse_Speed_Slow := Mouse_Speed_Orig * 0.75 
Mouse_Speed_Slow := Floor(Mouse_Speed_Slow) 
; Or directly set the speed: Mouse_Speed_Slow =5
Return 

SetSpeed(Mouse_Speed)
{
	DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, Mouse_Speed, UInt, 0) 
}

!#Z:: 
    SetSpeed(5)
Return 

!#X:: 
    SetSpeed(10)
Return 

!#C:: 
    SetSpeed(15)
Return 