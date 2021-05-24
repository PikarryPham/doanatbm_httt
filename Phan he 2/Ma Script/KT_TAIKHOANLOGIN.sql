/*Ham cho giao dien login*/
----------- Viet ham kiem tra dang nhap cua admin. ---------------------
begin
execute immediate 'drop function c##administrator.SYS_KTraTaiKhoan';
exception when others then null;
end;
/

CREATE OR REPLACE FUNCTION c##administrator.SYS_KTraTaiKhoan(adUsername IN varchar2 DEFAULT 'c##administrator', adPassword IN varchar2 DEFAULT 'addm', loainv IN VARCHAR2 default 'ke toan')
RETURN NUMBER
IS
    tmp number;
BEGIN
    SELECT COUNT(*) INTO tmp FROM c##QLBVIEN.NHAN_VIEN WHERE NV_ID = adUsername AND NV_PSW = adPassword AND NV_LOAI = loainv;
    IF(tmp != 0)
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Something wrong');
        RETURN 0;
END;
/

--- EXEC FUNCTION
DECLARE  
    tmp NUMBER:= 1;
BEGIN
    SELECT c##administrator.SYS_KTraTaiKhoan('C##NV001', 'C##NV001','bac si') into tmp from dual;
    IF (tmp = 1)
    THEN 
     dbms_output.put_line('Login thanh cong');
    ELSE
    dbms_output.put_line('Login khong thanh cong');
    END IF;
END;
/