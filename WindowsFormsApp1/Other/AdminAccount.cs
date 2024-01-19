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
using WindowsFormsApp1.DAO;
using System.Globalization;
using WindowsFormsApp1.DTO;

namespace WindowsFormsApp1
{
    public partial class AdminAccount : Form
    {

        public AdminAccount()
        {
            InitializeComponent();
            load_FoodList();
            load_Table();
        }

        string foodName;
        int idFoodType;
        Button Old_Button;
        int idTable;
        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        // -- Load Food -- 

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string querry = "SELECT name as 'Tên món ăn', FoodPrice as 'Đơn giá' FROM FOOD WHERE idFOODTYPE = " +
                " (SELECT TOP 1 idFOODTYPE FROM FOODTYPE WHERE name = N'" + cbbFoodType.Text + "')";
            DataTable pData = dataProvider.Instance.excuteQuerry(querry);
            dtgvFood.DataSource = pData;
            comboBox2.Text = cbbFoodType.Text;
            dtgvFood.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            food_Binding();
        }
        private void load_FoodList()
        {
            string querry = "SELECT * FROM FOODTYPE";
            DataTable pData = dataProvider.Instance.excuteQuerry(querry);
            cbbFoodType.DataSource = pData;
            comboBox3.DataSource = pData;
            comboBox3.DisplayMember = "name";
            comboBox2.DataSource = pData;
            comboBox2.DisplayMember = "name";
            cbbFoodType.DisplayMember = "name";
        }

        private void btn_Click(object sender, EventArgs e)
        {
            AdminAccount pAdmin = new AdminAccount();
             this.Hide();
             pAdmin.ShowDialog();
             this.Show();
        }

