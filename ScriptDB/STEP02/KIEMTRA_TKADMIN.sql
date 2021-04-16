/*Ham cho giao dien login*/
----------- Viet ham kiem tra dang nhap cua admin. ---------------------
begin
execute immediate 'drop function c##administrator.SYS_KTraTaiKhoanAdmin';
exception when others then null;
end;
/

CREATE OR REPLACE FUNCTION c##administrator.SYS_KTraTaiKhoanAdmin (adUsername IN varchar2 DEFAULT 'c##administrator', adPassword IN varchar2 DEFAULT 'addm')
RETURN NUMBER
IS
BEGIN
    IF(adUsername = 'c##administrator' and adPassword = 'addm')
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('WRONG');
        RETURN 0;
END;
/

--- EXEC FUNCTION
DECLARE  
    tmp NUMBER:= 1;
BEGIN
    SELECT c##administrator.SYS_KTraTaiKhoanAdmin() into tmp from dual;
    IF (tmp = 1)
    THEN 
     dbms_output.put_line('Login thanh cong');
    ELSE
    dbms_output.put_line('Login khong thanh cong');
    END IF;
END;
/