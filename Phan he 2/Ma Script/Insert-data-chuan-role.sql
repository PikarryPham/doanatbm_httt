
/*Nhap lieu*/
/*Nhap cho bang c##QLBVIEN.PHONG_BAN*/
--SELECT * FROM c##QLBVIEN.PHONG_BAN;
begin
execute immediate 'delete from c##QLBVIEN.PHONG_BAN';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (1,'Phong cap cuu','0775463088');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (2,'Phong kham benh','0775463089');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (3,'Phong chua benh','0775463090');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (4,'Phong dao tao can bo','0775463091');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (5,'Phong quan ly kinh te y te','0775463092');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (6,'Phong hoat dong xa hoi','0775463093');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (7,'Phong hop tac quoc te','0775463094');
INSERT INTO c##QLBVIEN.PHONG_BAN(PB_ID,PB_TEN,PB_SDT)
VALUES (8,'Phong benh','0775463095');


/**/
/*nhan vien co 3 loai, bac si, y ta, nvkd (nhan vien kinh doanh), tap vu*/
--SELECT * FROM c##QLBVIEN.NHAN_VIEN;
begin
execute immediate 'delete from c##QLBVIEN.NHAN_VIEN';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV001','C##NV001','Nguyen Thanh Long','17-NOV-96',C##QLBVIEN.EnCryp('45 Nguyen Thi Minh Khai'),C##QLBVIEN.EnCryp('1123456789'),C##QLBVIEN.EnCryp('10000000'),C##QLBVIEN.EnCryp('8500000'),'bac si',28,C##QLBVIEN.EnCryp('1500000'),'1',1);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV002','C##NV002','Tran Bao Son','17-NOV-96',C##QLBVIEN.EnCryp('126 Dien Bien Phu'),C##QLBVIEN.EnCryp('1123456790'),C##QLBVIEN.EnCryp('12000000'),C##QLBVIEN.EnCryp('9000000'),'bac si',25,C##QLBVIEN.EnCryp('3000000'),'1',2);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV003','C##NV003','Son Dep Trai','17-NOV-96',C##QLBVIEN.EnCryp('33 Ngo Thoi Nhiem'),C##QLBVIEN.EnCryp('1123456791'),C##QLBVIEN.EnCryp('8000000'),C##QLBVIEN.EnCryp('7000000'),'ban thuoc',26,C##QLBVIEN.EnCryp('1000000'),'1',3);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV004','C##NV004','Ho Bao Ngoc','17-NOV-96',C##QLBVIEN.EnCryp('27 Nguyen Van Qua'),C##QLBVIEN.EnCryp('1123456792'),C##QLBVIEN.EnCryp('7000000'),C##QLBVIEN.EnCryp('6500000'),'ke toan',20,C##QLBVIEN.EnCryp('500000'),'1',1);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV005','C##NV005','Nguyen Duc','17-NOV-96',C##QLBVIEN.EnCryp('223 Nguyen Van Cu'),C##QLBVIEN.EnCryp('1123456793'),C##QLBVIEN.EnCryp('10000000'),C##QLBVIEN.EnCryp('1000000'),'tai nguyen - nhan su',30,C##QLBVIEN.EnCryp('0'),'1',5);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV006','C##NV006','Tran Binh','17-NOV-96',C##QLBVIEN.EnCryp('12 Ho Thi Ky'),C##QLBVIEN.EnCryp('1123456794'),C##QLBVIEN.EnCryp('12000000'),C##QLBVIEN.EnCryp('11000000'),'quan ly tai vu',25,C##QLBVIEN.EnCryp('1000000'),'1',7);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV007','C##NV007','Le Thi Luu','17-NOV-96',C##QLBVIEN.EnCryp('100 Nguyen Xi'),C##QLBVIEN.EnCryp('1123456795'),C##QLBVIEN.EnCryp('7000000'),C##QLBVIEN.EnCryp('6000000'),'nhan vien bo phan tai vu',30,C##QLBVIEN.EnCryp('1000000'),'1',6);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('C##NV008','C##NV008','Nguyen Thi Anh','17-NOV-96',C##QLBVIEN.EnCryp('68 Tran Binh Trong'),C##QLBVIEN.EnCryp('1123456796'),C##QLBVIEN.EnCryp('8000000'),C##QLBVIEN.EnCryp('7500000'),'nhan vien bo phan tiep tan',30,C##QLBVIEN.EnCryp('500000'),'1',8);

