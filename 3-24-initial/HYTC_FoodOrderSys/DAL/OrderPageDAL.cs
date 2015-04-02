using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class OrderPageDAL
    {
        DBHelper db = new DBHelper();
        SqlDataReader dr;

        /// <summary>
        /// 获得地址记录
        /// </summary>
        /// <param name="userphone"></param>
        /// <returns></returns>
        public List<Model.AddressInfo> GetAddrList(string userphone) {
            List<Model.AddressInfo> addrlist = new List<Model.AddressInfo>();
            db.Open();
            dr = db.ExecuteReader("select addrId,userPhone,receiveName,addrDes,IsDefault from AddressInfo where userPhone = '" + userphone + "' and addrStateId = 1", CommandType.Text);
            while (dr.Read())
            {
                Model.AddressInfo addrinfo = new Model.AddressInfo();
                addrinfo.AddressId = Convert.ToInt32(dr["addrId"]);
                addrinfo.UserPhone = dr["userPhone"].ToString();
                addrinfo.ReceiveName = dr["receiveName"].ToString();
                addrinfo.AddressDes = dr["addrDes"].ToString();
                addrinfo.IsDefault = dr["IsDefault"].ToString();
                addrlist.Add(addrinfo);
            }
            db.Close();
            return addrlist;
        }

        public List<Model.ShopInfo> GetShopList(string userphone)
        {
            List<Model.ShopInfo> shoplist = new List<Model.ShopInfo>();
            db.Open();
            string sql = "SELECT FoodInfo.foodName, FoodInfo.foodPrice,ShopInfo.foodCount ";
            sql += "FROM FoodInfo INNER JOIN ShopInfo ON FoodInfo.foodId = ShopInfo.foodId ";
            sql += "where ShopInfo.shopStateId = 1 and ShopInfo.userPhone = '" + userphone + "'";
            dr = db.ExecuteReader(sql, CommandType.Text);
            while (dr.Read())
            {
                Model.ShopInfo shopinfo = new Model.ShopInfo();
                shopinfo.FoodCount = Convert.ToInt32(dr["foodCount"]);
                shopinfo.Foodinfo.FoodName = dr["foodName"].ToString();
                shopinfo.Foodinfo.FoodPrice = Convert.ToInt32(dr["foodPrice"]);
                shoplist.Add(shopinfo);
            }
            db.Close();
            return shoplist;
        }

    }
}
