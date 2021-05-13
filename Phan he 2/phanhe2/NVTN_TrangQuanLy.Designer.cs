
namespace phanhe2
{
    partial class NVTN_TrangQuanLy
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
            this.xemtb = new System.Windows.Forms.Button();
            this.qlthongtinbn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // dangxuatbtn
            // 
            this.dangxuatbtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.dangxuatbtn.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dangxuatbtn.Location = new System.Drawing.Point(16, 18);
            this.dangxuatbtn.Name = "dangxuatbtn";
            this.dangxuatbtn.Size = new System.Drawing.Size(110, 35);
            this.dangxuatbtn.TabIndex = 16;
            this.dangxuatbtn.Text = "Dang xuat";
            this.dangxuatbtn.UseVisualStyleBackColor = false;
            this.dangxuatbtn.Click += new System.EventHandler(this.dangxuatbtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(158, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(519, 38);
            this.label1.TabIndex = 15;
            this.label1.Text = "Trang ca nhan nhan vien tiep nhan";
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(683, 18);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 14;
            this.username.Text = "username";
            // 
            // xemtb
            // 
            this.xemtb.Location = new System.Drawing.Point(287, 271);
            this.xemtb.Name = "xemtb";
            this.xemtb.Size = new System.Drawing.Size(221, 58);
            this.xemtb.TabIndex = 18;
            this.xemtb.Text = "Xem thong bao";
            this.xemtb.UseVisualStyleBackColor = true;
            this.xemtb.Click += new System.EventHandler(this.xemtb_Click);
            // 
            // qlthongtinbn
            // 
            this.qlthongtinbn.Location = new System.Drawing.Point(287, 155);
            this.qlthongtinbn.Name = "qlthongtinbn";
            this.qlthongtinbn.Size = new System.Drawing.Size(221, 58);
            this.qlthongtinbn.TabIndex = 17;
            this.qlthongtinbn.Text = "Quan ly thong tin benh nhan";
            this.qlthongtinbn.UseVisualStyleBackColor = true;
            this.qlthongtinbn.Click += new System.EventHandler(this.qlthongtinbn_Click);
            // 
            // NVTN_TrangQuanLy
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(800, 368);
            this.Controls.Add(this.xemtb);
            this.Controls.Add(this.qlthongtinbn);
            this.Controls.Add(this.dangxuatbtn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.username);
            this.Name = "NVTN_TrangQuanLy";
            this.Text = "NVTN_TrangQuanLy";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button dangxuatbtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Button xemtb;
        private System.Windows.Forms.Button qlthongtinbn;
    }
}