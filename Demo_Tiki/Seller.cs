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
using Demo_Tiki.DAO;

namespace Demo_Tiki
{

    public partial class Seller : Form
    {
        //ket noi den database
        SqlConnection connection = new SqlConnection("Data Source=ZDEP;Initial Catalog=EcommerceWebsite;Integrated Security=True");
        string str = "";
        SqlDataAdapter adapter;
        SqlCommand command;
        int user;
        public Seller(int userId)
        {
            user = userId;
            InitializeComponent();
            LoadData();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            connection.Open();
            DataTable data = new DataTable();
            command = new SqlCommand("getVariant", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@product", SqlDbType.Int).Value = dataGridView1.Rows[e.RowIndex].Cells[0].Value;
            adapter = new SqlDataAdapter(command);
            adapter.Fill(data);
            dataGridView2.DataSource = data;
            connection.Close();
        }

        private void Seller_Load(object sender, EventArgs e)
        {
            connection.Open();
            DataTable data = new DataTable();

            data = new DataTable();
            command = new SqlCommand("getProductOfShop", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@userID", SqlDbType.Int).Value = user;
            adapter = new SqlDataAdapter(command);
            adapter.Fill(data);
            dataGridView1.DataSource = data;
            connection.Close();
        }
        void LoadData()
        {
            string query1 = @"SELECT distinct brandName FROM Brand";
            DataTable data1 = DataProvider.Instance.ExecuteQuery(query1);

            List<string> brandList = new List<string>();

            foreach (DataRow item in data1.Rows)
            {
                brandList.Add(item[0].ToString());
            }

            cb_Brand.DataSource = brandList;

            string query2 = @"SELECT distinct catName FROM Category";
            DataTable data2 = DataProvider.Instance.ExecuteQuery(query2);

            List<string> categoryList = new List<string>();

            foreach (DataRow item in data2.Rows)
            {
                categoryList.Add(item[0].ToString());
            }

            cb_category.DataSource = categoryList;
        }
        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            command = new SqlCommand("PostProduct", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@proName", SqlDbType.VarChar).Value = Convert.ToString(tb_TenSanPham.Text);
            command.Parameters.Add("@proOrigin", SqlDbType.VarChar).Value = Convert.ToString(tb_origin.Text);
            command.Parameters.Add("@proMarketPrice", SqlDbType.Int).Value = Convert.ToInt32(tb_price.Text);
            command.Parameters.Add("@proDescription", SqlDbType.VarChar).Value = Convert.ToString(tb_description.Text);
            command.Parameters.Add("@proImageCover", SqlDbType.VarChar).Value = Convert.ToString(tb_image.Text);
            command.Parameters.Add("@proBrand", SqlDbType.VarChar).Value = Convert.ToString(tb_TenSanPham.Text);
            command.Parameters.Add("@proCategory", SqlDbType.VarChar).Value = Convert.ToString(tb_TenSanPham.Text);
            command.Parameters.Add("@user", SqlDbType.Int).Value = user;
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}
