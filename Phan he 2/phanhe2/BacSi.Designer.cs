
namespace phanhe2
{
    partial class BacSi
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
            this.username = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.xemthongtindtribenh = new System.Windows.Forms.Button();
            this.themthongtindieutribenh = new System.Windows.Forms.Button();
            this.suathongtindieutribenh = new System.Windows.Forms.Button();
            this.dangxuatbtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(679, 9);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 2;
            this.username.Text = "username";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(234, 71);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(322, 38);
            this.label1.TabIndex = 3;
            this.label1.Text = "Trang ca nhan bac si";
            // 
            // xemthongtindtribenh
            // 
            this.xemthongtindtribenh.Location = new System.Drawing.Point(283, 238);
            this.xemthongtindtribenh.Name = "xemthongtindtribenh";
            this.xemthongtindtribenh.Size = new System.Drawing.Size(221, 58);
            this.xemthongtindtribenh.TabIndex = 4;
            this.xemthongtindtribenh.Text = "Xem thong tin dieu tri benh";
            this.xemthongtindtribenh.UseVisualStyleBackColor = true;
            this.xemthongtindtribenh.Click += new System.EventHandler(this.xemthongtindtribenh_Click);
            // 
            // themthongtindieutribenh
            // 
            this.themthongtindieutribenh.Location = new System.Drawing.Point(283, 150);
            this.themthongtindieutribenh.Name = "themthongtindieutribenh";
            this.themthongtindieutribenh.Size = new System.Drawing.Size(221, 58);
            this.themthongtindieutribenh.TabIndex = 5;
            this.themthongtindieutribenh.Text = "Them thong tin dieu tri benh";
            this.themthongtindieutribenh.UseVisualStyleBackColor = true;
            this.themthongtindieutribenh.Click += new System.EventHandler(this.themthongtindieutribenh_Click);
            // 
            // suathongtindieutribenh
            // 
            this.suathongtindieutribenh.Location = new System.Drawing.Point(283, 321);
            this.suathongtindieutribenh.Name = "suathongtindieutribenh";
            this.suathongtindieutribenh.Size = new System.Drawing.Size(221, 58);
            this.suathongtindieutribenh.TabIndex = 6;
            this.suathongtindieutribenh.Text = "Sua thong tin dieu tri benh";
            this.suathongtindieutribenh.UseVisualStyleBackColor = true;
            this.suathongtindieutribenh.Click += new System.EventHandler(this.suathongtindieutribenh_Click);
            // 
            // dangxuatbtn
            // 
            this.dangxuatbtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.dangxuatbtn.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dangxuatbtn.Location = new System.Drawing.Point(12, 9);
            this.dangxuatbtn.Name = "dangxuatbtn";
            this.dangxuatbtn.Size = new System.Drawing.Size(110, 35);
            this.dangxuatbtn.TabIndex = 7;
            this.dangxuatbtn.Text = "Dang xuat";
            this.dangxuatbtn.UseVisualStyleBackColor = false;
            this.dangxuatbtn.Click += new System.EventHandler(this.dangxuatbtn_Click);
            // 
            // BacSi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(821, 409);
            this.Controls.Add(this.dangxuatbtn);
            this.Controls.Add(this.suathongtindieutribenh);
            this.Controls.Add(this.themthongtindieutribenh);
            this.Controls.Add(this.xemthongtindtribenh);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.username);
            this.Name = "BacSi";
            this.Text = "BacSi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button xemthongtindtribenh;
        private System.Windows.Forms.Button themthongtindieutribenh;
        private System.Windows.Forms.Button suathongtindieutribenh;
        private System.Windows.Forms.Button dangxuatbtn;
    }
}