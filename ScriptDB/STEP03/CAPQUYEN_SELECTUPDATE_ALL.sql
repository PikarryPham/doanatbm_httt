/*cap quyen select cho Phong_Ban*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Phong_Ban_cho_User';
exception when others then null;
end;
/


create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Phong_Ban_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    PB_ID int default 0,
    PB_TENPHONGBAN int default 0,
    PB_SDT int default 0,
    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := PB_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'PB_ID';
            END IF;   

            IF PB_TENPHONGBAN= 1 and kiemtra != 0 THEN
                temp := temp || ',PB_TENPHONGBAN';
                kiemtra := kiemtra + 1;
            ELSIF PB_TENPHONGBAN= 1 and kiemtra = 0 THEN
                temp := temp || 'PB_TENPHONGBAN';
                kiemtra := kiemtra + 1;
            END IF;

            IF PB_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',PB_SDT';
                kiemtra := kiemtra + 1;
            ELSIF PB_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'PB_SDT';
                kiemtra := kiemtra + 1;
            END IF;
	
            temp := temp || ' FROM c##QLBVIEN.PHONG_BAN';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
            p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Phong_Ban*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Phong_Ban_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Phong_Ban_cho_User (
    Ten_user varchar2,
    PB_ID int default 0,
    PB_TENPHONGBAN int default 0,
    PB_SDT int default 0,
    p_Error out varchar2,
    GRANT_OP int default 0
    
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := PB_ID;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'PB_ID';
        END IF;
        
        IF PB_TENPHONGBAN= 1 and kiemtra != 0 THEN
            temp := temp || ',PB_TENPHONGBAN';
            kiemtra := kiemtra + 1;
        ELSIF PB_TENPHONGBAN= 1 and kiemtra = 0 THEN
            temp := temp || 'PB_TENPHONGBAN';
            kiemtra := kiemtra + 1;
        END IF;
        
        IF PB_SDT = 1 and kiemtra != 0 THEN
            temp := temp || ',PB_SDT';
            kiemtra := kiemtra + 1;
        ELSIF PB_SDT = 1 and kiemtra = 0 THEN
            temp := temp || 'PB_SDT';
            kiemtra := kiemtra + 1;
        END IF;
        
        temp := temp || ') ON c##QLBVIEN.PHONG_BAN to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/
















/*cap quyen select cho Nhan_Vien*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_User(
    Ten_user varchar2,
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



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user);
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
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Nhan_Vien*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Nhan_Vien_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Nhan_Vien_cho_User (
    Ten_user varchar2,
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
    p_Error out varchar2,
    GRANT_OP int default 0
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := NV_ID;
    IF Ten_user like 'c##%' THEN
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

        
        temp := temp || ') ON c##QLBVIEN.NHAN_VIEN to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/











/*cap quyen select cho Benh_Nhan*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Benh_Nhan_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Benh_Nhan_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    BN_ID int default 0,
    BN_TEN int default 0,
    BN_NAMSINH int default 0,
    BN_DIACHI int default 0,
    BN_SDT int default 0,
    



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := BN_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'BN_ID';
            END IF;   

            IF BN_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_TEN';
                kiemtra := kiemtra + 1;
            ELSIF BN_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF BN_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF BN_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF BN_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF BN_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;

	IF BN_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_SDT';
                kiemtra := kiemtra + 1;
            ELSIF BN_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_SDT';
                kiemtra := kiemtra + 1;
            END IF;

            temp := temp || ' FROM c##QLBVIEN.BENH_NHAN';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Benh_Nhan*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Benh_Nhan_cho_User ';
exception when others then null;
end;
/

CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Benh_Nhan_cho_User (
    Ten_user varchar2,
    BN_ID int default 0,
    BN_TEN int default 0,
    BN_NAMSINH int default 0,
    BN_DIACHI int default 0,
    BN_SDT int default 0,
    
    
    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := BN_ID;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'BN_ID';
        END IF;
        
            IF BN_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_TEN';
                kiemtra := kiemtra + 1;
            ELSIF BN_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF BN_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF BN_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF BN_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF BN_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;

	IF BN_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_SDT';
                kiemtra := kiemtra + 1;
            ELSIF BN_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_SDT';
                kiemtra := kiemtra + 1;
            END IF;
        
        temp := temp || ') ON c##QLBVIEN.BENH_NHAN to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/













/*cap quyen select cho Dich_Vu_Kham_Benh*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Dich_Vu_Kham_Benh_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Dich_Vu_Kham_Benh_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    DV_ID int default 0,
    DV_TEN int default 0,
    DV_DONGIA int default 0,
    DV_PHONG int default 0,
    
    



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := DV_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'DV_ID';
            END IF;   

            IF DV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF DV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DV_DONGIA = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_DONGIA';
                kiemtra := kiemtra + 1;
            ELSIF DV_DONGIA = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_DONGIA';
                kiemtra := kiemtra + 1;
            END IF;
	IF DV_PHONG = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_PHONG';
                kiemtra := kiemtra + 1;
            ELSIF DV_PHONG = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_PHONG';
                kiemtra := kiemtra + 1;
            END IF;


            temp := temp || ' FROM c##QLBVIEN.DICH_VU_KHAM_BENH';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Dich_Vu_Kham_Benh*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Dich_Vu_Kham_Benh_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Dich_Vu_Kham_Benh_cho_User (
    Ten_user varchar2,
    DV_ID int default 0,
    DV_TEN int default 0,
    DV_DONGIA int default 0,
    DV_PHONG int default 0,
    
    
    
    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := DV_ID;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'DV_ID';
        END IF;
        
            IF DV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF DV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DV_DONGIA = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_DONGIA';
                kiemtra := kiemtra + 1;
            ELSIF DV_DONGIA = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_DONGIA';
                kiemtra := kiemtra + 1;
            END IF;
	IF DV_PHONG = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_PHONG';
                kiemtra := kiemtra + 1;
            ELSIF DV_PHONG = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_PHONG';
                kiemtra := kiemtra + 1;
            END IF;

        
        temp := temp || ') ON c##QLBVIEN.DICH_VU_KHAM_BENH to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/




/*cap quyen select cho CT_Don_Thuoc*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_CT_Don_Thuoc_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_CT_Don_Thuoc_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    CTDT_IDDON int default 0,
    CTDT_IDTHUOC int default 0,
    CTDT_SOLUONG int default 0,
    CTDT_DVTINH int default 0,
    CTDT_GIA int default 0,
    CTDT_LIEUDUNG int default 0,
    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := CTDT_IDDON;
            IF kiemtra = 1 THEN
                temp := temp || 'CTDT_IDDON';
            END IF;   

            IF CTDT_IDTHUOC = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_IDTHUOC = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            END IF;

            IF CTDT_SOLUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_SOLUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            END IF;
            IF CTDT_DVTINH = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_DVTINH = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            END IF;


            IF CTDT_GIA = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_GIA';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_GIA = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_GIA';
                kiemtra := kiemtra + 1;
            END IF;

            IF CTDT_LIEUDUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_LIEUDUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            END IF;


            temp := temp || ' FROM c##QLBVIEN.CT_DON_THUOC';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho CT_Don_Thuoc*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_CT_Don_Thuoc_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_CT_Don_Thuoc_cho_User (
    Ten_user varchar2,
    CTDT_IDDON int default 0,
    CTDT_IDTHUOC int default 0,
    CTDT_SOLUONG int default 0,
    CTDT_DVTINH int default 0,
    CTDT_GIA int default 0,
    CTDT_LIEUDUNG int default 0,

    
    
    p_Error out varchar2,
    GRANT_OP int default 0
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := CTDT_IDDON;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'CTDT_IDDON';
        END IF;
        
            IF CTDT_IDTHUOC = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_IDTHUOC = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            END IF;

            IF CTDT_SOLUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_SOLUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            END IF;
	IF CTDT_DVTINH = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_DVTINH = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            END IF;

        

            IF CTDT_GIA = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_GIA';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_GIA = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_GIA';
                kiemtra := kiemtra + 1;
            END IF;

	IF CTDT_LIEUDUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_LIEUDUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            END IF;

        temp := temp || ') ON c##QLBVIEN.CT_DON_THUOC to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/










/*cap quyen select cho Don_Thuoc*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Don_Thuoc_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Don_Thuoc_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    DT_ID int default 0,
    DT_TONGTIEN int default 0,
    DT_GHICHUBS int default 0,
    DT_IDKHAM int default 0,
    

    



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := DT_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'DT_ID';
            END IF;   

            IF DT_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF DT_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DT_GHICHUBS = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            ELSIF DT_GHICHUBS = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            END IF;
	IF DT_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF DT_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;



            temp := temp || ' FROM c##QLBVIEN.DON_THUOC';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Don_Thuoc*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Don_Thuoc_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Don_Thuoc_cho_User (
    Ten_user varchar2,
    DT_ID int default 0,
    DT_TONGTIEN int default 0,
    DT_GHICHUBS int default 0,
    DT_IDKHAM int default 0,

    
    
    p_Error out varchar2,
    GRANT_OP int default 0
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := DT_ID;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'DT_ID';
        END IF;
        
            IF DT_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF DT_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DT_GHICHUBS = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            ELSIF DT_GHICHUBS = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            END IF;
	IF DT_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF DT_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

        


        temp := temp || ') ON c##QLBVIEN.DON_THUOC to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/






/*cap quyen select cho Kham*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Kham_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Kham_cho_User (
    Ten_user varchar2,
    Ten_view varchar2 default null,
    KH_ID int default 0,
    KH_TRIEUCHUNG int default 0,
    KH_THOIGIAN int default 0,
    KH_CHANDOAN int default 0,
    KH_TAIKHAM int default 0,
    KH_IDBN int default 0,
    KH_TONGTIEN int default 0,
    KH_BSKHAM int default 0,

    



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user);
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := KH_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'KH_ID';
            END IF;   

            IF KH_TRIEUCHUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            ELSIF KH_TRIEUCHUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;
	IF KH_CHANDOAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_CHANDOAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TAIKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_TAIKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            END IF;


            IF KH_IDBN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_IDBN';
                kiemtra := kiemtra + 1;
            ELSIF KH_IDBN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_IDBN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF KH_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_BSKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_BSKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_BSKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_BSKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            temp := temp || ' FROM c##QLBVIEN.KHAM';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Kham*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Kham_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Kham_cho_User (
    Ten_user varchar2,
    KH_ID int default 0,
    KH_TRIEUCHUNG int default 0,
    KH_THOIGIAN int default 0,
    KH_CHANDOAN int default 0,
    KH_TAIKHAM int default 0,
    KH_IDBN int default 0,
    KH_TONGTIEN int default 0,
    KH_BSKHAM int default 0,

    p_Error out varchar2,
    GRANT_OP int default 0
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := KH_ID;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'KH_ID';
        END IF;
        
            IF KH_TRIEUCHUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            ELSIF KH_TRIEUCHUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;
	IF KH_CHANDOAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_CHANDOAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TAIKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_TAIKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_IDBN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_IDBN';
                kiemtra := kiemtra + 1;
            ELSIF KH_IDBN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_IDBN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF KH_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_BSKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_BSKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_BSKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_BSKHAM';
                kiemtra := kiemtra + 1;
            END IF;


        
        temp := temp || ') ON c##QLBVIEN.KHAM to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/





/*cap quyen select cho Su_Dung_Dich_Vu*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Su_Dung_Dich_Vu_cho_User ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Su_Dung_Dich_Vu_cho_User(
    Ten_user varchar2,
    Ten_view varchar2 default null,
    SDDV_IDDV int default 0,
    SDDV_IDKHAM int default 0,
    SDDV_NGTHUCHIEN int default 0,
    SDDV_THOIGIAN int default 0,
    SDDV_CHECK int default 0,

    



    GRANT_OP int default 0,
    p_Error out varchar2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN 
    IF Ten_user like 'c##%' THEN
        check_e := c##administrator.Check_exist_user(Ten_user); 
        IF check_e = FALSE THEN
            Raise ex2;
        ELSE
            check_e := c##administrator.Check_exist_view(Ten_view);
        END IF;
        IF check_e = FALSE THEN
            temp := 'CREATE VIEW C##QLBVIEN.' || Ten_view || ' AS SELECT ';
            kiemtra := SDDV_IDDV;
            IF kiemtra = 1 THEN
                temp := temp || 'SDDV_IDDV';
            END IF;   

            IF SDDV_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF SDDV_NGTHUCHIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_NGTHUCHIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            END IF;
	IF SDDV_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF SDDV_CHECK = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_CHECK';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_CHECK = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_CHECK';
                kiemtra := kiemtra + 1;
            END IF;

	

            temp := temp || ' FROM c##QLBVIEN.SU_DUNG_DICH_VU';
            EXECUTE IMMEDIATE temp;
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        ELSE
            IF GRANT_OP = 1 THEN
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user || ' WITH GRANT OPTION';
            ELSE
                EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_user;
            END IF;
        END IF;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'User khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Su_Dung_Dich_Vu*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Su_Dung_Dich_Vu_cho_User ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Su_Dung_Dich_Vu_cho_User (
    Ten_user varchar2,
    SDDV_IDDV int default 0,
    SDDV_IDKHAM int default 0,
    SDDV_NGTHUCHIEN int default 0,
    SDDV_THOIGIAN int default 0,
    SDDV_CHECK int default 0,
    

    p_Error out varchar2,
    GRANT_OP int default 0
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp varchar2(4000);
    kiemtra int;
    check_e boolean;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = FALSE THEN
	Raise ex2;
    END IF;
    temp := 'GRANT UPDATE (';
    kiemtra := SDDV_IDDV;
    IF Ten_user like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'SDDV_IDDV';
        END IF;
        
            IF SDDV_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF SDDV_NGTHUCHIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_NGTHUCHIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            END IF;
	IF SDDV_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF SDDV_CHECK = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_CHECK';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_CHECK = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_CHECK';
                kiemtra := kiemtra + 1;
            END IF;

      


        
        temp := temp || ') ON c##QLBVIEN.SU_DUNG_DICH_VU to ' || Ten_user;
        IF GRANT_OP = 1 THEN
            temp := temp || ' WITH GRANT OPTION';
        END IF;
        DBMS_OUTPUT.PUT_LINE (temp);
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten user phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'User khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/



























/*cap quyen select cho Phong_Ban*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Phong_Ban_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Phong_Ban_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    PB_ID int default 0,
    PB_TENPHONGBAN int default 0,
    PB_SDT int default 0,
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
            kiemtra := PB_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'PB_ID';
            END IF;   

            IF PB_TENPHONGBAN= 1 and kiemtra != 0 THEN
                temp := temp || ',PB_TENPHONGBAN';
                kiemtra := kiemtra + 1;
            ELSIF PB_TENPHONGBAN= 1 and kiemtra = 0 THEN
                temp := temp || 'PB_TENPHONGBAN';
                kiemtra := kiemtra + 1;
            END IF;

            IF PB_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',PB_SDT';
                kiemtra := kiemtra + 1;
            ELSIF PB_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'PB_SDT';
                kiemtra := kiemtra + 1;
            END IF;
	
            temp := temp || ' FROM c##QLBVIEN.PHONG_BAN';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Phong_Ban*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Phong_Ban_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Phong_Ban_cho_Role (
    Ten_role varchar2,
    PB_ID int default 0,
    PB_TENPHONGBAN int default 0,
    PB_SDT int default 0,
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
    kiemtra := PB_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'PB_ID';
        END IF;
        
        IF PB_TENPHONGBAN= 1 and kiemtra != 0 THEN
            temp := temp || ',PB_TENPHONGBAN';
            kiemtra := kiemtra + 1;
        ELSIF PB_TENPHONGBAN= 1 and kiemtra = 0 THEN
            temp := temp || 'PB_TENPHONGBAN';
            kiemtra := kiemtra + 1;
        END IF;
        
        IF PB_SDT = 1 and kiemtra != 0 THEN
            temp := temp || ',PB_SDT';
            kiemtra := kiemtra + 1;
        ELSIF PB_SDT = 1 and kiemtra = 0 THEN
            temp := temp || 'PB_SDT';
            kiemtra := kiemtra + 1;
        END IF;
        
        temp := temp || ') ON c##QLBVIEN.PHONG_BAN to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/
















/*cap quyen select cho Nhan_Vien*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Nhan_Vien_cho_Role (
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
        check_e := c##administrator.Check_exist_role(Ten_role); 
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
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Nhan_Vien*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Nhan_Vien_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Nhan_Vien_cho_Role (
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
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/











/*cap quyen select cho Benh_Nhan*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Benh_Nhan_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Benh_Nhan_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    BN_ID int default 0,
    BN_TEN int default 0,
    BN_NAMSINH int default 0,
    BN_DIACHI int default 0,
    BN_SDT int default 0,
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
            kiemtra := BN_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'BN_ID';
            END IF;   

            IF BN_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_TEN';
                kiemtra := kiemtra + 1;
            ELSIF BN_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF BN_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF BN_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF BN_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF BN_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;

	IF BN_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_SDT';
                kiemtra := kiemtra + 1;
            ELSIF BN_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_SDT';
                kiemtra := kiemtra + 1;
            END IF;

            temp := temp || ' FROM c##QLBVIEN.BENH_NHAN';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Benh_Nhan*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Benh_Nhan_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Benh_Nhan_cho_Role (
    Ten_role varchar2,
    BN_ID int default 0,
    BN_TEN int default 0,
    BN_NAMSINH int default 0,
    BN_DIACHI int default 0,
    BN_SDT int default 0,
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
    kiemtra := BN_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'BN_ID';
        END IF;
        
            IF BN_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_TEN';
                kiemtra := kiemtra + 1;
            ELSIF BN_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF BN_NAMSINH = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_NAMSINH';
                kiemtra := kiemtra + 1;
            ELSIF BN_NAMSINH = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_NAMSINH';
                kiemtra := kiemtra + 1;
            END IF;
	IF BN_DIACHI = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_DIACHI';
                kiemtra := kiemtra + 1;
            ELSIF BN_DIACHI = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_DIACHI';
                kiemtra := kiemtra + 1;
            END IF;

	IF BN_SDT = 1 and kiemtra != 0 THEN
                temp := temp || ',BN_SDT';
                kiemtra := kiemtra + 1;
            ELSIF BN_SDT = 1 and kiemtra = 0 THEN
                temp := temp || 'BN_SDT';
                kiemtra := kiemtra + 1;
            END IF;
        
        temp := temp || ') ON c##QLBVIEN.BENH_NHAN to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/













/*cap quyen select cho Dich_Vu_Kham_Benh*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Dich_Vu_Kham_Benh_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Dich_Vu_Kham_Benh_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    DV_ID int default 0,
    DV_TEN int default 0,
    DV_DONGIA int default 0,
    DV_PHONG int default 0,
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
            kiemtra := DV_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'DV_ID';
            END IF;   

            IF DV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF DV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DV_DONGIA = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_DONGIA';
                kiemtra := kiemtra + 1;
            ELSIF DV_DONGIA = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_DONGIA';
                kiemtra := kiemtra + 1;
            END IF;
	IF DV_PHONG = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_PHONG';
                kiemtra := kiemtra + 1;
            ELSIF DV_PHONG = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_PHONG';
                kiemtra := kiemtra + 1;
            END IF;


            temp := temp || ' FROM c##QLBVIEN.DICH_VU_KHAM_BENH';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Dich_Vu_Kham_Benh*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Dich_Vu_Kham_Benh_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Dich_Vu_Kham_Benh_cho_Role (
    Ten_role varchar2,
    DV_ID int default 0,
    DV_TEN int default 0,
    DV_DONGIA int default 0,
    DV_PHONG int default 0,
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
    kiemtra := DV_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'DV_ID';
        END IF;
        
            IF DV_TEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_TEN';
                kiemtra := kiemtra + 1;
            ELSIF DV_TEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_TEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DV_DONGIA = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_DONGIA';
                kiemtra := kiemtra + 1;
            ELSIF DV_DONGIA = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_DONGIA';
                kiemtra := kiemtra + 1;
            END IF;
	IF DV_PHONG = 1 and kiemtra != 0 THEN
                temp := temp || ',DV_PHONG';
                kiemtra := kiemtra + 1;
            ELSIF DV_PHONG = 1 and kiemtra = 0 THEN
                temp := temp || 'DV_PHONG';
                kiemtra := kiemtra + 1;
            END IF;

        
        temp := temp || ') ON c##QLBVIEN.DICH_VU_KHAM_BENH to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/




/*cap quyen select cho CT_Don_Thuoc*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_CT_Don_Thuoc_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_CT_Don_Thuoc_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    CTDT_IDDON int default 0,
    CTDT_IDTHUOC int default 0,
    CTDT_SOLUONG int default 0,
    CTDT_DVTINH int default 0,
    CTDT_GIA int default 0,
    CTDT_LIEUDUNG int default 0,
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
            kiemtra := CTDT_IDDON;
            IF kiemtra = 1 THEN
                temp := temp || 'CTDT_IDDON';
            END IF;   

            IF CTDT_IDTHUOC = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_IDTHUOC = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            END IF;

            IF CTDT_SOLUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_SOLUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            END IF;
	IF CTDT_DVTINH = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_DVTINH = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            END IF;


            IF CTDT_GIA = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_GIA';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_GIA = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_GIA';
                kiemtra := kiemtra + 1;
            END IF;

	IF CTDT_LIEUDUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_LIEUDUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            END IF;


            temp := temp || ' FROM c##QLBVIEN.CT_DON_THUOC';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho CT_Don_Thuoc*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_CT_Don_Thuoc_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_CT_Don_Thuoc_cho_Role (
    Ten_role varchar2,
    CTDT_IDDON int default 0,
    CTDT_IDTHUOC int default 0,
    CTDT_SOLUONG int default 0,
    CTDT_DVTINH int default 0,
    CTDT_GIA int default 0,
    CTDT_LIEUDUNG int default 0,

    
    
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
    kiemtra := CTDT_IDDON;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'CTDT_IDDON';
        END IF;
        
            IF CTDT_IDTHUOC = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_IDTHUOC = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_IDTHUOC';
                kiemtra := kiemtra + 1;
            END IF;

            IF CTDT_SOLUONG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_SOLUONG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_SOLUONG';
                kiemtra := kiemtra + 1;
            END IF;
	IF CTDT_DVTINH = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_DVTINH = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_DVTINH';
                kiemtra := kiemtra + 1;
            END IF;

        

            IF CTDT_GIA = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_GIA';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_GIA = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_GIA';
                kiemtra := kiemtra + 1;
            END IF;

	IF CTDT_LIEUDUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            ELSIF CTDT_LIEUDUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'CTDT_LIEUDUNG';
                kiemtra := kiemtra + 1;
            END IF;

        temp := temp || ') ON c##QLBVIEN.CT_DON_THUOC to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/









/*cap quyen select cho Don_Thuoc*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Don_Thuoc_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Don_Thuoc_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    DT_ID int default 0,
    DT_TONGTIEN int default 0,
    DT_GHICHUBS int default 0,
    DT_IDKHAM int default 0,
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
            kiemtra := DT_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'DT_ID';
            END IF;   

            IF DT_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF DT_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DT_GHICHUBS = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            ELSIF DT_GHICHUBS = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            END IF;
	IF DT_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF DT_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;



            temp := temp || ' FROM c##QLBVIEN.DON_THUOC';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
        EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
    ELSE
        Raise ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau'; 
        WHEN ex2 THEN
            p_Error := 'Role khong ton tai'; 
        WHEN OTHERS THEN
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Don_Thuoc*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Don_Thuoc_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Don_Thuoc_cho_Role (
    Ten_role varchar2,
    DT_ID int default 0,
    DT_TONGTIEN int default 0,
    DT_GHICHUBS int default 0,
    DT_IDKHAM int default 0,
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
    kiemtra := DT_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'DT_ID';
        END IF;
        
            IF DT_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF DT_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

            IF DT_GHICHUBS = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            ELSIF DT_GHICHUBS = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_GHICHUBS';
                kiemtra := kiemtra + 1;
            END IF;
	IF DT_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',DT_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF DT_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'DT_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

        


        temp := temp || ') ON c##QLBVIEN.DON_THUOC to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/






/*cap quyen select cho Kham*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Kham_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Kham_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    KH_ID int default 0,
    KH_TRIEUCHUNG int default 0,
    KH_THOIGIAN int default 0,
    KH_CHANDOAN int default 0,
    KH_TAIKHAM int default 0,
    KH_IDBN int default 0,
    KH_TONGTIEN int default 0,
    KH_BSKHAM int default 0,
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
            kiemtra := KH_ID;
            IF kiemtra = 1 THEN
                temp := temp || 'KH_ID';
            END IF;   

            IF KH_TRIEUCHUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            ELSIF KH_TRIEUCHUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;
	IF KH_CHANDOAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_CHANDOAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TAIKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_TAIKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            END IF;


            IF KH_IDBN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_IDBN';
                kiemtra := kiemtra + 1;
            ELSIF KH_IDBN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_IDBN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF KH_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_BSKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_BSKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_BSKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_BSKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            temp := temp || ' FROM c##QLBVIEN.KHAM';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Kham*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Kham_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Kham_cho_Role (
    Ten_role varchar2,
    KH_ID int default 0,
    KH_TRIEUCHUNG int default 0,
    KH_THOIGIAN int default 0,
    KH_CHANDOAN int default 0,
    KH_TAIKHAM int default 0,
    KH_IDBN int default 0,
    KH_TONGTIEN int default 0,
    KH_BSKHAM int default 0,
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
    kiemtra := KH_ID;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'KH_ID';
        END IF;
        
            IF KH_TRIEUCHUNG = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            ELSIF KH_TRIEUCHUNG = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TRIEUCHUNG';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;
	IF KH_CHANDOAN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            ELSIF KH_CHANDOAN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_CHANDOAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TAIKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_TAIKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TAIKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF KH_IDBN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_IDBN';
                kiemtra := kiemtra + 1;
            ELSIF KH_IDBN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_IDBN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_TONGTIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            ELSIF KH_TONGTIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_TONGTIEN';
                kiemtra := kiemtra + 1;
            END IF;

	IF KH_BSKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',KH_BSKHAM';
                kiemtra := kiemtra + 1;
            ELSIF KH_BSKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'KH_BSKHAM';
                kiemtra := kiemtra + 1;
            END IF;


        
        temp := temp || ') ON c##QLBVIEN.KHAM to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/





/*cap quyen select cho Su_Dung_Dich_Vu*/
begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Select_Su_Dung_Dich_Vu_cho_Role ';
exception when others then null;
end;
/
create or replace PROCEDURE c##administrator.AD_Cap_Quyen_Select_Su_Dung_Dich_Vu_cho_Role (
    Ten_role varchar2,
    Ten_view varchar2 default null,
    SDDV_IDDV int default 0,
    SDDV_IDKHAM int default 0,
    SDDV_NGTHUCHIEN int default 0,
    SDDV_THOIGIAN int default 0,
    SDDV_CHECK int default 0,
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
            kiemtra := SDDV_IDDV;
            IF kiemtra = 1 THEN
                temp := temp || 'SDDV_IDDV';
            END IF;   

            IF SDDV_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF SDDV_NGTHUCHIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_NGTHUCHIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            END IF;
	IF SDDV_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF SDDV_CHECK = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_CHECK';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_CHECK = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_CHECK';
                kiemtra := kiemtra + 1;
            END IF;

	

            temp := temp || ' FROM c##QLBVIEN.SU_DUNG_DICH_VU';
            EXECUTE IMMEDIATE temp;
            EXECUTE IMMEDIATE 'GRANT SELECT ON C##QLBVIEN.' || Ten_view || ' to ' || Ten_role;
        ELSE
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
            p_Error := 'Co loi xay ra: ';  
