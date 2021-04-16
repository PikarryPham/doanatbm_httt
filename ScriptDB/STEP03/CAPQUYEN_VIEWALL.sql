-- Hien thi quyen muc cot ----
begin
execute immediate 'drop procedure c##administrator.AD_Hienthiquyenmuccot';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Hienthiquyenmuccot(p_ketqua OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_ketqua FOR
        SELECT GRANTEE, TABLE_NAME, COLUMN_NAME, GRANTOR, PRIVILEGE, grantable FROM DBA_COL_PRIVS WHERE OWNER = 'C##QLBVIEN';
    EXCEPTION 
        WHEN OTHERS then
            Raise_application_error(-1, 'Error');
END;
/

-- Hien thi quyen muc bang ----
begin
execute immediate 'drop procedure c##administrator.AD_Hienthiquyenmucbang';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Hienthiquyenmucbang(p_ketqua OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_ketqua FOR
        SELECT GRANTEE, TABLE_NAME, GRANTOR, PRIVILEGE, GRANTABLE, TYPE FROM DBA_TAB_PRIVS WHERE OWNER = 'C##QLBVIEN';
    EXCEPTION 
        WHEN OTHERS then
            Raise_application_error(-1, 'Error');
END;
/
