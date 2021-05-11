using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace phanhe2
{
    public partial class NVKT_XemThongTinNhanVien : Form
    {
        public NVKT_XemThongTinNhanVien()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form form = new NhanVienKeToan();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }
        OracleConnection conn = DBUtils.GetDBConnection();
        DataSet ds = new DataSet();

        private void btnxemdsnhanvien_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                DataTable dt = new DataTable();
                String search = manhanvien_xemnv.Text;
                OracleCommand objCmd = new OracleCommand("C##QLBVIEN.NVKT_Xem_NV", conn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("T_NV_ID", OracleDbType.Varchar2).Value = search;
                objCmd.Parameters.Add("KQ", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                objCmd.Parameters.Add(new OracleParameter("@P_ERROR", OracleDbType.Varchar2, 32767));
                objCmd.Parameters["@P_ERROR"].Direction = ParameterDirection.Output;
                objCmd.ExecuteNonQuery();
                string Perror = objCmd.Parameters["@P_ERROR"].Value.ToString();
                

                OracleDataAdapter da = new OracleDataAdapter(objCmd);
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                MessageBox.Show(Perror);

            }
            catch (Exception err)
            {
                MessageBox.Show("Da co loi xay ra");
                //Console.WriteLine(err.StackTrace);
            }
            finally
            {
                conn.Close();
                //conn.Dispose();
            }
            Console.Read();
        }
    }
}
