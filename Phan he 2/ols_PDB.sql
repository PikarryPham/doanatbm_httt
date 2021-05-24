/*
SQLPlus > conn system/123456;
SQLPlus > show con_name;
Neu con_name la cdb$root thi:
SQLPlus > ALTER SESSION SET CONTAINER=XEPDB1;
nguoc lai thi:
SQLPlus > ALTER SESSION SET CONTAINER=cdb$root;
*/

show con_name;


--1. Kiem tra bang co ton tai hay khong? Neu co thi xoa truoc khi tao
begin
execute immediate 'drop table c##QLBVIEN.THONGBAO';
exception when others then null;
end;
/
create table c##QLBVIEN.THONGBAO(
  MESSAGE VARCHAR2(4000)
);

-- conn /as sysdba
-- ALTER USER c##QLBVIEN quota unlimited on USERS;

-- 2. Them du lieu vao bang message
DELETE FROM c##QLBVIEN.THONGBAO;
insert into c##QLBVIEN.THONGBAO values ('Thong bao bi mat chi danh cho admin');
insert into c##QLBVIEN.THONGBAO values ('Thong bao gioi han danh cho nhan vien he thong');

select * from c##QLBVIEN.THONGBAO;

select * from DBA_OLS_STATUS; -- Kiem tra xem co dang ky dich vu ols va enable no hay chua
select * from CDB_OLS_STATUS;


-- Vào ?ây ?? xem h??ng d?n cách enable, ??ng ký và s? d?ng OLS: https://docs.oracle.com/en/database/oracle/oracle-database/19/olsag/getting-started-with-oracle-label-security.html#GUID-1CE83302-5DBB-461A-B64D-A61642113E50
-- B?t ??u l?i quá trình t?o b?ng và insert d? li?u
--1. Kiem tra bang co ton tai hay khong? Neu co thi xoa truoc khi tao
begin
execute immediate 'drop table c##QLBVIEN.NHAN_VIEN CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.PHONG_BAN CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.DON_THUOC CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.CT_DON_THUOC CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.THUOC CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.BENH_NHAN CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.DICH_VU_KHAM_BENH CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.KHAM CASCADE CONSTRAINT';
exception when others then null;
end;
/
begin
execute immediate 'drop table c##QLBVIEN.SU_DUNG_DICH_VU CASCADE CONSTRAINT';
exception when others then null;
end;
/
-- 2. Tao bang
CREATE TABLE c##QLBVIEN.PHONG_BAN
(
    PB_ID NUMBER NOT NULL,
    PB_TEN VARCHAR2(50),
    PB_SDT VARCHAR2(10),
    CONSTRAINT PHONGBAN_PK PRIMARY KEY (PB_ID)
);
/
CREATE TABLE c##QLBVIEN.NHAN_VIEN
(
    NV_ID VARCHAR2(10) NOT NULL,
    NV_PSW VARCHAR2(10) NOT NULL,
    NV_TEN VARCHAR2(50),
    NV_NAMSINH DATE,
    NV_DIACHI VARCHAR2(300),
    NV_SDT VARCHAR2(100),
    NV_LUONG VARCHAR2(100),
    NV_LUONGCB VARCHAR2(100),
    NV_LOAI VARCHAR2(20),
    NV_SONGAYCONG NUMBER,
    NV_PHUCAP VARCHAR2(100),
    NV_CONLV CHAR(1) CHECK(NV_CONLV IN ('1','0')),
    NV_PB NUMBER,
    
    CONSTRAINT NHAN_VIEN_PK PRIMARY KEY (NV_ID)
);
/

/*Insert d? li?u - Không c?n làm h?t, hi?n t?i ch? c?n test nhân viên là ???c*/
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
DELETE from c##QLBVIEN.NHAN_VIEN;
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV001','NV001','Nguyen Thanh Long','17-NOV-96','45 Nguyen Thi Minh Khai','1123456789','10000000','8500000','bac si',28,'1500000','1',1);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV002','NV002','Tran Bao Son','17-NOV-96','126 Dien Bien Phu','1123456790','12000000','9000000','bac si',25,'3000000','1',2);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV003','NV003','Son Dep Trai','17-NOV-96','33 Ngo Thoi Nhiem','1123456791','8000000','7000000','y ta',26,'1000000','1',3);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV004','NV004','Ho Bao Ngoc','17-NOV-96','27 Nguyen Van Qua','1123456792','7000000','6500000','y ta',20,'500000','1',1);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV005','NV005','Nguyen Duc','17-NOV-96','223 Nguyen Van Cu','1123456793','10000000','1000000','nvkd',30,'0','1',5);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV006','NV006','Tran Binh','17-NOV-96','12 Ho Thi Ky','1123456794','12000000','11000000','nvkd',25,'1000000','1',7);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV007','NV007','Le Thi Luu','17-NOV-96','100 Nguyen Xi','1123456795','7000000','6000000','tap vu',30,'1000000','1',6);
INSERT INTO c##QLBVIEN.NHAN_VIEN
VALUES ('NV008','NV008','Nguyen Thi Anh','17-NOV-96','68 Tran Binh Trong','1123456796','8000000','7500000','tap vu',30,'500000','1',8);

