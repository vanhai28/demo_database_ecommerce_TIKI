using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Demo_Tiki
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void blogin_Click(object sender, EventArgs e)
        {
            if (isSuccessLogin())                   //kiem tra login có thành công.
            {
                //if(getType) == get type user de mo form.
                Form1 cus = new Form1();
                this.Hide();
                cus.ShowDialog();
                this.Show();

               /* Form2 cus = new Form1();
                this.Hide();
                cus.ShowDialog();
                this.Show();*/
            }
            else
            {
                MessageBox.Show("Wrong username or password");
            }
        }
        bool isSuccessLogin()
        {
            return true;            //Khi lien ket voi database thì vào DAO để tạo hàm login để check.
        }

        private void bExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Login_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có thực sự muốn thoát chương trình? ", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }
    }
}
