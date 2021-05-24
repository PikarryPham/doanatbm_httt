using System;
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
    public partial class BacSi_ThemThongTinDieuTri : Form
    {
        public BacSi_ThemThongTinDieuTri()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        OracleConnection conn = DBUtils.GetDBConnection();
        private void quayvebtn_Click(object sender, EventArgs e)
        {
            Form form = new BacSi();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void taothongtinkham_btn_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                    if(!string.IsNullOrEmpty(trieuchungtxt.Text) && 
                    !string.IsNullOrEmpty(ngaykham_themkham.Text)
                 && !string.IsNullOrEmpty(mabn_themkham.Text)
                 && !string.IsNullOrEmpty(chandoantxt.Text))
                {

                    string tenbacsikham = ThongTinNV._username;
                    string ngaykhambenh = ngaykham_themkham.Text;
                    int mabenhnhan = Convert.ToInt32(mabn_themkham.Value.ToString());
                    string ngaytaikham = ngaytaikham_themdieutri.Text;
                    string trieuchung = trieuchungtxt.Text;
                    string chandoanbenh = chandoantxt.Text;

                    mabsikham_label.Text = ThongTinNV._username;

                    OracleCommand objCmd = new OracleCommand("C##QLBVIEN.BS_Them_KHAM", conn);
                    objCmd.CommandType = CommandType.StoredProcedure;

                    //ghep bien
                    OracleParameter themkham_trieuchung = new OracleParameter("@T_KH_TRIEUCHUNG", OracleDbType.Varchar2);
                    themkham_trieuchung.Value = trieuchung;
                    objCmd.Parameters.Add(themkham_trieuchung);

                    OracleParameter themkham_thgiankham = new OracleParameter("@T_KH_THOIGIAN", OracleDbType.Varchar2);
                    themkham_thgiankham.Value = ngaykhambenh;
                    objCmd.Parameters.Add(themkham_thgiankham);

                    OracleParameter themkham_chandoan = new OracleParameter("@T_KH_CHANDOAN", OracleDbType.Varchar2);
                    themkham_chandoan.Value = chandoanbenh;
                    objCmd.Parameters.Add(themkham_chandoan);

                    if (!string.IsNullOrWhiteSpace(ngaytaikham))
                    {
                        OracleParameter themkham_ngaytaikham = new OracleParameter("@T_KH_TAIKHAM", OracleDbType.Varchar2);
                        themkham_ngaytaikham.Value = ngaytaikham;
                        objCmd.Parameters.Add(themkham_ngaytaikham);
                    }
                    else
                    {
                        OracleParameter themkham_ngaytaikham = new OracleParameter("@T_KH_TAIKHAM", OracleDbType.Varchar2);
                        themkham_ngaytaikham.Value = DBNull.Value;
                        objCmd.Parameters.Add(themkham_ngaytaikham);
                    }
                   
                    OracleParameter themkham_idbenhnhan = new OracleParameter("@T_KH_IDBN", OracleDbType.Int32);
                    themkham_idbenhnhan.Value = mabenhnhan;
                    objCmd.Parameters.Add(themkham_idbenhnhan);

                    OracleParameter themkham_bsikham = new OracleParameter("@T_KH_BSKHAM", OracleDbType.Varchar2);
                    themkham_bsikham.Value = tenbacsikham;
                    objCmd.Parameters.Add(themkham_bsikham);

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
                MessageBox.Show("Da co loi xay ra" + err.StackTrace);
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
