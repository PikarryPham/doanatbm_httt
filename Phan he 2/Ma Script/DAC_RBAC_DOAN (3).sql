begin
execute immediate 'drop function C##QLBVIEN.Check_exist_id_benhnhan';
exception when others then null;
end;
/

create or replace FUNCTION  C##QLBVIEN.Check_exist_id_benhnhan(bnid in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(BN_ID) INTO temp FROM c##QLBVIEN.BENH_NHAN WHERE BN_ID = bnid;
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
begin
execute immediate 'drop procedure C##QLBVIEN.NV_Xem_ds_benh_nhan ';
exception when others then null;
end;
/
create or replace PROCEDURE C##QLBVIEN.NV_Xem_ds_benh_nhan 
(    KQ OUT SYS_REFCURSOR,
     P_ERROR OUT varchar2
)
IS
    ex EXCEPTION;
BEGIN
    OPEN KQ FOR
        SELECT BN_ID, BN_TEN, BN_NAMSINH, C##QLBVIEN.DeCryp(BN_DIACHI) as BN_DIACHI, C##QLBVIEN.DeCryp(BN_SDT) as BN_SDT FROM c##QLBVIEN.BENH_NHAN;
    IF SQL%NOTFOUND THEN
        RAISE ex;                            
    END IF;
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Error';
END;
/
begin
execute immediate 'drop function C##QLBVIEN.Check_exist_sdt_bn';
exception when others then null;
end;
/

create or replace FUNCTION  C##QLBVIEN.Check_exist_sdt_bn(sdt in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(BN_SDT) INTO temp FROM c##QLBVIEN.BENH_NHAN WHERE C##QLBVIEN.DeCryp(BN_SDT) = sdt;
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
begin
execute immediate 'drop function C##QLBVIEN.Get_id_bn';
exception when others then null;
end;
/
create or replace FUNCTION  C##QLBVIEN.Get_id_bn
    RETURN NUMBER
IS
    temp number;
BEGIN
    SELECT MAX(BN_ID) + 1 INTO temp FROM c##QLBVIEN.BENH_NHAN;
    IF temp is null THEN
        RETURN 1;
    ELSE
        RETURN temp;
    END IF;
END;
/
begin
execute immediate 'drop procedure C##QLBVIEN.NV_Them_BN';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.NV_Them_BN
(    
    T_BN_TEN VARCHAR2,
    T_BN_NAMSINH DATE,
    T_BN_DIACHI VARCHAR2,
    T_BN_SDT VARCHAR2,
    P_ERROR OUT VARCHAR2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp BOOLEAN;
    temp2 varchar2(10);
    temp3 number;
BEGIN
    temp := c##QLBVIEN.Check_exist_sdt_bn(T_BN_SDT);
    IF temp = TRUE THEN
        Raise ex2;
    END IF;
    temp2 := '''';
    temp3 := C##QLBVIEN.Get_id_bn();
    P_ERROR := 'Them thong tin benh nhan thanh cong';
    execute immediate 'INSERT INTO C##QLBVIEN.BENH_NHAN (BN_ID, BN_TEN, BN_NAMSINH,BN_DIACHI,BN_SDT)
        VALUES (' || to_char(temp3) || ',' || temp2 || T_BN_TEN || temp2 || ',' || temp2 || T_BN_NAMSINH || temp2 || ',' || temp2 || C##QLBVIEN.EnCryp(T_BN_DIACHI) || temp2 || ',' || temp2 || C##QLBVIEN.EnCryp(T_BN_SDT) || temp2 || ')';
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Trung id voi benh nhan khac';
        WHEN ex2 THEN
            P_ERROR := 'Trung so dien thoai voi benh nhan khac';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra' || SQLERRM;
END;
/

DECLARE 
    tmp varchar2(100);
BEGIN
    C##QLBVIEN.NV_Them_BN('Long Daniel','19-JUN-01', 'TPHCM','119518946',tmp);
    DBMS_OUTPUT.PUT_LINE (tmp);
END;
/


begin
execute immediate 'drop function C##QLBVIEN.Check_exist_id_nv';
exception when others then null;
end;
/

create or replace FUNCTION  C##QLBVIEN.Check_exist_id_nv(nvid in varchar2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(NV_ID) INTO temp FROM c##QLBVIEN.NHAN_VIEN WHERE NV_ID = nvid;
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/
begin
execute immediate 'drop procedure C##QLBVIEN.NVKT_Xem_NV';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.NVKT_Xem_NV
(    
    T_NV_ID varchar2,
    KQ OUT SYS_REFCURSOR,
    P_ERROR OUT varchar2
)
IS
    ex EXCEPTION;
    temp boolean;
BEGIN
    IF T_NV_ID is null THEN
        OPEN KQ FOR
            SELECT * FROM c##QLBVIEN.KT_Xem_Nhan_vien;
    ELSE
        temp := C##QLBVIEN.Check_exist_id_nv(T_NV_ID);
        IF temp = TRUE THEN
            OPEN KQ FOR
            SELECT NV_ID , NV_TEN ,NV_NAMSINH ,NV_SONGAYCONG ,C##QLBVIEN.Decryp(NV_PHUCAP) as NV_PHUCAP ,NV_CONLV , C##QLBVIEN.Decryp(NV_LUONG) as NV_LUONG  FROM c##QLBVIEN.KT_Xem_Nhan_vien WHERE NV_ID = T_NV_ID;
        ELSE
            Raise ex;
        END IF;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Id nhan vien khong ton tai';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra' || SQLERRM;
END;


----------------------- Grant quy?n th?c thi proc và ch?y proc cho t?ng nhân viên t??ng ?ng
GRANT CREATE PROCEDURE TO c##NV008, c##NV007,  c##NV006,  c##NV005,  c##NV004,  c##NV003;
GRANT EXECUTE ON C##QLBVIEN.NV_Xem_ds_benh_nhan TO c##NV008;
GRANT EXECUTE ON C##QLBVIEN.NV_Them_BN TO c##NV008;
GRANT EXECUTE ON C##QLBVIEN.NVKT_Xem_NV TO c##NV004, c##administrator;