-- Grant cac quyen can thiet cho lbacsys (dang nhap bang account ols_PDB);
-- conn LBACSYS/123;
GRANT SELECT, UPDATE, INSERT, DELETE ON c##QLBVIEN.THONGBAO to LBACSYS;
GRANT SELECT ON c##QLBVIEN.NHAN_VIEN to LBACSYS;
GRANT SELECT ON c##QLBVIEN.PHONG_BAN to LBACSYS;
GRANT SELECT ON c##QLBVIEN.THONGBAO to c##administrator;

/*
grant create user to LBACSYS;

grant create session, connect to LBACSYS;
*/

REVOKE UPDATE, INSERT, DELETE ON c##QLBVIEN.THONGBAO FROM c##administrator;
-- T?o chính sách
-- Kiem tra policy nay co ton tai k? Neu co thi xoa
declare
   c int;
begin
   select count(*) into c from ALL_POLICIES where POLICY_NAME = upper('THONGBAOHETHONG_OLS');
   if c = 1 then
     begin
            sa_sysdba.drop_policy(policy_name => 'THONGBAO_OLS', drop_column => TRUE);
            end;
   end if;
end;
/

BEGIN
sa_sysdba.create_policy
(policy_name => 'THONGBAOHETHONG_OLS',
column_name => 'NDTHONGBAO_OLS');
END;



-- Grant viec thuc thi nay toi system
-- conn LBACSYS/123
-- Khi ma tao policyname thi oracle tu dong gan them _dba dang sau ten policy
grant THONGBAOHETHONG_OLS_dba to system;
GRANT EXECUTE ON sa_components TO system;
GRANT EXECUTE ON sa_label_admin TO system;
GRANT EXECUTE ON sa_user_admin TO system;
GRANT EXECUTE ON char_to_label TO system;


grant THONGBAOHETHONG_OLS_dba to mgr;
GRANT EXECUTE ON sa_components TO mgr;
GRANT EXECUTE ON sa_label_admin TO mgr;
GRANT EXECUTE ON sa_user_admin TO mgr;
GRANT EXECUTE ON char_to_label TO mgr;

/*
CONN system/123456@//localhost:1521/XEPDB1;
*/
-- Step 1. Create the label components
BEGIN
 SA_COMPONENTS.CREATE_LEVEL 
 (
   policy_name   => 'THONGBAOHETHONG_OLS',
   level_num     => 9000,
   short_name    => 'ADMIN',
    long_name    => 'ADMINISTRATOR'
  );
END;


BEGIN
 SA_COMPONENTS.CREATE_LEVEL 
 (
   policy_name   => 'THONGBAOHETHONG_OLS',
   level_num     => 8000,
   short_name    => 'EMP',
    long_name    => 'EMPLOYEE'
  );
END;

-- Step 2. Create the label
BEGIN
 sa_label_admin.create_label
 (
   policy_name   => 'THONGBAOHETHONG_OLS',
   label_tag => 1,
   label_value => 'ADMIN'
  );
END;

BEGIN
 sa_label_admin.create_label
 (
   policy_name   => 'THONGBAOHETHONG_OLS',
   label_tag => 3,
   label_value => 'EMP'
  );
END;

-- Step 3: Applying the policy

BEGIN
    sa_policy_admin.apply_table_policy
    (
       policy_name   => 'THONGBAOHETHONG_OLS',
       schema_name => 'c##QLBVIEN',
       table_name => 'THONGBAO',
       table_options => 'NO_CONTROL'
    );
END;

SELECT * FROM c##QLBVIEN.THONGBAO;
-- Step 4: Gan level vao du lieu
-- Nhan thap nhat cho moi du lieu (o day la nhan emp, vi admin co quyen cao hon emp)
-- Set all records to lowest level
UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP');

-- Increase level for admin's records
UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','ADMIN')
WHERE (MESSAGE) LIKE '%admin%';

