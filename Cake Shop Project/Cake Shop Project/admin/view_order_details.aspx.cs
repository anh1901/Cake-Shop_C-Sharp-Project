using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessLogic;
namespace Cake_shop_Project.admin.css
{
    public partial class view_order_details : System.Web.UI.Page
    {
        int totalAmount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            OrderDetailBL orderDetailBL = new OrderDetailBL();
            DataTable dtDetail = orderDetailBL.GetOrderDetails(id);
            foreach(DataRow dr in dtDetail.Rows)
            {
                totalAmount += Convert.ToInt32(dr["cake_price"])* Convert.ToInt32(dr["cake_quantity"]);
            }
            total.Text = "Total: $" + totalAmount;
            details.DataSource = dtDetail;
            details.DataBind();
        }
    }
}