        private void food_Binding()
        {
            textBox10.DataBindings.Clear();
            textBox10.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "Tên món ăn"));
            numericUpDown1.DataBindings.Clear();
            numericUpDown1.DataBindings.Add(new Binding("Value", dtgvFood.DataSource, "Đơn giá"));
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string querry = "INSERT dbo.FOODTYPE (name) VALUES (N'" + textBox2.Text + "')";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int idFoodType = (int)dataProvider.Instance.excuteFirstElement("" +
                "SELECT idFOODTYPE FROM dbo.FOODTYPE WHERE name = N'" + comboBox2.Text + "'", "idFOODTYPE");
            string querry = "DELETE FROM dbo.FOOD WHERE idFOODTYPE = " + idFoodType + " " +
             "DELETE FROM dbo.FOODTYPE WHERE name = N'" + comboBox2.Text + "'";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void btnChange_Click(object sender, EventArgs e)
        {
            string querry = "UPDATE dbo.FOODTYPE SET name = N'" + textBox2.Text + "' WHERE name = N'" + comboBox2.Text + "'";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            string querry = "SELECT idFOOD FROM dbo.FOOD WHERE name = N'" + textBox10.Text + "'";
            textBox9.Text = dataProvider.Instance.excuteFirstElement(querry, "idFOOD").ToString();
            if (textBox9.Text != "0")
            {
                foodName = textBox10.Text;
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            int idFoodType = (int)dataProvider.Instance.excuteFirstElement("" +
                "SELECT idFOODTYPE FROM dbo.FOODTYPE WHERE name = N'" + comboBox3.Text + "'", "idFOODTYPE");
            string querry = "INSERT dbo.FOOD(name, idFOODTYPE, FoodPrice)" +
                " VALUES(N'" + textBox10.Text + "'," + idFoodType + "," + numericUpDown1.Value + ")";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int idFoodType = (int)dataProvider.Instance.excuteFirstElement("" +
                "SELECT idFOODTYPE FROM dbo.FOODTYPE WHERE name = N'" + comboBox3.Text + "'", "idFOODTYPE");
            int idFood = (int)dataProvider.Instance.excuteFirstElement("" +
                "SELECT idFOOD FROM dbo.FOOD WHERE name = N'" + foodName + "'", "idFOOD");
            string querry = "UPDATE dbo.FOOD SET idFOODTYPE = " +
                idFoodType + ", name = N'" + textBox10.Text +  "', FoodPrice = " + numericUpDown1.Value +
                " WHERE  idFOOD = " + idFood;
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int idFood = (int)dataProvider.Instance.excuteFirstElement("" +
                "SELECT idFOOD FROM dbo.FOOD WHERE name = N'" + foodName + "'", "idFOOD");
            string querry = "DELETE FROM dbo.FOOD WHERE idFOOD = " + idFood;
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        //  -- load account -- 

        private void AdminAccount_Load(object sender, EventArgs e)
        {

            string querry = "SELECT UserName AS 'Tài Khoản', DisplayName AS 'Họ Tên', Type AS 'Chức Vụ' FROM ACCOUNT";
            dtgvAccount.DataSource = dataProvider.Instance.excuteQuerry(querry);
            textBox5.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Họ Tên"));
            textBox6.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Tài Khoản"));
            comboBox4.Items.Add("Quản lý");
            comboBox4.Items.Add("Nhân viên");
            dtgvAccount.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            string querry = "SELECT * FROM ACCOUNT WHERE DisplayName like N'" + txtHoten.Text.ToLower() + "'";
            dtgvAccount.DataSource = dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);

        }

        private void btnAddAccount_Click(object sender, EventArgs e)
        {
            string querry = "INSERT dbo.ACCOUNT(UserName,DisplayName,UserPass,Type) " +
                "VALUES(N'" + textBox6.Text + "', N'" + textBox5.Text + "', '" + textBox7.Text + "', ";
            if(comboBox4.Text == "Quản lý")
            {
                querry += "1)";
            }
            else
            {
                querry += "0)";
            }
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void btnDeleteAccount_Click(object sender, EventArgs e)
        {
            string querry = "DELETE FROM dbo.ACCOUNT WHERE UserName = N'" + textBox6.Text + "'";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            string querry = "UPDATE dbo.ACCOUNT SET DisplayName = N'" + textBox5.Text +
                "', UserPass = '" + textBox7.Text + "', Type = ";
            if (comboBox4.Text == "Quản lý")
            {
                querry += "1";
            }
            else
            {
                querry += "0";
            }
            querry += " WHERE UserName = '" + textBox6.Text + "'";
            dataProvider.Instance.excuteQuerry(querry);
            btn_Click(sender, e);
        }

        // -- Load Bill --

        void loadBillInfor()
        {

        }

        private void btnFindBill_Click(object sender, EventArgs e)
        {
           string fromDate = "'" + dateTimePicker1.Value.Year + "-" + dateTimePicker1.Value.Month + "-" + dateTimePicker1.Value.Day + "'";
           string toDate = "'" + dateTimePicker2.Value.Year + "-" + dateTimePicker2.Value.Month + "-" + (dateTimePicker2.Value.Day + 1) + "'";
           string querry = "SELECT idBILL AS 'ID', name AS 'Tên Món',BILLINFOR.Time AS 'Thời Gian', FoodPrice AS 'Đơn Giá', count AS 'Số Lượng', 'Thành Tiền' = count * FoodPrice FROM dbo.BILLINFOR, dbo.FOOD WHERE dbo.BILLINFOR.idFOOD = dbo.FOOD.idFOOD and Time between " + fromDate + " and " + toDate;
            DataTable pData = dataProvider.Instance.excuteQuerry(querry);
            double Total = 0;
            foreach(DataRow row in pData.Rows)
            {
                Total = Total + Convert.ToDouble(row["Thành Tiền"].ToString());
            }
            dtgvBill.DataSource = pData;
            dtgvBill.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            CultureInfo culture = new CultureInfo("vi-vn");
            textBox1.Text = Total.ToString("c", culture);
        }


        // -- load Table --
        void load_Table()
        {
            fplTable.Controls.Clear();
            List<TableDTO> TableList = TableDAO.Instance.Tablelist_load();
            foreach (TableDTO Table in TableList)
            {
                Button btnTable = new Button() { Width = 100, Height = 100 };
                btnTable.Text = "      " + Table.Name + "\n" + (Table.Status == 0 ? " Có người" : "Trống");
                btnTable.Tag = Table;
                btnTable.Click += btnTable_Click;
                if (Table.Status > 0)
                    btnTable.BackColor = Color.Aqua;
                else
                {
                    btnTable.BackColor = Color.MediumOrchid;
                }
                btnTable.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
                fplTable.Controls.Add(btnTable);
            }
        }

            void btnTable_Click(object sender, EventArgs e)
            {
                if (Old_Button != null)
                    Old_Button.FlatAppearance.BorderColor = Color.White;
                Button p = sender as Button;
                Old_Button = p;
                p.FlatStyle = FlatStyle.Flat;
                p.FlatAppearance.BorderColor = Color.Red;
                p.FlatAppearance.BorderSize = 2;
            idTable = (p.Tag as TableDTO).Id;
            showTable_infor();
            }
        void showTable_infor()
        {
            txtIdTable.Text = idTable.ToString();
            txtTableName.Text = dataProvider.Instance.excuteFirstElement("select name FROM dbo.TABLESTORE WHERE idTABLE = " + idTable, "name").ToString();
            int k = (int)dataProvider.Instance.excuteFirstElement("select isGood FROM dbo.TABLESTORE WHERE idTABLE = " + idTable, "isGood");
            if (k == 1)
                txtIsGood.Text = "Bàn Trống";
            else
            {
                txtIsGood.Text = "Có Người";
            }
        }
        private void Table_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(dataProvider.Instance.excuteExist("SELECT * FROM dbo.TABLESTORE WHERE name = N'" + txtNewTable.Text + "'") == 0)
            {
                dataProvider.Instance.excuteQuerry("INSERT dbo.TABLESTORE(name,isGood) VALUES(N'" + txtNewTable.Text + "', 1)");
                btn_Click(sender, e);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
                dataProvider.Instance.excuteQuerry("UPDATE dbo.TABLESTORE SET name = N'" + txtNewTable.Text + "' WHERE name = N'" + txtTableName.Text + "'");
                btn_Click(sender, e);
        }

        private void button7_Click(object sender, EventArgs e)
        {

        }
    }
}
 