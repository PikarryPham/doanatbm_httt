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
            //string user = "c##administrator";
            //string password = "addm";
            string user = ThongTinNV._username;
            MessageBox.Show("Ten user" + user);
            string password = ThongTinNV._psw;
            MessageBox.Show("Password" + password);


            return DBOracleUtils.GetDBConnection(host, port, sid, user, password);
        }
    }
}
