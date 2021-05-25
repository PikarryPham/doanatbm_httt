/*
SQLPlus > conn system/123456;
SQLPlus > show con_name;
Neu con_name la cdb$root thi:
SQLPlus > 
nguoc lai thi ALTER SESSION SET CONTAINER=XEPDB1;
SQLPlus > ALTER SESSION SET CONTAINER=cdb$root;
*/

-- dang nhap bang tai khoan sysdba
-- conn /as sysdba 
-- Dung tk MGR/123@//localhost:1521/XEPDB1
SELECT * FROM all_users;

Show con_name;

--1. Kiem tra bang co ton tai hay khong? Neu co thi xoa truoc khi tao
begin
execute immediate 'drop table MGR.ANNOUNCE';
exception when others then null;
end;
/
create table MGR.ANNOUNCE(
  MESSAGE VARCHAR2(1000)
);

-- Dang nhap bang sysdba de grant quyen nay cho MGR
ALTER SESSION SET CONTAINER=XEPDB1;
ALTER USER MGR quota unlimited on USERS;
GRANT CONNECT, RESOURCE, select_catalog_role to MGR;
-- 2. Them du lieu vao bang message
DELETE FROM MGR.ANNOUNCE;
insert into MGR.ANNOUNCE values ('Thong bao bi mat chi danh cho admin');
insert into MGR.ANNOUNCE values ('Thong bao gioi han danh cho nhan vien he thong');
insert into MGR.ANNOUNCE values ('Thong bao khan: Vui long den phong cap cuu');
insert into MGR.ANNOUNCE values ('Thong bao moi: Vui long den phong chua benh');
insert into MGR.ANNOUNCE values ('Thong bao nay chi danh cho nhan vien nao la bac si');
insert into MGR.ANNOUNCE values ('Thong bao nay chi danh cho nhan vien nao la tiep tan');
insert into MGR.ANNOUNCE values ('Thong bao nay chi danh cho nhan vien nao la ke toan');


select * from MGR.ANNOUNCE; -- Kiem tra

-- Kiem tra xem co dang ky dich vu ols va enable no hay chua
select * from DBA_OLS_STATUS; 
select * from CDB_OLS_STATUS;

-- Grant quyen BANG CACH DUNG TK SYSDBA
GRANT SELECT ON MGR.ANNOUNCE TO c##administrator, LBACSYS, SYSTEM;
GRANT INSERT, UPDATE ON MGR.ANNOUNCE TO LBACSYS, SYSTEM;

-- Dang nhap bang tai khoan lbacsys de tao policy, va grant quyen
-- conn LBACSYS/@//localhost:1521/XEPDB1
declare
   c int;
begin
   select count(*) into c from ALL_POLICIES where POLICY_NAME = upper('ANNOUNCE_OLS');
   if c = 1 then
     begin
            sa_sysdba.drop_policy(policy_name => 'ANNOUNCE_OLS', drop_column => TRUE);
     end;
   end if;
end;
/

BEGIN
sa_sysdba.create_policy
(policy_name => 'ANNOUNCE_OLS',
column_name => 'rowlabel');
END;

GRANT ANNOUNCE_OLS_dba TO MGR;
-- select * from ALL_SA_POLICIES;


GRANT EXECUTE ON sa_sysdba to MGR;
GRANT EXECUTE ON sa_components to MGR WITH GRANT OPTION;
GRANT EXECUTE ON sa_user_admin to MGR WITH GRANT OPTION;
GRANT EXECUTE ON sa_label_admin to MGR WITH GRANT OPTION;
GRANT EXECUTE ON sa_policy_admin to MGR WITH GRANT OPTION;
GRANT EXECUTE ON sa_audit_admin to MGR WITH GRANT OPTION;
GRANT LBAC_DBA TO MGR WITH ADMIN OPTION;
GRANT EXECUTE ON char_to_label to MGR;

-- Tao label component
-- 4. Create the level
-- Dang nhap bang tk mgr

