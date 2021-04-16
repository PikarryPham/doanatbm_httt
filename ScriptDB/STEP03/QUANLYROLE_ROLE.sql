------ Ham kiem tra xem role da ton tai hay chua? -----------------
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
------------------------------------- TAO ROLE---------------
begin
execute immediate 'drop procedure c##administrator.AD_Tao_Role';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Tao_Role (
    Ten_role varchar2,
    pass_role varchar2 default null,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp:= c##administrator.Check_exist_role(Ten_role);
    IF (tmp = FALSE)
    THEN
        IF Ten_role like 'c##%' THEN
            IF (pass_role IS NOT NULL) THEN
                 p_Error:= 'Chuc mung ban da tao role thanh cong voi ten role la' || Ten_role || ' va pass ' || pass_role;
                EXECUTE IMMEDIATE 'CREATE ROLE ' || Ten_role || ' IDENTIFIED BY ' || pass_role;
            ELSE
                p_Error:= 'Chuc mung ban da tao role thanh cong voi ten role la' || Ten_role;
                EXECUTE IMMEDIATE 'CREATE ROLE ' || Ten_role;
            END IF;
        ELSE 
            RAISE ex;
        END IF;
    ELSE
        RAISE ex1;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'Role nay da ton tai trong db roi.';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/
---- Exec procedure
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Tao_Role('c##student',NULL,str);
    dbms_output.put_line(str);
END;
/

------------------------------------- XOA ROLE ---------------
begin
execute immediate 'drop procedure c##administrator.AD_Xoa_Role';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Xoa_Role (
    Ten_role varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_role(Ten_role);
    IF tmp = TRUE THEN
        IF Ten_role like 'c##%' THEN
            p_Error:= 'Xoa role ' || Ten_role || ' thanh cong!';
            EXECUTE IMMEDIATE 'DROP ROLE ' || Ten_role;
        ELSE
            RAISE ex;
        END IF;
    ELSE
        RAISE ex1;
    END IF;
    EXCEPTION 
       WHEN ex THEN
            p_Error:= 'Ten role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'Role nay chua ton tai trong db nen khong the xoa.';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;          
END;
/
--- EXEC
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Xoa_Role('c##student',str);
    dbms_output.put_line(str);
END;
/

------------------ CAP NHAT ROLE (SE BO SUNG SAU) --------------
begin
execute immediate 'drop procedure c##administrator.AD_CapnhatRole';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_CapnhatRole (
    Ten_role varchar2,
    pass_role varchar2 DEFAULT NULL,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_role(Ten_role);
    IF tmp = TRUE THEN
        IF Ten_role like 'c##%' THEN
            IF (pass_role IS NOT NULL) THEN
                p_Error:= 'Cap nhat role ' || Ten_role || ' co password ' || pass_role || ' thanh cong';
                EXECUTE IMMEDIATE 'ALTER ROLE ' || Ten_role || '  IDENTIFIED BY ' || pass_role;
            ELSE --muon role k con mat khau nua
                p_Error:= 'Cap nhat role khong con password thanh cong';
                EXECUTE IMMEDIATE 'ALTER ROLE ' || Ten_role || ' NOT IDENTIFIED';
            END IF;
        ELSE
            RAISE ex;
        END IF;
    ELSE
        RAISE ex1;
    END IF;
    EXCEPTION 
       WHEN ex THEN
            p_Error:= 'Ten role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'Role nay chua ton tai trong db nen khong the cap nhat.';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';        
END;
/
--
DECLARE
     str varchar2(100):= '';
BEGIN
    c##administrator.AD_CapnhatRole('c##student','ahihi',str);
    dbms_output.put_line(str);
END;