INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
    m1      db 13, 10, '     TONG LE DAY SO NGUYEN'
            db 13, 10, '     ---------------------'
            db 13, 10, '  Hay vao so luong thanh phan: $'
    m2      db 13, 10,    '  a[$'
    m3      db         '] = $'   
    m4      db 13, 10, '  Day so vua vao la: $'
    space   db         '  $'
    m5      db 13, 10, '  Tong cac thanh phan le cua day so nguyen la: $'
    menu    db 13, 10, '  An phim bat ky de ve Main menu$'
    tieptuc db 13, 10, '  Co tiep tuc CT (c/k) ? $'
    
    sltp    dw ?              ; Khai bao bien sltp (So luong thanh phan) kieu word
    index   dw 0              ; Khai bao bien index voi gia tri ban dau la 0
    a       dw 100 dup(?)     ; Khai bao 1 mang a co 100 phan tu va khong khoi tao gia tri ban dau
    buff    db 8              
            db ?              
            db 8 dup(?)
.CODE
    PUBLIC @TongLe$qv
    @TongLe$qv PROC
        L0:
            clrscr
            HienString m1
            call VAO_SO_N   ; Nhap so luong thanh phan va luu vao ax
            mov sltp, ax    ; Gan so luong thanh phan tu ax vao sltp
            mov index, 0    ; Gan gia tri bien nho index
            lea bx, a       ; bx la con tro offset cua a[0]
            mov cx, sltp    ; Gan so luong thanh phan tu sltp vao cx
            
        ; Vong lap 1 nhan 1 so nguyen vao mang (Array)
        L1:
            HienString m2
            mov ax, index   ; Gan gia tri tu index vao ax
            call HIEN_SO_N  ; Hien gia tri tu ax
            HienString m3
            call VAO_SO_N
            mov [bx], ax    ; Gan gia tri a[index] vua nhap vao vi tri bo nho bx tro den
            inc index       ; Tang gia tri index len 1
            add bx, 2       ; Cho bx tro den thanh phan tiep theo trong mang
            loop L1
            
        ; Vong lap hien cac so cua mang len man hinh
        HienString m4
        mov cx, sltp        ; Gan so luong thanh phan tu sltp vao cx
        lea bx, a
        
        L2:
            mov ax, [bx]    ; Gan gia tri trong
            call HIEN_SO_N
            HienString space
            add bx, 2
            loop L2
            
        ; Vong lap tinh tong
        HienString m5
        mov cx, sltp
        lea bx, a
        xor ax, ax          ; Gan gia tri cho ax = 0
        
        ; Vong lap tinh tong cac so le
        L3:
            mov dx, [bx]	; dx = a[i]
            shr dx, 1		; Bit thấp nhất vào cờ Carry (C=1-> a[i] là lẻ, C=0 -> a[i] là chẵn)
            jnc L4		    ; Nếu giá trị a[i] là chẵn thì nhảy đến nhãn L4
            add ax, [bx]	; còn giá trị a[i] là lẻ thì cộng vào tổng nằm ở ax
        L4:
            add bx, 2		; bx trỏ đến thành phần tiếp theo của mảng a
            loop L3
            
        call HIEN_SO_N      ; Hien tong tu ax ra man hinh
        
        HienString menu
        mov ah, 1
        int 21h

        Thoat:
            ret
    @TongLe$qv ENDP
INCLUDE lib2.asm
END