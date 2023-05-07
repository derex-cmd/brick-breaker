.model small
.stack 100h
.data
;These are the variables used for movement proc
Browup dw 0
Browdown dw 0
Rcolrightup dw 1
Rcolrightdown dw 0
Lcollleftup dw 0
Lcollleftdown dw 0
Hitwallright dw 0
Hitwallleft dw 0
Hitwallup dw 0
endgamee dw 0



;These variables will be used for bricks
hit1 dw 0
hit2 dw 0
hit3 dw 0
hit4 dw 0
hit5 dw 0
hit6 dw 0
hit7 dw 0
hit8 dw 0
hit9 dw 0
hit10 dw 0
hit11 dw 0
hit12 dw 0
hit13 dw 0
hit14 dw 0
hit15 dw 0
hit16 dw 0
hit17 dw 0
hit18 dw 0
hit19 dw 0
hit20 dw 0
hit21 dw 0
hit22 dw 0
hit23 dw 0
hit24 dw 0
hit25 dw 0
hit26 dw 0
hit27 dw 0
hit28 dw 0
hit29 dw 0
hit30 dw 0
hit31 dw 0
hit32 dw 0
hit33 dw 0
hit34 dw 0
hit35 dw 0




counter dw 0
score dw 0
hearts dw 3
infi dw 0
sliderleftcol db 16
sliderrightcol db 24
slidertoprow db 22
sliderbottomrow db 22

sliderhit db 0
ballleftcol db 12
ballrightcol db 12
balltop db 18
ballbottom db 18
pl1 db 0
pl2 db 0
BB db 'BRICK BREAKER'
br=$-BB
v1 db 3
col db 01h
var1 db 'WELCOME'
l=$-var1
v2 db 0
v3 db 0
str1 db "Press -BACKSPACE- to end Game program $"
str2 db 'Kindly Enter your name: '
lol=$-str2
str3 db "!!INSTRUCTIONS!!$"
str4 db 15 dup(0)
len db 0
string1 db "In the brick breaker game, the player moves a paddle from side to side to hit a BALL. $"
string2 db "The game objective is to eliminate all of the BRICKS at the top of the screen by hitting them with the BALL.$"
string3 db "But if the ball hit the bottom ENCLOSURE, the player loses and the game ends!$"
string4 db "To win the game, all the BRICKS must be eliminated.$"
string5 db "The game is split into many levels, which must be completed in sequence.$"
string6 db "There will be a time limit of 4 minutes and the remaining time will be shown with the counter.$" 
string7 db "The purpose of this game is to complete all the levels without losing all lives.$"
string8 db "The player will have a maximum of 3 lives.$"
string9 db "Backspace has been pressed,ended the Game program$"
strong db 'PRESS 3 FOR INSTRUCTIONS'
lo=$-strong
streng db 'PRESS 1 FOR NEW GAME'
ng=$-streng
funny db 'PRESS 2 TO RESUME'
ho=$-funny
highscore db 'PRESS 4 FOR HIGHSCORE'
hs=$-highscore
strin1 db "Press 'b' at any stage to go to MainMenu$"
paus db "Press 'p' to pause the game and go back to the main menu$"

.code
mov ax,@data
mov ds,ax
mov ax,0

call WelcomePage

MAINMENU:
mov ah,0
mov al,13h
int 10h
;____MAIN MENU____

mov bx,0
mov si,offset str4
mov cl,len
mov v1,0
n:
;cursor pos
mov ah, 2
mov dh, 0    ;row
mov dl, v1     ;column
int 10h

mov dl,[si]
mov ah,2
int 21h
inc si
inc v1
loop n

mov bx,0

mov si,offset streng
mov al,ng
mov v3,al
mov al,0
mov v1,3
bubg:
mov bx,0
;cursor pos
mov ah, 2
mov dh, 4    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je sheee
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Eh   ; color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP bubg

sheee:


mov v2,0
mov bx,0
mov v1,3
mov si,offset highscore
mov al,hs
mov v3,al
mov al,0
hoho:
mov bx,0
;cursor pos
mov ah, 2
mov dh, 10    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je cool
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Eh   ; color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP hoho

cool:

mov v2,0
mov bx,0
mov v1,3
mov si,offset strong
mov al,lo
mov v3,al
mov al,0
hello:
mov bx,0
;cursor pos
mov ah, 2
mov dh, 8    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je coo
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Eh   ; color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP hello