-- Khi nay, minh se tao ra 2 authorizations: ONLY_ADMIN va ALL_EMPLOYEES
BEGIN
    sa_user_admin.set_user_labels(
        policy_name => 'THONGBAOHETHONG_OLS',
        user_name => 'ONLY_ADMIN',
        max_read_label => 'ADMIN');
END;

BEGIN
    sa_user_admin.set_user_labels(
        policy_name => 'THONGBAOHETHONG_OLS',
        user_name => 'ALL_EMPLOYEES',
        max_read_label => 'EMP');
END;

-- Step 5. Testing the labels (truoc khi test, thay doi apply_table_policy BANG CACH REMOVE --> TAO MOI)
BEGIN
    sa_policy_admin.remove_table_policy
    (
       policy_name   => 'THONGBAOHETHONG_OLS',
       schema_name => 'c##QLBVIEN',
       table_name => 'THONGBAO'
    );
END;

BEGIN
    sa_policy_admin.apply_table_policy
    (
       policy_name   => 'THONGBAOHETHONG_OLS',
       schema_name => 'c##QLBVIEN',
       table_name => 'THONGBAO',
       table_options => 'READ_CONTROL'
    );
END;

-- Step 6. Create the compartments (chi lam 3 cai thoi: 3 compartments: bac si, tiep tan, ke toan)
BEGIN
    sa_components.create_compartment(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'Nhan vien ke toan',
        short_name => 'KETOAN',
        comp_num => 1000); -- :) slide bi sai cmnl, comp_num chu khong phai la level_num
END;

BEGIN
    sa_components.create_compartment(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'Bac si',
        short_name => 'BACSI',
        comp_num => 100);
END;

BEGIN
    sa_components.create_compartment(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'Nhan vien tiep tan va dieu phoi benh',
        short_name => 'TIEPTAN',
        comp_num => 10);
END;

-- Step 7. Create the labels (for compartments)
BEGIN
    sa_label_admin.create_label(
        policy_name => 'THONGBAOHETHONG_OLS',
        label_tag => 25,
        label_value => 'EMP:KETOAN');
END;

BEGIN
    sa_label_admin.create_label(
        policy_name => 'THONGBAOHETHONG_OLS',
        label_tag => 30,
        label_value => 'EMP:BACSI');
END;

BEGIN
    sa_label_admin.create_label(
        policy_name => 'THONGBAOHETHONG_OLS',
        label_tag => 35,
        label_value => 'EMP:TIEPTAN');
END;

BEGIN
    sa_label_admin.create_label(
        policy_name => 'THONGBAOHETHONG_OLS',
        label_tag => 20,
        label_value => 'ADMIN:KETOAN,BACSI,TIEPTAN');
END;

-- Step 8. Authorizations for Compartments

BEGIN
    sa_user_admin.add_compartments(
        policy_name => 'THONGBAOHETHONG_OLS',
        user_name => 'ONLY_ADMIN',
        comps => 'KETOAN,BACSI,TIEPTAN'
        );
END;

-- "ONLY_ADMIN": modify the current authorization to add the new compartments --> can read all messages
-- "ALL_EMPLOYEES": now can read the messages that all employess can read
-- c##administrator: can read all the messages
-- Employees: now can read the messages that all employees can read
-- EMP:KETOAN: can see all the data within their compartment and the data that has no compartments
-- EMP:BACSI va EMP:TIEPTAN : tuong tu nhu tren

insert into c##QLBVIEN.THONGBAO values ('Thong bao nay chi danh cho nhan vien nao la bac si',0);
insert into c##QLBVIEN.THONGBAO values ('Thong bao nay chi danh cho nhan vien nao la tiep tan',0);
insert into c##QLBVIEN.THONGBAO values ('Thong bao nay chi danh cho nhan vien nao la ke toan',0);

-- Increase level for admin's records
UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP:KETOAN')
WHERE (MESSAGE) LIKE '%ke toan%';

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP:TIEPTAN')
WHERE (MESSAGE) LIKE '%tiep tan%';

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP:BACSI')
WHERE (MESSAGE) LIKE '%bac si%';

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','ADMIN:KETOAN,BACSI,TIEPTAN')
WHERE (MESSAGE) LIKE '%admin%';

SELECT * FROM C##QLBVIEN.thongbao;
-- Step 9. Create the groups 
-- Tao group cho phong ban: cap cuu va phong kham benh (doi vs EMP:BACSI) ==> EMP:BACSI:PCC vs EMP:BACSI:PCB
-- Tao group cho admin ==> ADMIN:KETOAN,BACSI,TIEPTAN:CORP
BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'Corporate',
        short_name => 'CORP',
        group_num => 1000,
        parent_name => NULL
    );
