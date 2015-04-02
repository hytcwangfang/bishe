using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Web
{
    public partial class Background : System.Web.UI.Page
    {
        public List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
        public List<Model.FoodClass> foodclass = new List<Model.FoodClass>();
        public List<Model.UserInfo> userlist = new List<Model.UserInfo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取所有食物种类信息
            BLL.HomeBLL home = new BLL.HomeBLL();
            home.GetFoodClassNames();
            foodclass = home.GetFoodClassNames();
            DataTable dt = new DataTable();
            dt.Columns.Add("classid", typeof(System.Int32));
            dt.Columns.Add("classname", typeof(System.String));
            dt.Columns.Add("classimg", typeof(System.String));
            for (int i = 0; i < foodclass.Count; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = foodclass[i].FoodClassId;
                dr[1] = foodclass[i].FoodClassName;
                dr[2] = foodclass[i].FoodClassImg;
                dt.Rows.Add(dr);
            }
            this.redelclass.DataSource = dt;
            this.redelclass.DataBind();
            this.bgfoodclass.DataSource = dt;
            this.bgfoodclass.DataBind();
            this.bgfoodclass2.DataSource = dt;
            this.bgfoodclass2.DataBind();

            //获取所有食物列表
            BLL.FoodListBLL foodlistbll = new BLL.FoodListBLL();
            foodlist = foodlistbll.GetFoodList();
            DataTable dt_foodinfo = new DataTable();
            dt_foodinfo.Columns.Add("foodname", typeof(System.String));
            dt_foodinfo.Columns.Add("foodimg", typeof(System.String));
            dt_foodinfo.Columns.Add("foodprice", typeof(System.Double));
            dt_foodinfo.Columns.Add("foodclassname", typeof(System.String));
            dt_foodinfo.Columns.Add("fooddes", typeof(System.String));
            for (int i = 0; i < foodlist.Count; i++)
            {
                DataRow dr_foodinfo = dt_foodinfo.NewRow();
                dr_foodinfo["foodimg"] = foodlist[i].FoodImg;
                dr_foodinfo["foodname"] = foodlist[i].FoodName;
                dr_foodinfo["foodprice"] = foodlist[i].FoodPrice;
                dr_foodinfo["fooddes"] = foodlist[i].FoodDes;
                dr_foodinfo["foodclassname"] = foodlist[i].FoodClassName;
                dt_foodinfo.Rows.Add(dr_foodinfo);
            }
            this.bgfoodinfo.DataSource = dt_foodinfo;
            this.bgfoodinfo.DataBind();
            
            //获取所有用户信息
            BLL.UserBLL userlistbll = new BLL.UserBLL();
            userlist = userlistbll.GetAllUserInfo();
            DataTable dt_userinfo = new DataTable();
            dt_userinfo.Columns.Add("userimg",typeof(System.String));
            dt_userinfo.Columns.Add("userphone", typeof(System.String));
            dt_userinfo.Columns.Add("username", typeof(System.String));
            dt_userinfo.Columns.Add("usergender", typeof(System.String));
            dt_userinfo.Columns.Add("userage", typeof(System.Int32));
            dt_userinfo.Columns.Add("userbirth", typeof(System.String));
            dt_userinfo.Columns.Add("useraddr", typeof(System.String));
            dt_userinfo.Columns.Add("userqq", typeof(System.String));
            dt_userinfo.Columns.Add("usermail", typeof(System.String));
            dt_userinfo.Columns.Add("userlevel", typeof(System.Int32));
            dt_userinfo.Columns.Add("userscore", typeof(System.Int32));
            dt_userinfo.Columns.Add("userfaith", typeof(System.Int32));
            for (int i = 0; i < userlist.Count; i++)
            {
                DataRow dr_userinfo = dt_userinfo.NewRow();
                dr_userinfo["userimg"] = userlist[i].UserImg;
                dr_userinfo["userphone"] = userlist[i].UserPhone;
                dr_userinfo["username"] = userlist[i].UserName;
                dr_userinfo["usergender"] = userlist[i].UserGender;
                dr_userinfo["userage"] = userlist[i].UserAge;
                dr_userinfo["userbirth"] = userlist[i].UserBirth;
                dr_userinfo["useraddr"] = userlist[i].UserAddress;
                dr_userinfo["userqq"] = userlist[i].UserQQ;
                dr_userinfo["usermail"] = userlist[i].UserMail;
                dr_userinfo["userlevel"] = userlist[i].UserLevel;
                dr_userinfo["userscore"] = userlist[i].UserScore;
                dr_userinfo["userfaith"] = userlist[i].UserFaith;
                dt_userinfo.Rows.Add(dr_userinfo);
            }

            this.reuserlist.DataSource = dt_userinfo;
            this.reuserlist.DataBind();
        }
    }
}