coo:

mov v1,3
mov si,offset funny
mov al,ho
mov v3,al
mov al,0
hey:
mov bx,0
;cursor pos
mov ah, 2
mov dh, 6   ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je fort
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Eh   ; color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP hey

fort:
mov v1,3
mov v2,0
mov al,0
mov v3,0
; box

mov ah, 6
mov al, 0
mov bh, 3     ;color
mov ch, 18     ;top row of window
mov cl, 7     ;left most column of window
mov dh, 24     ;Bottom row of window
mov dl, 35    ;Right most column of window
int 10h



L1:
mov ah,1
int 16h
mov ah,0
int 16h
cmp al,08h   ;will terminate if backspace pressed
je exit
cmp al,'1'
je NEWGAME
cmp al,'2'
je NEWGAME
cmp al,'3'
je INSTRUCTIONS
JMP L1

INSTRUCTIONS:
call inst



NEWGAME:
call NEWGAM

exit:
mov dx,offset string9
mov ah,09h
int 21h

mov ah,4ch
int 21h

;//////////////////THE PROCEDURE FOR THE INSTRUCTIONS
inst PROC
mov bx,0

mov ah,0
mov al,13h
int 10h

mov dx,offset str3
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string1
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string2
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string3
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string4
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string5
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string6
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

mov dx,offset string7
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h


L3:
mov ah,1
int 16h
mov ah,0
int 16h
cmp al,08h   ;will terminate if backspace pressed
je exit
cmp al,'b'
je MAINMENU
JMP L3
r:
ret
inst endp
;////////////////////////WELCOME PAGE
WelcomePage PROC

mov ah,0
mov al,13h ;800x600
int 10h

mov v1,5
mov si,offset BB
mov al,br
mov v3,al
mov al,0
lop:
;cursor pos
mov ah, 2
mov dh, 2    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je ct
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,col   ; color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
inc col
JMP lop

ct:
mov v1,3
mov v2,0

mov si,offset var1
mov al,l
mov v3,al
mov al,0
loop1:
;cursor pos
mov ah, 2
mov dh, 6    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je ctd
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Dh   ;pink color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP loop1

ctd:
mov v1,3
mov v2,0
mov si,offset str2
mov al,lol
mov v3,al
mov al,0
loop2:
;cursor pos
mov ah, 2
mov dh, 8    ;row
mov dl, v1     ;column
int 10h

mov al,v2
mov bl,v3
cmp al,bl
je ctd2
mov al,[si]   ;ASCII code of Character 
mov bx,0
mov bl,0Dh   ;pink color
mov cx,1      ;repetition count
mov ah,09h
int 10h
inc v2
inc si
inc v1
JMP loop2

ctd2:

;cursor pos
mov ah, 2
mov dh, 23    ;row
mov dl, 0     ;column
int 10h

mov dx,offset str1
mov ah,9
int 21h

;cursor pos
mov ah, 2
mov dh, 22    ;row
mov dl, 0     ;column
int 10h

mov dx,offset strin1
mov ah,9
int 21h


;cursor pos
mov ah, 2
mov dh, 20    ;row
mov dl, 0     ;column
int 10h

mov dx,offset paus
mov ah,9
int 21h


mov si,offset str4
mov v1,3
mov bx,0

L2:

;cursor pos
mov ah, 2
mov dh, 9    ;row
mov dl, v1     ;column
int 10h
mov ah,1
int 16h
mov ah,0
int 16h
cmp al,08h   ;will terminate if backspace pressed
je exit
mov [si],al
mov al,[si]
mov bx,0
mov bl,0Dh   ;pink color
mov cx,1      ;repetition count
mov ah,09h
int 10h
cmp al,13	;after entering the name
je mm
inc si
inc v1
inc len
JMP L2

mm:


ret
WelcomePage endp

;///////////////////
NEWGAM proc



mov ah, 0
mov al, 13h    ;320x200
int 10h
;/////////////////////////////////////////////////
;Top box
comment!
mov ah, 6
mov al, 0
mov bh, 8     ;color
mov ch, 0     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 2     ;Bottom row of window
mov dl, 40    ;Right most column of window
int 10h
!
;//////////////////////////////////////////////////////////////
infinity:

;Borders 

