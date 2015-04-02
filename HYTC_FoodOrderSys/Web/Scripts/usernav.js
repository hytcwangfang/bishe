$(function () {

    var userphone = $("#userphone").attr("userphone");
    var orderid = $("#userphone").attr("orderid");

    //是否选中当前食物
    $(document).on("click", ".noclickimg", function () {
        var clickstate = $(this).attr("clickstate");
        if (clickstate == "no") {
            $(this).attr("src", "images_tool/qiyifaith2.jpg");
            $(this).attr("clickstate", "yes");
        } else {
            $(this).attr("src", "images_tool/comtype.jpg");
            $(this).attr("clickstate", "no");
        }
    });

    //选择食物类型或价位
    $(document).on("click", ".choose", function () {
        $(this).parent().parent().find(".choose").removeClass("bggreenstyle");
        $(this).addClass("bggreenstyle");
    });

    //添加新地址按钮
    $(document).on("click", ".addaddr", function () {
        $(".addrMeng").show();
    });
    //蒙板添加新地址页面关闭按钮样式变化
    $(".addrcloselog").hover(function () {
        var linksrc = $(this).attr(".linksrc");
        $(this).attr("src", "images_tool/xxx2.png")
    }, function () {
        $(this).attr("src", "images_tool/xxx1.png")
    });
    //蒙板添加新地址页面关闭
    $(document).on("click", ".addrcloselog", function () {
        $(".addrMeng").hide();
    });

    //保存、取消添加新地址按钮
    $(document).on("click", ".addr_btn", function () {
        var jobname = $(this).attr("jobname");
        if (jobname == "cancel") {
            //取消按钮
            $(".addrMeng").hide();
        } else {
            //保存按钮
        }
    });

    $(document).on("click", ".btn_confirm", function () {
        if (orderid == "0" || userphone == "0") {
            return;
        } else {
            ConfirmOrder(orderid, userphone);
        }
    });
});

//ConfirmOrder(string orderid,string userphone)
function ConfirmOrder(orderid, userphone) {//CreateOrder(string preorder,string userphone,string sumprice)
    $.ajax({
        type: "post",
        url: "WebService.asmx/ConfirmOrder",
        data: "{orderid:'" + orderid + "',userphone:'" + userphone + "'}",
        dataType: "json",
        async: false,
        contentType: "application/json",
        success: function (res) {
            if (res.d == "success") {
                alert("您的订单已成功提交，请记住您的订单号：" + orderid);
            } else {
                //alert("提交失败");
                alert(res.d);
            }
        }
    });
}