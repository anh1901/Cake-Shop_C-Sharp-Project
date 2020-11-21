using BussinessLogic;
using BussinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cake_shop_Project
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            string UserName = username.Text;
            string Password = password.Text;
            string Address = address.Text;
            string phone = phoneNo.Text;
            UserBL userBL = new UserBL();
            UserBO userBO = new UserBO()
            {
                UserName = UserName, Password = Password, Address = Address, Phone = phone
            };
            if (userBL.RegisterUser(userBO)) {
                Response.Redirect("login.aspx");
            }
            else
            {
                Error.Text = "Can not create new user. Try again.";
            }

        }
    }
}