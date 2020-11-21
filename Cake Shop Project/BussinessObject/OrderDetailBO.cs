using System;
using System.Collections.Generic;
using System.Text;

namespace BussinessObject
{
    class OrderDetailBO
    {
        public int id { get; set; }
        public int order_id { get; set; }
        public int cake_id { get; set; }
        public string cake_name { get; set; }
        public int cake_price { get; set; }
        public int cake_quantity { get; set; }
        public string cake_image { get; set; }
    }
}
