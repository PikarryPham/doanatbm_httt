﻿
namespace phanhe2
{
    partial class BacSi_XemThongTinDieuTri
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
            this.xemthongtindieutribenh = new System.Windows.Forms.TabControl();
            this.xemthongtinkhamcuabenhnhan = new System.Windows.Forms.TabPage();
            this.dsthongtinkham = new System.Windows.Forms.DataGridView();
            this.btn_xemthongtinkhamcuabn = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.xemthongtinsddvcuabn = new System.Windows.Forms.TabPage();
            this.dssudungdichvu = new System.Windows.Forms.DataGridView();
            this.xemthongtinsddv_btn = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.quayvebtn = new System.Windows.Forms.Button();
            this.mabn_xemkham = new System.Windows.Forms.TextBox();
            this.mabenhnhan_sddv = new System.Windows.Forms.TextBox();
            this.xemthongtindieutribenh.SuspendLayout();
            this.xemthongtinkhamcuabenhnhan.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dsthongtinkham)).BeginInit();
            this.xemthongtinsddvcuabn.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dssudungdichvu)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label1.Location = new System.Drawing.Point(197, 59);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(404, 38);
            this.label1.TabIndex = 7;
            this.label1.Text = "Xem thong tin dieu tri benh";
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(685, 9);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(99, 25);
            this.username.TabIndex = 6;
            this.username.Text = "username";
            // 
            // xemthongtindieutribenh
            // 
            this.xemthongtindieutribenh.Controls.Add(this.xemthongtinkhamcuabenhnhan);
            this.xemthongtindieutribenh.Controls.Add(this.xemthongtinsddvcuabn);
            this.xemthongtindieutribenh.Location = new System.Drawing.Point(12, 119);
            this.xemthongtindieutribenh.Name = "xemthongtindieutribenh";
            this.xemthongtindieutribenh.SelectedIndex = 0;
            this.xemthongtindieutribenh.Size = new System.Drawing.Size(776, 528);
            this.xemthongtindieutribenh.TabIndex = 8;
            // 
            // xemthongtinkhamcuabenhnhan
            // 
            this.xemthongtinkhamcuabenhnhan.Controls.Add(this.mabn_xemkham);
            this.xemthongtinkhamcuabenhnhan.Controls.Add(this.dsthongtinkham);
            this.xemthongtinkhamcuabenhnhan.Controls.Add(this.btn_xemthongtinkhamcuabn);
            this.xemthongtinkhamcuabenhnhan.Controls.Add(this.label3);
            this.xemthongtinkhamcuabenhnhan.Location = new System.Drawing.Point(4, 25);
            this.xemthongtinkhamcuabenhnhan.Name = "xemthongtinkhamcuabenhnhan";
            this.xemthongtinkhamcuabenhnhan.Padding = new System.Windows.Forms.Padding(3);
            this.xemthongtinkhamcuabenhnhan.Size = new System.Drawing.Size(768, 499);
            this.xemthongtinkhamcuabenhnhan.TabIndex = 0;
            this.xemthongtinkhamcuabenhnhan.Text = "Xem thong tin kham cua benh nhan";
            this.xemthongtinkhamcuabenhnhan.UseVisualStyleBackColor = true;
            // 
            // dsthongtinkham
            // 
            this.dsthongtinkham.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dsthongtinkham.Location = new System.Drawing.Point(32, 154);
            this.dsthongtinkham.Name = "dsthongtinkham";
            this.dsthongtinkham.RowHeadersWidth = 51;
            this.dsthongtinkham.RowTemplate.Height = 24;
            this.dsthongtinkham.Size = new System.Drawing.Size(686, 324);
            this.dsthongtinkham.TabIndex = 35;
            // 
            // btn_xemthongtinkhamcuabn
            // 
            this.btn_xemthongtinkhamcuabn.Location = new System.Drawing.Point(301, 84);
            this.btn_xemthongtinkhamcuabn.Name = "btn_xemthongtinkhamcuabn";
            this.btn_xemthongtinkhamcuabn.Size = new System.Drawing.Size(167, 50);
            this.btn_xemthongtinkhamcuabn.TabIndex = 34;
            this.btn_xemthongtinkhamcuabn.Text = "Xem thong tin kham";
            this.btn_xemthongtinkhamcuabn.UseVisualStyleBackColor = true;
            this.btn_xemthongtinkhamcuabn.Click += new System.EventHandler(this.btn_xemthongtinkhamcuabn_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(29, 35);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Ma benh nhan";
            // 
            // xemthongtinsddvcuabn
            // 
            this.xemthongtinsddvcuabn.Controls.Add(this.mabenhnhan_sddv);
            this.xemthongtinsddvcuabn.Controls.Add(this.dssudungdichvu);
            this.xemthongtinsddvcuabn.Controls.Add(this.xemthongtinsddv_btn);
            this.xemthongtinsddvcuabn.Controls.Add(this.label5);
            this.xemthongtinsddvcuabn.Location = new System.Drawing.Point(4, 25);
            this.xemthongtinsddvcuabn.Name = "xemthongtinsddvcuabn";
            this.xemthongtinsddvcuabn.Padding = new System.Windows.Forms.Padding(3);
            this.xemthongtinsddvcuabn.Size = new System.Drawing.Size(768, 499);
            this.xemthongtinsddvcuabn.TabIndex = 1;
            this.xemthongtinsddvcuabn.Text = "Xem thong tin su dung dich vu cua benh nhan";
            this.xemthongtinsddvcuabn.UseVisualStyleBackColor = true;
            // 
            // dssudungdichvu
            // 
            this.dssudungdichvu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dssudungdichvu.Location = new System.Drawing.Point(34, 149);
            this.dssudungdichvu.Name = "dssudungdichvu";
            this.dssudungdichvu.RowHeadersWidth = 51;
            this.dssudungdichvu.RowTemplate.Height = 24;
            this.dssudungdichvu.Size = new System.Drawing.Size(686, 325);
            this.dssudungdichvu.TabIndex = 36;
            // 
            // xemthongtinsddv_btn
            // 
            this.xemthongtinsddv_btn.Location = new System.Drawing.Point(272, 81);
            this.xemthongtinsddv_btn.Name = "xemthongtinsddv_btn";
            this.xemthongtinsddv_btn.Size = new System.Drawing.Size(226, 50);
            this.xemthongtinsddv_btn.TabIndex = 35;
            this.xemthongtinsddv_btn.Text = "Xem thong tin su dung dich vu";
            this.xemthongtinsddv_btn.UseVisualStyleBackColor = true;
            this.xemthongtinsddv_btn.Click += new System.EventHandler(this.xemthongtinsddv_btn_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(31, 30);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(99, 17);
            this.label5.TabIndex = 6;
            this.label5.Text = "Ma benh nhan";
            // 
            // quayvebtn
            // 
            this.quayvebtn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.quayvebtn.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.quayvebtn.Location = new System.Drawing.Point(12, 12);
            this.quayvebtn.Name = "quayvebtn";
            this.quayvebtn.Size = new System.Drawing.Size(119, 47);
            this.quayvebtn.TabIndex = 33;
            this.quayvebtn.Text = "Quay ve";
            this.quayvebtn.UseVisualStyleBackColor = false;
            this.quayvebtn.Click += new System.EventHandler(this.quayvebtn_Click);
            // 
            // mabn_xemkham
            // 
            this.mabn_xemkham.Location = new System.Drawing.Point(150, 35);
            this.mabn_xemkham.Name = "mabn_xemkham";
            this.mabn_xemkham.Size = new System.Drawing.Size(568, 22);
            this.mabn_xemkham.TabIndex = 66;
            // 
            // mabenhnhan_sddv
            // 
            this.mabenhnhan_sddv.Location = new System.Drawing.Point(152, 27);
            this.mabenhnhan_sddv.Name = "mabenhnhan_sddv";
            this.mabenhnhan_sddv.Size = new System.Drawing.Size(568, 22);
            this.mabenhnhan_sddv.TabIndex = 67;
            // 
            // BacSi_XemThongTinDieuTri
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(800, 695);
            this.Controls.Add(this.quayvebtn);
            this.Controls.Add(this.xemthongtindieutribenh);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.username);
            this.Name = "BacSi_XemThongTinDieuTri";
            this.Text = "BacSi_XemThongTinDieuTri";
            this.xemthongtindieutribenh.ResumeLayout(false);
            this.xemthongtinkhamcuabenhnhan.ResumeLayout(false);
            this.xemthongtinkhamcuabenhnhan.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dsthongtinkham)).EndInit();
            this.xemthongtinsddvcuabn.ResumeLayout(false);
            this.xemthongtinsddvcuabn.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dssudungdichvu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.TabControl xemthongtindieutribenh;
        private System.Windows.Forms.TabPage xemthongtinkhamcuabenhnhan;
        private System.Windows.Forms.TabPage xemthongtinsddvcuabn;
        private System.Windows.Forms.Button quayvebtn;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btn_xemthongtinkhamcuabn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button xemthongtinsddv_btn;
        private System.Windows.Forms.DataGridView dsthongtinkham;
        private System.Windows.Forms.DataGridView dssudungdichvu;
        private System.Windows.Forms.TextBox mabn_xemkham;
        private System.Windows.Forms.TextBox mabenhnhan_sddv;
    }
}