begin
execute immediate 'drop function C##QLBVIEN.Check_exist_id_benhnhan';
exception when others then null;
end;
/

create or replace FUNCTION  C##QLBVIEN.Check_exist_id_benhnhan(bnid in NUMBER)
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
execute immediate 'drop function C##QLBVIEN.Check_exist_SDT_benhnhan';
exception when others then null;
end;
/

create or replace FUNCTION  C##QLBVIEN.Check_exist_SDT_benhnhan(sdtbn in VARCHAR2)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(BN_SDT) INTO temp FROM c##QLBVIEN.BENH_NHAN WHERE BN_SDT = sdtbn;
    IF temp = 1 THEN
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
(KQ OUT SYS_REFCURSOR,
P_ERROR OUT varchar2
)
IS
    ex EXCEPTION;
    tmp boolean;
BEGIN
    OPEN KQ FOR
    SELECT * FROM c##QLBVIEN.BENH_NHAN;
    IF SQL%NOTFOUND THEN
        RAISE ex;                            
    END IF;
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Error';
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
    temp number;
    tmpcheckID boolean;
    checking boolean;
    temp2 varchar2(10);
    BNID number;
BEGIN
    select count(BN_ID) into temp from C##QLBVIEN.BENH_NHAN;
    BNID := temp + 1; 
    tmpcheckID := C##QLBVIEN.Check_exist_id_benhnhan(BNID);
    -- G?a s? ta có 2 dòng: 1 dòng có id=1 và 1 dòng có id=2 ==> n?u ta xóa dòng có id=1 ==> khi thêm m?i s? vi ph?m khóa ngo?i (lúc ??y s? dòng hi?n t?i = 1 + 1 = 2)
    /*Xét TH n?u BNID có trong DB thì mình c? ti?p t?c t?ng cho ??n khi nào nó không trùng n?a thì thôi*/
    checking := C##QLBVIEN.Check_exist_SDT_benhnhan(T_BN_SDT);
    DBMS_OUTPUT.PUT_LINE ('long');
    IF(checking = false) THEN
        temp2 := '''';
        execute immediate 'INSERT INTO C##QLBVIEN.BENH_NHAN (BN_ID, BN_TEN, BN_NAMSINH,BN_DIACHI,BN_SDT)
            VALUES (' || to_char(BNID) || ',' || temp2 || T_BN_TEN || temp2 || ',' || temp2 || T_BN_NAMSINH || temp2 || ',' || temp2 || T_BN_DIACHI || temp2 || ',' || temp2 || T_BN_SDT || temp2 || ')';
        P_ERROR:= 'Tao thong tin benh nhan moi thanh cong';
    ELSIF (checking = true) 
    THEN
        RAISE ex2;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Trung id voi benh nhan khac';
        WHEN ex2 THEN
            P_ERROR := 'Trung so dien thoai voi benh nhan khac';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra' || SQLERRM;
END;

DECLARE 
    tmp varchar2(100);
BEGIN
    C##QLBVIEN.NV_Them_BN('HELLOWORLD','10-FEB-00', 'TPHCM','0901876543',tmp);
    DBMS_OUTPUT.PUT_LINE (tmp);
END;
/

select * from C##QLBVIEN.benh_nhan;
delete from C##QLBVIEN.benh_nhan where BN_ID = 4;


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
             P_ERROR := 'Tim kiem thanh cong';
    ELSE
        temp := C##QLBVIEN.Check_exist_id_nv(T_NV_ID);
        IF temp = TRUE THEN
            OPEN KQ FOR
            SELECT * FROM c##QLBVIEN.KT_Xem_Nhan_vien WHERE NV_ID = T_NV_ID;
             P_ERROR := 'Tim kiem thanh cong';
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

