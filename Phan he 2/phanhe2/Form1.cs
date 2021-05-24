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
using System.Text.RegularExpressions;

namespace phanhe2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

       

        public string returnUsername()
        {
            if (!string.IsNullOrEmpty(usernametxt_login.Text))
            {
                MessageBox.Show(usernametxt_login.Text);
                return usernametxt_login.Text;
            }
            else
            {
                return "ahihi";
            }
        }

        public string returnPassword()
        {
            if (!string.IsNullOrEmpty(pswtxt_login.Text))
            {
                return pswtxt_login.Text;
            }
            else
            {
                return "addm";
            }
        }

        private void dangnhapbtn_Click(object sender, EventArgs e)
        {
            ThongTinNV._username = "c##administrator";
            ThongTinNV._psw = "addm";
            OracleConnection conn = DBUtils.GetDBConnection();
            try
            {
                conn.Open();
                if (!string.IsNullOrEmpty(usernametxt_login.Text) && !string.IsNullOrEmpty(pswtxt_login.Text))
                {
                    //Phải xét thêm TH nếu kí tự đầu của chuỗi là gì đó --> thì khi chọn đúng loại mới cho vào
                    // Ví dụ. Tên đăng nhập là bacsi001 thì chỉ dc chọn loại là bác sĩ ===> nếu chọn loại khác thì báo lỗi

                    //dùng regex để check lỗi --> nếu chuỗi nhập vào có các kí tự đặc biệt (trừ #) thì sẽ báo lỗi
                    var regexItem = new Regex("^[a-zA-Z0-9_#]*$");

                    if (regexItem.IsMatch(usernametxt_login.Text))
                    {

                        if (comboBox_login.SelectedItem != null)
                        {

                            string option = comboBox_login.SelectedItem.ToString();

                            

                            OracleCommand objCmd = new OracleCommand();
                            objCmd.Connection = conn;
                            String username = usernametxt_login.Text.ToUpper();
                            String psw = pswtxt_login.Text.ToUpper();
                            String loainv = comboBox_login.SelectedItem.ToString().ToLower();
                            //MessageBox.Show(loainv);

                            // Convert no ve chuoi thuong neu lo co ghi hoa thi van dang nhap duoc
                            objCmd.CommandText = "c##administrator.SYS_KTraTaiKhoan";
                            objCmd.CommandType = CommandType.StoredProcedure;
                            objCmd.Parameters.Add("adUsername", username);
                            objCmd.Parameters.Add("adPassword", psw);
                            objCmd.Parameters.Add("loainv", loainv);

                            OracleParameter kq;
                            kq = objCmd.Parameters.Add("tmp", OracleDbType.Int32);
                            kq.Direction = ParameterDirection.Output;

                            Int32 result = 1;
                            //result = Convert.ToInt32(kq.Value);

                            //MessageBox.Show(result.ToString());

                            objCmd.Connection.Close();
                            conn.Open();

                            ThongTinNV._username = usernametxt_login.Text.ToUpper();
                            ThongTinNV._psw = pswtxt_login.Text.ToUpper();
                            if (result == 1)
                            {
                                if ((option).ToLower() == "bac si")
                                {
                                    if(ThongTinNV._username == "C##NV001" && ThongTinNV._psw == "C##NV001")
                                    {
                                        ThongTinNV._loainv = "bac si";
                                        Form form = new BacSi();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else if (ThongTinNV._username == "C##NV002" && ThongTinNV._psw == "C##NV002")
                                    {
                                        ThongTinNV._loainv = "bac si";
                                        Form form = new BacSi();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else if(ThongTinNV._username.ToLower() == "c##administrator" && ThongTinNV._psw.ToLower() == "addm")
                                    {
                                        ThongTinNV._username = usernametxt_login.Text.ToLower();
                                        ThongTinNV._psw = pswtxt_login.Text.ToLower();
                                        ThongTinNV._loainv = "bac si";
                                        Form form = new BacSi();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else
                                    {
                                        MessageBox.Show("Co loi xay ra/Nhan vien nay khong phai la bac si.");
                                    }
                                }
                                else if (option.ToLower() == "nhan vien bo phan tiep tan")
                                {
                                    if(ThongTinNV._username == "C##NV008" && ThongTinNV._psw == "C##NV008")
                                    {
                                        ThongTinNV._loainv = "nhan vien bo phan tiep tan";
                                        Form form = new NVTN_TrangQuanLy();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else if (ThongTinNV._username.ToLower() == "c##administrator" && ThongTinNV._psw.ToLower() == "addm")
                                    {
                                        ThongTinNV._username = usernametxt_login.Text.ToLower();
                                        ThongTinNV._psw = pswtxt_login.Text.ToLower();
                                        ThongTinNV._loainv = "nhan vien bo phan tiep tan";
                                        Form form = new NVTN_TrangQuanLy();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else
                                    {
                                        MessageBox.Show("Co loi xay ra/Nhan vien nay khong phai la bo phan tiep tan");
                                    }
                                }
                                else if (option.ToLower() == "ke toan")
                                {
                                    if(ThongTinNV._username == "C##NV004" && ThongTinNV._psw == "C##NV004")
                                    {
                                        ThongTinNV._loainv = "ke toan";
                                        Form form = new NhanVienKeToan();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else if (ThongTinNV._username.ToLower() == "c##administrator" && ThongTinNV._psw.ToLower() == "addm")
                                    {
                                        ThongTinNV._username = usernametxt_login.Text.ToLower();
                                        ThongTinNV._psw = pswtxt_login.Text.ToLower();
                                        ThongTinNV._loainv = "ke toan";
                                        Form form = new NhanVienKeToan();
                                        form.StartPosition = FormStartPosition.CenterScreen;
                                        form.Show();
                                        this.Hide();
                                    }
                                    else
                                    {
                                        MessageBox.Show("Co loi xay ra/ Nhan vien nay khong phai la ke toan");
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("Vui long chon loai nguoi dung khac.");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Co loi xay ra doi voi tai khoan cua nhan vien. Vui long xem lai");
                            }
                            objCmd.Connection.Close();
                        }
                        else
                        {
                            MessageBox.Show("Vui long chon loai nguoi dung");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Co chua ki tu dac biet. Ban la hacker chang?");
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Vui long dien day du thong tin");
                }
            }catch(Exception err)
            {
                MessageBox.Show("Co loi xay ra" + err);
            }
        }

    }
}
