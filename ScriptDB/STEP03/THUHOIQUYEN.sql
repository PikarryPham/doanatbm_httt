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

begin
execute immediate 'drop procedure c##administrator.AD_Thu_Hoi_Select_Bang_view';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Thu_Hoi_Select_Bang_view(
    Ten_user_role varchar2,
    Ten_bang_view varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    ex2 EXCEPTION;
    tmp boolean;
    tmp2 boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user_role) or c##administrator.Check_exist_role(Ten_user_role);
    IF Ten_user_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            tmp2 := c##administrator.Check_exist_view_table(Ten_bang_view);
            IF (tmp2 = TRUE) THEN
                EXECUTE IMMEDIATE 'REVOKE SELECT ON C##QLBVIEN.'|| Ten_bang_view || ' FROM ' || Ten_user_role;
                p_Error:= 'Ban da thu hoi quyen select tren' || Ten_bang_view || ' thanh cong!';
            ELSE
                RAISE ex2;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user hay role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User hay role khong ton tai';
        WHEN ex2 THEN
             p_Error:= 'View hay bang khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'User khong co quyen nay';     
END;
/

begin
execute immediate 'drop procedure c##administrator.AD_Thu_Hoi_Update_Bang_view';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Thu_Hoi_Update_Bang_view(
    Ten_user_role varchar2,
    Ten_bang_view varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    ex2 EXCEPTION;
    tmp boolean;
    tmp2 boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user_role) or c##administrator.Check_exist_role(Ten_user_role);
    IF Ten_user_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            tmp2 := c##administrator.Check_exist_view_table(Ten_bang_view);
            IF (tmp2 = TRUE) THEN
                EXECUTE IMMEDIATE 'REVOKE UPDATE ON C##QLBVIEN.'|| Ten_bang_view || ' FROM ' || Ten_user_role;
                p_Error:= 'Ban da thu hoi quyen update tren' || Ten_bang_view || ' thanh cong!';
            ELSE
                RAISE ex2;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user hay role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User hay role khong ton tai';
        WHEN ex2 THEN
             p_Error:= 'View hay bang khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'User khong co quyen nay';     
END;
/

begin
execute immediate 'drop procedure c##administrator.AD_Thu_Hoi_Insert_Bang_view';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Thu_Hoi_Insert_Bang_view(
    Ten_user_role varchar2,
    Ten_bang_view varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    ex2 EXCEPTION;
    tmp boolean;
    tmp2 boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user_role) or c##administrator.Check_exist_role(Ten_user_role);
    IF Ten_user_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            tmp2 := c##administrator.Check_exist_view_table(Ten_bang_view);
            IF (tmp2 = TRUE) THEN
                EXECUTE IMMEDIATE 'REVOKE INSERT ON C##QLBVIEN.'|| Ten_bang_view || ' FROM ' || Ten_user_role;
                p_Error:= 'Ban da thu hoi quyen insert tren' || Ten_bang_view || ' thanh cong!';
            ELSE
                RAISE ex2;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user hay role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User hay role khong ton tai';
        WHEN ex2 THEN
             p_Error:= 'View hay bang khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'User khong co quyen nay';     
END;
/


begin
execute immediate 'drop procedure c##administrator.AD_Thu_Hoi_Delete_Bang_view';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Thu_Hoi_Delete_Bang_view(
    Ten_user_role varchar2,
    Ten_bang_view varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    ex2 EXCEPTION;
    tmp boolean;
    tmp2 boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user_role) or c##administrator.Check_exist_role(Ten_user_role);
    IF Ten_user_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            tmp2 := c##administrator.Check_exist_view_table(Ten_bang_view);
            IF (tmp2 = TRUE) THEN
                EXECUTE IMMEDIATE 'REVOKE DELETE ON C##QLBVIEN.'|| Ten_bang_view || ' FROM ' || Ten_user_role;
                p_Error:= 'Ban da thu hoi quyen delete tren' || Ten_bang_view || ' thanh cong!';
            ELSE
                RAISE ex2;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user hay role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User hay role khong ton tai';
        WHEN ex2 THEN
             p_Error:= 'View hay bang khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'User khong co quyen nay';     
END;
/