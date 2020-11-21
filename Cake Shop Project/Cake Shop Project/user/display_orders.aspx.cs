using BussinessLogic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cake_shop_Project.user
{
    public partial class display_orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderBL orderBL = new OrderBL();
            DataTable dtOrder = orderBL.GetOrdersForUser(Session["user"].ToString());
            orders.DataSource = dtOrder;
            orders.DataBind();
        }
    }
}