using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Demo_Tiki.DAO;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace Demo_Tiki
{
    public partial class Form1 : Form
    {
        SqlConnection connection = new SqlConnection("Data Source=.\\SQLEXPRESS01;Initial Catalog=EcommerceWebsite;Integrated Security=True");
        string str = "";
        SqlDataAdapter adapter;
        SqlCommand command;
        int user;
       

        public Form1(int userID)
        {
            InitializeComponent();
            user = userID;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btn_search_Click(object sender, EventArgs e)
        {
            string name, brand, category;
            name = name_sp.Text;
            brand = brand_in.Text;
            category = category_in.Text;
            string query = string.Format("exec SearchProduct '{0}', '{1}', '{2}'", name, brand, category);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            product_data.DataSource = data;

        }

        private void btn_viewcart_Click(object sender, EventArgs e)
        {
         
            
            string userid = user.ToString();
            string query = "exec GetCart ";
            query += userid;
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            dataGridView2.DataSource = data;
        }

        private void btn_update_Click(object sender, EventArgs e)
        {
            string productid, variant, amount;
            productid = product_ID.Text;
            variant = variant_in.Text;
            amount = amount_in.Text;
            string query = string.Format("EXEC dbo.updateNPinCart {0}, {1}, '{2}', {3}", user, productid, variant,amount);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            string userid = user.ToString();
            string query1 = "exec GetCart ";
            query1 += userid;
            DataTable data1 = DataProvider.Instance.ExecuteQuery(query1);


            dataGridView2.DataSource = data1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string productid, variant;
            productid = product_ID.Text;
            variant = variant_in.Text;
            string query = string.Format("EXEC DeleteProductInCart {0}, {1}, '{2}'", user, productid, variant);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            string userid = user.ToString();
            string query1 = "exec GetCart ";
            query1 += userid;
            DataTable data1 = DataProvider.Instance.ExecuteQuery(query1);


            dataGridView2.DataSource = data1;
        }

        private void bestsell_Click(object sender, EventArgs e)
        {
            //EXEC ViewBestsellersInMonth '2019-12-01'
            string month = date.Value.Year.ToString() + "-" + date.Value.Month.ToString() + "-" + date.Value.Day.ToString();

            string query = string.Format("EXEC ViewBestsellersInMonth @month = '{0}'", month);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            product_data.DataSource = data;
        }
    }
}
