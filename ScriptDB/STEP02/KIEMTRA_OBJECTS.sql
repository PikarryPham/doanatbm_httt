------------ Lenh kiem tra xem co ton tai user do hay khong -------------
begin
execute immediate 'drop function c##administrator.Check_exist_user';
exception when others then null;
end;
/

CREATE OR REPLACE FUNCTION c##administrator.Check_exist_user(u_name in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(USERNAME) INTO temp FROM DBA_USERS WHERE USERNAME = UPPER(u_name);
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
------------ Lenh kiem tra xem co ton tai role hay khong -------------
begin
execute immediate 'drop function c##administrator.Check_exist_role';
exception when others then null;
end;
/
CREATE OR REPLACE FUNCTION c##administrator.Check_exist_role(r_name in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(ROLE) INTO temp FROM DBA_ROLES WHERE ROLE = UPPER(r_name);
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
------------ Lenh kiem tra xem 1 role co password hay khong? -------------
begin
execute immediate 'drop function c##administrator.Check_pass_role';
exception when others then null;
end;
/
create or replace FUNCTION c##administrator.Check_pass_role (r_name in varchar2)
    RETURN NUMBER
IS
    temp number;
BEGIN
    SELECT COUNT(d.ROLE) INTO temp FROM DBA_ROLES d WHERE d.ROLE = UPPER(r_name) and d.PASSWORD_REQUIRED = 'YES' AND AUTHENTICATION_TYPE = 'PASSWORD';
    IF temp != 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/
-- EXEC
DECLARE
    tmp number:= 0;
BEGIN
    SELECT c##administrator.Check_pass_role('c##dataentry') into tmp from dual;
    IF (tmp = 1)
    THEN 
     dbms_output.put_line('Co password');
    ELSE
    dbms_output.put_line('Khong co password');
    END IF;
END;
------------ Lenh kiem tra xem co ton tai view/table hay khong -------------
begin
execute immediate 'drop function c##administrator.Check_exist_view_table';
exception when others then null;
end;
/

create or replace FUNCTION  c##administrator.Check_exist_view_table (v_name in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(UPPER(VIEW_NAME)) INTO temp FROM ALL_VIEWS WHERE OWNER = 'C##QLBVIEN' and VIEW_NAME = UPPER(v_name);
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        SELECT COUNT(UPPER(TABLE_NAME)) INTO temp FROM ALL_TABLES WHERE OWNER = 'C##QLBVIEN' and TABLE_NAME = UPPER(v_name);
        IF temp != 0 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END IF;
END;
/
---------- Lenh kiem tra view co ton tay hay khong?---------------------
begin
execute immediate 'drop FUNCTION c##administrator.Check_exist_view';
exception when others then null;
end;
/
create or replace FUNCTION c##administrator.Check_exist_view (v_name in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(UPPER(VIEW_NAME)) INTO temp FROM ALL_VIEWS WHERE OWNER = 'C##QLBVIEN' and VIEW_NAME = UPPER(v_name);
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/