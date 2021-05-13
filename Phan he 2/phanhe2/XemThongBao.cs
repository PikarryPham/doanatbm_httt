using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace phanhe2
{
    public partial class XemThongBao : Form
    {
        public XemThongBao()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(ThongTinNV._loainv == "Bac si")
            {
                Form form = new BacSi();
                form.StartPosition = FormStartPosition.CenterScreen;
                form.Show();
                this.Close();
            }
            else if(ThongTinNV._loainv == "Bo phan tiep tan va dieu phoi benh")
            {
                Form form = new NVTN_TrangQuanLy();
                form.StartPosition = FormStartPosition.CenterScreen;
                form.Show();
                this.Close();
            }
            else if(ThongTinNV._loainv == "Nhan vien ke toan")
            {
                Form form = new NhanVienKeToan();
                form.StartPosition = FormStartPosition.CenterScreen;
                form.Show();
                this.Close();
            }
            else
            {
                Form form = new Form1();
                form.StartPosition = FormStartPosition.CenterScreen;
                form.Show();
                this.Close();
            }
            
        }
    }
}
