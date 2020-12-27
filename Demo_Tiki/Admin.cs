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
    public partial class Admin : Form
    {
        //ket noi den database
        SqlConnection connection = new SqlConnection("Data Source=ZDEP;Initial Catalog=EcommerceWebsite;Integrated Security=True");
        string str = "";
        SqlDataAdapter adapter;
        SqlCommand command;
        public Admin()
        {
            InitializeComponent();
        }

        private void Admin_Load(object sender, EventArgs e)
        {
            connection.Open();
            DataTable data = new DataTable();
            command = new SqlCommand("ViewProceedsInMonth", connection);
            command.CommandType = CommandType.StoredProcedure;
            adapter = new SqlDataAdapter(command);
            adapter.Fill(data);
            dataGridView1.DataSource = data;
            connection.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            connection.Open();
            DataTable data = new DataTable();
            command = new SqlCommand("ViewBestsellersInMonth", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@month", SqlDbType.DateTime).Value = Convert.ToDateTime(dateTimePicker1.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(data);
            dataGridView2.DataSource = data;
            connection.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            command = new SqlCommand("UpdateOrderStatus", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@order_ID", SqlDbType.VarChar).Value = Convert.ToString(textBox1.Text);
            command.Parameters.Add("@order_Status", SqlDbType.VarChar).Value = Convert.ToString(comboBox1.Text);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            connection.Open();
            command = new SqlCommand("GetOrderStatus", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@order_ID", SqlDbType.VarChar).Value = Convert.ToString(textBox1.Text);
            adapter = new SqlDataAdapter(command);
            adapter.Fill(data);
            dataGridView3.DataSource = data;
            connection.Close();
        }
    }
}
