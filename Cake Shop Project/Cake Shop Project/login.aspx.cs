using BussinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cake_shop_Project.admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            string UserName = username.Text;
            string Password = password.Text;
            UserBL userBL = new UserBL();
            if (userBL.CheckUserRole(UserName, Password) == "user")
            {
                if (Session["checkoutbutton"]=="yes")
                {
                    Session["user"] = username.Text;
                    Response.Redirect("user/update_order_detail.aspx");
                }
                else
                {
                    Session["user"] = username.Text;
                    Response.Redirect("user/display_cake.aspx");
                }
            }else if (userBL.CheckUserRole(UserName, Password) == "admin")
            {
                Response.Redirect("admin/add_product.aspx");
            }
            else
            {
                Error.Text = "Username or password is incorrect. Try Again!";
            }
        }
    }
}