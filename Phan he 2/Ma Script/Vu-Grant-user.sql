/*tao va check user co ton tai hay chua*/


begin
execute immediate 'drop user C##NV001 CASCADE';
exception when others then null;
end;
/
create user C##NV001 identified by C##NV001;


begin
execute immediate 'drop user C##NV002 CASCADE';
exception when others then null;
end;
/
create user C##NV002 identified by C##NV002;
 
begin
execute immediate 'drop user C##NV003 CASCADE';
exception when others then null;
end;
/
create user C##NV003 identified by 123;


begin
execute immediate 'drop user C##NV004 CASCADE';
exception when others then null;
end;
/
create user C##NV004 identified by 123;
 
begin
execute immediate 'drop user C##NV005 CASCADE';
exception when others then null;
end;
/
create user C##NV005 identified by 123;


begin
execute immediate 'drop user C##NV006 CASCADE';
exception when others then null;
end;
/
create user C##NV006 identified by 123;
 
begin
execute immediate 'drop user C##NV007 CASCADE';
exception when others then null;
end;
/
create user C##NV007 identified by 123;


begin
execute immediate 'drop user C##NV008 CASCADE';
exception when others then null;
end;
/
create user C##NV008 identified by 123;
 

 /*gan role cho tung user*/

Grant c##BACSI to c##NV001;
Grant c##BACSI to c##NV002;
Grant c##banthuoc to c##NV003;
Grant c##ketoan to c##NV004;
Grant c##tainguyen_nhansu to c##NV005;
Grant c##quanlitaivu to c##NV006;
Grant c##NhanVienPhongTaiVu to c##NV007;
Grant c##NhanVienBoPhanTiepTan to c##NV008;

GRANT CREATE SESSION, CONNECT TO c##NV001,c##NV002,c##NV003,c##NV004,c##NV005,c##NV006,c##NV007,c##NV008;
