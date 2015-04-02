var userphone;
$(function () {
    userphone = $("#userphone").attr("userphone");
    setPositon();

    //是否选中当前食物
    $(document).on("click", ".noclickimg", function () {
        var clickstate = $(this).attr("clickstate");
        var foodname = $(this).attr("foodname");
        var foodprice = $(this).attr("foodprice");
        var foodid = $(this).attr("foodid");
        if (clickstate == "no") {//选中
            $(this).attr("src", "images_tool/qiyifaith2.jpg");
            $(this).attr("clickstate", "yes");

            var html = "";
            html += '<li class="shopcar-row perfood" price="' + foodprice + '" foodid="' + foodid + '" id="food' + foodid + '">';
            html += '        <ul class="shopcar-fill">';
            html += '            <li class="goods-larger"><a href="FoodDetail.aspx?foodid=' + foodid + '" target="_blank" class="foodname" title="' + foodname + '">' + foodname + '</a></li>';
            html += '            <li class="goods-justify">';
            html += '				<ul class="pro_countA">';
            html += '					<li class="pro_change" flag="less">-</li>';
            html += '					<li class="pro_count" foodid="' + foodid + '">1</li>';
            html += '					<li class="pro_change" flag="add">+</li>';
            html += '				</ul>';
            html += '            </li>';
            html += '            <li class="goods-small price">￥' + foodprice + '</li>';
            html += '            <li class="goods-small multiprice" multiprice="' + foodprice + '">￥' + foodprice + '</li>';
            html += '            <li class="goods-small foodaction" foodid=' + foodid + '>删除</li>';
            html += '        </ul>';
            html += '    </li>';
            $("#sumpriceArea").before(html);
            InsertShopinfo(foodid, userphone, 1);

        } else {//不选中
            $(this).attr("src", "images_tool/comtype.jpg");
            $(this).attr("clickstate", "no");
            $("#food" + foodid).remove();
            DeleShopinfo(foodid, userphone);
        }
        var sumprice = 0;
        $(".perfood").each(function () {
            sumprice += parseFloat($(this).find(".multiprice").attr("multiprice"));
        });

        $("#sumpriceArea").find(".text-right").html("合计：￥" + sumprice + ".00");
        $("#sumpriceArea").attr("sumprice", sumprice);
        if (sumprice >= 30) {
            $(".btnOrder").css({ "background-color": "#0f0" });
            $(".btnOrder").attr("clickable", "true");
        } else {
            $(".btnOrder").css({ "background-color": "#ccc" });
            $(".btnOrder").attr("clickable", "false");
        }

    });

    //购物车删除操作
    $(document).on("click", ".foodaction", function () {
        var foodid = $(this).attr("foodid");
        $("#food" + foodid).remove();
        $("#img" + foodid).attr("src", "images_tool/comtype.jpg");
        $("#img" + foodid).attr("clickstate", "no");
        DeleShopinfo(foodid, userphone);
        var sumprice = 0;
        $(".perfood").each(function () {
            sumprice += parseFloat($(this).find(".multiprice").attr("multiprice"));
        });

        $("#sumpriceArea").find(".text-right").html("合计：￥" + sumprice + ".00");
        $("#sumpriceArea").attr("sumprice", sumprice);
        if (sumprice >= 30) {
            $(".btnOrder").css({ "background-color": "#0f0" });
            $(".btnOrder").attr("clickable", "true");
        } else {
            $(".btnOrder").css({ "background-color": "#ccc" });
            $(".btnOrder").attr("clickable", "false");
        }
    });

    //选择食物类型或价位
    $(document).on("click", ".choose", function () {
        $(this).parent().parent().find(".choose").removeClass("bggreenstyle");
        $(this).addClass("bggreenstyle");
        var identity = $(this).attr("identity");
        var foodclassid;
        var minprice;
        var maxprice;
        if (identity == "kind") {
            foodclassid = $(this).attr("foodclassid");
            $("#kind").attr("foodclassid", foodclassid);
        } else {
            minprice = $(this).attr("minprice");
            maxprice = $(this).attr("maxprice");
            $("#price").attr("minprice", minprice); //将当前所选最低价位告知id的自定义属性
            $("#price").attr("maxprice", maxprice);
        }

        foodclassid = $("#kind").attr("foodclassid");
        minprice = $("#price").attr("minprice");
        maxprice = $("#price").attr("maxprice");
        //alert(foodclassid+minprice+maxprice);
        choosefoodlist(foodclassid, minprice, maxprice);
    });

    //数量加减
    $(document).on("click", ".pro_change", function () {
        var flag = $(this).attr("flag");
        var count = parseFloat($(this).parent().find(".pro_count").html());
        var foodid;
        if (flag == "add") {
            count++;
            $(this).prev().html(count);
            foodid = $(this).prev().attr("foodid");
            ModifyShopCount(count, foodid, userphone);
        } else {
            if (count == 1) {
                return;
            } else {
                count--;
                $(this).next().html(count);
                foodid = $(this).next().attr("foodid");
                ModifyShopCount(count, foodid, userphone);
            }
        }
        var perprice = parseFloat($("#food" + foodid).attr("price"));
        var multiprice = count * perprice;
        $("#food" + foodid).find(".multiprice").html("￥" + multiprice);
        $("#food" + foodid).find(".multiprice").attr("multiprice", multiprice);

        var sumprice = 0;
        $(".perfood").each(function () {
            sumprice += parseFloat($(this).find(".multiprice").attr("multiprice"));
        });

        $("#sumpriceArea").find(".text-right").html("合计：￥" + sumprice + ".00");
        $("#sumpriceArea").attr("sumprice", sumprice);
        if (sumprice >= 30) {
            $(".btnOrder").css({ "background-color": "#0f0" });
            $(".btnOrder").attr("clickable", "true");
        } else {
            $(".btnOrder").css({ "background-color": "#ccc" });
            $(".btnOrder").attr("clickable", "false");
        }
    });

    $(document).on("click", ".btnOrder", function () {
        var clickable = $(this).attr("clickable");
        if (clickable == "true") {
            if (userphone == "0") {
                alert("您还未登录。。。");
            } else {
                var ymd = GetYMD();
                var sumprice = $("#sumpriceArea").attr("sumprice");

                CreateOrder(ymd, userphone, sumprice);

            }
        } else {
            return;
        }
    });


});

