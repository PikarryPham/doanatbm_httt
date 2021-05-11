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
    public partial class BacSi : Form
    {
        public BacSi()
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

        private void themthongtindieutribenh_Click(object sender, EventArgs e)
        {
            Form form = new BacSi_ThemThongTinDieuTri();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void xemthongtindtribenh_Click(object sender, EventArgs e)
        {
            Form form = new BacSi_XemThongTinDieuTri();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        private void suathongtindieutribenh_Click(object sender, EventArgs e)
        {
            Form form = new BacSi__SuaThongTinDieuTri();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }
    }
}
