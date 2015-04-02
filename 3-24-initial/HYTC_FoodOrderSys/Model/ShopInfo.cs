using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class ShopInfo
    {
        //orderId foodinfo foodcount userphone
        public string OrderId { get; set; }
        public FoodInfo Foodinfo = new FoodInfo();
        public int FoodCount { get; set; }
        public string UserPhone { get; set; }

    }
}
