using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Windows.Forms;

namespace phanhe2
{
    public class DBUtils
    {

        Form1 fm = new Form1();

        public static OracleConnection GetDBConnection()
        {
            
            string host = "DESKTOP-ED2S73F";
            int port = 1521;
            string sid = "XE";
            string user = "c##administrator";
            string password = "addm";
            user = ThongTinNV._username;
            password = ThongTinNV._psw;

            
            return DBOracleUtils.GetDBConnection(host, port, sid, user, password);
        }
    }
}
