--- Dang nhap bang tai khoan sysdba roi chay bang account nay
set define off; --chay nay truoc
CREATE OR REPLACE AND RESOLVE JAVA SOURCE NAMED C##QLBVIEN."calcsha"
AS import java.security.MessageDigest; 
public class calcsha2 
{
    static public String fncsha(String inputVal) throws Exception
    {           
    MessageDigest myDigest = MessageDigest.getInstance("SHA-256");        
    myDigest.update(inputVal.getBytes());
    byte[] dataBytes = myDigest.digest();
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < dataBytes.length; i++) {
    sb.append(Integer.toString((dataBytes[i])).substring(1));
    }        
    StringBuffer hexString = new StringBuffer();
    for (int i=0;i<dataBytes.length;i++) {
        String hex=Integer.toHexString(0xff & dataBytes[i]);
        if(hex.length()==1) hexString.append('0');
         hexString.append(hex);
        }
        String retParam = hexString.toString();
        return retParam;           
    }    
}
/

CREATE OR REPLACE FUNCTION C##QLBVIEN.hash_sha256 (txt varchar2)
RETURN VARCHAR2
AS
LANGUAGE JAVA
NAME 'calcsha2.fncsha(java.lang.String) return String';
/
set define on; -- Chay nay

select C##QLBVIEN.hash_sha256('123456789') from dual;
-- Thay doi do dai cua bien NV_PSW
ALTER TABLE C##QLBVIEN.NHAN_VIEN
MODIFY NV_PSW VARCHAR2(4000);

-- Chuyen tat ca cac psw co trong day thanh hash psw 
declare
    hashpsw VARCHAR2(4000):='';
    str VARCHAR2(100) := 'C##NV008';
begin
    select C##QLBVIEN.hash_sha256(str) into hashpsw from dual ;
    dbms_output.put_line(hashpsw);
    UPDATE C##QLBVIEN.NHAN_VIEN
    SET C##QLBVIEN.NHAN_VIEN.NV_PSW = hashpsw
    WHERE C##QLBVIEN.NHAN_VIEN.NV_ID = str;
end;
/

-- Kiem tra lai ket qua sau khi hash psw
SELECT * FROM C##QLBVIEN.NHAN_VIEN;