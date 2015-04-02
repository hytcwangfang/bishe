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
    public partial class OrderPage : System.Web.UI.Page
    {
        public List<Model.ShopInfo> shoplist = new List<Model.ShopInfo>();
        public List<Model.AddressInfo> addrlist = new List<Model.AddressInfo>();
        public string userphone = "0";
        public int sumprice = 0;
        public string orderid="";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["orderid"] == "") { }
            else
            {
                orderid = Request.QueryString["orderid"];
            }
            BLL.OrderPageBLL orderbll = new BLL.OrderPageBLL();
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                string html1 = "欢迎来到中华外卖！请{ <span class='login' id='userphone' userphone='0' orderid='" + orderid + "'>登录</span> } <a href='sign.aspx' class='sign'> 免费注册</a></span>";
                this.Welcome.InnerHtml = html1;
            }
            else
            {
                string html1 = "<span class='redStyle' id='userphone' userphone='" + Session["phoneid"] + "' orderid='" + orderid + "'>" + Session["username"] + "</span>,欢迎来到中华外卖！ ";
                html1 += "<span class='btnCancel'>  注销</span>";
                this.Welcome.InnerHtml = html1;
                userphone = Session["phoneid"].ToString();
                addrlist = orderbll.GetAddrList(userphone);
                shoplist = orderbll.GetShopList(userphone);
            }
            //recename addrdes isdefault  
            DataTable dt_addrinfo = new DataTable();
            dt_addrinfo.Columns.Add("receivename", typeof(System.String));
            dt_addrinfo.Columns.Add("userphone", typeof(System.String));
            dt_addrinfo.Columns.Add("addrdes", typeof(System.String));
            dt_addrinfo.Columns.Add("isdefault", typeof(System.String));
            for (int i = 0; i < addrlist.Count; i++)
            {
                DataRow dr_addrinfo = dt_addrinfo.NewRow();
                dr_addrinfo[0] = addrlist[i].ReceiveName;
                dr_addrinfo[1] = addrlist[i].UserPhone;
                dr_addrinfo[2] = addrlist[i].AddressDes;
                dr_addrinfo[3] = addrlist[i].IsDefault;
                dt_addrinfo.Rows.Add(dr_addrinfo);
            }
            this.readdrlist.DataSource = dt_addrinfo;
            this.readdrlist.DataBind();

            // foodinfo foodcount userphone
            DataTable dt_shoplist = new DataTable();
            dt_shoplist.Columns.Add("foodname", typeof(System.String));
            dt_shoplist.Columns.Add("foodcount", typeof(System.Int32));
            dt_shoplist.Columns.Add("foodprice", typeof(System.Int32));
            dt_shoplist.Columns.Add("multiprice", typeof(System.Int32));
            for (int i = 0; i < shoplist.Count; i++)
            {
                DataRow dr_shoplist = dt_shoplist.NewRow();
                dr_shoplist[0] = shoplist[i].Foodinfo.FoodName;
                dr_shoplist[1] = shoplist[i].FoodCount;
                dr_shoplist[2] = shoplist[i].Foodinfo.FoodPrice;
                dr_shoplist[3] = Convert.ToInt32(dr_shoplist[1]) * Convert.ToInt32(dr_shoplist[2]);
                sumprice += Convert.ToInt32(dr_shoplist[3]);
                dt_shoplist.Rows.Add(dr_shoplist);
            }
            this.reshoplist.DataSource = dt_shoplist;
            this.reshoplist.DataBind();
        }
    }
}