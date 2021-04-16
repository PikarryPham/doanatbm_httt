--- Xoa ham truoc khi tao moi ---
-- Co the kiem tra view: select * from dba_tab_privs where owner = 'C##QLBVIEN';
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
/*cap quyen select cho Nhan_Vien*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_Role(
    Ten_role varchar2,
    Ten_view varchar2 default null,
    NV_ID int default 0,
    NV_TEN int default 0,
    NV_NAMSINH int default 0,
    NV_DIACHI int default 0,
    NV_SDT int default 0,
    NV_LUONG int default 0,
    NV_LUONGCB int default 0,
    NV_LOAI int default 0,
    NV_SONGAYCONG int default 0,
    NV_PHUCAP int default 0,
    NV_CONLV int default 0,
    NV_PB int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_role like 'c##%' THEN
        check_e := c##administrator.Check_exist_role(Ten_role); -- Doi thanh role neu lam cho role
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := NV_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'NV_ID';
            END IF;   
            IF NV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF NV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF NV_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF NV_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF NV_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_SDT';
                kiemtra := kiemtra + 1;
            ELSIF NV_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_SDT';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_LUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LUONG ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LUONG';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_LUONGCB = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LUONGCB ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LUONGCB = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LUONGCB';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_LOAI = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LOAI ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LOAI = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LOAI';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_SONGAYCONG = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_SONGAYCONG ';
                kiemtra := kiemtra + 1;
            ELSIF NV_SONGAYCONG = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_SONGAYCONG';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_PHUCAP = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_PHUCAP ';
                kiemtra := kiemtra + 1;
            ELSIF NV_PHUCAP = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_PHUCAP';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_CONLV = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_CONLV ';
                kiemtra := kiemtra + 1;
            ELSIF NV_CONLV = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_CONLV';
                kiemtra := kiemtra + 1;
            END IF;

	IF NV_PB = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_PB ';
                kiemtra := kiemtra + 1;
            ELSIF NV_PB = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_PB';
                kiemtra := kiemtra + 1;
            END IF;
            temp := temp || ' FROM c##QLBVIEN.NHAN_VIEN';
            EXECUTE IMMEDIATE temp;
            p_Error := 'Cap quyen select tren ' || Ten_view || 'thanh cong';
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
            p_Error := 'Cap quyen select tren ' || Ten_view || 'thanh cong';
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau'; -- Doi thanh role neu lam cho role
        WHEN ex2 THEN
            p_Error := 'Role khong ton tai'; -- Doi thanh role neu lam cho role
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ' || SQLERRM;  
end;
/

/*cap quyen select cho THUOC cho role*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Thuoc_cho_Role';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Thuoc_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    T_ID int default 0,
    T_TENTHUOC int default 0,
    T_HANG int default 0,
    T_DONGIA int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_role like 'c##%' THEN
        check_e := c##administrator.Check_exist_role(Ten_role);
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := T_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'T_ID';
            END IF;   
            IF T_TENTHUOC = 1 and kiemtra != 0 THEN
                temp := temp || ',T_TENTHUOC';
                kiemtra := kiemtra + 1;
            ELSIF T_TENTHUOC = 1 and kiemtra = 0 THEN
                temp := temp || 'T_TENTHUOC';
                kiemtra := kiemtra + 1;
            END IF;
            IF T_HANG = 1 and kiemtra != 0 THEN
                temp := temp || ',T_HANG';
                kiemtra := kiemtra + 1;
            ELSIF T_HANG = 1 and kiemtra = 0 THEN
                temp := temp || 'T_HANG';
                kiemtra := kiemtra + 1;
            END IF;
            IF T_DONGIA = 1 and kiemtra != 0 THEN
                temp := temp || ',T_DONGIA';
            ELSIF T_DONGIA = 1 and kiemtra = 0 THEN
                temp := temp || 'T_DONGIA';
            END IF;
            temp := temp || ' FROM c##QLBVIEN.THUOC';
            EXECUTE IMMEDIATE temp;
            p_Error := 'Cap quyen select tren ' || Ten_view || 'thanh cong';
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
            p_Error := 'Cap quyen select tren ' || Ten_view || 'thanh cong';
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
            p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ' || SQLERRM;  
END;
/

DECLARE 
    tmp varchar2(100);
BEGIN
    c##administrator.AD_Cap_Quyen_Select_Thuoc_cho_Role('c##test26', 'test_view20', 1, 1, 0, 0,tmp);
    DBMS_OUTPUT.PUT_LINE (tmp);
END;
/

------------ UPDATE TREN NHAN VIEN --------------------
/*cap quyen update cho Nhan_Vien*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Nhan_Vien_cho_Role ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Quyen_Update_Nhan_Vien_cho_Role (
    Ten_role varchar2,
    NV_ID int default 0,
    NV_TEN int default 0,
    NV_NAMSINH int default 0,
    NV_DIACHI int default 0,
    NV_SDT int default 0,
    NV_LUONG int default 0,
    NV_LUONGCB int default 0,
    NV_LOAI int default 0,
    NV_SONGAYCONG int default 0,
    NV_PHUCAP int default 0,
    NV_CONLV int default 0,
    NV_PB int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_role(Ten_role);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := NV_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'NV_ID';
        END IF;
            IF NV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF NV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF NV_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF NV_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF NV_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_SDT';
                kiemtra := kiemtra + 1;
            ELSIF NV_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_SDT';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_LUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LUONG ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LUONG';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_LUONGCB = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LUONGCB ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LUONGCB = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LUONGCB';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_LOAI = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_LOAI ';
                kiemtra := kiemtra + 1;
            ELSIF NV_LOAI = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_LOAI';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_SONGAYCONG = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_SONGAYCONG ';
                kiemtra := kiemtra + 1;
            ELSIF NV_SONGAYCONG = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_SONGAYCONG';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_PHUCAP = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_PHUCAP ';
                kiemtra := kiemtra + 1;
            ELSIF NV_PHUCAP = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_PHUCAP';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_CONLV = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_CONLV ';
                kiemtra := kiemtra + 1;
            ELSIF NV_CONLV = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_CONLV';
                kiemtra := kiemtra + 1;
            END IF;
	IF NV_PB = 1 and kiemtra != 0 THEN
                temp := temp || ',NV_PB ';
                kiemtra := kiemtra + 1;
            ELSIF NV_PB = 1 and kiemtra = 0 THEN
                temp := temp || 'NV_PB';
                kiemtra := kiemtra + 1;
            END IF;
        temp := temp || ') ON c##QLBVIEN.NHAN_VIEN to ' || Ten_role;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
        p_Error:= 'Cap quyen update tren bang NHANVIEN cho role ' || Ten_role || ' thanh cong';
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' || SQLERRM; 
end;
/

DECLARE 
    tmp varchar2(100);
BEGIN
    c##administrator.AD_Cap_Quyen_Update_Nhan_Vien_cho_Role('c##student',0,0,0,0,0,0,0, 1, 1, 0, 0, 1, tmp);
    DBMS_OUTPUT.PUT_LINE (tmp);
END;
/
---------------- UPDATE TREN THUOC ----------------------
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Thuoc_cho_Role';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE c##administrator.AD_Cap_Quyen_Update_Thuoc_cho_Role (
    Ten_role varchar2,
    T_ID int default 0,
    T_TENTHUOC int default 0,
    T_HANG int default 0,
    T_DONGIA int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_role(Ten_role);
    IF check_e = FALSE THEN
        Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := T_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'T_ID';
        END IF;
        
        IF T_TENTHUOC = 1 and kiemtra != 0 THEN
            temp := temp || ',T_TENTHUOC';
            kiemtra := kiemtra + 1;
        ELSIF T_TENTHUOC = 1 and kiemtra = 0 THEN
            temp := temp || 'T_TENTHUOC';
            kiemtra := kiemtra + 1;
        END IF;
        
        IF T_HANG = 1 and kiemtra != 0 THEN
            temp := temp || ',T_HANG';
            kiemtra := kiemtra + 1;
        ELSIF T_HANG = 1 and kiemtra = 0 THEN
            temp := temp || 'T_HANG';
            kiemtra := kiemtra + 1;
        END IF;
        
        IF T_DONGIA = 1 and kiemtra != 0 THEN
            temp := temp || ',T_DONGIA';
        ELSIF T_DONGIA = 1 and kiemtra = 0 THEN
            temp := temp || 'T_DONGIA';
        END IF;
        
        temp := temp || ') ON c##QLBVIEN.THUOC to ' || Ten_role;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
        p_Error:= 'Cap quyen update tren bang THUOC cho '|| Ten_role || ' thanh cong';
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
            p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra'; 
END;
/
