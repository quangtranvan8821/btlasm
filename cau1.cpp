#include <iostream.h>
#include <conio.h>
extern TaoThuMuc();
extern TongLe();
extern CongCom();
extern Chia2So();

void main()
{
    char tl;
    int cn; 
    
    clrscr();
    cout<<"\n             Truong Dai Hoc Mo Ha Noi";
    cout<<"\n             KHOA CONG NGHE THONG TIN";
    cout<<"\n             -----------o0o----------";
    cout<<"\n               BAI TAP LON MON LTHT";
    cout<<"\n\n  Cac Sinh Vien thuc hien:";
    cout<<"\n      1. Tran Van Quang     Lop: 1910A05";
    cout<<"\n      2. Nguyen Thanh Nam   Lop: 1910A04";
    cout<<"\n\n  An phim bat ky de tiep tuc CT con an Esc thi thoat";
    tl = getch();
    if(tl != 27)
    {
        L1:
            clrscr();
            cout<<"\n     CAC CHUC NANG tao thu muc, TONG SL, CONG COM";
            cout<<"\n     --------------------------------------------";
            cout<<"\n     1. Chuc nang tao thu muc";
            cout<<"\n     2. Tong le day so nguyen";
            cout<<"\n     3. Cong COM va dia chi";
            cout<<"\n     4. Thoat ve DOS";
            cout<<"\n     Hay chon: ";
            cin>>cn;
            switch(cn)
            {
            	case 1:
            	    TaoThuMuc();
            	    break;
            	case 2:
                    TongLe();
            	    break;
            	case 3:
                    CongCom();
            	    break;
            	case 5:
                    Chia2So();
            	    break;
            	case 4:
            	    return;
            	default: 
            	    cout<<"\n     Chon sai roi, hay chon lai!";
            	    getch();
            	    goto L1;
            }
            goto L1;
    }
}
