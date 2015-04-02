$(function () {

    $(document).on("click", ".sig_btn", function () {
        var phoneid = $.trim($("#sig_mobile").find(".sig_input").val());
        var username = $.trim($("#sig_name").find(".sig_input").val());
        // alert(username);
        var userpwd = $.trim($("#sig_pwd").find(".sig_input").val());
        var againpwd = $.trim($("#sig_confirmpwd").find(".sig_input").val());
        var regphoneid = /^[1][358]\d{9}$/;
        var regusaname = /^[a-zA-Z]{2,14}$/;
        var regzhname = /^[u4e00-u9fa5]{2,4}$/;
        var regpwd = /^[a-zA-Z0-9_]{6,16}$/;
        if (phoneid == "") {
            $("#sig_mobile").find(".sig_erro").html(" x 手机号不能为空");
        } else {
            if (!regphoneid.test(phoneid)) {
                $("#sig_mobile").find(".sig_erro").html(" x 手机号格式不正确");
            } else {

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/CheckSignPhone",
                    dataType: "json",
                    contentType: "application/json",
                    data: "{phoneid:'" + phoneid + "'}",
                    success: function (res) {
                        if (res.d == "hassigned") {
                            $("#sig_mobile").find(".sig_erro").html(" ！ 该手机号已被注册");
                        } else {
                            $("#sig_mobile").find(".sig_erro").html("");
                        }
                    },
                    fail: function () {
                        $("#sig_mobile").find(".sig_erro").html(" ！ 该手机号注册失败");
                    }

                });

            }
        }
        if (username == "") {
            $("#sig_name").find(".sig_erro").html(" x 用户名不能为空");
        } else {
            $("#sig_name").find(".sig_erro").html();
            if (regusaname.test(username) || regzhname.test(username)) {
                $("#sig_name").find(".sig_erro").html(" x 用户名不符合要求");
            } else {
                $("#sig_name").find(".sig_erro").html("");
            }
        }
        if (userpwd == "") {
            $("#sig_pwd").find(".sig_erro").html(" x 密码不能为空");
        } else {
            if (!regpwd.test(userpwd)) {
                $("#sig_pwd").find(".sig_erro").html(" x 密码不符合要求");
            } else {
                $("#sig_pwd").find(".sig_erro").html("");
            }
        }
        if (againpwd == "") {
            $("#sig_confirmpwd").find(".sig_erro").html(" x 请确认密码");
        } else {
            if (userpwd != againpwd) {
                $("#sig_confirmpwd").find(".sig_erro").html(" x 密码输入不一致");
            } else {
                $("#sig_confirmpwd").find(".sig_erro").html("");
            }
        }
        var phoneerro = $("#sig_mobile").find(".sig_erro").html();
        var nameerro = $("#sig_name").find(".sig_erro").html();
        var pwderro = $("#sig_pwd").find(".sig_erro").html();
        var againerro = $("#sig_confirmpwd").find(".sig_erro").html();
        if (phoneerro == "" && nameerro == "" && pwderro == "" && againerro == "") {
        //插入注册信息
            $.ajax({
                type: "POST",
                url: "WebService.asmx/SignNote",
                dataType: "json",
                contentType: "application/json",
                data: "{phoneid:'" + phoneid + "',username:'" + username + "',pwd:'" + userpwd + "'}",
                success: function (res) {
                    if (res.d == "success") {
                        window.location.href = "login.aspx";
                    } else {
                        alert("注册失败");
                    }
                },
                fail: function () {
                    alert("注册失败！");
                }

            });
            
        }
    });

    //手机号获得与失去焦点
    $("#sig_mobile").find(".sig_input").focus(function () {
        $(this).parent().parent().find(".sig_erro").html("");
    });
    $("#sig_mobile").find(".sig_input").blur(function () {

        //查看此号码是否已被注册
        var val = $(this).val();
        if (val == "" || val == null) {
            return;
        } else {
            $.ajax({
                type: "POST",
                url: "WebService.asmx/CheckSignPhone",
                dataType: "json",
                contentType: "application/json",
                data: "{phoneid:'" + val + "'}",
                success: function (res) {
                    if (res.d == "hassigned") {
                        $("#sig_mobile").find(".sig_erro").html(" ！ 该手机号已被注册");
                    } else {
                        return;
                    }
                },
                fail: function () {
                    return;
                }

            });
        }
    });

    //用户名获得焦点
    $("#sig_name").find(".sig_input").focus(function () {
        $(this).parent().parent().find(".sig_erro").html("");
    });
    //密码获得焦点
    $("#sig_pwd").find(".sig_input").focus(function () {
        $(this).parent().parent().find(".sig_erro").html("");
    });
    //确认密码框获得焦点
    $("#sig_confirmpwd").find(".sig_input").focus(function () {
        $(this).parent().parent().find(".sig_erro").html("");
    });
});