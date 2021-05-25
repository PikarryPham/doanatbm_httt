-----------------------------------PHAN CUA THANH------------------------
/*Tao role nhan vien ban thuoc va cap quyen*/
begin
execute immediate 'drop role c##banthuoc';
exception when others then null;
end;
/
CREATE ROLE c##banthuoc;

/*Tao role cho nhan vien ke toan va cap quyèn*/
begin
execute immediate 'drop role c##ketoan';
exception when others then null;
end;
/
CREATE ROLE c##ketoan;

/*tao role cua nhom quan li tai nguyen va nhan su*/
begin
execute immediate 'drop role c##tainguyen_nhansu';
exception when others then null;
end;
/
CREATE ROLE c##tainguyen_nhansu;

/*Tao role va cap quyen cho nhom quan li tai vu*/
begin
execute immediate 'drop role c##quanlitaivu';
exception when others then null;
end;
/
CREATE ROLE c##quanlitaivu;


------------------------------ PHAN CUA VU -----------------------------
/*check ton tai role*/
begin
execute immediate 'drop role c##NhanVienBoPhanTiepTan';
exception when others then null;
end;
/
begin
execute immediate 'drop role c##NhanVienPhongTaiVu';
exception when others then null;
end;
/
create role c##NhanVienBoPhanTiepTan;
create role c##NhanVienPhongTaiVu;

---------------------------- PHAN CUA TRANG ---------------
/*Tao role va cap quyen cho nhom nhan vien la BAC SI*/
begin
execute immediate 'drop role c##BACSI';
exception when others then null;
end;
/
CREATE ROLE c##BACSI;
