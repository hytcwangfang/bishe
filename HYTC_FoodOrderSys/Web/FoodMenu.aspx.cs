using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;


namespace Web
{
    public partial class FoodMenu : System.Web.UI.Page
    {
        public List<Model.FoodInfo> foodlist = new List<Model.FoodInfo>();
        public List<Model.FoodClass> foodclass = new List<Model.FoodClass>();
        public int thisclassid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                string html1 = "欢迎来到中华外卖！请{ <span class='login' id='userphone' userphone='0'>登录</span> } <a href='sign.aspx' class='sign'> 免费注册</a></span>";
                this.Welcome.InnerHtml = html1;
            }
            else
            {
                string html1 = "<span class='redStyle' id='userphone' userphone='" + Session["phoneid"] + "'>" + Session["username"] + "</span>,欢迎来到中华外卖！ ";
                html1 += "<span class='btnCancel'>  注销</span>";
                this.Welcome.InnerHtml = html1;
            }

            //获取所有食物种类信息
            BLL.HomeBLL home = new BLL.HomeBLL();
            home.GetFoodClassNames();
            foodclass = home.GetFoodClassNames();
            

            string html2 = "<li class='pro_post'>";//最终html2赋值给类别栏

            //获取对应食物列表
            BLL.FoodListBLL foodlistbll = new BLL.FoodListBLL();
            if (Request.QueryString["foodclassid"] == null || Request.QueryString["foodclassid"] == "")
            {
                //获取所有食物列表
                foodlist = foodlistbll.GetFoodList();
                html2 += "    <span class='pro_large choose bggreenstyle' identity='kind' foodclassid='0'>全部</span>";

            }
            else
            {
                //获取X类型食物列表   >> 将对应食物类型背景变绿
                thisclassid = Convert.ToInt32(Request.QueryString["foodclassid"]);
                foodlist = foodlistbll.GetFoodList(thisclassid);
                html2 += "    <span class='pro_large choose' identity='kind' foodclassid='0'>全部</span>";
            }

            html2 += "</li>";
            for (int i = 0; i < foodclass.Count; i++)
            {
                html2 += "<li class='pro_post'>";
                if (thisclassid == foodclass[i].FoodClassId)
                {
                    html2 += "    <span class='pro_large choose bggreenstyle' identity='kind' foodclassid='" + foodclass[i].FoodClassId + "'>" + foodclass[i].FoodClassName + "</span>";
                }
                else
                {
                    html2 += "    <span class='pro_large choose' identity='kind' foodclassid='" + foodclass[i].FoodClassId + "'>" + foodclass[i].FoodClassName + "</span>";
                }
                html2 += "</li>";
            }
            this.bgclasslist.InnerHtml = html2;

            string html = "";
            for (int i = 0; i < foodlist.Count; i++)
            {
                html += "<li class='foodli'>";
                html += "   <img src='images_tool/comtype.jpg' id='img" + foodlist[i].FoodId + "' class='noclickimg' clickstate='no' foodid='" + foodlist[i].FoodId + "' foodname='" + foodlist[i].FoodName + "' foodprice='" + foodlist[i].FoodPrice + "' />";
                html += "   <a href='FoodDetail.aspx?foodid=" + foodlist[i].FoodId + "' target='_blank'><img src='" + foodlist[i].FoodImg + "' class='foodimg' /></a>";
                html += "   <div class='fooddes'>";
                html += "       <strong>名称：</strong>";
                html += "       <span title='" + foodlist[i].FoodName + "'>" + foodlist[i].FoodName + "</span>";
                html += "   </div>";
                html += "   <div class='fooddes'>";
                html += "       <strong>价格：</strong>";
                html += "       <span>￥" + foodlist[i].FoodPrice + "</span>";
                html += "   </div>";
                //html += "   <div class='fooddes'>";
                //html += "       <strong>已售：</strong>";
                //html += "       <img src='images_tool/qiyifaith2.jpg' class='likestar' />";
                //html += "   </div>";
                html += "</li>";
            }
            this.foodmenulist.InnerHtml = html;

        }
        
    }
}