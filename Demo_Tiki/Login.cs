using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Demo_Tiki
{
    public partial class Login : Form
    {
        //ket noi den database
        SqlConnection connection = new SqlConnection("Data Source=ZDEP;Initial Catalog=EcommerceWebsite;Integrated Security=True");
        string str = "";
        SqlDataAdapter adapter;
        SqlCommand command;
        int userId;
        public Login()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void blogin_Click(object sender, EventArgs e)
        {
            if (isSuccessLogin(txtUserNam.Text, txtUserPassword.Text))                   //kiem tra login có thành công.
            {
                str = "SELECT typeUser FROM dbo.[User] WHERE userID = @userID";
                command = new SqlCommand(str, connection);
                command.Parameters.Add("@userID", SqlDbType.Int).Value = userId;
                connection.Open();
                string result = command.ExecuteScalar().ToString();
                connection.Close();

                if (result == "C")
                {
                    Form1 cus = new Form1();
                    this.Hide();
                    cus.ShowDialog();
                    this.Show();
                }
                else if (result == "S")
                {
                    Seller cus = new Seller();
                    this.Hide();
                    cus.ShowDialog();
                    this.Show();
                }
                else
                {
                    Admin cus = new Admin();
                    this.Hide();
                    cus.ShowDialog();
                    this.Show();
                }
            }
            else
            {
                MessageBox.Show("Wrong username or password");
            }
        }
        bool isSuccessLogin(string username, string pass)
        {
            command = new SqlCommand("uspLogin", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            command.Parameters.Add("@password", SqlDbType.VarChar).Value = pass;
            command.Parameters.Add("@userID", SqlDbType.Int).Direction = ParameterDirection.Output;
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            userId = (int)command.Parameters["@userID"].Value;
            if (userId == -1) return false;
            return true;            
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
