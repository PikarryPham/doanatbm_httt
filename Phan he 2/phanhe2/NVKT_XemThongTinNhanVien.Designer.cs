
namespace phanhe2
{
    partial class NVKT_XemThongTinNhanVien
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.username = new System.Windows.Forms.Label();
            this.btn_suathongtinkhamcuabn = new System.Windows.Forms.Button();
            this.suatrieuchung = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.button1.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.button1.Location = new System.Drawing.Point(12, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(119, 47);
            this.button1.TabIndex = 35;
            this.button1.Text = "Quay ve";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(233, 84);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(367, 38);
            this.label1.TabIndex = 36;
            this.label1.Text = "Xem thong tin nhan vien";
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(667, 20);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 37;
            this.username.Text = "username";
            // 
            // btn_suathongtinkhamcuabn
            // 
            this.btn_suathongtinkhamcuabn.Location = new System.Drawing.Point(274, 208);
            this.btn_suathongtinkhamcuabn.Name = "btn_suathongtinkhamcuabn";
            this.btn_suathongtinkhamcuabn.Size = new System.Drawing.Size(276, 50);
            this.btn_suathongtinkhamcuabn.TabIndex = 38;
            this.btn_suathongtinkhamcuabn.Text = "Xem danh sach nhan vien cua he thong";
            this.btn_suathongtinkhamcuabn.UseVisualStyleBackColor = true;
            // 
            // suatrieuchung
            // 
            this.suatrieuchung.Location = new System.Drawing.Point(145, 163);
            this.suatrieuchung.Name = "suatrieuchung";
            this.suatrieuchung.Size = new System.Drawing.Size(621, 22);
            this.suatrieuchung.TabIndex = 40;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 166);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(93, 17);
            this.label3.TabIndex = 39;
            this.label3.Text = "Ma nhan vien";
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(27, 284);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(739, 276);
            this.dataGridView1.TabIndex = 41;
            // 
            // NVKT_XemThongTinNhanVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 572);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.suatrieuchung);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btn_suathongtinkhamcuabn);
            this.Controls.Add(this.username);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.Name = "NVKT_XemThongTinNhanVien";
            this.Text = "NVKT_XemThongTinNhanVien";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Button btn_suathongtinkhamcuabn;
        private System.Windows.Forms.TextBox suatrieuchung;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}