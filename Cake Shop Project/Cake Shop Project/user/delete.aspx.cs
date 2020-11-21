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
    public partial class delete : System.Web.UI.Page
    {
        string s;
        string t;
        string[] a = new string[6];
        int deleteId, cake_id,qty;
        string cake_name, cake_descriptions, cake_price, cake_quantity, cake_image;
        int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            CakeBL cakeBL = new CakeBL();
            DataTable dtCart = new DataTable();
            dtCart.Rows.Clear();
            dtCart.Columns.AddRange(new DataColumn[7] { new DataColumn("cake_name"), new DataColumn("cake_description"), new DataColumn("cake_price"), new DataColumn("cake_quantity"), new DataColumn("cake_image"), new DataColumn("id"), new DataColumn("cake_id") });
            if(Request.Cookies["cart"] != null)
            {
                s = Convert.ToString(Request.Cookies["cart"].Value);
                string[] strArr = s.Split('|');
                for(int i=0; i<strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for (int j=0;j<strArr1.Length;j++)
                    {
                        a[j] = strArr1[j].ToString();
                    }
                    dtCart.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), i.ToString(),a[5].ToString());
                }
            }
            //
            count = 0;
            foreach(DataRow dr in dtCart.Rows)
            {
                if (count == Convert.ToInt32(dr["id"].ToString()))
                {
                    cake_id = Convert.ToInt32(dr["cake_id"].ToString());
                    qty = Convert.ToInt32(dr["cake_quantity"].ToString());
                    deleteId = count;
                }
                count++;
            }
            count = 0;
            //
            cakeBL.ReturnAmountWhenDeteleItem(qty, cake_id);
            dtCart.Rows.RemoveAt(deleteId);
            Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);
            foreach (DataRow dr in dtCart.Rows)
            {
                cake_name = dr["cake_name"].ToString();
                cake_descriptions = dr["cake_description"].ToString();
                cake_price = dr["cake_price"].ToString();
                cake_quantity = dr["cake_quantity"].ToString();
                cake_image = dr["cake_image"].ToString();
                cake_id = Convert.ToInt32(dr["cake_id"].ToString());
                count++;

                if (count == 1)
                {
                    Response.Cookies["cart"].Value = cake_name.ToString() + "," + cake_descriptions.ToString() + "," + cake_price.ToString() + "," + cake_quantity.ToString() + "," + cake_image.ToString()+","+cake_id.ToString();
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["cart"].Value = Request.Cookies["cart"].Value + "|" + cake_name.ToString() + "," + cake_descriptions.ToString() + "," + cake_price.ToString() + "," + cake_quantity.ToString() + "," + cake_image.ToString() + "," + cake_id.ToString();
                    Response.Cookies["cart"].Expires = DateTime.Now.AddDays(1);
                }
            }
            Response.Redirect("view_cart.aspx");
        }
    }
}