BEGIN
 SA_COMPONENTS.CREATE_LEVEL 
 (
   policy_name   => 'ANNOUNCE_OLS',
   level_num     => 9000,
   short_name    => 'AD',
    long_name    => 'ADMIN'
  );
END;
/

BEGIN
 SA_COMPONENTS.CREATE_LEVEL 
 (
   policy_name   => 'ANNOUNCE_OLS',
   level_num     => 8000,
   short_name    => 'EMP',
    long_name    => 'EMPLOYEE'
  );
END;
/

-- 5. Create the label
BEGIN
 sa_label_admin.create_label
 (
   policy_name   => 'ANNOUNCE_OLS',
   label_tag => 3100,
   label_value => 'AD',
   data_label   => TRUE
  );
END;
/

BEGIN
 sa_label_admin.create_label
 (
   policy_name   => 'ANNOUNCE_OLS',
   label_tag => 2100,
   label_value => 'EMP',
   data_label   => TRUE
  );
END;
/

-- Step 3: Applying the policy

BEGIN
    sa_policy_admin.apply_table_policy
    (
       policy_name   => 'ANNOUNCE_OLS',
       schema_name => 'MGR',
       table_name => 'ANNOUNCE',
       table_options => 'NO_CONTROL'
    );
END;
/

-- Set all records to lowest level
UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP');

-- Increase level for admin's records
UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','AD')
WHERE (MESSAGE) LIKE '%admin%';

-- Khi nay, minh se tao ra 2 authorizations: ONLY_ADMIN va ALL_EMPLOYEES
BEGIN
    sa_user_admin.set_user_labels(
        policy_name => 'ANNOUNCE_OLS',
        user_name => 'ONLY_ADMIN',
        max_read_label => 'AD');
END;

BEGIN
    sa_user_admin.set_user_labels(
        policy_name => 'ANNOUNCE_OLS',
        user_name => 'ALL_EMPLOYEES',
        max_read_label => 'EMP');
END;

-- Step 5. Testing the labels (truoc khi test, thay doi apply_table_policy BANG CACH REMOVE --> TAO MOI)
BEGIN
    sa_policy_admin.remove_table_policy
    (
       policy_name   => 'ANNOUNCE_OLS',
       schema_name => 'MGR',
       table_name => 'ANNOUNCE'
    );
END;
/

BEGIN
    sa_policy_admin.apply_table_policy
    (
       policy_name   => 'ANNOUNCE_OLS',
       schema_name => 'MGR',
       table_name => 'ANNOUNCE',
       table_options => 'READ_CONTROL'
    );
END;
/

-- Dang nhap bang nick lbacsys de set user privs cho MGR
-- conn LBACSYS/@//localhost:1521/XEPDB1
BEGIN
    sa_user_admin.set_user_privs
    (policy_name => 'ANNOUNCE_OLS',
    user_name => 'MGR',
    privileges => 'PROFILE_ACCESS');
END;
/
-- CREATE COMPARTMENTS
BEGIN
    sa_components.create_compartment(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'Nhan vien ke toan',
        short_name => 'KETOAN',
        comp_num => 1000); -- :) slide bi sai cmnl, comp_num chu khong phai la level_num
END;
/

BEGIN
    sa_components.create_compartment(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'Bac si',
        short_name => 'BACSI',
        comp_num => 100);
END;
/

BEGIN
    sa_components.create_compartment(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'Nhan vien tiep tan va dieu phoi benh',
        short_name => 'TIEPTAN',
        comp_num => 10);
END;
/

-- Create labels with level and compartment(s)
BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 10,
    label_value => 'AD:KETOAN,BACSI,TIEPTAN',
    data_label   => TRUE);
END;
/

BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 50,
    label_value => 'EMP:KETOAN',
    data_label   => TRUE);
END;
/

BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 60,
    label_value => 'EMP:BACSI',
    data_label   => TRUE);
END;
/

BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 40,
    label_value => 'EMP:TIEPTAN',
    data_label   => TRUE);
END;
/

