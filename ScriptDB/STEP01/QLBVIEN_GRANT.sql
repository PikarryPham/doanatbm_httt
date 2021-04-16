/*Tao view de cap quyen cho nhan vien ke toan*/
begin
execute immediate 'drop view c##QLBVIEN.KT_Xem_Nhan_vien';
exception when others then null;
end;
/
CREATE VIEW c##QLBVIEN.KT_Xem_Nhan_vien
AS
SELECT NV_ID, NV_TEN, NV_NAMSINH, NV_SONGAYCONG, NV_PHUCAP, NV_CONLV, NV_LUONG
FROM c##QLBVIEN.NHAN_VIEN;

GRANT SELECT on KT_Xem_Nhan_vien to c##ketoan;
GRANT UPDATE(NV_LUONG, NV_LUONGCB) on c##QLBVIEN.NHAN_VIEN to c##ketoan;

-- Tao view cho role c##BACSI;
begin
execute immediate 'drop view c##QLBVIEN.QLYTHUOC_BSI';
exception when others then null;
end;
/
-- Bac si co quyen SELECT tren ct don thuoc, don thuoc, thong tin kham va su dung dich vu cua chinh bs do 
CREATE OR REPLACE VIEW c##QLBVIEN.BACSI_QLDONTHUOC AS
SELECT * FROM c##QLBVIEN.DON_THUOC dt, 
c##QLBVIEN.CT_DON_THUOC ctdt, 
c##QLBVIEN.KHAM kham,
c##QLBVIEN.SU_DUNG_DICH_VU sddv
WHERE dt.DT_ID = ctdt.CTDT_IDDON
AND kham.KH_ID = dt.DT_IDKHAM
AND sddv.SDDV_NGTHUCHIEN = kham.KH_BSKHAM
AND kham.KH_BSKHAM = LOWER(SYS_CONTEXT('USERENV', 'SESSION_USER'));

GRANT SELECT ON c##QLBVIEN.BACSI_QLDONTHUOC TO c##BACSI;
-- Phan quyen cho role c##BACSI
GRANT SELECT on c##QLBVIEN.THUOC to c##BACSI;
GRANT SELECT on c##QLBVIEN.DICH_VU_KHAM_BENH to c##BACSI;

/*tao view cho nhan vien bo phan tiep tan select KH_TONGTIEN */
begin
execute immediate 'drop view c##QLBVIEN.NVBPTV_VIEWINFO_TONGTIENKHAM';
exception when others then null;
end;
/
create OR REPLACE view c##QLBVIEN.NVBPTV_VIEWINFO_TONGTIENKHAM as 
select KH_TONGTIEN
from c##QLBVIEN.KHAM;

/*tao view cho nhan vien bo phan tiep tan select nv_id và nv_ten*/
begin
execute immediate 'drop view c##QLBVIEN.NVBPTT_VIEWINFO_NV';
exception when others then null;
end;
/
create OR REPLACE view c##QLBVIEN.NVBPTT_VIEWINFO_NV as 
select NV_ID, NV_TEN
from c##QLBVIEN.NHAN_VIEN;
/*where NV_LOAI = 'bac si'*/


/*phan quyen cho nhan vien tiep tan*/
grant select, insert, update, delete on c##QLBVIEN.BENH_NHAN to c##NhanVienBoPhanTiepTan;
grant select on c##QLBVIEN.DICH_VU_KHAM_BENH to c##NhanVienBoPhanTiepTan;
grant insert on c##QLBVIEN.SU_DUNG_DICH_VU to c##NhanVienBoPhanTiepTan;
grant insert on c##QLBVIEN.KHAM to c##NhanVienBoPhanTiepTan;

/*tao grant tren view cho nhan vien tiep tan*/
grant select on c##QLBVIEN.NVBPTT_VIEWINFO_NV to c##NhanVienBoPhanTiepTan;

/*phan quyen cho nhan vien phong tai vu*/
grant select on c##QLBVIEN.SU_DUNG_DICH_VU to c##NhanVienPhongTaiVu;
grant update (SDDV_CHECK)  on c##QLBVIEN.SU_DUNG_DICH_VU to  c##NhanVienPhongTaiVu;
grant update (KH_TONGTIEN)  on c##QLBVIEN.KHAM to  c##NhanVienPhongTaiVu;

/*tao grant tren view cho nhan vien tiep tan*/
grant select on c##QLBVIEN.NVBPTV_VIEWINFO_TONGTIENKHAM to c##NhanVienPhongTaiVu;

-- Cap quyen cho quan li tai vu
GRANT SELECT, UPDATE, DELETE, INSERT on c##QLBVIEN.THUOC to c##quanlitaivu;
GRANT SELECT, UPDATE, DELETE, INSERT on c##QLBVIEN.DICH_VU_KHAM_BENH to c##quanlitaivu;

--Cap quyen cho nhom quan li tai nguyen va nhan su
GRANT SELECT, UPDATE, INSERT, DELETE on c##QLBVIEN.PHONG_BAN to c##tainguyen_nhansu;
GRANT SELECT, INSERT on c##QLBVIEN.NHAN_VIEN to c##tainguyen_nhansu;
GRANT UPDATE (NV_SONGAYCONG, NV_PHUCAP, NV_LUONGCB, NV_PB) on c##QLBVIEN.NHAN_VIEN to c##tainguyen_nhansu;
GRANT UPDATE (DV_PHONG) on c##QLBVIEN.DICH_VU_KHAM_BENH to c##tainguyen_nhansu;

-- Cap quyen cho nhom ban thuoc
GRANT SELECT on c##QLBVIEN.DON_THUOC to c##banthuoc;
GRANT UPDATE (DT_TONGTIEN) on c##QLBVIEN.DON_THUOC to c##banthuoc;
GRANT SELECT on c##QLBVIEN.CT_DON_THUOC to c##banthuoc;
-- Viet VPD proc cho delete/update tren truong ct_don_Thuoc, don_thuoc ==>  