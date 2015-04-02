$(function () {
 
    //验证登录
	$(document).on("click",".log_btn",function(){

		var mobile = $.trim($("#userId").val());
		var pwd = $.trim($("#userPwd").val());
 
		if(mobile == "" || pwd == "")
		{
		  $(".log_erro").html("手机号或密码不能为空！");
		}else{
			var regmobile = /^[1][358]\d{9}$/;  
		 	var regpwd = /^[a-zA-Z0-9]{6,16}$/;
			if(!regmobile.test(mobile) && !regpwd.test(pwd))
			{
			    $(".log_erro").html("手机号与密码格式输入不正确！");
			    return false;
			}
			if(!regmobile.test(mobile) && regpwd.test(pwd))
			{
				$(".log_erro").html("手机号输入不正确！");
			    return false;
			}
			if(regmobile.test(mobile) && !regpwd.test(pwd))
			{
				$(".log_erro").html("密码格式输入不正确！");
			    return false;
			}
			if(regmobile.test(mobile) && regpwd.test(pwd))
			{
				$(".log_erro").html("");
		 		login(mobile,pwd);
			}
		}
	});
});
//核实登录信息是否符合
function login(userid,pwd){
    $.ajax({
        type: "POST",
        url: "WebService.asmx/checklogin",
        dataType: "json",
        contentType: "application/json",
        data: "{phoneid:'" + userid + "',pwd:'"+pwd+"'}",
        success: function (res) {
            if (res.d == "success") {
                window.location.href = "Home.aspx";
            } else {
                $(".log_erro").html("手机号与密码不符合！！")
            }
        }

    });

}