-- Authorizations for compartments
BEGIN
    sa_user_admin.add_compartments
    (policy_name => 'ANNOUNCE_OLS',
    user_name => 'ONLY_ADMIN',
    comps => 'KETOAN,BACSI,TIEPTAN');
END;
/

-- Co the dung account sysdba de update
UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP:KETOAN')
WHERE (MESSAGE) LIKE '%ke toan%';

UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP:TIEPTAN')
WHERE (MESSAGE) LIKE '%tiep tan%';

UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP:BACSI')
WHERE (MESSAGE) LIKE '%bac si%';

-- Create group
BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'Corporate',
        short_name => 'CORP',
        group_num => 1,
        parent_name => NULL
    );
END;

BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'PHG CAP CUU',
        short_name => 'PHCC',
        group_num => 100,
        parent_name => 'CORP'
    );
END;

BEGIN
    sa_components.CREATE_GROUP(
        policy_name => 'ANNOUNCE_OLS',
        long_name => 'PHG CHUA BENH',
        short_name => 'PHCB',
        group_num => 110,
        parent_name => 'CORP'
    );
END;

-- Create the label with level, compartments and group
BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 300,
    label_value => 'EMP:BACSI:PHCC',
    data_label   => TRUE);
END;
/

BEGIN
    sa_label_admin.create_label
    (policy_name => 'ANNOUNCE_OLS',
    label_tag => 320,
    label_value => 'EMP:BACSI:PHCB',
    data_label   => TRUE);
END;
/

BEGIN
    sa_user_admin.add_groups
    (policy_name => 'ANNOUNCE_OLS',
    user_name => 'ONLY_ADMIN',
    groups => 'CORP');
END;
/

UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP:BACSI:PHCB')
WHERE (MESSAGE) LIKE '%chua benh%';

UPDATE MGR.ANNOUNCE
SET rowlabel = char_to_label('ANNOUNCE_OLS','EMP:BACSI:PHCC')
WHERE (MESSAGE) LIKE '%cap cuu%';
-- Tao nguoi dung moi, sau do set user label cho may nhan vien nay
-- Drop user bang sysdba account
-- Grant quyen create user cho mgr bang sysdba account
-- Grant quyen create session cho cac user bang sysdba account
drop user NV001 CASCADE;
drop user NV002 CASCADE;
drop user NV003 CASCADE;
drop user NV004 CASCADE;
drop user NV008 CASCADE;
drop user ADMINISTRATOR CASCADE;
GRANT CREATE USER TO MGR WITH ADMIN OPTION;

-- DUNG ACCOUNT MGR
create user NV001 identified by NV001;
create user NV002 identified by NV002;
create user NV004 identified by NV004;
create user NV008 identified by NV008;
create user ADMINISTRATOR identified by ADDM;

GRANT CREATE SESSION, CONNECT TO ADMINISTRATOR;
GRANT CREATE SESSION, CONNECT TO NV001;
GRANT CREATE SESSION, CONNECT TO NV002;
GRANT CREATE SESSION, CONNECT TO NV004;
GRANT CREATE SESSION, CONNECT TO NV008;

GRANT SELECT, UPDATE ON MGR.ANNOUNCE TO ADMINISTRATOR,NV001, NV002, NV004,NV008;
-- Set label cho cac users; 
BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'ANNOUNCE_OLS',
        user_name => 'ADMINISTRATOR',
    max_read_label => 'AD:KETOAN,BACSI,TIEPTAN:CORP');
END;
/

BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'ANNOUNCE_OLS',
        user_name => 'NV001',
    max_read_label => 'EMP:BACSI:PHCB');
END;
/

BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'ANNOUNCE_OLS',
        user_name => 'NV002',
    max_read_label => 'EMP:BACSI:PHCC');
END;
/

BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'ANNOUNCE_OLS',
        user_name => 'NV008',
    max_read_label => 'EMP:TIEPTAN');
END;
/

BEGIN
    sa_user_admin.set_user_labels
    (policy_name => 'ANNOUNCE_OLS',
        user_name => 'NV004',
    max_read_label => 'EMP:KETOAN');
END;
/