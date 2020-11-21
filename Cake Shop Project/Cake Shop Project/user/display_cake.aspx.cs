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
    public partial class display_cake : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CakeBL cakeBL = new CakeBL();
            DataTable dtCake;
            
            if (Request.QueryString["search"] != null)
            {
                string searchValue = Request.QueryString["search"].ToString();
                dtCake=cakeBL.SearchByName(searchValue);
            }
            else
            {
                dtCake = cakeBL.GetCakes();
            }
            cakes.DataSource = dtCake;
            cakes.DataBind();
        }
    }
}