END;

BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'PHG CAP CUU',
        short_name => 'PHCC',
        group_num => 2500,
        parent_name => 'CORP'
    );
END;

BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'THONGBAOHETHONG_OLS',
        long_name => 'PHG CHUA BENH',
        short_name => 'PHCB',
        group_num => 3500,
        parent_name => 'CORP'
    );
END;

-- Step 10. Assign the labels to users
BEGIN
    sa_user_admin.add_groups
    (policy_name => 'THONGBAOHETHONG_OLS',
    user_name => 'ONLY_ADMIN',
    groups => 'CORP');
END;

-- Step 11. Create authorization for US and EMEA sales managers
BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'THONGBAOHETHONG_OLS',
    user_name => 'PHONGCAPCUU_BACSI_EMP',
    max_read_label => 'EMP:BACSI:PHCC');
END;


BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'THONGBAOHETHONG_OLS',
    user_name => 'PHONGCHUABENH_BACSI_EMP',
    max_read_label => 'EMP:BACSI:PHCB');
END;

-- Step 12. have to drop then re-add policy with label_default option
BEGIN
    sa_policy_admin.remove_table_policy
    (
       policy_name   => 'THONGBAOHETHONG_OLS',
       schema_name => 'c##QLBVIEN',
       table_name => 'THONGBAO'
    );
END;

BEGIN
    sa_policy_admin.apply_table_policy
    (
       policy_name   => 'THONGBAOHETHONG_OLS',
       schema_name => 'c##QLBVIEN',
       table_name => 'THONGBAO',
       table_options => 'READ_CONTROL'
    );
END;

-- Step 13. Them dong du lieu tuong ung
insert into c##QLBVIEN.THONGBAO values ('Thong bao khan: Vui long den phong cap cuu',0);
insert into c##QLBVIEN.THONGBAO values ('Thong bao moi: Vui long den phong chua benh',0);

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP:BACSI:PHCC')
WHERE (MESSAGE) LIKE '%cap cuu%';

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','EMP:BACSI:PHCB')
WHERE (MESSAGE) LIKE '%chua benh%';

UPDATE C##QLBVIEN.thongbao
SET ndthongbao_ols = char_to_label('THONGBAOHETHONG_OLS','ADMIN:KETOAN,BACSI,TIEPTAN:CORP')
WHERE (MESSAGE) LIKE '%admin%';

select * from C##QLBVIEN.thongbao;
-- Step 15. Assign label to user (user o day la user cua he thong)

-- Authorizing levels
---------------------- Cho bác s? có mã là NV001 ? phòng c?p c?u
BEGIN
    sa_user_admin.set_levels
    ( policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV001',
    max_level => 'EMP');
END;

-- Authorizing compartments
BEGIN
    sa_user_admin.set_compartments
    ( policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV001',
    read_comps => 'BACSI',
    write_comps => 'BACSI',
    def_comps => 'BACSI',
    row_comps => 'BACSI'
    );
END;

-- Authorizing groups
BEGIN
    sa_user_admin.set_groups
    ( policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV001',
    read_groups => 'PHCC',
    write_groups => 'PHCC',
    def_groups => 'PHCC',
    row_groups => 'PHCC'
    );
END;

BEGIN
    sa_user_admin.set_user_labels
    (policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV002',
    max_read_label => 'EMP:BACSI:PHCB');
END;

BEGIN
    sa_user_admin.set_user_labels
    (policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV001',
    max_read_label => 'EMP:BACSI:PHCC');
END;
-- Step 16. Assign specific authorizations to user
BEGIN
    sa_user_admin.set_user_privs
    (policy_name   => 'THONGBAOHETHONG_OLS',
    user_name => 'NV001',
    privileges => 'READ');
END;

BEGIN
   SA_POLICY_ADMIN.ENABLE_TABLE_POLICY (
      policy_name => 'THONGBAOHETHONG_OLS',
      schema_name => 'C##QLBVIEN',
      table_name  => 'THONGBAO');
END;
/

----------------------
-- Link: https://docs.oracle.com/database/121/OLSAG/packages.htm#OLSAG046
SELECT POLICY_NAME, LABEL, LABEL_TAG FROM DBA_SA_LABELS ORDER BY LABEL_TAG;
select * from ALL_SA_GROUPS;
select * from ALL_SA_COMPARTMENTS;
select * from ALL_SA_LEVELS;
select * from ALL_SA_LABELS;
select * from ALL_SA_POLICIES;

--SELECT * FROM C##QLBVIEN.thongbao

