-----------------------------------PHAN CUA THANH------------------------
/*Tao role nhan vien ban thuoc va cap quyen*/
begin
execute immediate 'drop role banthuoc';
exception when others then null;
end;
/
CREATE ROLE banthuoc;

/*Tao role cho nhan vien ke toan va cap quyèn*/
begin
execute immediate 'drop role ketoan';
exception when others then null;
end;
/
CREATE ROLE ketoan;

/*tao role cua nhom quan li tai nguyen va nhan su*/
begin
execute immediate 'drop role tainguyen_nhansu';
exception when others then null;
end;
/
CREATE ROLE tainguyen_nhansu;

/*Tao role va cap quyen cho nhom quan li tai vu*/
begin
execute immediate 'drop role quanlitaivu';
exception when others then null;
end;
/
CREATE ROLE quanlitaivu;


------------------------------ PHAN CUA VU -----------------------------
/*check ton tai role*/
begin
execute immediate 'drop role NhanVienBoPhanTiepTan';
exception when others then null;
end;
/
begin
execute immediate 'drop role NhanVienPhongTaiVu';
exception when others then null;
end;
/
create role NhanVienBoPhanTiepTan;
create role NhanVienPhongTaiVu;

---------------------------- PHAN CUA TRANG ---------------
/*Tao role va cap quyen cho nhom nhan vien la BAC SI*/
begin
execute immediate 'drop role BACSI';
exception when others then null;
end;
/
CREATE ROLE BACSI;
