--------------------------------------NHAN VIEN------------------------
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Nhan_Vien_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Nhan_Vien_Role (
    Ten_role varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_role(Ten_role);
    IF Ten_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_role;  
            p_Error := 'Da cap quyen delete thanh cong cho ' || Ten_role || ' thanh cong';
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
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Nhan_Vien_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Nhan_Vien_Role (
    Ten_role varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_role(Ten_role);
    IF Ten_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_role;
            p_Error := 'Cap quyen insert thanh cong cho ' || Ten_role;
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
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Thuoc_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Thuoc_Role (
    Ten_role varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_role(Ten_role);
    IF Ten_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.THUOC TO ' || Ten_role;  
            p_Error := 'Da cap quyen delete thanh cong cho ' || Ten_role || ' thanh cong';
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
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Thuoc_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Thuoc_Role (
    Ten_role varchar2,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex1 EXCEPTION;
    tmp boolean;
BEGIN
    tmp :=  c##administrator.Check_exist_role(Ten_role);
    IF Ten_role like 'c##%' THEN
        IF (tmp = TRUE) THEN
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.THUOC TO ' || Ten_role;    
                p_Error := 'Cap quyen insert thanh cong cho ' || Ten_role;
        ELSE 
            RAISE ex1;
        END IF;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION
        WHEN ex THEN
            p_Error:= 'Ten role phai co c## o dau';
        WHEN ex1 THEN
            p_Error:= 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM;     
END;
/
