/*check tren sql plus
CONNECT sys/password AS SYSDBA
SHOW PARAMETER AUDIT - cho nay se thay value dang DB*/ 

/*standard audit tren bang nhan vien*/
ALTER SYSTEM SET audit_trail = DB, extended scope = spfile;

/*SHOW PARAMETER AUDIT - cho nay van thay value dang DB, can tat va ket noi lai DB*/
shu immediate

startup
/*SHOW PARAMETER AUDIT_trail - luc nay se thay co extended them vao*/

audit table;

audit select,update,delete on c##QLBVIEN.NHAN_VIEN by access;

/*xem dinh dang cua file audit*/
desc dba_audit_trail

/*xem lai lich su ghi chu audit*/
select os_username,username,owner,timestamp,action,sql_text
from dba_audit_trail 

/*test thu select bang tai khoan nao do o bang nhan vien*/
/*chay lai lenh xem lich su la thay*/