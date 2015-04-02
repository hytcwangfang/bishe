$(function () {
    //alert("ok");
    //检查当前用户登录状态
    checkLoginState();
});

function checkLoginState() {
    $.ajax({
        type: "post",
        url: "WebService.asmx/readUserSession",
        data: "{}",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            alert(res.d["userphone"]);
            if (res.d == null) {
                var html = '欢迎来到中华外卖！请{ <span class="login">登录</span> } <a href="sign.aspx" class="sign"> 免费注册</a></span>';
                $("#Welcome").html(html);

            }
            else {
                var html = '<span class="redStyle">' + res.d["UserName"] + '</span>,欢迎来到中华外卖！ ';
                html += '<span class="btnCancel">  注销</span>';
                $("#Welcome").html(html);
            }
        }
    });
}