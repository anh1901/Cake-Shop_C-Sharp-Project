using BussinessObject;
using Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace BussinessLogic
{
    public class CakeBL
    {
        public bool AddNewCake(CakeBO cakeBO)
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.AddCake(cakeBO);
        }
        public bool UpdateCakeAmount(int quantity, int id)
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.UpdateCakeQuantity(quantity,id);
        }
        public bool ReturnAmountWhenDeteleItem(int quantity, int id)
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.ReturnCakeQuantity(quantity, id);
        }
        public DataTable GetCakes()
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.GetAllCakes();
        }
        public DataTable ShowCakeDetail(int id)
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.GetCakeByID(id);
        }
        public DataTable SearchByName(string name)
        {
            CakeDA cakeDA = new CakeDA();
            return cakeDA.SearchByLikeName(name);
        }

    }
}
