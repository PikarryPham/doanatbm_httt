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
    public partial class NhanVienTiepNhan_DPBenh_ThemThongTinBN : Form
    {
        public NhanVienTiepNhan_DPBenh_ThemThongTinBN()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        OracleConnection conn = DBUtils.GetDBConnection();
        DataSet ds = new DataSet();

        private void quayvebtn_Click(object sender, EventArgs e)
        {
            Form form = new Form1();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void xemdsbenhnhan_btn_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                DataTable dt = new DataTable();
                OracleCommand objCmd = new OracleCommand("C##QLBVIEN.NV_Xem_ds_benh_nhan", conn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("KQ", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                objCmd.Parameters.Add("P_ERROR", OracleDbType.Varchar2).Direction = ParameterDirection.Output;

                objCmd.ExecuteNonQuery();
                OracleDataAdapter da = new OracleDataAdapter(objCmd);
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                MessageBox.Show("Tim kiem thanh cong!");
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

        private void taothongtinbenhnhan_btn_Click(object sender, EventArgs e)
        {

            conn.Open();
            try
            {
                if (!string.IsNullOrEmpty(tenbn_txt.Text) || !string.IsNullOrEmpty(namsinh.Text) || !string.IsNullOrEmpty(diachitxt.Text)
                 || !string.IsNullOrEmpty(sodienthoaitxt.Text))
                {
                    string tenbenhnhan = tenbn_txt.Text;
                    string namsinhbenhnhan = namsinh.Text;
                    string diachi = diachitxt.Text;
                    string sdt = sodienthoaitxt.Text;

                    OracleCommand objCmd = new OracleCommand("C##QLBVIEN.NV_Them_BN", conn);
                    objCmd.CommandType = CommandType.StoredProcedure;



                    //ghep bien
                    OracleParameter thembn_tenbenhnhan = new OracleParameter("@T_BN_TEN", OracleDbType.Varchar2);
                    thembn_tenbenhnhan.Value = tenbenhnhan;
                    objCmd.Parameters.Add(thembn_tenbenhnhan);

                    OracleParameter thembn_namsinhbenhnhan = new OracleParameter("@T_BN_NAMSINH", OracleDbType.Varchar2);
                    thembn_namsinhbenhnhan.Value = namsinhbenhnhan;
                    objCmd.Parameters.Add(thembn_namsinhbenhnhan);

                    OracleParameter thembn_diachi = new OracleParameter("@T_BN_DIACHI", OracleDbType.Varchar2);
                    thembn_diachi.Value = diachi;
                    objCmd.Parameters.Add(thembn_diachi);

                    OracleParameter thembn_sdt = new OracleParameter("@T_BN_SDT", OracleDbType.Varchar2);
                    thembn_sdt.Value = sdt;
                    objCmd.Parameters.Add(thembn_sdt);

                    objCmd.Parameters.Add(new OracleParameter("@P_ERROR", OracleDbType.Varchar2, 32767));
                    objCmd.Parameters["@P_ERROR"].Direction = ParameterDirection.Output;
                    objCmd.ExecuteNonQuery();
                    string perror2 = objCmd.Parameters["@P_ERROR"].Value.ToString();
                    MessageBox.Show(perror2);
                }
                else
                {
                    MessageBox.Show("Vui long dien day du thong tin");
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Da co loi xay ra");
                Console.WriteLine(err.StackTrace);
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
