begin
execute immediate 'drop procedure c##administrator.AD_Xem_ds_user';
exception when others then null;
end;
/
/*Cau 1 -- fix da co cho phep tim kiem - chua ap dung cho procedure trong c#*/
CREATE OR REPLACE PROCEDURE c##administrator.AD_Xem_ds_user(USER_USERNAME IN VARCHAR2 DEFAULT NULL, p_ketqua OUT SYS_REFCURSOR)
IS
    ex EXCEPTION;
    INPUTUSERNAME VARCHAR2(100):= USER_USERNAME;
    tmp boolean;
BEGIN
    tmp := c##administrator.Check_exist_user(INPUTUSERNAME);
    IF(INPUTUSERNAME IS NULL) THEN
        OPEN p_ketqua FOR
        SELECT * FROM DBA_USERS;
    ELSE 
            IF (tmp = TRUE) THEN
                OPEN p_ketqua FOR
                SELECT * FROM DBA_USERS WHERE USERNAME = INPUTUSERNAME;
            ELSE
                RAISE ex;
            END IF;
            IF SQL%NOTFOUND THEN
                RAISE ex;                            
            END IF;
    END IF;
    EXCEPTION 
        WHEN ex THEN
            Raise_application_error(-1, 'Error');
END;
/