/*nhap lieu benh nhan*/
--SELECT * FROM c##QLBVIEN.BENH_NHAN;
begin
execute immediate 'delete from c##QLBVIEN.BENH_NHAN';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (1,'Nguyen Tien Thinh','17-NOV-96',C##QLBVIEN.EnCryp('39 Cao Lo'),C##QLBVIEN.EnCryp('1775463096'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (2,'Nguyen Trinh','17-NOV-96',C##QLBVIEN.EnCryp('129 Pham The Hien'),C##QLBVIEN.EnCryp('9775463097'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (3,'Tran Trong Dat','17-NOV-96',C##QLBVIEN.EnCryp('242 Pham Hung'),C##QLBVIEN.EnCryp('3775463098'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (4,'Luu Nguyen Ba Hung','17-NOV-96',C##QLBVIEN.EnCryp('321 Nguyen Trong Tuyen'),C##QLBVIEN.EnCryp('5775463099'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (5,'Nguyen Ngoc Minh','17-NOV-96',C##QLBVIEN.EnCryp('44 Hoa Hao'),C##QLBVIEN.EnCryp('6775463100'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (6,'Ly Duy Nam','17-NOV-96',C##QLBVIEN.EnCryp('489 Duong 3/2'),C##QLBVIEN.EnCryp('9775463101'));
INSERT INTO c##QLBVIEN.BENH_NHAN
VALUES (7,'Le Van Anh','17-NOV-96',C##QLBVIEN.EnCryp('261 Le Hong Phong'),C##QLBVIEN.EnCryp('1775463102'));

/*nhap lieu dich vu kham benh*/
begin
execute immediate 'delete from c##QLBVIEN.DICH_VU_KHAM_BENH';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (1,'Kham benh co ban',100000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (2,'Kham yeu cau',500000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (3,'Chup Xquang',1500000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (4,'Sieu am',500000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (5,'Xet nghiem',1000000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (6,'Phau thuat',2000000,3);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (7,'Cham soc dat biet',5000000,8);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (8,'Nhan com thien nguyen',1,6);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (9,'Phong benh rieng 1 nguoi',5000000,8);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (10,'Phong benh rieng 2 nguoi',2000000,8);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (11,'Cap cuu',500000,1);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (12,'Phuc hoi chuc nang',100000,3);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (13,'Kham tong quat',500000,2);
INSERT INTO c##QLBVIEN.DICH_VU_KHAM_BENH
VALUES (14,'Hau phau',500000,3);

/*Nhap thong tin thuoc*/
begin
execute immediate 'delete from c##QLBVIEN.THUOC';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.THUOC
VALUES (1,'Paracetamol','Cong ty CPDP Euvipharm',544);
INSERT INTO c##QLBVIEN.THUOC
VALUES (2,'Celecoxib','Cong ty CPDP Cuu Long',365);
INSERT INTO c##QLBVIEN.THUOC
VALUES (3,'Diclofenac','Samil Pharm. Co., Ltd',43000);
INSERT INTO c##QLBVIEN.THUOC
VALUES (4,'Meloxicam','Boehringer Ingelheim Ellas A.E',9122);
INSERT INTO c##QLBVIEN.THUOC
VALUES (5,'Loratadin','Cty CP Duoc Vacopharm',91);
INSERT INTO c##QLBVIEN.THUOC
VALUES (6,'Gabapentin','Bidiphar',565);
INSERT INTO c##QLBVIEN.THUOC
VALUES (7,'Ivermectin','Cong ty CPDP Ampharco U.S.A',13980);
INSERT INTO c##QLBVIEN.THUOC
VALUES (8,'Cefepim','Tenamyd Pharma - Viet NamE', 35994);
INSERT INTO c##QLBVIEN.THUOC
VALUES (9,'Doripenem','Cty CP DP VCP',618500);
INSERT INTO c##QLBVIEN.THUOC
VALUES (10,'Doxycyclin','Cong ty CPDP Cuu Long',317);

/*Nhap thong tin kham*/
begin
execute immediate 'delete from c##QLBVIEN.KHAM';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.KHAM
VALUES (1,C##QLBVIEN.EnCryp('Dau dau, sot, ho'),'17-NOV-21',C##QLBVIEN.EnCryp('Cam cum'),NULL,1,200000,'C##NV001');
INSERT INTO c##QLBVIEN.KHAM
VALUES (2,C##QLBVIEN.EnCryp('Dau bung'),'17-NOV-21',C##QLBVIEN.EnCryp('Trung thuc'),'24-NOV-21',2,300000,'C##NV001');
INSERT INTO c##QLBVIEN.KHAM
VALUES (3,C##QLBVIEN.EnCryp('Dau lung, nhuc moi vai gay'),'17-NOV-21',C##QLBVIEN.EnCryp('Xuong khop thoai hoa'),'24-NOV-21',6,100000,'C##NV002');
INSERT INTO c##QLBVIEN.KHAM
VALUES (4,C##QLBVIEN.EnCryp('Dau dau nang, tay chan bun run'),'17-NOV-21',C##QLBVIEN.EnCryp('Thieu dinh duong, lam viec qua do'),'24-NOV-21',3,200000,'C##NV002');
INSERT INTO c##QLBVIEN.KHAM
VALUES (5,C##QLBVIEN.EnCryp('Noi me day'),'17-NOV-21',C##QLBVIEN.EnCryp('Di ung'),'24-NOV-21',4,400000,'C##NV001');
INSERT INTO c##QLBVIEN.KHAM
VALUES (6,C##QLBVIEN.EnCryp('Gai dam vao ban chan, dau goi sung phu'),'17-NOV-21',C##QLBVIEN.EnCryp('Ton thuong xuong khop va mo mem'),'24-NOV-21',7,500000,'C##NV002');
INSERT INTO c##QLBVIEN.KHAM
VALUES (7,C##QLBVIEN.EnCryp('Sot, ho lien tuc'),'17-NOV-21',C##QLBVIEN.EnCryp('Sot xuat huyet'),'24-NOV-21',5,100000,'C##NV001');

/*Nhap thong tin don thuoc*/
begin
execute immediate 'delete from c##QLBVIEN.DON_THUOC';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.DON_THUOC
VALUES (1,'50000','Ngay uong 3 lan, sau an',1);
INSERT INTO c##QLBVIEN.DON_THUOC
VALUES (2,'100000','Ngay uong 2 lan, truoc an, kieng do nang bung',2);
INSERT INTO c##QLBVIEN.DON_THUOC
VALUES (3,'150000','Ngay uong 3 lan, sau an, tang cuong boi bo dinh duong',4);
INSERT INTO c##QLBVIEN.DON_THUOC
VALUES (4,'300000','Ngay uong 3 lan, sau an',5);

/*Nhap thong tin chi tiet don thuoc*/
begin
execute immediate 'delete from c##QLBVIEN.CT_DON_THUOC';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (1,1,9,'vien',5000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (1,2,9,'vien',40000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (1,3,9,'vien',50000,'3 lan/ngay');

INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (2,5,4,'vien',50000,'2 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (2,6,2,'vien',50000,'1 lan/ngay');

INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (3,3,6,'vien',50000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (3,4,6,'vien',50000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (3,9,6,'vien',50000,'3 lan/ngay');

INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (4,8,6,'vien',50000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (4,9,6,'vien',50000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (4,10,6,'vien',50000,'3 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (4,7,4,'vien',200000,'2 lan/ngay');
INSERT INTO c##QLBVIEN.CT_DON_THUOC
VALUES (4,3,6,'vien',50000,'3 lan/ngay');


/*Nhap SU_DUNG_DICH_VU*/
begin
execute immediate 'delete from c##QLBVIEN.SU_DUNG_DICH_VU';
exception when others then null;
end;
/
INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (1,1,'C##NV001','17-NOV-21','1');

INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (2,2,'C##NV001','17-NOV-21','1');
INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (4,2,'C##NV001','17-NOV-21','1');

INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (3,3,'C##NV002','17-NOV-21','1');
INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (7,3,'C##NV004','17-NOV-21','1');
INSERT INTO c##QLBVIEN.SU_DUNG_DICH_VU
VALUES (12,3,'C##NV003','17-NOV-21','1');

/*Viet ham kiem tra login cac thu*/

