using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using WindowsFormsApp1.DAO;

namespace WindowsFormsApp1.DAO
{
    internal class AccountDAO
    {
        private static AccountDAO instance;
        private string Username, Password;
        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return AccountDAO.instance; }
            private set { AccountDAO.instance = value; }
        }

        private AccountDAO() { }

        public bool compare(string password)
        {
            return password == Password;
        }
        public string getUsername()
        {
            return Username;
        }
        public bool getType()
        {
            string querry = "SELECT Type FROM dbo.ACCOUNT WHERE UserName = '" +
                Username + "' AND UserPass = '" + Password + "'";
            if ((int)dataProvider.Instance.excuteFirstElement(querry, "Type") == 1)
                return true;
            else
                return false;
        }
        public bool Login(string userName, string Password)
        {
            string querry = "SELECT * FROM ACCOUNT WHERE userName = '" + userName + "' AND UserPass = '" + Password + "'";
            DataTable data = dataProvider.Instance.excuteQuerry(querry);
            this.Password = Password.Trim();
            this.Username = userName.Trim();
            return data.Rows.Count > 0;
        }
    }
}
