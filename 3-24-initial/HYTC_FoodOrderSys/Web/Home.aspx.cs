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
    public partial class Home : System.Web.UI.Page
    {
        public string noticetext;
        public List<Model.FoodClass> foodclassnames;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                string html = "欢迎来到中华外卖！请{ <span class='login' id='userphone' userphone='0'>登录</span> } <a href='sign.aspx' class='sign'> 免费注册</a></span>";
                this.Welcome.InnerHtml = html;
            }
            else
            {
                string html = "<span class='redStyle' id='userphone' userphone='" + Session["phoneid"] + "'>" + Session["username"] + "</span>,欢迎来到中华外卖！ ";
                html += "<span class='btnCancel'>  注销</span>";
                this.Welcome.InnerHtml = html;
            }

            //获取通告信息
            BLL.HomeBLL home = new BLL.HomeBLL();
            noticetext = home.GetNoticeBoard();

            //获取食物种类名称
            foodclassnames = home.GetFoodClassNames();
            DataTable dt = new DataTable();
            dt.Columns.Add("classid",typeof(System.Int32));
            dt.Columns.Add("classname", typeof(System.String));
            dt.Columns.Add("classimg", typeof(System.String));
            for (int i = 0; i < foodclassnames.Count; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = foodclassnames[i].FoodClassId;
                dr[1] = foodclassnames[i].FoodClassName;
                dr[2] = foodclassnames[i].FoodClassImg;
                dt.Rows.Add(dr);
            }
            this.refoodclassname.DataSource = dt;
            this.refoodclassname.DataBind();
        }
    }
}