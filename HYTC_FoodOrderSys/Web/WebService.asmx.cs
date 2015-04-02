using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace Web
{
    /// <summary>
    /// WebService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        public string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString.ToString();

        #region 查看手机号是否已被注册
        [WebMethod]
        public string CheckSignPhone(string phoneid)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select userPhone from UserInfo where userPhone = '" + phoneid + "'", con))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                return "hassigned";
                            }
                            else
                            {
                                return "unsigned";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
        #endregion

        #region 注册
        [WebMethod]
        public string SignNote(string phoneid, string username, string pwd)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    con.Open();
                    string sql = "insert into UserInfo ";
                    sql += "  select '" + phoneid + "','" + pwd + "','" + username + "',null,null,'images_data/user/userdefault.jpg',null,0,null,null,null,1,10,5";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch (Exception)
            {
                return "fail";
            }
        }
        #endregion

        #region 查看用户登录信息
        [WebMethod(EnableSession = true)]
        public string checklogin(string phoneid, string pwd)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select userPhone,userName,userImg from UserInfo where userPhone = '" + phoneid + "' and userPwd = '" + pwd + "'", con))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                //session
                                Session["phoneid"] = dr["userPhone"].ToString();
                                Session["username"] = dr["userName"].ToString();
                                Session["userimg"] = dr["userImg"].ToString();
                                //Session["userphone"];
                                //Session["userimg"];
                                //Session["username"];
                                //Session["userstateid"];
                                //Session["userscore"];
                                //Session["userqq"];
                                //Session["userpwd"];
                                //Session["usermail"];
                                //Session["userlevel"];
                                //Session["usergender"];
                                //Session["userfaith"];
                                //Session["userbirth"];
                                //Session["userage"];
                                //Session["useraddr"];
                                return "success";
                            }
                            else
                            {
                                return "fail";
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
        #endregion

        #region 读取登录信息
        [WebMethod(EnableSession = true)]
        public Model.UserInfo readUserSession()
        {
            Model.UserInfo user = new Model.UserInfo();
            if (Session["userphone"] == null || Session["userphone"].ToString() == "")
            {
                return null;
            }
            else
            {
                user.UserPhone = Session["userphone"].ToString();
                user.UserImg = Session["userimg"].ToString();
                user.UserName = Session["username"].ToString();
                //user.UserStateId = Convert.ToInt32(Session["userstateid"]);
                //user.UserScore = Convert.ToInt32(Session["userscore"]);
                //user.UserQQ = Session["userqq"].ToString();
                //user.UserPwd = Session["userpwd"].ToString();
                //user.UserMail = Session["usermail"].ToString();
                //user.UserLevel = Convert.ToInt32(Session["userlevel"]);
                //user.UserGender = Session["usergender"].ToString();
                //user.UserFaith = Convert.ToInt32(Session["userfaith"]);
                //user.UserBirth = Session["userbirth"].ToString();
                //user.UserAge = Convert.ToInt32(Session["userage"]);
                //user.UserAddress = Session["useraddr"].ToString();
                return user;
            }
        }
        #endregion

        #region 注销
        [WebMethod(EnableSession = true)]
        public void SessionClear()
        {
            Session["userphone"] = null;
        }
        #endregion

        #region 获取对应食物列表
        [WebMethod]
        public string GetFoodList(int foodclassid, string minprice, string maxprice)
        {
            string html = "";
            string sql = "";
            if (foodclassid == 0)
            {
                if (minprice == "all")
                {
                    //种类为全部，价位为全部
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo";
                }
                else if (minprice != "all" && maxprice == "all")
                {
                    //种类为全部，价位大于最高价格
                    int minmoney = Convert.ToInt32(minprice);
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo where foodPrice > " + minmoney + "";
                }
                else
                {
                    //种类为全部，价位在最低与最高价格区间
                    int minmoney = Convert.ToInt32(minprice);
                    int maxmoney = Convert.ToInt32(maxprice);
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo where foodPrice between " + minmoney + " and " + maxmoney;
                }
            }
            else
            {
                if (minprice == "all")
                {
                    //价位为全部，种类不为全部
                    int classid = Convert.ToInt32(foodclassid);
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo where foodClassId = " + classid + "";
                }
                else if (minprice != "all" && maxprice == "all")
                {
                    //价位大于最高价格,种类不为全部
                    int classid = Convert.ToInt32(foodclassid);
                    int minmoney = Convert.ToInt32(minprice);
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo where foodClassId = " + classid + " and foodPrice > " + minmoney + "";
                }
                else
                {
                    //价位在最低与最高价格区间，种类不为全部
                    int classid = Convert.ToInt32(foodclassid);
                    int minmoney = Convert.ToInt32(minprice);
                    int maxmoney = Convert.ToInt32(maxprice);
                    sql = "select foodClassId,foodDes,foodId,foodImg,foodName,foodPrice from FoodInfo where foodClassId = " + classid + " and foodPrice between " + minmoney + " and " + maxmoney;
                }
            }
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds, "foodlist");
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            int foodId = Convert.ToInt32(ds.Tables[0].Rows[i]["foodId"]);
                            string foodImg = ds.Tables[0].Rows[i]["foodImg"].ToString();
                            string foodName = ds.Tables[0].Rows[i]["foodName"].ToString();
                            Double foodPrice = Convert.ToDouble(ds.Tables[0].Rows[i]["foodPrice"]);

                            html += "<li class='foodli'>";
                            html += "   <img src='images_tool/comtype.jpg' id='img" + foodId + "' class='noclickimg' clickstate='no' foodid='" + foodId + "' foodname='" + foodName + "' foodprice='" + foodPrice + "' />";
                            html += "   <a href='FoodDetail.aspx?foodid=" + foodId + "' target='_blank'><img src='" + foodImg + "' class='foodimg' /></a>";
                            html += "   <div class='fooddes'>";
                            html += "       <strong>名称：</strong>";
                            html += "       <span title='" + foodName + "'>" + foodName + "</span>";
                            html += "   </div>";
                            html += "   <div class='fooddes'>";
                            html += "       <strong>价格：</strong>";
                            html += "       <span>￥" + foodPrice + "</span>";
                            html += "   </div>";
                            //html += "   <div class='fooddes'>";
                            //html += "       <strong>已售：</strong>";
                            //html += "       <img src='images_tool/qiyifaith2.jpg' class='likestar' />";
                            //html += "   </div>";
                            html += "</li>";
                        }
                    }
                }
            }
            return html;
        }
        #endregion

        #region 创建订单
        [WebMethod]
        public string CreateOrder(string preorder, string userphone, string sumprice)
        {
            try
            {
                //get maxcurrentid
                int maxcurrentid;
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    using (SqlCommand cmd = new SqlCommand("select MAX(currentId) from OrderInfo", con))
                    {
                        con.Open();
                        maxcurrentid = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();

                        string orderid = preorder + (maxcurrentid + 1).ToString();
                        cmd.CommandText = " insert OrderInfo select '" + orderid + "','" + userphone + "',2," + sumprice + ",1,null,GETDATE(),1,null";
                        con.Open();
                        cmd.ExecuteNonQuery();

                    }
                }
                return maxcurrentid.ToString();
            }
            catch
            {
                return "fail";
            }
        }
        #endregion

        #region 插入购物车信息
        [WebMethod]
        public string InsertShopinfo(int foodid, string userphone, int foodcount)
        {
            try
            {
                string sql = "";
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    sql = "insert ShopInfo ";
                    sql += "select null,GETDATE()," + foodid + ",'" + userphone + "',1," + foodcount;
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch
            {
                return "fail";
                //return ex.ToString();
            }
        }
        #endregion

        #region 删除购物车信息
        [WebMethod]
        public string DeleShopinfo(int foodid, string userphone)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    string sql = "update ShopInfo set shopStateId = 2 where foodId = " + foodid + "and userPhone = '" + userphone + "'";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch
            {
                return "fail";
                //return ex.ToString();
            }
        }
        #endregion

        #region 修改购物数量
        [WebMethod]
        public string ModifyShopCount(int foodcount, int foodid, string userphone)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    string sql = "update ShopInfo set foodCount = " + foodcount + " where foodId = " + foodid + "and userPhone = '" + userphone + "'";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch
            {
                return "fail";
                //return ex.ToString();
            }
        }
        #endregion

        #region 确认订单
        [WebMethod]
        public string ConfirmOrder(string orderid, string userphone)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    using (SqlCommand cmd = new SqlCommand("update ShopInfo set orderId = '" + orderid + "' where userPhone = '" + userphone + "' and shopStateId =1", con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch(Exception ex)
            {
               // return "fail";
                return ex.ToString();
            }
        }
        #endregion
    }
}
