.model small
.stack 100h 
.data 

.code

PLUS macro      
mov dl,'+'
mov ah,02h
int 21h
endm

main proc

mov ah,1h    ;Input1
int 21h
sub al,30h
mov bl,al ; moving first bit of first num in bl 

mov ah,1h    ;Input2
int 21h
sub al,30h  
mov bh,al   ;moving second bit of first num in bh  


PLUS          ;plus macro to seperate another 2bit number 


mov ah,01h    ;Input 3
int 21h
sub al,30h  
mov ch,al   ;moving first bit of second number in ch

mov ah,01h    ;Input 4 
int 21h
sub al,30h  ;moving second bit of second number in al   

mov cl,'0'
sub cl,30h

add bh,al
cmp bh,9
JB a
JE b
JG c

c:
add bl,1
sub bh,10
b:
mov bh,bh 
a:
add bl,ch 

cmp bl,9
JB aa
JE ab
JG ac

ac:
add cl,1
sub bl,10 
ab:
mov bl,bl
aa:
mov cl,cl

add cl,30h
add bl,30h  ;Conversions  
add bh,30h  ;of asciis 


mov dl,'='
mov ah,02h      ; for displaying '='
int 21h  
      
mov dl,cl     ;Displaying first bit
mov ah,02h
int 21h        
mov dl,bl     ;Displaying second bit
mov ah,02h
int 21h   
mov dl,bh     ;Displaying third bit
mov ah,02h
int 21h 


main endp
end main