;Top horiz line
MOV CX, 20    ;(column)
MOV DX, 40    ;(row)
hl1:
cmp cx, 300
je rp
MOV AL, 1111b  ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp hl1


;Left vertical line
rp:
MOV CX, 20    ;(column)
MOV DX, 40    ;(row)
vl2:
cmp dx, 200
je lw
MOV AL, 1111b  ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp vl2


;Right vertical line
lw:
MOV CX, 300    ;(column)
MOV DX, 40    ;(row)
jmp vl4
vl4:
cmp dx, 200
je score1
MOV AL, 1111b  ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp vl4


;///////////////////////////////////////////////////////
;Score

score1:
mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 17     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 18     ;column
int 10h

mov al,'c'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 19     ;column
int 10h

mov al,'o'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 20     ;column
int 10h

mov al,'r'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 21     ;column
int 10h

mov al,'e'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 22     ;column
int 10h

mov al,':'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 24     ;column
int 10h
call SetScore

jmp mq


;//////////////////////////////////////////////////////////////////////////

;HEARTS///////////////////////////////////////////////////////////////////
mq:
mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 2     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,4  ;red color
mov cx,hearts       ;repetition count
mov ah,09h
int 10h


jmp pl
;/////////////////////////////////////////////////////////////////////////

;Platform
mov bx,0
pl:

mov ah, 6
mov al, 0
mov bh, 3     ;color
mov ch, slidertoprow    ;top row of window
mov cl, sliderleftcol   ;left most column of window
mov dh, sliderbottomrow     ;Bottom row of window
mov dl, sliderrightcol    ;Right most column of window
int 10h


br1:
mov ah,1
int 16h
jz cnt
mov ah,0
int 16h

cmp ah,4dh
je rightgo
cmp ah,4bh
je leftgo
cmp al,'p'
je MAINMENU

cnt:

mov ah, 6
mov al, 0
mov bh, 3    ;color
mov ch, slidertoprow    ;top row of window
mov cl, sliderleftcol   ;left most column of window
mov dh, sliderbottomrow     ;Bottom row of window
mov dl, sliderrightcol    ;Right most column of window
int 10h


jmp brik

brik:

.if(hit1==0)
call b1
.endif

.if(hit1==1)
call bn1

.endif



.if(hit2==0)
call b2
.endif

.if(hit2==1)
call bn2

.endif


.if(hit3==0)
call b3
.endif

.if(hit3==1)
call bn3

.endif


.if(hit4==0)
call b4
.endif

.if(hit4==1)
call bn4

.endif


.if(hit5==0)
call b5
.endif

.if(hit5==1)
call bn5

.endif


.if(hit6==0)
call b6
.endif

.if(hit6==1)
call bn6

.endif


.if(hit7==0)
call b7
.endif

.if(hit7==1)
call bn7

.endif


.if(hit8==0)
call b8

.endif

.if(hit8==1)
call bn8

.endif


.if(hit9==0)
call b9
.endif

.if(hit9==1)
call bn9

.endif


.if(hit10==0)
call b10
.endif

.if(hit10==1)
call bn10

.endif


.if(hit11==0)
call b11
.endif

.if(hit11==1)
call bn11

.endif


.if(hit12==0)
call b12
.endif

.if(hit12==1)
call bn12

.endif


.if(hit13==0)
call b13
.endif

.if(hit13==1)
call bn13

.endif


.if(hit14==0)
call b14
.endif

.if(hit14==1)
call bn14

.endif


.if(hit15==0)
call b15
.endif

.if(hit15==1)
call bn15

.endif


.if(hit16==0)
call b16
.endif

.if(hit16==1)
call bn16

.endif


.if(hit17==0)
call b17
.endif

.if(hit17==1)
call bn17
.endif


.if(hit18==0)
call b18
.endif

.if(hit18==1)
call bn18

.endif


.if(hit19==0)
call b19
.endif

.if(hit19==1)
call bn19

.endif


.if(hit20==0)
call b20
.endif

.if(hit20==1)
call bn20

.endif


.if(hit21==0)
call b21
.endif

.if(hit21==1)
call bn21

.endif


.if(hit22==0)
call b22
.endif

.if(hit22==1)
call bn22

.endif


.if(hit23==0)
call b23
.endif

.if(hit23==1)
call bn23

.endif


.if(hit24==0)
call b24
.endif

.if(hit24==1)
call bn24

