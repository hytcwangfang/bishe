using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class OrderInfo
    {
        //orderid phone sumprice ordernote 
        public string OrderId { get; set; }
        public string userPhone { get; set; }
        public int OrderPrice { get; set; }
        public string OrderNote { get; set; }
    }
}
