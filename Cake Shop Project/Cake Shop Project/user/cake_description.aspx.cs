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
    public partial class cake_description : System.Web.UI.Page
    {
        int id;
        int TotalQty;
        string cake_name,cake_descriptions, cake_price, cake_quantity, cake_image;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtCake = new DataTable();
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("display_cake.aspx");
            }
            else
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                CakeBL cakeBL = new CakeBL();
                dtCake = cakeBL.ShowCakeDetail(id);
                cake.DataSource = dtCake;
                cake.DataBind();
            }
            foreach (DataRow dr in dtCake.Rows)
            {
                TotalQty = Convert.ToInt32(dr["cake_quantity"]);
            }
            if (TotalQty == 0)
            {
                InputLable.Visible = false;
                quantity.Visible = false;
                AddToCart.Visible = false;
                MSG.Text = "Out of stock";
            }
        }
        
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            CakeBL cakeBL = new CakeBL();
            DataTable dtCart = cakeBL.ShowCakeDetail(id);
            foreach(DataRow dr in dtCart.Rows)
            {
                cake_name = dr["cake_name"].ToString();
                cake_descriptions = dr["cake_description"].ToString();
                cake_price = dr["cake_price"].ToString();
                cake_quantity = quantity.Text;
                cake_image = dr["cake_image"].ToString();
                TotalQty = Convert.ToInt32(dr["cake_quantity"].ToString());
            }
            if (Convert.ToInt32(quantity.Text) > TotalQty)
            {
                MSG.Text = "Out of available. Input lower number.";
            }
            else if(TotalQty == 0)
            {
                InputLable.Visible = false;
                quantity.Visible = false;
                AddToCart.Visible = false;
                MSG.Text = "Out of stock";
            }else
            {
                //cart in cookies
                //cart="test1"
                //cart="test1|test2"
                if (Request.Cookies["cart"] == null)
                {
                    Response.Cookies["cart"].Value = cake_name.ToString() + "," + cake_descriptions.ToString() + "," + cake_price.ToString() + "," + cake_quantity.ToString() + "," + cake_image.ToString()+","+id.ToString();
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["cart"].Value = Request.Cookies["cart"].Value + "|" + cake_name.ToString() + "," + cake_descriptions.ToString() + "," + cake_price.ToString() + "," + cake_quantity.ToString() + "," + cake_image.ToString() + id.ToString();
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(1);
                }
                //Response.Redirect("view_cart.aspx");
                cakeBL.UpdateCakeAmount(TotalQty-Convert.ToInt32(cake_quantity),id);
                Response.Redirect("cake_description.aspx?id=" + id);
            }

        }
    }
}