.endif


.if(hit25==0)
call b25
.endif

.if(hit25==1)
call bn25

.endif


.if(hit26==0)
call b26
.endif

.if(hit26==1)
call bn26

.endif


.if(hit27==0)
call b27
.endif

.if(hit27==1)
call bn27

.endif


.if(hit28==0)
call b28
.endif

.if(hit28==1)
call bn28

.endif












Ballmov:



;////Add Conditions here
.IF (Browup==1)
	call Ballup
call delay
	call Upwall
	.if (Hitwallup==1)
		mov Browup,0
		mov Browdown,1 
		call sound
	.endif
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Browup,0
		mov Browdown,1 
		call delay
		inc score

		call sound

		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Browup,0
		mov Browdown,1 
		call delay
		inc score

		call sound

		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit4!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit5!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit6!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit7!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit8!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Browup,0
		mov Browdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Browup,0
		mov Browdown,1
		call delay
		call sound
		inc score
		.endif
	.endif
	
.ELSEIF (Browdown==1)
	call Balldown
call delay
	call endgam
	call checkslider
	.if (endgamee==1)
		mov Browdown,0
		mov endgamee,0
		call sound
		call res
	.endif
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit4!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit5!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit6!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit7!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit8!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Browup,1
		mov Browdown,0
		call sound
		call delay
		inc score
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Browup,1
		mov Browdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Browup,1
		mov Browdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	
	;//////FUNCTIONALITY FOR THE SLIDER
.ELSEIF (Rcolrightup == 1)
	call BallRightup
call delay
	call Upwall
	call Rightwall
	.if (Hitwallup==1)
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call sound
	.endif
	.if (Hitwallright==1)
		mov Rcolrightup,0
		mov Lcollleftup,1
		call sound
	.endif
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call sound
		call delay
		inc score
		.endif
	.endif
	.if hit4!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit5!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit6!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit7!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit8!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Rcolrightup,0
		mov Rcolrightdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	


.ELSEIF (Rcolrightdown == 1)
	call BallRightdown
call delay
	call Rightwall
	call checkslider
	call endgam
	.if (endgamee==1)
		call sound
		mov endgamee,0
		mov Rcolrightdown,0
		call res
	.endif
	.if (Hitwallright==1)
		mov Hitwallright,0
		call sound
		mov Rcolrightdown,0
		mov Lcollleftdown,1
	.endif
	.if (sliderhit==1)
		mov sliderhit,0
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call sound
	.endif
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit4!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit5!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit6!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit7!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit8!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score 
		call sound
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Rcolrightup,1
		mov Rcolrightdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	

.ELSEIF (Lcollleftup == 1)
	call BallLeftup
call delay
	call Upwall
	call Leftwall
	.if (Hitwallup==1)
		mov Hitwallup,0
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call sound
	.endif
	.if (Hitwallleft==1)
		mov Hitwallleft,0
		mov Lcollleftup,0
		mov Rcolrightup,1
		call sound
		
	.endif
	
	
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit4!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit5!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit6!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit7!=1
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit8!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1
		call delay
		inc score 
		call sound
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1
		call delay
		inc score 
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1
		call delay
		inc score 
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		call sound
		inc score
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Lcollleftup,0
		mov Lcollleftdown,1 
		call delay
		inc score
		call sound
		.endif
	.endif
	

.ELSEIF (Lcollleftdown == 1)
	call BallLeftdown
