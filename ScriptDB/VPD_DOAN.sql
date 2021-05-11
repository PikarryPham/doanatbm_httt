-------------------------
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

declare
   c int;
begin
   select count(*) into c from ALL_POLICIES where POLICY_NAME = upper('BACSI_XEM_KHAM');
   if c = 1 then
      BEGIN DBMS_RLS.drop_policy (object_schema => 'C##QLBVIEN',
            object_name => 'KHAM',
            policy_name => 'BACSI_XEM_KHAM'); 
            END;
   end if;
end;
/

BEGIN DBMS_RLS.add_policy
(object_schema => 'C##QLBVIEN',
object_name => 'KHAM',
policy_name => 'BACSI_XEM_KHAM',
function_schema => 'C##QLBVIEN',
policy_function => 'KHAM_predicate',
statement_types => 'SELECT');
END;
/

CREATE USER C##BS1 identified by 123;
GRANT connect, create session to C##BS1;
GRANT C##BACSI to C##BS1;
GRANT SELECT on c##QLBVIEN.KHAM to C##BACSI;
/

-------------
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

declare
   c int;
begin
   select count(*) into c from ALL_POLICIES where POLICY_NAME = upper('BACSI_XEM_SDDV');
   if c = 1 then
     BEGIN DBMS_RLS.drop_policy (object_schema => 'C##QLBVIEN',
            object_name => 'SU_DUNG_DICH_VU',
            policy_name => 'BACSI_XEM_SDDV'); 
            END;
   end if;
end;
/

BEGIN DBMS_RLS.add_policy
(object_schema => 'C##QLBVIEN',
object_name => 'SU_DUNG_DICH_VU',
policy_name => 'BACSI_XEM_SDDV',
function_schema => 'C##QLBVIEN',
policy_function => 'SDDV_predicate',
statement_types => 'SELECT');
END;
/
GRANT SELECT on C##QLBVIEN.SU_DUNG_DICH_VU to C##BACSI;