using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class HomeDAL
    {
        DBHelper db = new DBHelper();

        /// <summary>
        /// 获取标记为公告中的公告信息
        /// </summary>
        /// <returns></returns>
        public string GetNoticeBoard() 
        {
            db.Open();
            string noticetext ="";
            SqlDataReader dr = db.ExecuteReader("select noticeContent from NoticeBoard where noticeStateId = 3", CommandType.Text);
            if (dr.Read())
            {
                noticetext = dr[0].ToString();
            }
            dr.Close();
            db.Close();
            return noticetext;
        }

        /// <summary>
        /// 获得所有食物类型信息
        /// </summary>
        /// <returns></returns>
        public List<Model.FoodClass> GetFoodClassNames() 
        {
            db.Open();
            List<Model.FoodClass> foodclasslist = new List<Model.FoodClass>();
            SqlDataReader dr = db.ExecuteReader("select foodClassId,foodClassName,foodClassImg from FoodClass", CommandType.Text);
            while (dr.Read())
            {
                Model.FoodClass foodclass = new Model.FoodClass();
                foodclass.FoodClassId = Convert.ToInt32(dr["foodClassId"]);
                foodclass.FoodClassName = dr["foodClassName"].ToString();
                foodclass.FoodClassImg = dr["foodClassImg"].ToString();
                foodclasslist.Add(foodclass);
            }
            dr.Close();
            db.Close();
            return foodclasslist;
        }
    }
}
