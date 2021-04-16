begin
execute immediate 'drop function c##administrator.Check_exist_user';
exception when others then null;
end;
/
/*ham de check user co ton tai*/
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
------------------------- Ham de xem thong tin cua moi user tren cac doi tuong du lieu -----------------------
begin
execute immediate 'drop procedure c##administrator.AD_Xem_moi_user_tren_bang';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Xem_moi_user_tren_bang(
    ten_user varchar2,
    CAU2a OUT SYS_REFCURSOR
)
IS
    ex EXCEPTION;
    temp boolean;
BEGIN
    temp := Check_exist_user(ten_user);
    IF ten_user IS NULL THEN
        OPEN CAU2a FOR
            SELECT dr.GRANTEE, dt.TABLE_NAME, dt.privilege, dt.GRANTABLE FROM DBA_ROLE_PRIVS dr join DBA_TAB_PRIVS dt on (dr.GRANTED_ROLE = dt.GRANTEE) where dt.OWNER = 'C##QLBVIEN'
            and dr.GRANTEE != 'SYS' 
            and dr.GRANTEE != 'SYSTEM'
            AND dr.GRANTEE != 'C##ADMINISTRATOR';
    ELSE
        IF temp = TRUE THEN
            OPEN CAU2a FOR
            SELECT dr.GRANTEE, dt.TABLE_NAME, dt.privilege, dt.GRANTABLE FROM DBA_ROLE_PRIVS dr join DBA_TAB_PRIVS dt on (dr.GRANTED_ROLE = dt.GRANTEE) where dt.OWNER = 'C##QLBVIEN'
            and dr.GRANTEE != 'SYS' 
            and dr.GRANTEE != 'SYSTEM'
            AND dr.GRANTEE != 'C##ADMINISTRATOR'
            AND dr.GRANTEE = UPPER(ten_user);
        Else
            RAISE ex;
        END IF;
        IF SQL%NOTFOUND THEN
            RAISE ex;                            
        END IF;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            Raise_application_error(-1, 'Error');
END;
/
-- EXEC
DECLARE
    para varchar2(100):= '';
BEGIN
    c##administrator.AD_Xem_moi_user_tren_bang('c##nhanvien');
END;
/


------------------------------------------------------ Ham de xem thong tin cua moi role tren cac doi tuong du lieu -----------------------

begin
execute immediate 'drop procedure c##administrator.AD_Xem_moi_role_tren_bang ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Xem_moi_role_tren_bang (
    ten_role in varchar2 default null, CAU2c OUT SYS_REFCURSOR
)
IS
    ex EXCEPTION;
    tmp boolean;
    TenRole varchar2(100):= ten_role;
BEGIN
    tmp := Check_exist_role(ten_role);
    IF (TenRole IS NULL) THEN
            OPEN CAU2c FOR
            SELECT * FROM ROLE_TAB_PRIVS WHERE OWNER = 'C##QLBVIEN';
    ELSE
        IF tmp = TRUE THEN
            OPEN CAU2c FOR
                SELECT * FROM ROLE_TAB_PRIVS WHERE OWNER = 'C##QLBVIEN' AND ROLE = UPPER(TenRole);
        ELSE
            RAISE ex;
        END IF;
        IF SQL%NOTFOUND THEN
            RAISE ex;                            
        END IF;
    END IF;
     EXCEPTION 
        WHEN ex THEN
            Raise_application_error(-1, 'Error');
END;
-- EXEC