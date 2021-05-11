
namespace phanhe2
{
    partial class NhanVienKeToan
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
            this.dangxuatbtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.username = new System.Windows.Forms.Label();
            this.tinhluongnvbtn = new System.Windows.Forms.Button();
            this.xemthongtinnvbtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // dangxuatbtn
            // 
            this.dangxuatbtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.dangxuatbtn.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dangxuatbtn.Location = new System.Drawing.Point(16, 13);
            this.dangxuatbtn.Name = "dangxuatbtn";
            this.dangxuatbtn.Size = new System.Drawing.Size(110, 35);
            this.dangxuatbtn.TabIndex = 13;
            this.dangxuatbtn.Text = "Dang xuat";
            this.dangxuatbtn.UseVisualStyleBackColor = false;
            this.dangxuatbtn.Click += new System.EventHandler(this.dangxuatbtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(169, 75);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(493, 38);
            this.label1.TabIndex = 9;
            this.label1.Text = "Trang ca nhan nhan vien ke toan";
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(683, 13);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 8;
            this.username.Text = "username";
            // 
            // tinhluongnvbtn
            // 
            this.tinhluongnvbtn.Location = new System.Drawing.Point(287, 244);
            this.tinhluongnvbtn.Name = "tinhluongnvbtn";
            this.tinhluongnvbtn.Size = new System.Drawing.Size(221, 58);
            this.tinhluongnvbtn.TabIndex = 10;
            this.tinhluongnvbtn.Text = "Tinh luong";
            this.tinhluongnvbtn.UseVisualStyleBackColor = true;
            // 
            // xemthongtinnvbtn
            // 
            this.xemthongtinnvbtn.Location = new System.Drawing.Point(287, 156);
            this.xemthongtinnvbtn.Name = "xemthongtinnvbtn";
            this.xemthongtinnvbtn.Size = new System.Drawing.Size(221, 58);
            this.xemthongtinnvbtn.TabIndex = 11;
            this.xemthongtinnvbtn.Text = "Xem thong tin nhan vien";
            this.xemthongtinnvbtn.UseVisualStyleBackColor = true;
            this.xemthongtinnvbtn.Click += new System.EventHandler(this.xemthongtinnvbtn_Click);
            // 
            // NhanVienKeToan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 359);
            this.Controls.Add(this.dangxuatbtn);
            this.Controls.Add(this.xemthongtinnvbtn);
            this.Controls.Add(this.tinhluongnvbtn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.username);
            this.Name = "NhanVienKeToan";
            this.Text = "NhanVienKeToan";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button dangxuatbtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Button tinhluongnvbtn;
        private System.Windows.Forms.Button xemthongtinnvbtn;
    }
}