call delay
	call Leftwall
	call endgam
	call checkslider
	.if (endgamee==1)
		mov Lcollleftdown,0
		mov endgamee,0
		call res
	.endif
	.if (Hitwallleft==1)
		mov Hitwallleft,0
		mov Lcollleftdown,0
		mov Rcolrightdown,1
		call sound
	.endif
	.if (sliderhit==1)
		mov sliderhit,0
		mov Lcollleftdown,0
		mov Lcollleftup,1
		call sound
	.endif
	.if (hit1==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=3 && ballrightcol<=6)
		mov hit1, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0
		call delay
		inc score 
		call sound
		.endif
	.endif
	.if (hit2==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=8 && ballrightcol<=11)
		mov hit2, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0  
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit3==0)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=13 && ballrightcol<=16)
		mov hit3, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit4!=1)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=18 && ballrightcol<=21)
		mov hit4, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit5!=1)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=23 && ballrightcol<=26)
		mov hit5, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0  
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit6!=1)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=28 && ballrightcol<=31)
		mov hit6, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit7!=1)
		.if((balltop==6 || ballbottom==6) && ballleftcol>=33 && ballrightcol<=36)
		mov hit7, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if (hit8!=1)
		.if((balltop==8 || ballbottom==8) && ballleftcol>=3 && ballrightcol<=4)
		mov hit8, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit9!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=6 && ballrightcol<=9)
		mov hit9, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit10!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=11 && ballrightcol<=14)
		mov hit10, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit11!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=16 && ballrightcol<=19)
		mov hit11, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit12!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=21 && ballrightcol<=24)
		mov hit12, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit13!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=26 && ballrightcol<=29)
		mov hit13, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit14!=1
		.if((balltop==8 || ballbottom==8) && ballleftcol>=31 && ballrightcol<=34)
		mov hit14, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit15!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=3 && ballrightcol<=6)
		mov hit15, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit16!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=8 && ballrightcol<=11)
		mov hit16, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit17!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=13 && ballrightcol<=16)
		mov hit17, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit18!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=18 && ballrightcol<=21)
		mov hit18, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit19!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=23 && ballrightcol<=26)
		mov hit19, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit20!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=28 && ballrightcol<=31)
		mov hit20, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit21!=1
		.if((balltop==10 || ballbottom==10) && ballleftcol>=33 && ballrightcol<=36)
		mov hit21, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit22!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=3 && ballrightcol<=4)
		mov hit22, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit23!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=6 && ballrightcol<=9)
		mov hit23, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit24!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=11 && ballrightcol<=14)
		mov hit24, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit25!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=16 && ballrightcol<=19)
		mov hit25, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit26!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=21 && ballrightcol<=24)
		mov hit26, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit27!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=26 && ballrightcol<=29)
		mov hit27, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	.if hit28!=1
		.if((balltop==12 || ballbottom==12) && ballleftcol>=31 && ballrightcol<=34)
		mov hit28, 1
		mov Lcollleftup,1
		mov Lcollleftdown,0 
		call delay
		inc score
		call sound
		.endif
	.endif
	


.ELSE 
	jmp exit	
.ENDIF

.IF (hit1==1 && hit2==1 && hit3==1 && hit4==1 && hit5==1 && hit6==1)
	.IF(hit7==1 && hit8==1 && hit9==1 && hit10==1 && hit11==1 && hit12==1 && hit13==1) 
		.IF(hit14==1 && hit15==1 && hit16==1 && hit17==1 && hit18==1 && hit19==1) 
			.IF(hit20==1 && hit21==1 && hit22==1 && hit23==1 && hit24==1) 
				.IF(hit25==1 && hit26==1 && hit27==1 && hit27==1 && hit28==1)
				call GameWon
				.ENDIF
			.ENDIF
		.ENDIF
	.ENDIF
.ENDIF
.IF(hearts==0)
call gameOver
JMP exit
.ENDIF

JMP infinity


leftgo:
call leftslide
JMP cnt
rightgo:
call rightslide
JMP cnt


ret
NEWGAM endp

;///////////INITIAL VALUES RESET
res proc
mov balltop,18
mov ballbottom,18
mov ballleftcol,20
mov ballrightcol,20

mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop    ;top row of window
mov cl, ballleftcol    ;left most column of window
mov dh, ballbottom    ;Bottom row of window
mov dl, ballrightcol  ;Right most column of window
int 10

cmp hearts,0
je exit

call heartmake
dec hearts


mov Browup,0
mov Browdown,0
mov Rcolrightdown,0
mov Lcollleftup,0
mov Lcollleftdown,0
mov Rcolrightup,1

ret
res endp
;//////////////////////////////////

heartmake proc


mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 2     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,0 ;red color
mov cx,3      ;repetition count
mov ah,09h
int 10h


ret
heartmake endp

leftslide proc


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, slidertoprow    ;top row of window
mov cl, sliderleftcol   ;left most column of window
mov dh, sliderbottomrow     ;Bottom row of window
mov dl, sliderrightcol    ;Right most column of window
int 10h

.if sliderleftcol!=3
dec sliderleftcol
dec sliderrightcol

.endif
ret
leftslide endp

rightslide proc


mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, slidertoprow    ;top row of window
mov cl, sliderleftcol   ;left most column of window
mov dh, sliderbottomrow     ;Bottom row of window
mov dl, sliderrightcol    ;Right most column of window
int 10h
.if sliderrightcol!=36
inc sliderrightcol
inc sliderleftcol


.endif
ret

rightslide endp

;/////////////////PROCEDURE TO CHECK IF SLIDER IS HIT OR NOT

checkslider proc

.if balltop==21
	mov al,ballleftcol
	.if (al>=sliderleftcol) 
		.if (al<=sliderrightcol)
			.if (Lcollleftdown==1)
			mov sliderhit,1
			.elseif (Rcolrightdown==1)
			mov sliderhit,1
			.endif
		.endif
	.endif
.endif

ret
checkslider endp


;///////////////////////////////////



;/////////////////PROCEDURES TO CHECK IF ANY WALL IS HIT OR IF THE BALL FELL DOWN
Upwall proc
.if balltop==5
	mov hitwallup,1
.endif

ret

Upwall endp

endgam proc
.if balltop==25
	
mov Browup,0
mov Browdown,0
mov Rcolrightdown,0
mov Lcollleftup,1
mov Lcollleftdown,0
mov Rcolrightup,0
	mov endgamee,1
	
.endif
ret
endgam endp

Rightwall proc
.if ballrightcol==36
	mov hitwallright,1
.endif
ret
Rightwall endp

Leftwall proc
.if ballleftcol==2
	mov hitwallleft,1
.endif

ret
Leftwall endp
;///////////////////////////


Ballup proc
;//////////movement up


mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay

dec balltop
dec ballbottom


mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h






ret
Ballup endp


;/////////////////////////////////////////////////
delay proc
.while (infi<=65000)
inc infi
.endw
mov infi,0
ret
delay endp




;///////////////////////////////////////////////
Balldown proc

mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop         ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom      ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay

inc balltop
inc ballbottom


mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay





ret
Balldown endp



;///////////////////////////////////////////////
;//////////////This Proc will move the ball 135 degrees to the left
BallLeftup proc


mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop         ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom      ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay


dec balltop
dec ballbottom
dec ballleftcol
dec ballrightcol

mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay



ret
BallLeftup endp




;///////////////////////////////////////////////
BallRightup proc;///This proc will move the ball 45 degrees to the right

mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop         ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom      ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay


dec balltop
dec ballbottom
inc ballleftcol
inc ballrightcol

mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay






ret
BallRightup endp




;///////////////////////////////////////////////
BallRightdown proc;///This proc will be used when we have to move -45 degrees downwards after hitting wall


mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop         ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom      ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay


inc balltop
inc ballbottom
inc ballleftcol
inc ballrightcol

mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay





ret
BallRightdown endp







;///////////////////////////////////////////////
BallLeftdown proc;///This proc will be used to move -135 degrees downwards, after after hitting wall

mov ah, 6
mov al, 0
mov bh, 0    ;color
mov ch, balltop         ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom      ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay


inc balltop
inc ballbottom
dec ballleftcol
dec ballrightcol

mov ah, 6
mov al, 0
mov bh, 69    ;color
mov ch, balltop     ;top row of window
mov cl, ballleftcol     ;left most column of window
mov dh, ballbottom     ;Bottom row of window
mov dl, ballrightcol    ;Right most column of window
int 10h

call delay




ret
BallLeftdown endp








;///////////////////////////////////////////////





;/////////////////////////////////////////////////////////////////////
;Bricks
;Row 1

b1 proc
mov bx,0
mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h

ret
b1 endp

bn1 proc
mov bx,0
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h

ret
bn1 endp

b2 proc
mov ah, 6
mov al, 0
mov bh, 2     ;color
mov ch, 6     ;top row of window
mov cl, 8     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 11    ;Right most column of window
int 10h
ret
b2 endp

bn2 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 8     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 11    ;Right most column of window
int 10h
ret
bn2 endp



b3 proc
mov ah, 6
mov al, 0
mov bh, 3     ;color
mov ch, 6     ;top row of window
mov cl, 13     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 16    ;Right most column of window
int 10h
ret
b3 endp


bn3 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 13     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 16    ;Right most column of window
int 10h
ret
bn3 endp




b4 proc
mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 6     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 21    ;Right most column of window
int 10h
ret
b4 endp

