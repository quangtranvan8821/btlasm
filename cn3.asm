INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
    m1    db 13, 10, '          CONG COM'
          db 13, 10, '          --------'
          db 13, 10, '  So luong cong COM la: $'
    m3    db 13, 10, '  Dia chi cac cong com la: $'
    menu  db 13, 10, '  An phim bat ky de ve Main menu$'
    space db         '  $'  
.CODE
    PUBLIC @CongCom$qv
    @CongCom$qv PROC
        clrscr
        HienString m1
        int 11h                 ; Goi ham ngat voi ma 0x11 de thuc hien thao tac 
                                ; lien quan den cong COM va luu ket qua vao thanh ghi AX va AH.
        mov al, ah              ; Sao chep gia tri thanh ghi AH (0:411h) vao AL.
        and al, 00001110b       ; Tach 3 bit thap cua AL de kiem tra so luong cong COM.
        shr al, 1               ; Dich phai cac bit cua AL de kiem tra so luong cong COM.
        jnz L1                  ; Neu AL # 0, nhay den nhan L1
        jmp Exit                ; Va thoat chuong trinh
        
        L1:
            mov cl, al          ; Gan gia tri cua AL cho CL
            xor ch, ch          ; Gan ch = 0 -> CX = CL -> cx la chi so vong lap
            
            add al, 30h         ; Chuyen gia tri cua AL (So luong cong COM) thanh ASCII
            mov ah, 0eh         ; Chuc nang hien thi ky tu ASCII
            int 10h             
            
            HienString m3       ; Hien thi chuoi "Dia chi cac cong COM la: "
            xor ax, ax          ; Gan gia tri cho ax = 0
            mov es, ax          ; Gan gia tri cho es = ax
            mov bx, 400h        ; Gan gia tri BX = dia chi bat dau cua cac cong COM.

        L2:
            mov ax, es:[bx]     ; Gan gia tri ES:BX vao AX.
            call HIEN_HEXA      ; Hien thi gia tri cua ax duoi dang HEXA
            HienString space
            add bx, 2
            loop L2

        Exit:
            HienString menu
            mov ah, 1
            int 21h
            ret
    @CongCom$qv ENDP
INCLUDE lib2.asm
END