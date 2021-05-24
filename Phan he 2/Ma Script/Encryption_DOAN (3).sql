begin
execute immediate 'drop table c##QLBVIEN.YEK';
exception when others then null;
end;
/
CREATE TABLE c##QLBVIEN.YEK
(
    yek_ varchar2(10)
);
/
GRANT EXECUTE ON SYS.DBMS_CRYPTO TO PUBLIC;
GRANT EXECUTE ON C##QLBVIEN.Decryp TO PUBLIC;
GRANT EXECUTE ON C##QLBVIEN.Encryp TO PUBLIC;
GRANT SELECT on c##QLBVIEN.YEK to public;
INSERT INTO c##QLBVIEN.YEK
    VALUES ('YEKIPSOH')
/
begin
execute immediate 'drop function C##QLBVIEN.Get_k';
exception when others then null;
end;
/
create or replace FUNCTION  C##QLBVIEN.Get_k
    RETURN varchar2
IS
    temp varchar2(20);
BEGIN
    SELECT * INTO temp FROM C##QLBVIEN.YEK;
    RETURN temp;
END;
/
begin
execute immediate 'drop trigger C##QLBVIEN.EnCryp';
exception when others then null;
end;
/
CREATE OR REPLACE FUNCTION C##QLBVIEN.EnCryp(
    input_string in VARCHAR2
)
RETURN varchar2
AS
    raw_input RAW(128) := UTL_RAW.CAST_TO_RAW(CONVERT(input_string,'AL32UTF8','US7ASCII'));
    key_string VARCHAR2(8) := C##QLBVIEN.get_k();
    raw_key RAW(128) := UTL_RAW.CAST_TO_RAW(CONVERT(key_string,'AL32UTF8','US7ASCII'));
    encrypted_raw RAW(2048);
    encrypted_string VARCHAR2(2048);
begin
        encrypted_raw := dbms_crypto.Encrypt(src => raw_input, typ => DBMS_CRYPTO.DES_CBC_PKCS5, key => raw_key);
        RETURN rawtohex(UTL_RAW.CAST_TO_RAW(encrypted_raw));
end;
/
DECLARE
    temp varchar2(300);
BEGIN
    temp := C##QLBVIEN.EnCryp('1');
    DBMS_OUTPUT.PUT_LINE (temp);
END;
/
begin
execute immediate 'drop function C##QLBVIEN.DeCryp';
exception when others then null;
end;
/
CREATE OR REPLACE FUNCTION C##QLBVIEN.Decryp
(
    Diem IN varchar2
)
RETURN varchar2
IS
    key_string VARCHAR2(8) :=  C##QLBVIEN.get_k();
    raw_key RAW(128) := UTL_RAW.CAST_TO_RAW(CONVERT(key_string,'AL32UTF8','US7ASCII'));
    encrypted_raw RAW(2048) := hextoraw(UTL_RAW.CAST_TO_VARCHAR2(Diem));
    encrypted_string VARCHAR2(2048);
    decrypted_raw RAW(2048);
    decrypted_string VARCHAR2(2048);
BEGIN
    decrypted_raw := dbms_crypto.Decrypt(src => encrypted_raw, typ => DBMS_CRYPTO.DES_CBC_PKCS5, key => raw_key);
    decrypted_string := CONVERT(UTL_RAW.CAST_TO_VARCHAR2(decrypted_raw),'US7ASCII','AL32UTF8');
    RETURN decrypted_string;
END;
/
/*
DECLARE
 temp varchar2(100) := '';
 Begin
    temp := C##QLBVIEN.DeCryp(temp);
    DBMS_OUTPUT.PUT_LINE(temp);
 end;
 /
 SELECT * FROM C##QLBVIEN.BENH_NHAN;*/
begin
execute immediate 'drop procedure C##QLBVIEN.BS_Xem_KHAM';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.BS_Xem_KHAM
(    
    T_BN_ID varchar2,
    KQ OUT SYS_REFCURSOR,
    P_ERROR OUT varchar2
)
IS
    ex EXCEPTION;
    temp boolean;
BEGIN
    IF T_BN_ID is null THEN
        OPEN KQ FOR
            SELECT KH_ID ,C##QLBVIEN.Decryp(KH_TRIEUCHUNG) as KH_TRIEUCHUNG ,KH_THOIGIAN ,C##QLBVIEN.Decryp(KH_CHANDOAN) as KH_CHANDOAN,KH_TAIKHAM ,KH_IDBN ,KH_TONGTIEN ,KH_BSKHAM  FROM c##QLBVIEN.KHAM;
    ELSE
        temp := C##QLBVIEN.Check_exist_id_benhnhan(T_BN_ID);
        IF temp = TRUE THEN
            OPEN KQ FOR
            SELECT KH_ID ,C##QLBVIEN.Decryp(KH_TRIEUCHUNG) as KH_TRIEUCHUNG ,KH_THOIGIAN ,C##QLBVIEN.Decryp(KH_CHANDOAN) as KH_CHANDOAN,KH_TAIKHAM ,KH_IDBN ,KH_TONGTIEN ,KH_BSKHAM  FROM c##QLBVIEN.KHAM WHERE KH_IDBN = T_BN_ID;
        ELSE
            Raise ex;
        END IF;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'Id benh nhan khong ton tai';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra : ' || SQLERRM;
