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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //private string _userName;
        //private string _passWord;

        //public string userName
        //{
        //    get
        //    {
        //        return _userName;
        //    }
        //    set
        //    {
        //        _userName = usernametxt_login.Text;
        //    }
        //}

        //public string passWord
        //{
        //    get
        //    {
        //        return _passWord;
        //    }
        //    set
        //    {
        //        _passWord = value;
        //    }
        //}

        //public Form1(string usname, string psw)
        //{
        //    if(!string.IsNullOrEmpty(usname) && !string.IsNullOrEmpty(psw))
        //    {
        //        this.userName = usname;
        //        this.passWord = psw;
        //    }
        //}

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
            if (!string.IsNullOrEmpty(usernametxt_login.Text) && !string.IsNullOrEmpty(pswtxt_login.Text))
            {
                //Phải xét thêm TH nếu kí tự đầu của chuỗi là gì đó --> thì khi chọn đúng loại mới cho vào
                // Ví dụ. Tên đăng nhập là bacsi001 thì chỉ dc chọn loại là bác sĩ ===> nếu chọn loại khác thì báo lỗi
                   if(comboBox_login.SelectedItem != null)
                {
                    ThongTinNV._username = usernametxt_login.Text;
                    ThongTinNV._psw = pswtxt_login.Text;
                    string option = comboBox_login.SelectedItem.ToString();
                    if(option == "Bac si")
                    {
                        Form form = new BacSi();
                        form.StartPosition = FormStartPosition.CenterScreen;
                        form.Show();
                        this.Hide();
                    }
                    else if(option == "Bo phan tiep tan va dieu phoi benh")
                    {
                        Form form = new NhanVienTiepNhan_DPBenh_ThemThongTinBN();
                        form.StartPosition = FormStartPosition.CenterScreen;
                        form.Show();
                        this.Hide();
                    }
                    else if(option == "Nhan vien ke toan")
                    {
                        Form form = new NhanVienKeToan();
                        form.StartPosition = FormStartPosition.CenterScreen;
                        form.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Loai nguoi dung khac");
                    }
                }
                else
                {
                    MessageBox.Show("Vui long chon loai nguoi dung");
                }
            }
            else
            {
                MessageBox.Show("Vui long dien day du thong tin");
            }
        }

    }
}
