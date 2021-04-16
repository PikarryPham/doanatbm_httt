
--------------------------------------NHAN VIEN------------------------
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Nhan_Vien_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Nhan_Vien_User (
    Ten_user varchar2,
    Grant_op int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user);
    IF Ten_user like 'c##%' THEN
        IF (tmp = TRUE) THEN
            IF Grant_op = 1 THEN
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user || ' WITH GRANT OPTION';
                p_Error :=  'Da cap quyen delete thanh cong cho ' || Ten_user || ' voi quyen grant option thanh cong';
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user;  
                p_Error := 'Da cap quyen delete thanh cong cho ' || Ten_user || ' thanh cong';
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/
/*ham cap quyen them tren bang nhan vien cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Nhan_Vien_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Nhan_Vien_User (
    Ten_user varchar2,
    Grant_op int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user);
    IF Ten_user like 'c##%' THEN
        IF (tmp = TRUE) THEN
            IF Grant_op = 1 THEN
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user || ' WITH GRANT OPTION';
                p_Error := 'Cap quyen insert thanh cong cho ' || Ten_user || ' voi grant option';
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user;    
                p_Error := 'Cap quyen insert thanh cong cho ' || Ten_user;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/
------------------------------------ THUOC -------------------------
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Thuoc_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Thuoc_User (
    Ten_user varchar2,
    Grant_op int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user);
    IF Ten_user like 'c##%' THEN
        IF (tmp = TRUE) THEN
            IF Grant_op = 1 THEN
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                p_Error :=  'Da cap quyen delete thanh cong cho ' || Ten_user || ' voi quyen grant option thanh cong';
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.THUOC TO ' || Ten_user;  
                p_Error := 'Da cap quyen delete thanh cong cho ' || Ten_user || ' thanh cong';
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Thuoc_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Thuoc_User (
    Ten_user varchar2,
    Grant_op int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_user(Ten_user);
    IF Ten_user like 'c##%' THEN
        IF (tmp = TRUE) THEN
            IF Grant_op = 1 THEN
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                p_Error := 'Cap quyen insert thanh cong cho ' || Ten_user || ' voi grant option';
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.THUOC TO ' || Ten_user;    
                p_Error := 'Cap quyen insert thanh cong cho ' || Ten_user;
            END IF;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten user phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/
