using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class OrderPageBLL
    {
        DAL.OrderPageDAL orderdal = new DAL.OrderPageDAL();
        public List<Model.AddressInfo> GetAddrList(string userphone) {
            return orderdal.GetAddrList(userphone);
        }

        public List<Model.ShopInfo> GetShopList(string userphone) {
            return orderdal.GetShopList(userphone);
        }
    }
}