END;
/


begin
execute immediate 'drop FUNCTION C##QLBVIEN.Get_id_kham';
exception when others then null;
end;
/
create or replace FUNCTION c##QLBVIEN.Get_id_kham
    RETURN NUMBER
IS
    temp number;
BEGIN
    SELECT MAX(KH_ID) + 1 INTO temp FROM c##QLBVIEN.KHAM;
    IF temp is null THEN
        RETURN 1;
    ELSE
        RETURN temp;
    END IF;
END;
/
begin
execute immediate 'drop procedure C##QLBVIEN.BS_Them_KHAM';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.BS_Them_KHAM
(    
    T_KH_TRIEUCHUNG VARCHAR2, 
    T_KH_THOIGIAN DATE, 
    T_KH_CHANDOAN VARCHAR2, 
    T_KH_TAIKHAM DATE,
    T_KH_IDBN NUMBER,
    T_KH_TONGTIEN NUMBER,
    T_KH_BSKHAM VARCHAR2,
    P_ERROR OUT VARCHAR2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    temp BOOLEAN;
    temp2 varchar2(10);
    temp3 number;
BEGIN
    temp := c##QLBVIEN.Check_exist_id_benhnhan(T_KH_IDBN);
    IF temp = FALSE THEN
        Raise ex;
    END IF;
    temp := c##QLBVIEN.Check_exist_id_nv(T_KH_BSKHAM);
    IF temp = FALSE THEN
        Raise ex2;
    END IF;
    temp2 := '''';
    temp3 := C##QLBVIEN.Get_id_kham();
    DBMS_OUTPUT.PUT_LINE('Hello');
    execute immediate 'INSERT INTO C##QLBVIEN.KHAM (KH_ID, KH_TRIEUCHUNG, KH_THOIGIAN, KH_CHANDOAN, KH_TAIKHAM,KH_IDBN,KH_TONGTIEN,KH_BSKHAM)
        VALUES (' || to_char(temp3) || ',' || temp2 || C##QLBVIEN.EnCryp(T_KH_TRIEUCHUNG) || temp2 || ',' || temp2 || T_KH_THOIGIAN || temp2 || ',' || temp2 || C##QLBVIEN.EnCryp(T_KH_CHANDOAN) || temp2 || ',' || temp2 || T_KH_TAIKHAM || temp2 ||
        ',' || temp2 || T_KH_IDBN || temp2 || ',' || temp2 || T_KH_TONGTIEN|| temp2 || ',' || temp2 || T_KH_BSKHAM || temp2 || ')';
    EXCEPTION 
        WHEN ex THEN
            P_ERROR := 'id benh nhan khong ton tai';
        WHEN ex2 THEN
            P_ERROR := 'id bac si khong ton tai';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra : ' || SQLERRM;
END;
/
DECLARE 
    tmp varchar2(4000);
BEGIN
    C##QLBVIEN.BS_Them_KHAM('Viem xoang','15-OCT-20','So mui, di ung',NULL,7,1200000,'C##NV001',tmp);
    SELECT MAX(KH_ID) + 1 INTO tmp FROM C##QLBVIEN.KHAM;
    --tmp := C##QLBVIEN.Get_id_kham();
    DBMS_OUTPUT.PUT_LINE(tmp);
END;


-- Grant quyen tao procedure va thuc thi procedure cho cac bac si ==> vi sau khi ap dung VPD ==> can phai dung bac si moi insert KHAM va SDDV
-- Phai dung tai khoan system/sysdba
GRANT CREATE PROCEDURE TO C##NV001, C##NV002;
GRANT EXECUTE ON C##QLBVIEN.BS_Them_KHAM TO C##NV001, C##NV002;
GRANT EXECUTE ON C##QLBVIEN.BS_Xem_KHAM TO C##NV001, C##NV002;
GRANT EXECUTE ON c##QLBVIEN.Check_exist_id_benhnhan TO C##NV001, C##NV002;
GRANT EXECUTE ON c##QLBVIEN.Check_exist_id_nv TO C##NV001, C##NV002;
GRANT EXECUTE ON C##QLBVIEN.Get_id_kham TO C##NV001, C##NV002;