//页面滚动时
function setPositon() {

    $(window).scroll(function () {
        if ($(window).scrollTop() >= 150) {
            $(".goodsClass").css({ "position": "fixed", "top": "100px", "left": "76px", "height": "40px" });
            $(".conLeft").css({ "position": "fixed", "top": "140px", "left": "76px" });
        }else {
            $(".goodsClass").css({ "position": "static" });
            $(".conLeft").css({ "position": "static" });
        }
    });

}

//选择食物列表
function choosefoodlist(foodclassid, minprice, maxprice) {
    //xXXXXXXX foodclassid minprice maxprice
    $.ajax({
        type: "post",
        url: "WebService.asmx/GetFoodList",
        data: "{foodclassid:'" + foodclassid + "',minprice:'" + minprice + "',maxprice:'" + maxprice + "'}",
        dataType: "json",
        async:false,
        contentType: "application/json",
        success: function (res) {
            $(".foodlist").html(res.d);
        }
    });
}


function GetYMD() {
    var ct = new Date();
    //年
    var year = ct.getYear();
    if (year < 314) {
        year = year + 1900;
    }
    
    //月
    var month = ct.getMonth();
    var m1 = Math.floor((month / 10) % 10);
    var m2 = Math.floor(month % 10 + 1);
    month = '' + m1 + m2;
    //日
    var day = ct.getDate();

    var ymd = '' + year + month + day;

    return ymd;
}

function CreateOrder(preorder, userphone, sumprice) {//CreateOrder(string preorder,string userphone,string sumprice)
    $.ajax({
        type: "post",
        url: "WebService.asmx/CreateOrder",
        data: "{preorder:'" + preorder + "',userphone:'" + userphone + "',sumprice:'" + sumprice + "'}",
        dataType: "json",
        async: false,
        contentType: "application/json",
        success: function (res) {
            if (res.d != "fail") {
                //                alert("创建成功");
                var orderid = '' + preorder + res.d;
                window.location.href = "OrderPage.aspx?orderid=" + orderid;

            }
        }
    });
}
//InsertShopinfo(int foodid, string userphone, int foodcount)
function InsertShopinfo(foodid, userphone, foodcount) {//CreateOrder(string preorder,string userphone,string sumprice)
    $.ajax({
        type: "post",
        url: "WebService.asmx/InsertShopinfo",
        data: "{foodid:'" + foodid + "',userphone:'" + userphone + "',foodcount:'" + foodcount + "'}",
        dataType: "json",
        async: false,
        contentType: "application/json",
        success: function (res) {
            if (res.d != "fail") {
                //alert("InsertShopinfo ok");
            }
        }
    });
}

//DeleShopinfo(foodid,userphone)
function DeleShopinfo(foodid,userphone) {//CreateOrder(string preorder,string userphone,string sumprice)
    $.ajax({
        type: "post",
        url: "WebService.asmx/DeleShopinfo",
        data: "{foodid:'" + foodid + "',userphone:'" + userphone + "'}",
        dataType: "json",
        async: false,
        contentType: "application/json",
        success: function (res) {
            if (res.d != "fail") {
                //alert("DeleShopinfo ok");
            }
        }
    });
}
//ModifyShopCount(int foodcount,int foodid,string userphone)
function ModifyShopCount(foodcount,foodid, userphone) {//CreateOrder(string preorder,string userphone,string sumprice)
    $.ajax({
        type: "post",
        url: "WebService.asmx/ModifyShopCount",
        data: "{foodcount:'" + foodcount + "',foodid:'" + foodid + "',userphone:'" + userphone + "'}",
        dataType: "json",
        async: false,
        contentType: "application/json",
        success: function (res) {
            if (res.d != "fail") {
                //alert("ModifyShopCount ok");
            }
        }
    });
}