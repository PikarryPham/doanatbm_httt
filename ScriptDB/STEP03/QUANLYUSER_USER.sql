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
----- -------------------- TAO MOI USER-------------------
begin
execute immediate 'drop procedure c##administrator.AD_Tao_User';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Tao_User (
    Ten_user varchar2,
    MK varchar2 DEFAULT NULL,
    User_quota int default 0,
    User_tablespace varchar2 default 'system',
    p_Error OUT varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    ex3 EXCEPTION;
    ex4 EXCEPTION;
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_user(Ten_user);
    IF tmp = FALSE THEN
        IF User_quota < 0 THEN
            RAISE ex2;
        END IF;
        IF Ten_user like 'c##%' THEN
            IF User_quota = 0 THEN
                IF (MK IS NOT NULL) THEN
                    p_Error:= 'Chuc mung ban da tao user thanh cong voi ten user la' || Ten_user || ' va pass ' || MK;
                    EXECUTE IMMEDIATE 'CREATE USER ' || Ten_user || ' IDENTIFIED BY ' || MK;
                    EXECUTE IMMEDIATE 'GRANT create session, connect to ' || Ten_user;
                ELSE
                    RAISE ex3;
                END IF;
            ELSE
                p_Error:= 'Chuc mung ban da tao user thanh cong co tablespace la ' || User_tablespace || ' voi quota la ' || User_quota || ' M';
                EXECUTE IMMEDIATE 'CREATE USER ' || Ten_user || ' IDENTIFIED BY ' || MK || ' DEFAULT TABLESPACE ' || 
                User_tablespace || ' QUOTA ' || TO_CHAR(User_quota) || 'M ON ' || User_tablespace;
                EXECUTE IMMEDIATE 'GRANT create session, connect to ' || Ten_user;
            END IF;
        ELSE
            RAISE ex;
        END IF;
    ELSE
        RAISE ex4;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex2 THEN
            p_Error:= 'Quota phai la mot so duong lon hon 0';
        WHEN ex3 THEN
            p_Error:= 'Vui long nhap password cho nguoi dung';
        WHEN ex4 THEN
            p_Error:= 'Da ton tai user nay trong database';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/

---- EXEC
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Tao_User('c##meomun','123',10,'system',str);
    dbms_output.put_line(str);
END;
/

----------------- XOA USER --------------------------
begin
execute immediate 'drop procedure c##administrator.AD_Xoa_User';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Xoa_User (
    Ten_user varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_user(ten_user);
    IF tmp = TRUE THEN
        IF Ten_user like 'c##%' THEN
            p_Error:= 'Xoa user ' || Ten_user || ' thanh cong!';
            EXECUTE IMMEDIATE 'DROP USER ' || Ten_user;
        ELSE
            RAISE ex;
        END IF;
    ELSE
        RAISE ex1;
    END IF;
    EXCEPTION 
       WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User nay chua ton tai trong db nen khong the xoa.';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;          
END;
/
--- EXEC
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Xoa_User('c##meomun',str);
    dbms_output.put_line(str);
END;
/

----------------------- CAP NHAT USER -------------------
--- CAP NHAT PASSWORD
begin
execute immediate 'drop procedure c##administrator.AD_Sua_User_password';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Sua_User_password (
    Ten_user varchar2,
    MK_moi varchar2 default '',
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    ex3 EXCEPTION;
    temp varchar2(400);
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_user(Ten_user);
    IF tmp = FALSE THEN
        Raise ex3;
    END IF;
    temp := 'ALTER USER ' || Ten_user;
    IF Ten_user like 'c##%' THEN
        IF(MK_moi IS NOT NULL OR MK_moi != '') THEN
            p_Error:= 'Da thay doi password cua user ' || Ten_user || ' thanh cong';
            temp := temp || ' IDENTIFIED BY ' || MK_moi;
            EXECUTE immediate temp;
        ELSE
            RAISE ex2;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
       WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
       WHEN ex2 THEN
            p_Error:= 'Mat khau khong duoc de trong';
       WHEN ex3 THEN
            p_Error:= 'User khong ton tai';
       WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;    
END;
/
-- EXEC
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Sua_User_password ('c##meomun','ahihi',str);
    dbms_output.put_line(str);
END;
/
-- CAP NHAT QUOTA/TABLESPACE
begin
execute immediate 'drop procedure c##administrator.AD_Sua_User_Quota';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Sua_User_Quota (
    Ten_user varchar2,
    User_quota int default 5,
    User_tablespace varchar2 default 'system',
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    ex3 EXCEPTION;
    ex4 EXCEPTION;
    temp varchar2(100);
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_user(Ten_user);
    IF tmp = FALSE THEN
        Raise ex3;
    END IF;
    temp := 'ALTER USER ' || Ten_user;
    IF User_quota <= 0 THEN
        RAISE ex2;
    END IF;
    IF Ten_user like 'c##%' THEN
        IF User_quota != '' OR User_quota > 0 THEN
            IF User_quota > 0 AND User_tablespace IS NOT NULL THEN
                    temp :=  temp || ' DEFAULT TABLESPACE ' || User_tablespace || ' QUOTA ' ||
                    User_quota || 'M ON ' || User_tablespace;
                    p_Error:= 'Da thay doi quota va tablespace cua user ' || Ten_user || ' thanh cong';
            ELSE
                RAISE ex4;
            END IF;
        ELSE
            RAISE ex4;
        END IF;
        EXECUTE immediate temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
       WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
       WHEN ex2 THEN
            p_Error:= 'Quota phai la mot so nguyen > 0';
       WHEN ex3 THEN
            p_Error:= 'User khong ton tai';
        WHEN ex4 THEN
            p_Error:= 'Vui long xem lai ten cua tablespace va quota';
       WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;
            
END;
/
---- EXEC
declare 
    str varchar2(100):= '';
BEGIN
    c##administrator.AD_Sua_User_Quota('c##meomun',5,'system',str);
    dbms_output.put_line(str);
END;
/
-- Ham kiem tra quota cua user co username la c##meomun
SELECT USERNAME, MAX_BYTES FROM DBA_TS_QUOTAS WHERE USERNAME IN('C##MEOMUN');