bn4 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 21    ;Right most column of window
int 10h
ret
bn4 endp


b5 proc
mov ah, 6
mov al, 0
mov bh, 5     ;color
mov ch, 6     ;top row of window
mov cl, 23     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 26    ;Right most column of window
int 10h

ret
b5 endp


bn5 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 23     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 26    ;Right most column of window
int 10h

ret
bn5 endp



b6 proc
mov ah, 6
mov al, 0
mov bh, 6     ;color
mov ch, 6     ;top row of window
mov cl, 28     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 31    ;Right most column of window
int 10h

ret
b6 endp


bn6 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 28     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 31    ;Right most column of window
int 10h

ret
bn6 endp





b7 proc
mov ah, 6
mov al, 0
mov bh, 7     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 36    ;Right most column of window
int 10h
ret
b7 endp



bn7 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 36    ;Right most column of window
int 10h
ret
bn7 endp




;Row 2////////////////////////////////////////////////////////////////


b8 proc
mov ah, 6
mov al, 0
mov bh, 8     ;color
mov ch, 8     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 4    ;Right most column of window
int 10h
ret
b8 endp



bn8 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 4    ;Right most column of window
int 10h
ret
bn8 endp




b9 proc
mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 8     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 9    ;Right most column of window
int 10h
ret
b9 endp


bn9 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 9    ;Right most column of window
int 10h
ret
bn9 endp



b10 proc
mov ah, 6
mov al, 0
mov bh, 10     ;color
mov ch, 8     ;top row of window
mov cl, 11     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 14    ;Right most column of window
int 10h
ret
b10 endp


bn10 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 11     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 14    ;Right most column of window
int 10h
ret
bn10 endp




b11 proc
mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 8     ;top row of window
mov cl, 16     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19    ;Right most column of window
int 10h
ret
b11 endp




bn11 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 16     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19    ;Right most column of window
int 10h
ret
bn11 endp









b12 proc
mov ah, 6
mov al, 0
mov bh, 12     ;color
mov ch, 8     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 24    ;Right most column of window
int 10h
ret
b12 endp


bn12 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 24    ;Right most column of window
int 10h
ret
bn12 endp




b13 proc
mov ah, 6
mov al, 0
mov bh, 13     ;color
mov ch, 8     ;top row of window
mov cl, 26     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 29    ;Right most column of window
int 10h
ret
b13 endp

 
bn13 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 26     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 29    ;Right most column of window
int 10h
ret
bn13 endp




b14 proc
mov ah, 6
mov al, 0
mov bh, 14     ;color
mov ch, 8     ;top row of window
mov cl, 31     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 34    ;Right most column of window
int 10h
ret
b14 endp


bn14 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 8     ;top row of window
mov cl, 31     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 34    ;Right most column of window
int 10h
ret
bn14 endp






;Row 3/////////////////////////////////////////////////////////////////

b15 proc
mov ah, 6
mov al, 0
mov bh, 31     ;color
mov ch, 10     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h
ret
b15 endp


bn15 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h
ret
bn15 endp








b16 proc
mov ah, 6
mov al, 0
mov bh, 32     ;color
mov ch, 10     ;top row of window
mov cl, 8     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 11    ;Right most column of window
int 10h
ret
b16 endp


bn16 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 8     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 11    ;Right most column of window
int 10h
ret
bn16 endp




b17 proc
mov ah, 6
mov al, 0
mov bh, 33     ;color
mov ch, 10     ;top row of window
mov cl, 13     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 16    ;Right most column of window
int 10h
ret
b17 endp


bn17 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 13     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 16    ;Right most column of window
int 10h
ret
bn17 endp





b18 proc
mov ah, 6
mov al, 0
mov bh, 34     ;color
mov ch, 10     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 21    ;Right most column of window
int 10h
ret
b18 endp



bn18 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 18     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 21    ;Right most column of window
int 10h
ret
bn18 endp



b19 proc
mov ah, 6
mov al, 0
mov bh, 35     ;color
mov ch, 10     ;top row of window
mov cl, 23     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 26    ;Right most column of window
int 10h
ret
b19 endp



bn19 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 23     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 26    ;Right most column of window
int 10h
ret
bn19 endp




b20 proc
mov ah, 6
mov al, 0
mov bh, 36     ;color
mov ch, 10     ;top row of window
mov cl, 28     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 31    ;Right most column of window
int 10h
ret
b20 endp



