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
    public partial class BacSi__SuaThongTinDieuTri : Form
    {
        Form1 fm = new Form1();
        public BacSi__SuaThongTinDieuTri()
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

        private void button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}
