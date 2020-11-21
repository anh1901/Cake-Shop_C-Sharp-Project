using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessLogic;
using BussinessObject;
using Cake_shop_Project.admin;
namespace Cake_shop_Project.admin
{
    public partial class add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            string pName= Name.Text;
            string pDescription = Description.Text;
            int pPrice = Int32.Parse(Price.Text);
            int pQuantity = Int32.Parse(Quantity.Text);
            string pImage = Image.FileName.ToString();
            Image.SaveAs(Request.PhysicalApplicationPath+"./Images/"+Image.FileName.ToString());
            CakeBO cakeBO = new CakeBO()
            {
                Name = pName,
                Description = pDescription,
                Price = pPrice,
                Quantity = pQuantity,
                Image = pImage
            };
            CakeBL cakeBL = new CakeBL();
            if (!cakeBL.AddNewCake(cakeBO))
            {
                Response.Redirect("invalid.aspx");
            }
            else
            {
                Response.Redirect("add_product.aspx");
            }
        }
        
    }
}