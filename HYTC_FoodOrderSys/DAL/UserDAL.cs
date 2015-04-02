using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class UserDAL
    {
        DBHelper db = new DBHelper();
        SqlDataReader dr;
        /// <summary>
        /// 获取所有用户信息
        /// </summary>
        /// <returns></returns>
        public List<Model.UserInfo> GetAllUserInfo()
        {
            List<Model.UserInfo> userlist = new List<Model.UserInfo>();
            db.Open();
            string sql = "select userImg,userName,userPhone,userGender,userAge,userBirth,userAddress,userQQ,userMail,userLevel,userScore,userFaithId from UserInfo";
            dr = db.ExecuteReader(sql, CommandType.Text);
            while (dr.Read())
            {
                Model.UserInfo user = new Model.UserInfo();
                user.UserImg = dr["userImg"].ToString();
                user.UserName = dr["userName"].ToString();
                user.UserPhone = dr["userPhone"].ToString();
                if (dr["userGender"].ToString() == "" || dr["userGender"] == null)
                {
                    user.UserGender = "-";
                }
                else
                {
                    user.UserGender = dr["userGender"].ToString();
                }
                if (dr["userAge"].ToString() == "" || dr["userAge"] == null)
                {
                    user.UserAge = 0;
                }
                else
                {
                    user.UserAge = Convert.ToInt32(dr["userAge"]);
                }
                if (dr["userBirth"].ToString() == "" || dr["userBirth"] == null)
                {
                    user.UserBirth = "----";
                }
                else
                {
                    user.UserBirth = dr["userBirth"].ToString();
                }
                if (dr["userAddress"].ToString() == "" || dr["userAddress"] == null)
                {
                    user.UserAddress = "----";
                }
                else
                {
                    user.UserAddress = dr["userAddress"].ToString();
                }
                if (dr["userQQ"].ToString() == "" || dr["userQQ"] == null)
                {
                    user.UserQQ = "----";
                }
                else
                {
                    user.UserQQ = dr["userQQ"].ToString();
                }
                if (dr["userMail"].ToString() == "" || dr["userMail"] == null)
                {
                    user.UserMail = "----";
                }
                else
                {
                    user.UserMail = dr["userMail"].ToString();
                }
                if (dr["userMail"].ToString() == "" || dr["userMail"] == null)
                {
                    user.UserMail = "----";
                }
                else
                {
                    user.UserMail = dr["userMail"].ToString();
                }
                user.UserLevel = Convert.ToInt32(dr["userLevel"]);
                user.UserScore = Convert.ToInt32(dr["userScore"]);
                user.UserFaith = Convert.ToInt32(dr["userFaithId"]);
                userlist.Add(user);
            }
            dr.Close();
            db.Close();
            return userlist;
        }
    }
}