END;
/



/*cap quyen update cho Su_Dung_Dich_Vu*/

begin
execute immediate 'drop procedure c##administrator.AD_Cap_Quyen_Update_Su_Dung_Dich_Vu_cho_Role ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE AD_Cap_Quyen_Update_Su_Dung_Dich_Vu_cho_Role (
    Ten_role varchar2,
    SDDV_IDDV int default 0,
    SDDV_IDKHAM int default 0,
    SDDV_NGTHUCHIEN int default 0,
    SDDV_THOIGIAN int default 0,
    SDDV_CHECK int default 0,
    

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
    kiemtra := SDDV_IDDV;
    IF Ten_role like 'c##%' THEN
        IF kiemtra = 1 THEN
            temp := temp || 'SDDV_IDDV';
        END IF;
        
            IF SDDV_IDKHAM = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_IDKHAM = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_IDKHAM';
                kiemtra := kiemtra + 1;
            END IF;

            IF SDDV_NGTHUCHIEN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_NGTHUCHIEN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_NGTHUCHIEN';
                kiemtra := kiemtra + 1;
            END IF;
	IF SDDV_THOIGIAN = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_THOIGIAN = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_THOIGIAN';
                kiemtra := kiemtra + 1;
            END IF;

	IF SDDV_CHECK = 1 and kiemtra != 0 THEN
                temp := temp || ',SDDV_CHECK';
                kiemtra := kiemtra + 1;
            ELSIF SDDV_CHECK = 1 and kiemtra = 0 THEN
                temp := temp || 'SDDV_CHECK';
                kiemtra := kiemtra + 1;
            END IF;

      


        
        temp := temp || ') ON c##QLBVIEN.SU_DUNG_DICH_VU to ' || Ten_role;
        EXECUTE IMMEDIATE temp;
    ELSE
        RAISE ex;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            p_Error := 'Ten role phai co c## o dau';
        WHEN ex2 THEN
	p_Error := 'Role khong ton tai';
        WHEN OTHERS THEN
            p_Error:= 'Co loi xay ra' ;
END;
/





















