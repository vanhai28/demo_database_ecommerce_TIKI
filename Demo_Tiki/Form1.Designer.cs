namespace Demo_Tiki
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
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.product_data = new System.Windows.Forms.DataGridView();
            this.btn_search = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.category_in = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.brand_in = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.name_sp = new System.Windows.Forms.TextBox();
            this.Name = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button1 = new System.Windows.Forms.Button();
            this.btn_update = new System.Windows.Forms.Button();
            this.panel7 = new System.Windows.Forms.Panel();
            this.amount_in = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.variant_in = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.product_ID = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.btn_viewcart = new System.Windows.Forms.Button();
            this.bestsell = new System.Windows.Forms.Button();
            this.date = new System.Windows.Forms.DateTimePicker();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.product_data)).BeginInit();
            this.panel3.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(1, 3);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(912, 571);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.date);
            this.tabPage1.Controls.Add(this.bestsell);
            this.tabPage1.Controls.Add(this.product_data);
            this.tabPage1.Controls.Add(this.btn_search);
            this.tabPage1.Controls.Add(this.panel3);
            this.tabPage1.Controls.Add(this.panel1);
            this.tabPage1.Controls.Add(this.panel2);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(904, 542);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Sản phẩm";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // product_data
            // 
            this.product_data.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.product_data.Location = new System.Drawing.Point(55, 317);
            this.product_data.Name = "product_data";
            this.product_data.RowHeadersWidth = 51;
            this.product_data.RowTemplate.Height = 24;
            this.product_data.Size = new System.Drawing.Size(752, 185);
            this.product_data.TabIndex = 11;
            // 
            // btn_search
            // 
            this.btn_search.Location = new System.Drawing.Point(255, 194);
            this.btn_search.Name = "btn_search";
            this.btn_search.Size = new System.Drawing.Size(112, 50);
            this.btn_search.TabIndex = 10;
            this.btn_search.Text = "Tìm kiếm";
            this.btn_search.UseVisualStyleBackColor = true;
            this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.category_in);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Location = new System.Drawing.Point(18, 150);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(349, 38);
            this.panel3.TabIndex = 5;
            // 
            // category_in
            // 
            this.category_in.Location = new System.Drawing.Point(145, 9);
            this.category_in.Name = "category_in";
            this.category_in.Size = new System.Drawing.Size(201, 22);
            this.category_in.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Loại hàng: ";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.brand_in);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(18, 96);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(349, 38);
            this.panel1.TabIndex = 4;
            // 
            // brand_in
            // 
            this.brand_in.Location = new System.Drawing.Point(145, 9);
            this.brand_in.Name = "brand_in";
            this.brand_in.Size = new System.Drawing.Size(201, 22);
            this.brand_in.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Thương hiệu: ";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.name_sp);
            this.panel2.Controls.Add(this.Name);
            this.panel2.Location = new System.Drawing.Point(18, 42);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(349, 38);
            this.panel2.TabIndex = 3;
            // 
            // name_sp
            // 
            this.name_sp.Location = new System.Drawing.Point(145, 9);
            this.name_sp.Name = "name_sp";
            this.name_sp.Size = new System.Drawing.Size(201, 22);
            this.name_sp.TabIndex = 1;
            // 
            // Name
            // 
            this.Name.AutoSize = true;
            this.Name.Location = new System.Drawing.Point(3, 9);
            this.Name.Name = "Name";
            this.Name.Size = new System.Drawing.Size(107, 17);
            this.Name.TabIndex = 0;
            this.Name.Text = "Tên sản phẩm: ";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.button1);
            this.tabPage2.Controls.Add(this.btn_update);
            this.tabPage2.Controls.Add(this.panel7);
            this.tabPage2.Controls.Add(this.panel6);
            this.tabPage2.Controls.Add(this.panel5);
            this.tabPage2.Controls.Add(this.dataGridView2);
            this.tabPage2.Controls.Add(this.btn_viewcart);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(904, 542);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Giỏ hàng";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(430, 206);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(112, 32);
            this.button1.TabIndex = 17;
            this.button1.Text = "Xóa";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btn_update
            // 
            this.btn_update.Location = new System.Drawing.Point(430, 151);
            this.btn_update.Name = "btn_update";
            this.btn_update.Size = new System.Drawing.Size(112, 38);
            this.btn_update.TabIndex = 16;
            this.btn_update.Text = "Cập nhật";
            this.btn_update.UseVisualStyleBackColor = true;
            this.btn_update.Click += new System.EventHandler(this.btn_update_Click);
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.amount_in);
            this.panel7.Controls.Add(this.label6);
            this.panel7.Location = new System.Drawing.Point(34, 224);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(349, 38);
            this.panel7.TabIndex = 15;
            // 
            // amount_in
            // 
            this.amount_in.Location = new System.Drawing.Point(145, 9);
            this.amount_in.Name = "amount_in";
            this.amount_in.Size = new System.Drawing.Size(201, 22);
            this.amount_in.TabIndex = 1;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(3, 9);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(72, 17);
            this.label6.TabIndex = 0;
            this.label6.Text = "Số lượng: ";
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.variant_in);
            this.panel6.Controls.Add(this.label5);
            this.panel6.Location = new System.Drawing.Point(34, 180);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(349, 38);
            this.panel6.TabIndex = 14;
            // 
            // variant_in
            // 
            this.variant_in.Location = new System.Drawing.Point(145, 9);
            this.variant_in.Name = "variant_in";
            this.variant_in.Size = new System.Drawing.Size(201, 22);
            this.variant_in.TabIndex = 1;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(3, 9);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(61, 17);
            this.label5.TabIndex = 0;
            this.label5.Text = "Variant: ";
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.product_ID);
            this.panel5.Controls.Add(this.label4);
            this.panel5.Location = new System.Drawing.Point(34, 126);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(349, 38);
            this.panel5.TabIndex = 13;
            this.panel5.Paint += new System.Windows.Forms.PaintEventHandler(this.panel5_Paint);
            // 
            // product_ID
            // 
            this.product_ID.Location = new System.Drawing.Point(145, 9);
            this.product_ID.Name = "product_ID";
            this.product_ID.Size = new System.Drawing.Size(201, 22);
            this.product_ID.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(3, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(101, 17);
            this.label4.TabIndex = 0;
            this.label4.Text = "Mã sản phẩm: ";
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(109, 268);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowHeadersWidth = 51;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.Size = new System.Drawing.Size(707, 268);
            this.dataGridView2.TabIndex = 12;
            // 
            // btn_viewcart
            // 
            this.btn_viewcart.Location = new System.Drawing.Point(430, 33);
            this.btn_viewcart.Name = "btn_viewcart";
            this.btn_viewcart.Size = new System.Drawing.Size(112, 38);
            this.btn_viewcart.TabIndex = 11;
            this.btn_viewcart.Text = "Xem";
            this.btn_viewcart.UseVisualStyleBackColor = true;
            this.btn_viewcart.Click += new System.EventHandler(this.btn_viewcart_Click);
            // 
            // bestsell
            // 
            this.bestsell.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.bestsell.Location = new System.Drawing.Point(478, 194);
            this.bestsell.Name = "bestsell";
            this.bestsell.Size = new System.Drawing.Size(138, 50);
            this.bestsell.TabIndex = 12;
            this.bestsell.Text = "Sản phẩm bán chạy nhất";
            this.bestsell.UseVisualStyleBackColor = false;
            this.bestsell.Click += new System.EventHandler(this.bestsell_Click);
            // 
            // date
            // 
            this.date.Location = new System.Drawing.Point(416, 46);
            this.date.Name = "date";
            this.date.Size = new System.Drawing.Size(200, 22);
            this.date.TabIndex = 13;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(925, 586);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.product_data)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.panel7.ResumeLayout(false);
            this.panel7.PerformLayout();
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TextBox brand_in;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox name_sp;
        private System.Windows.Forms.Label Name;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.DataGridView product_data;
        private System.Windows.Forms.Button btn_search;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox category_in;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.TextBox product_ID;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Button btn_viewcart;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.TextBox amount_in;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.TextBox variant_in;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btn_update;
        private System.Windows.Forms.Button bestsell;
        private System.Windows.Forms.DateTimePicker date;
    }
}

