using BussinessObject;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Data_Access_Layer
{
    public class CakeDA
    {
        string strConnection;
        public string GetConnectionString()
        {
            strConnection = ConfigurationManager.ConnectionStrings["CakeShop"].ToString();
            return strConnection;
        }
        public CakeDA()
        {
            GetConnectionString();
        }
        public bool AddCake(CakeBO cakeBO)
        {
            string sql = "insert into cakes values(@Name,@Description,@Price,@Quantity,@Image)";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@Name", cakeBO.Name);
            cmd.Parameters.AddWithValue("@Description", cakeBO.Description);
            cmd.Parameters.AddWithValue("@Price", cakeBO.Price);
            cmd.Parameters.AddWithValue("@Quantity", cakeBO.Quantity);
            cmd.Parameters.AddWithValue("@Image", cakeBO.Image);
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                return cmd.ExecuteNonQuery() > 0;
            }
            catch (SqlException e)
            {
                throw new Exception(e.Message);
            }
        }
        public DataTable GetAllCakes()
        {
            string sql = "select * from cakes";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtCake = new DataTable();
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                da.Fill(dtCake);
            }catch(SqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                cnn.Close();
            }
            return dtCake;
        }
        public DataTable GetCakeByID(int id)
        {
            string sql = "select * from cakes where id=@ID";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@ID", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtCake = new DataTable();
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                da.Fill(dtCake);
            }
            catch (SqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                cnn.Close();
            }
            return dtCake;
        }
        public DataTable SearchByLikeName(string name)
        {
            string sql = "select * from cakes where cake_name like '%"+name+"%'";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtCake = new DataTable();
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                da.Fill(dtCake);
            }
            catch (SqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                cnn.Close();
            }
            return dtCake;
        }
        public bool UpdateCakeQuantity(int quantity,int id)
        {
            string sql = "update cakes set cake_quantity=@Quantity where id=@ID";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@ID", id);
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                return cmd.ExecuteNonQuery() > 0;
            }
            catch (SqlException e)
            {
                throw new Exception(e.Message);
            }
        }
        public bool ReturnCakeQuantity(int quantity, int id)
        {
            string sql = "update cakes set cake_quantity=cake_quantity+@Quantity where id=@ID";
            SqlConnection cnn = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@ID", id);
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                return cmd.ExecuteNonQuery() > 0;
            }
            catch (SqlException e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
