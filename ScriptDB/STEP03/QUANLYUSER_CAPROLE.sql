---- CAP ROLE CHO USER (WITH GRANT OPTION OR NOT) ----- 
-- 1. Kiem tra xem role do co password hay khong?
begin
execute immediate 'drop function c##administrator.Check_pass_role';
exception when others then null;
end;
/
create or replace FUNCTION c##administrator.Check_pass_role (r_name in varchar2)
    RETURN NUMBER
IS
    temp number;
BEGIN
    SELECT COUNT(d.ROLE) INTO temp FROM DBA_ROLES d WHERE d.ROLE = UPPER(r_name) and d.PASSWORD_REQUIRED = 'YES' AND AUTHENTICATION_TYPE = 'PASSWORD';
    IF temp != 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/
-- EXEC
DECLARE
    tmp number:= 0;
BEGIN
    SELECT c##administrator.Check_pass_role('c##dataentry') into tmp from dual;
    IF (tmp = 1)
    THEN 
     dbms_output.put_line('Co password');
    ELSE
    dbms_output.put_line('Khong co password');
    END IF;
END;


--- 2. Grant role cho nguoi dung
begin
execute immediate 'drop procedure c##administrator.Set_role_user ';
exception when others then null;
end;
/
CREATE OR REPLACE PROCEDURE c##administrator.Set_role_user 
(
    Ten_user in varchar2,
    Ten_role in varchar2,
    Pass_role in varchar2 default '',
    p_Error out varchar2
)
IS
    ex1 EXCEPTION;
    ex2 EXCEPTION;
    ex3 EXCEPTION;
    check_e Boolean;
    check_pass NUMBER;
BEGIN
    check_e := c##administrator.Check_exist_user(Ten_user);
    IF check_e = TRUE THEN
        check_e := c##administrator.Check_exist_role(Ten_role);
        IF check_e = TRUE THEN
                check_pass := c##administrator.Check_pass_role(Ten_role);
                p_Error:= 'Grant role ' || Ten_role || ' toi ' || Ten_user || ' thanh cong';
                EXECUTE IMMEDIATE 'GRANT ' || Ten_role || ' to ' || Ten_user;
            IF check_pass = 1 THEN
                IF Pass_role is null OR Pass_role = '' THEN
                    raise ex1;
                ELSE
                    dbms_output.put_line('ahhhh');
                    p_Error:= 'Grant role co mat khau ' || Ten_role || ' toi ' || Ten_user || ' thanh cong';
                    --EXECUTE IMMEDIATE 'SET ROLE ' || Ten_role || ' INDENTIFIED BY ' || Pass_role; //khong the thuc hien duoc quyen nay vi oracle khong cho phep
                END IF;
            END IF;
        ELSE
            Raise ex3;
        END IF;
    ELSE
        RAISE EX2;
    END IF;
    EXCEPTION 
       WHEN ex1 THEN
           p_Error := 'Role nay co password. Vui long nhap password';
       WHEN ex2 THEN
           p_Error := 'User khong ton tai';
       WHEN ex3 THEN
           p_Error := 'Role khong ton tai';   
       WHEN OTHERS THEN
           p_Error := 'Co loi xay ra: ' || SQLERRM;  
END;
/
--- EXEC
DECLARE
    str VARCHAR2(100);
BEGIN
    c##administrator.Set_role_user('c##meomun','c##student','234',str);
    dbms_output.put_line(str); 
END;
/