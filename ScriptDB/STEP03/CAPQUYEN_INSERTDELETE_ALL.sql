

/*4 ham tren bang phong ban*/
/*ham cap quyen them tren bang phong ban cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Phong_Ban_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Phong_Ban_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.PHONG_BAN TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.PHONG_BAN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang phong ban cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Phong_Ban_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Phong_Ban_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.PHONG_BAN TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.PHONG_BAN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang phong ban cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Phong_Ban_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Phong_Ban_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.PHONG_BAN TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang phong ban cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Phong_Ban_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Phong_Ban_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.PHONG_BAN TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/









/*4 ham tren bang nhan vien*/
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
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang nhan vien cho user*/

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
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.NHAN_VIEN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang nhan vien cho role*/

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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang nhan vien cho role*/
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/











/*4 ham tren bang benh nhan*/
/*ham cap quyen them tren bang benh nhan cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Benh_Nhan_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Benh_Nhan_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.BENH_NHAN TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.BENH_NHAN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang benh nhan cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Benh_Nhan_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Benh_Nhan_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.BENH_NHAN TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.BENH_NHAN TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang benh nhan cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Benh_Nhan_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Benh_Nhan_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.BENH_NHAN TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang benh nhan cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Benh_Nhan_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Benh_Nhan_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.BENH_NHAN TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/








/*4 ham tren bang dich vu kham benh*/
/*ham cap quyen them tren bang dich vu kham benh cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Dich_Vu_Kham_Benh_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Dich_Vu_Kham_Benh_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang dich vu kham benh cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Dich_Vu_Kham_Benh_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Dich_Vu_Kham_Benh_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang dich vu kham benh cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Dich_Vu_Kham_Benh_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Dich_Vu_Kham_Benh_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang dich vu kham benh cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Dich_Vu_Kham_Benh_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Dich_Vu_Kham_Benh_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DICH_VU_KHAM_BENH TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/








/*4 ham tren bang don thuoc*/
/*ham cap quyen them tren bang don thuoc cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Don_Thuoc_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Don_Thuoc_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DON_THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DON_THUOC TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang don thuoc cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Don_Thuoc_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Don_Thuoc_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DON_THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DON_THUOC TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang don thuoc cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Don_Thuoc_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Don_Thuoc_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.DON_THUOC TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang don thuoc cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Don_Thuoc_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Don_Thuoc_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.DON_THUOC TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/








/*4 ham tren bang chi tiet don thuoc*/
/*ham cap quyen them tren bang chi tiet don thuoc cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_CT_Don_Thuoc_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_CT_Don_Thuoc_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang chi tiet don thuoc cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_CT_Don_Thuoc_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_CT_Don_Thuoc_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang chi tiet don thuoc cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_CT_Don_Thuoc_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_CT_Don_Thuoc_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_role;
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang chi tiet don thuoc cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_CT_Don_Thuoc_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_CT_Don_Thuoc_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.CT_DON_THUOC TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/












/*4 ham tren bang Kham*/
/*ham cap quyen them tren bang Kham cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Kham_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Kham_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.KHAM TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.KHAM TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang Kham cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Kham_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Kham_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.KHAM TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.KHAM TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang Kham cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Kham_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Kham_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.KHAM TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang Kham cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Kham_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Kham_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.KHAM TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/








/*4 ham tren bang Su_Dung_Dich_Vu*/
/*ham cap quyen them tren bang Su_Dung_Dich_Vu cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Su_Dung_Dich_Vu_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Su_Dung_Dich_Vu_User (
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
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/

/*ham xoa quyen tren bang Su_Dung_Dich_Vu cho user*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Su_Dung_Dich_Vu_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Su_Dung_Dich_Vu_User (
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
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_user || ' WITH GRANT OPTION';
                
            ELSE
                EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_user;    
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
            p_Error:= 'Co loi xay ra';     
END;
/


/*ham cap quyen tren bang Su_Dung_Dich_Vu cho role*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Insert_Su_Dung_Dich_Vu_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Insert_Su_Dung_Dich_Vu_Role (
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
            EXECUTE IMMEDIATE 'GRANT INSERT ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/



/*ham xoa quyen tren bang Su_Dung_Dich_Vu cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Delete_Su_Dung_Dich_Vu_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Delete_Su_Dung_Dich_Vu_Role (
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
            EXECUTE IMMEDIATE 'GRANT DELETE ON c##QLBVIEN.SU_DUNG_DICH_VU TO ' || Ten_role;    
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
            p_Error:= 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra';     
END;
/




