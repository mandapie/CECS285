;Amanda Pan
;Lab 3: Ram and complex operation
;Activity 2

w EQU 0x30 ;char w with ROM location 0x30
x EQU 0x31 ;char x with ROM location 0x31
y EQU 0x32 ;char y with ROM location 0x32
z EQU 0x33 ;char z with ROM location 0x33

mov w, #0x01 ;w = 0x01
mov x, #0x02 ;x = 0x02
mov y, #0x03 ;y = 0x03
mov z, #0x04 ;z = 0x04
mov A, y ;A = y
add A, z ;A = y+z
subb A, w ;A = y+z-w
subb A, x ;A = y+z-w-x
end





;Activity 1

mov R0, #0x1F ;R0 = #0x1F
mov R1, #0x2E ;R1 = #0x2E
mov R2, #0x3D ;R2 = #0x3D
mov A, R0 ;A = R0
add A, R1 ;A = R0 + R1
subb A, R2 ;A = R0 + R1 - R2
mov R4, A ;R4 = A
end