bn20 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 28     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 31    ;Right most column of window
int 10h
ret
bn20 endp






b21 proc
mov ah, 6
mov al, 0
mov bh, 37     ;color
mov ch, 10     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 36    ;Right most column of window
int 10h
ret
b21 endp



bn21 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 10     ;Bottom row of window
mov dl, 36    ;Right most column of window
int 10h
ret
bn21 endp






;Row 4/////////////////////////////////////////////////////////////



b22 proc
mov ah, 6
mov al, 0
mov bh, 38     ;color
mov ch, 12     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 4    ;Right most column of window
int 10h
ret
b22 endp


bn22 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 4    ;Right most column of window
int 10h
ret
bn22 endp







b23 proc
mov ah, 6
mov al, 0
mov bh, 39     ;color
mov ch, 12     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 9    ;Right most column of window
int 10h
ret
b23 endp



bn23 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 6     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 9    ;Right most column of window
int 10h
ret
bn23 endp



b24 proc
mov ah, 6
mov al, 0
mov bh, 40     ;color
mov ch, 12     ;top row of window
mov cl, 11     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 14    ;Right most column of window
int 10h
ret
b24 endp


bn24 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 11     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 14    ;Right most column of window
int 10h
ret
bn24 endp







b25 proc
mov ah, 6
mov al, 0
mov bh, 41     ;color
mov ch, 12     ;top row of window
mov cl, 16     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19    ;Right most column of window
int 10h
ret
b25 endp


bn25 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 16     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19    ;Right most column of window
int 10h
ret
bn25 endp




b26 proc
mov ah, 6
mov al, 0
mov bh, 42     ;color
mov ch, 12     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 24    ;Right most column of window
int 10h
ret
b26 endp



bn26 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 24    ;Right most column of window
int 10h
ret
bn26 endp





b27 proc
mov ah, 6
mov al, 0
mov bh, 43     ;color
mov ch, 12     ;top row of window
mov cl, 26     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 29    ;Right most column of window
int 10h
ret
b27 endp



bn27 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 26     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 29    ;Right most column of window
int 10h
ret
bn27 endp





b28 proc
mov ah, 6
mov al, 0
mov bh, 44     ;color
mov ch, 12     ;top row of window
mov cl, 31     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 34    ;Right most column of window
int 10h
ret
b28 endp



bn28 proc
mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 12     ;top row of window
mov cl, 31     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 34    ;Right most column of window
int 10h
ret
bn28 endp





;///////////

Setscore proc


 OUTPUT:
     mov dx, 0
	MOV AX, score
	MOV Bx, 10
	Label1:
          mov dx, 0
		CMP Ax, 0
		JE DISP
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counter
		MOV AH, 0
		JMP Label1

DISP:
	CMP counter, 0
	JE done
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counter
	JMP DISP

done:

ret
Setscore endp

sound proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,  3043     ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 2          ; Pause for duration of note.
.pause1:
        mov     cx, 65535
.pause2:
        dec     cx
        jne     .pause2
        dec     bx
        jne     .pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        pop dx
        pop cx
        pop bx
        pop ax

ret
sound endp

GameWon proc

mov ah,0
mov al,13h
int 10h
mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 17     ;column
int 10h

mov al,'Y'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 18     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 19     ;column
int 10h

mov al,'U'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 22     ;column
int 10h

mov al,'W'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 22     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h


mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 23     ;column
int 10h

mov al,'N'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 24     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 25     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 26     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 27     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 27     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov bx,0
;setting cursor position
mov ah, 2
mov dh, 20     ;row
mov dl, 0    ;column
int 10h


ret 
GameWon endp

GameOver proc

mov ah,0
mov al,13h
int 10h

mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 17     ;column
int 10h

mov al,'G'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 18     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 19     ;column
int 10h

mov al,'M'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 20     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 22     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 23     ;column
int 10h

mov al,'V'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h


mov bx,0
;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 24    ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 25     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 26     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 27     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 28     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 2     ;row
mov dl, 29     ;column
int 10h

mov al,'!'    ;ASCII code of Character 
mov bx,0
mov bl,78   ;Light Blue color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov bx,0
;setting cursor position
mov ah, 2
mov dh, 20     ;row
mov dl, 0    ;column
int 10h

ret
GameOver endp

end