INCLUDE lib1.asm
.MODEL small
.DATA
    m        db 13, 10, '       CHUC NANG TAO THU MUC'
             db 13, 10, '       ---------------------'
             db 13, 10, '  Hay vao ten TM can tao: $'
    Err_TM   db 13, 10, '  Khong tao duoc thu muc!$'
    Suc_TM   db 13, 10, '  Thu muc da duoc tao!$'
    menu     db 13, 10, '  An phim bat ky de ve Main menu$'
    tieptuc  db 13, 10, '  Co tiep tuc CT (c/k)? $'
    buff     db 40
             db ?
    dir_name db 40 dup(?)
.CODE
    PUBLIC @TaoThuMuc$qv
    @TaoThuMuc$qv PROC
        L0:
            clrscr
            HienString m
            lea dx, buff        
            call GET_DIR_NAME   ; Nhap ten thu muc can tao
            lea dx, dir_name    ; Lay ten thu muc can tao luu vao dx
            
            mov ah, 39h         ; Tao thu muc
            int 21h
            jnc L1              ; Neu tao duoc thi thong bao va ve menu
            
            HienString Err_TM   ; Thong bao khong tao duoc
            jmp Exit            ; Neu khong tao duoc thi thoat
        
        L1:
            HienString Suc_TM
        
        Exit:
            HienString menu
            mov ah, 1
            int 21h

        Thoat:
            ret
    @TaoThuMuc$qv ENDP
INCLUDE lib3.asm
END