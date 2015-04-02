using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class FoodListDAL
    {
        public DBHelper db = new DBHelper();
        public SqlDataReader dr;

        /// <summary>
        /// 获取所有食物清单
        /// </summary>
        /// <returns></returns>
        /// 
        public List<Model.FoodInfo> GetFoodList()
        {
            List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
            db.Open();
            dr = db.ExecuteReader("select foodId,foodName,foodImg,foodPrice,foodDes,FoodInfo.foodClassId,foodClassName from FoodClass,FoodInfo where FoodClass.foodClassId = FoodInfo.foodClassId and FoodInfo.foodStateId = 1 and FoodClass.foodClassState = 1", CommandType.Text);
            while (dr.Read())
            {
                Model.FoodInfo foodinfo = new Model.FoodInfo();
                foodinfo.FoodClassId = Convert.ToInt32(dr["foodClassId"]);
                foodinfo.FoodDes = dr["foodDes"].ToString();
                foodinfo.FoodId = Convert.ToInt32(dr["foodId"]);
                foodinfo.FoodImg = dr["foodImg"].ToString();
                foodinfo.FoodName = dr["foodName"].ToString();
                foodinfo.FoodPrice = Convert.ToDouble(dr["foodPrice"]);
                foodinfo.FoodClassName = dr["foodClassName"].ToString();
                foodlist.Add(foodinfo);
            }
            dr.Close();
            db.Close();
            return foodlist;
        }

        /// <summary>
        /// 获取X类型的食物列表
        /// </summary>
        /// <param name="classid">类型id</param>
        /// <returns></returns>
        public List<Model.FoodInfo> GetFoodList(int classid)
        {
            List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
            db.Open();
            dr = db.ExecuteReader("select class.foodClassId,foodClassName,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo info,FoodClass class where info.foodClassId = class.foodClassId and info.foodStateId = 1 and class.foodClassState = 1 and info.foodClassId = '" + classid + "'", CommandType.Text);
            while (dr.Read())
            {
                Model.FoodInfo foodinfo = new Model.FoodInfo();
                foodinfo.FoodClassId = Convert.ToInt32(dr["foodClassId"]);
                foodinfo.FoodDes = dr["foodDes"].ToString();
                foodinfo.FoodId = Convert.ToInt32(dr["foodId"]);
                foodinfo.FoodImg = dr["foodImg"].ToString();
                foodinfo.FoodName = dr["foodName"].ToString();
                foodinfo.FoodPrice = Convert.ToDouble(dr["foodPrice"]);
                foodinfo.FoodClassName = dr["foodClassName"].ToString();
                foodlist.Add(foodinfo);
            }
            dr.Close();
            db.Close();
            return foodlist;
        }

        /// <summary>
        /// 获取价位在x与X之间的食物列表
        /// </summary>
        /// <param name="minprice">最低价格</param>
        /// <param name="maxprice">最高价格</param>
        /// <returns></returns>
        public List<Model.FoodInfo> GetFoodList(Double minprice, Double maxprice)
        {
            List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
            db.Open();
            dr = db.ExecuteReader("select FoodInfo.foodClassId,foodClassName,foodDes,foodId,foodImg,foodName,foodPrice from FoodClass,FoodInfo where FoodClass.foodClassId = FoodInfo.foodClassId and FoodInfo.foodStateId = 1 and FoodClass.foodClassState = 1 and FoodInfo.foodPrice between " + minprice + " and " + maxprice + "", CommandType.Text);
            while (dr.Read())
            {
                Model.FoodInfo foodinfo = new Model.FoodInfo();
                foodinfo.FoodClassId = Convert.ToInt32(dr["foodClassId"]);
                foodinfo.FoodDes = dr["foodDes"].ToString();
                foodinfo.FoodId = Convert.ToInt32(dr["foodId"]);
                foodinfo.FoodImg = dr["foodImg"].ToString();
                foodinfo.FoodName = dr["foodName"].ToString();
                foodinfo.FoodPrice = Convert.ToDouble(dr["foodPrice"]);
                foodinfo.FoodClassName = dr["foodClassName"].ToString();
                foodlist.Add(foodinfo);
            }
            dr.Close();
            db.Close();
            return foodlist;
        }

        /// <summary>
        /// 获取X类型并且在x-X价位的食物列表
        /// </summary>
        /// <param name="classname">类型</param>
        /// <param name="minprice">最低价格</param>
        /// <param name="maxprice">最高价格</param>
        /// <returns></returns>
        public List<Model.FoodInfo> GetFoodList(string classname, Double minprice, Double maxprice)
        {
            List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
            db.Open();
            dr = db.ExecuteReader("select FoodClass.foodClassId,foodClassName,foodDes,foodId,foodImg,foodName,foodPrice from FoodClass,FoodInfo where FoodClass.foodClassId = FoodInfo.foodClassId and FoodInfo.foodStateId = 1 and FoodClass.foodClassState = 1 and FoodInfo.foodPrice between " + minprice + " and " + maxprice + " and FoodClass.foodClassName like '%" + classname + "%'", CommandType.Text);
            while (dr.Read())
            {
                Model.FoodInfo foodinfo = new Model.FoodInfo();
                foodinfo.FoodClassId = Convert.ToInt32(dr["foodClassId"]);
                foodinfo.FoodDes = dr["foodDes"].ToString();
                foodinfo.FoodId = Convert.ToInt32(dr["foodId"]);
                foodinfo.FoodImg = dr["foodImg"].ToString();
                foodinfo.FoodName = dr["foodName"].ToString();
                foodinfo.FoodPrice = Convert.ToDouble(dr["foodPrice"]);
                foodinfo.FoodClassName = dr["foodClassName"].ToString();
                foodlist.Add(foodinfo);
            }
            dr.Close();
            db.Close();
            return foodlist;
        }
    }
}
