
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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.usernametxt_login = new System.Windows.Forms.TextBox();
            this.pswtxt_login = new System.Windows.Forms.TextBox();
            this.comboBox_login = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dangnhapbtn = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(233, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(503, 46);
            this.label1.TabIndex = 0;
            this.label1.Text = "He thong quan ly benh vien";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(51, 253);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(98, 25);
            this.label2.TabIndex = 2;
            this.label2.Text = "Password";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(47, 186);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(102, 25);
            this.label3.TabIndex = 2;
            this.label3.Text = "Username";
            // 
            // usernametxt_login
            // 
            this.usernametxt_login.Location = new System.Drawing.Point(230, 190);
            this.usernametxt_login.Name = "usernametxt_login";
            this.usernametxt_login.Size = new System.Drawing.Size(568, 22);
            this.usernametxt_login.TabIndex = 3;
            // 
            // pswtxt_login
            // 
            this.pswtxt_login.Location = new System.Drawing.Point(230, 253);
            this.pswtxt_login.Name = "pswtxt_login";
            this.pswtxt_login.PasswordChar = '*';
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
            "bac si",
            "ban thuoc",
            "ke toan",
            "nhan vien bo phan tiep tan",
            "quan ly chuyen mon",
            "quan ly tai nguyen nhan su",
            "quan ly tai vu"});
            this.comboBox_login.Location = new System.Drawing.Point(230, 315);
            this.comboBox_login.Name = "comboBox_login";
            this.comboBox_login.Size = new System.Drawing.Size(568, 24);
            this.comboBox_login.Sorted = true;
            this.comboBox_login.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(51, 315);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(151, 25);
            this.label4.TabIndex = 6;
            this.label4.Text = "Loai nguoi dung";
            // 
            // dangnhapbtn
            // 
            this.dangnhapbtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.dangnhapbtn.Location = new System.Drawing.Point(353, 401);
            this.dangnhapbtn.Name = "dangnhapbtn";
            this.dangnhapbtn.Size = new System.Drawing.Size(213, 52);
            this.dangnhapbtn.TabIndex = 7;
            this.dangnhapbtn.Text = "Dang nhap";
            this.dangnhapbtn.UseVisualStyleBackColor = false;
            this.dangnhapbtn.Click += new System.EventHandler(this.dangnhapbtn_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.label5.Location = new System.Drawing.Point(405, 107);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(161, 36);
            this.label5.TabIndex = 8;
            this.label5.Text = "Dang nhap";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(878, 494);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.dangnhapbtn);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.comboBox_login);
            this.Controls.Add(this.pswtxt_login);
            this.Controls.Add(this.usernametxt_login);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "He thong quan ly benh vien";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox usernametxt_login;
        private System.Windows.Forms.TextBox pswtxt_login;
        private System.Windows.Forms.ComboBox comboBox_login;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button dangnhapbtn;
        private System.Windows.Forms.Label label5;
    }
}

