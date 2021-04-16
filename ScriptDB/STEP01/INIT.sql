-- Vao sys de chay lenh nay --> connect toi c##administrator/addm
begin
execute immediate 'drop user c##administrator cascade';
exception when others then null;
end;
/

CREATE USER c##administrator IDENTIFIED BY addm;
GRANT connect, create session to c##administrator;
GRANT  ALL PRIVILEGES to  c##administrator WITH ADMIN OPTION CONTAINER = ALL;
GRANT CONNECT, RESOURCE, DBA TO c##administrator;
GRANT SELECT ANY DICTIONARY TO c##administrator;