
namespace phanhe2
{
    partial class Form1
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
            this.label1 = new System.Windows.Forms.Label();
            this.username = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.usernametxt_login = new System.Windows.Forms.TextBox();
            this.pswtxt_login = new System.Windows.Forms.TextBox();
            this.comboBox_login = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dangnhapbtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(353, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(221, 46);
            this.label1.TabIndex = 0;
            this.label1.Text = "Dang Nhap";
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(707, 19);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 1;
            this.username.Text = "username";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(59, 230);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(98, 25);
            this.label2.TabIndex = 2;
            this.label2.Text = "Password";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(55, 152);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(102, 25);
            this.label3.TabIndex = 2;
            this.label3.Text = "Username";
            // 
            // usernametxt_login
            // 
            this.usernametxt_login.Location = new System.Drawing.Point(238, 156);
            this.usernametxt_login.Name = "usernametxt_login";
            this.usernametxt_login.Size = new System.Drawing.Size(568, 22);
            this.usernametxt_login.TabIndex = 3;
            // 
            // pswtxt_login
            // 
            this.pswtxt_login.Location = new System.Drawing.Point(238, 234);
            this.pswtxt_login.Name = "pswtxt_login";
            this.pswtxt_login.Size = new System.Drawing.Size(568, 22);
            this.pswtxt_login.TabIndex = 4;
            // 
            // comboBox_login
            // 
            this.comboBox_login.AllowDrop = true;
            this.comboBox_login.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.comboBox_login.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.HistoryList;
            this.comboBox_login.FormattingEnabled = true;
            this.comboBox_login.Items.AddRange(new object[] {
            "Bac si",
            "Bo phan tiep tan va dieu phoi benh",
            "Nhan vien ban thuoc",
            "Nhan vien ke toan",
            "Quan ly chuyen mon",
            "Quan ly tai nguyen nhan su",
            "Quan ly tai vu"});
            this.comboBox_login.Location = new System.Drawing.Point(238, 318);
            this.comboBox_login.Name = "comboBox_login";
            this.comboBox_login.Size = new System.Drawing.Size(568, 24);
            this.comboBox_login.Sorted = true;
            this.comboBox_login.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(59, 314);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(151, 25);
            this.label4.TabIndex = 6;
            this.label4.Text = "Loai nguoi dung";
            // 
            // dangnhapbtn
            // 
            this.dangnhapbtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.dangnhapbtn.Location = new System.Drawing.Point(361, 400);
            this.dangnhapbtn.Name = "dangnhapbtn";
            this.dangnhapbtn.Size = new System.Drawing.Size(213, 52);
            this.dangnhapbtn.TabIndex = 7;
            this.dangnhapbtn.Text = "Dang nhap";
            this.dangnhapbtn.UseVisualStyleBackColor = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(878, 498);
            this.Controls.Add(this.dangnhapbtn);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.comboBox_login);
            this.Controls.Add(this.pswtxt_login);
            this.Controls.Add(this.usernametxt_login);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.username);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox usernametxt_login;
        private System.Windows.Forms.TextBox pswtxt_login;
        private System.Windows.Forms.ComboBox comboBox_login;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button dangnhapbtn;
    }
}

