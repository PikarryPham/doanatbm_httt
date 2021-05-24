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
    public partial class NhanVienKeToan : Form
    {
        public NhanVienKeToan()
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

        private void xemthongtinnvbtn_Click(object sender, EventArgs e)
        {
            Form form = new NVKT_XemThongTinNhanVien();
            form.StartPosition = FormStartPosition.CenterScreen;
            form.Show();
            this.Close();
        }

        
    }
}
