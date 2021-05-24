/*tao va check user co ton tai hay chua*/


begin
execute immediate 'drop user NV001 CASCADE';
exception when others then null;
end;
/
create user NV001 identified by 123;
GRANT CREATE SESSION, CONNECT TO NV001,NV002,NV003,NV004,NV005,NV006,NV007,NV008;
GRANT SELECT ON C##QLBVIEN.thongbao TO NV001,NV002,NV003,NV004,NV005,NV006,NV007,NV008;

GRANT CREATE SESSION TO NV001;

begin
execute immediate 'drop user NV002 CASCADE';
exception when others then null;
end;
/
create user NV002 identified by 123;
 
begin
execute immediate 'drop user NV003 CASCADE';
exception when others then null;
end;
/
create user NV003 identified by 123;


begin
execute immediate 'drop user NV004 CASCADE';
exception when others then null;
end;
/
create user NV004 identified by 123;
 
begin
execute immediate 'drop user NV005 CASCADE';
exception when others then null;
end;
/
create user NV005 identified by 123;


begin
execute immediate 'drop user NV006 CASCADE';
exception when others then null;
end;
/
create user NV006 identified by 123;
 
begin
execute immediate 'drop user NV007 CASCADE';
exception when others then null;
end;
/
create user NV007 identified by 123;


begin
execute immediate 'drop user NV008 CASCADE';
exception when others then null;
end;
/
create user NV008 identified by 123;
 

 /*gan role cho tung user*/

Grant BACSI to NV001;
Grant BACSI to NV002;
Grant banthuoc to NV003;
Grant ketoan to NV004;
Grant tainguyen_nhansu to NV005;
Grant quanlitaivu to NV006;
Grant NhanVienPhongTaiVu to NV007;
Grant NhanVienBoPhanTiepTan to NV008;

GRANT CREATE SESSION, CONNECT TO NV001,NV002,NV003,NV004,NV005,NV006,NV007,NV008;
GRANT SELECT, UPDATE ON C##QLBVIEN.thongbao TO NV001,NV002,NV003,NV004,NV005,NV006,NV007,NV008;

REVOKE SELECT, UPDATE ON C##QLBVIEN.thongbao FROM NV001,NV002,NV003,NV004,NV005,NV006,NV007,NV008;

SELECT * FROM dba_users;

SELECT OS_USERNAME,
   USERNAME AS USER_WHO_CREATED_YOU,
   USERHOST,
   TERMINAL,
   TIMESTAMP,
   OBJ_NAME AS USER_CREATED,
   ACTION_NAME
 FROM DBA_AUDIT_TRAIL
