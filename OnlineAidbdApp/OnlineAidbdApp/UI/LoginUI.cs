using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using OnlineAidbdApp.UI;

namespace OnlineAidbdApp
{
    public partial class LoginUI : Form
    {
        public LoginUI()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
           RegisterNewUser newUser=new RegisterNewUser();
            newUser.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void loginButton_Click(object sender, EventArgs e)
        {AdminAreaUI adminArea=new AdminAreaUI();
            adminArea.Show();
            
            
        }
    }
}
