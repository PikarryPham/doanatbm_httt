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
    public partial class NVTN_TrangQuanLy : Form
    {
        public NVTN_TrangQuanLy()
        {
            InitializeComponent();
            username.Text = ThongTinNV._username;
        }

        private void dangxuatbtn_Click(object sender, EventArgs e)
        {
            Form form = new Form1();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void qlthongtinbn_Click(object sender, EventArgs e)
        {
            Form form = new NhanVienTiepNhan_DPBenh_ThemThongTinBN();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void xemtb_Click(object sender, EventArgs e)
        {
            Form form = new XemThongBao();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }
    }
}
