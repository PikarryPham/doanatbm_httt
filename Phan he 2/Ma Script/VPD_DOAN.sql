begin
execute immediate 'drop function C##QLBVIEN.KHAM_predicate';
exception when others then null;
end;
/

CREATE OR REPLACE FUNCTION C##QLBVIEN.KHAM_predicate(
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
AS
    check_user varchar2(100);
BEGIN
    check_user := '(SELECT (SYS_CONTEXT(''userenv'', ''SESSION_USER'')) FROM dual)';
    RETURN 'UPPER(KH_BSKHAM) = ' || check_user;
END;
/
BEGIN DBMS_RLS.drop_policy (object_schema => 'C##QLBVIEN',
object_name => 'KHAM',
policy_name => 'BACSI_XEM_KHAM'); 
END;
/
BEGIN DBMS_RLS.add_policy
(object_schema => 'C##QLBVIEN',
object_name => 'KHAM',
policy_name => 'BACSI_XEM_KHAM',
function_schema => 'C##QLBVIEN',
policy_function => 'KHAM_predicate',
statement_types => 'SELECT,INSERT',
update_check => TRUE);
END;
/

begin
execute immediate 'drop function C##QLBVIEN.SDDV_predicate';
exception when others then null;
end;
/

CREATE OR REPLACE FUNCTION C##QLBVIEN.SDDV_predicate(
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
AS
    check_user varchar2(100);
BEGIN
    check_user := '(SELECT KH_ID FROM C##QLBVIEN.KHAM WHERE UPPER(KH_BSKHAM) = SYS_CONTEXT(''userenv'', ''SESSION_USER''))';
    RETURN 'SDDV_IDKHAM in ' || check_user;
END;
/


BEGIN DBMS_RLS.drop_policy (object_schema => 'C##QLBVIEN',
object_name => 'SU_DUNG_DICH_VU',
policy_name => 'BACSI_XEM_SDDV'); 
END;
/
BEGIN DBMS_RLS.add_policy
(object_schema => 'C##QLBVIEN',
object_name => 'SU_DUNG_DICH_VU',
policy_name => 'BACSI_XEM_SDDV',
function_schema => 'C##QLBVIEN',
policy_function => 'SDDV_predicate',
statement_types => 'SELECT,INSERT',
update_check => TRUE);
END;
/

GRANT SELECT on C##QLBVIEN.SU_DUNG_DICH_VU to C##BACSI;
/
begin
execute immediate 'drop PROCEDURE C##QLBVIEN.BS_Xem_DV';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.BS_Xem_DV
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
            SELECT *  FROM c##QLBVIEN.SU_DUNG_DICH_VU;
    ELSE
        temp := C##QLBVIEN.Check_exist_id_benhnhan(T_BN_ID);
        IF temp = TRUE THEN
            OPEN KQ FOR
            SELECT *  FROM c##QLBVIEN.SU_DUNG_DICH_VU WHERE SDDV_IDKHAM in (SELECT KH_ID FROM c##QLBVIEN.KHAM WHERE KH_IDBN = T_BN_ID);
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
execute immediate 'drop FUNCTION c##QLBVIEN.Check_exist_id_dv';
exception when others then null;
end;
/
create or replace FUNCTION c##QLBVIEN.Check_exist_id_dv(dvid in number)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(DV_ID) INTO temp FROM c##QLBVIEN.DICH_VU_KHAM_BENH WHERE DV_ID = dvid;
    DBMS_OUTPUT.PUT_LINE(temp);
    IF temp != 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/


begin
execute immediate 'drop FUNCTION c##QLBVIEN.Check_exist_id_kham';
exception when others then null;
end;
/
create or replace FUNCTION c##QLBVIEN.Check_exist_id_kham(khid in number)
    RETURN BOOLEAN
IS
    temp number;
BEGIN
    SELECT COUNT(KH_ID) INTO temp FROM c##QLBVIEN.KHAM WHERE KH_ID = khid;
    DBMS_OUTPUT.PUT_LINE(temp);
    IF temp = 1 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/

begin
execute immediate 'drop procedure C##QLBVIEN.NV_Them_SDDV';
exception when others then null;
end;
/
create or replace PROCEDURE  C##QLBVIEN.NV_Them_SDDV
(   
    T_SSDV_IDDV NUMBER,
    T_SDDV_IDKHAM NUMBER,
    T_SDDV_NGTHUCHIEN VARCHAR2,
    T_SDDV_THOIGIAN DATE,
    T_SDDV_CHECK VARCHAR2,
    P_ERROR OUT VARCHAR2
)
IS
    ex EXCEPTION;
    ex2 EXCEPTION;
    ex3 EXCEPTION;
    temp BOOLEAN;
    temp2 varchar2(10);
    temp3 number;
BEGIN
    temp := c##QLBVIEN.Check_exist_id_dv(T_SSDV_IDDV);
    IF temp = FALSE THEN
        Raise ex3;
    END IF;
    temp := c##QLBVIEN.Check_exist_id_kham(T_SDDV_IDKHAM);
    IF temp = FALSE THEN
        Raise ex;
    END IF;
    temp := c##QLBVIEN.Check_exist_id_nv(T_SDDV_NGTHUCHIEN);
    IF temp = FALSE THEN
        Raise ex2;
    END IF;
    temp2 := '''';
    execute immediate 'INSERT INTO C##QLBVIEN.SU_DUNG_DICH_VU (SSDV_IDDV,SDDV_IDKHAM,SDDV_NGTHUCHIEN,SDDV_THOIGIAN,SDDV_CHECK)
        VALUES (' || T_SSDV_IDDV || temp2 || ',' || temp2 || T_SDDV_IDKHAM || temp2 || ',' || temp2 || T_SDDV_NGTHUCHIEN || temp2 || ',' || temp2 || T_SDDV_THOIGIAN || temp2 || ',' || temp2 || T_SDDV_CHECK || temp2 || ')';
    DBMS_OUTPUT.PUT_LINE('Thanh cong');
    EXCEPTION
        WHEN ex THEN
            P_ERROR := 'id kham khong ton tai';
        WHEN ex2 THEN
            P_ERROR := 'id nhan vien khong ton tai';
         WHEN ex3 THEN
            P_ERROR := 'id dich vu khong ton tai';
        WHEN OTHERS THEN
            P_ERROR := 'Co loi xay ra' || SQLERRM;
END;
/

DECLARE 
    tmp varchar2(100);
BEGIN
    C##QLBVIEN.NV_Them_SDDV(2,3,'C##NV003','20-SEP-20','1',tmp);
    DBMS_OUTPUT.PUT_LINE(tmp);
END;

SELECT * FROM C##QLBVIEN.KHAM;
-- Grant quyen tao procedure va thuc thi procedure cho cac bac si ==> vi sau khi ap dung VPD ==> can phai dung bac si moi insert KHAM va SDDV
GRANT CREATE PROCEDURE TO C##NV001, C##NV002;
GRANT EXECUTE ON C##QLBVIEN.NV_Them_SDDV TO C##NV001, C##NV002;
GRANT EXECUTE ON C##QLBVIEN.BS_Xem_DV TO C##NV001, C##NV002;