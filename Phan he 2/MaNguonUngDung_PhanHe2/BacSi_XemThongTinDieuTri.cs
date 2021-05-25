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
    public partial class BacSi_XemThongTinDieuTri : Form
    {
        public BacSi_XemThongTinDieuTri()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        private void quayvebtn_Click(object sender, EventArgs e)
        {
            Form form = new BacSi();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }
        OracleConnection conn = DBUtils.GetDBConnection();
        private void btn_xemthongtinkhamcuabn_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                DataTable dt = new DataTable();
                String search = mabn_xemkham.Text;
                OracleCommand objCmd = new OracleCommand("C##QLBVIEN.BS_Xem_KHAM", conn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("T_BN_ID", OracleDbType.Varchar2).Value = search;
                objCmd.Parameters.Add("KQ", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                objCmd.Parameters.Add(new OracleParameter("@P_ERROR", OracleDbType.Varchar2, 32767));
                objCmd.Parameters["@P_ERROR"].Direction = ParameterDirection.Output;
                objCmd.ExecuteNonQuery();
                string Perror = objCmd.Parameters["@P_ERROR"].Value.ToString();


                OracleDataAdapter da = new OracleDataAdapter(objCmd);
                da.Fill(dt);
                dsthongtinkham.DataSource = dt;
                if (mabn_xemkham.Text.Length >= 1)
                {
                    MessageBox.Show(Perror);
                }
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

        private void xemthongtinsddv_btn_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                DataTable dt = new DataTable();
                String search = mabenhnhan_sddv.Text;
                OracleCommand objCmd = new OracleCommand("C##QLBVIEN.BS_Xem_DV", conn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("T_BN_ID", OracleDbType.Varchar2).Value = search;
                objCmd.Parameters.Add("KQ", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                objCmd.Parameters.Add(new OracleParameter("@P_ERROR", OracleDbType.Varchar2, 32767));
                objCmd.Parameters["@P_ERROR"].Direction = ParameterDirection.Output;
                objCmd.ExecuteNonQuery();
                string Perror = objCmd.Parameters["@P_ERROR"].Value.ToString();


                OracleDataAdapter da = new OracleDataAdapter(objCmd);
                da.Fill(dt);
                dssudungdichvu.DataSource = dt;
                if (mabenhnhan_sddv.Text.Length >= 1)
                {
                    MessageBox.Show(Perror);
                }
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
