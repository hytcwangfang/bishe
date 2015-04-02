<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Background.aspx.cs" Inherits="Web.Background" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <link href="Styles/themes/default/default.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="Styles/bootstrap.css" />
    <link href="Styles/public.css" rel="stylesheet" type="text/css" />
    <link href="Styles/foodmenu.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="Styles/Admin.css">
	<title>中华外卖后台系统</title>
	<script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script src="Scripts/kindeditor.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/Admin.js"></script>
    <script src="Scripts/lang/zh_CN.js" type="text/javascript"></script>
    <script>
      KindEditor.ready(function (K) {
          var editor = K.editor({
              allowFileManager: true
          });
         K('.chooseimage').click(function() {
				editor.loadPlugin('image', function() {
				    editor.plugin.imageDialog({
						showRemote : true,
						imageUrl : K('#url3').val(),
						clickFn : function(url, title, width, height, border, align) {
							K('#url3').val(url);
							editor.hideDialog();
						}
					});
				});
			});
		});
   </script>
   <script src="Scripts/background.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="ad_header">
        <a href="#" class="ad_logo"><b>中华外卖</b>后台</a>
        <span class="glyphicon glyphicon-th-list nav_size varsizebtn" IsOpen="true"></span>
        <nav class="navbar pull-right">
            <ul class="nav navbar-nav" id="navheader">
                <li class="dropdown ">
                    <a href="#" class="nav_size data-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                        <span class="greencol ad_head_count">4</span>
                    </a>
                    <ul class="dropdown-menu navmenu">
                        <li class="menu_header">You have 4 messages</li>
                        <li class="menu_con">
                            <a href="" class="menu_con_a">
                                <img src="../imgages/" class="menu_con_img">
                                <div class="menu_con_con">
                                    <div class="ad_con_alarm">
                                        <span class="glyphicon glyphicon-alarm"></span>
                                        <span>5 minutes</span>
                                    </div>
                                    <span class="menu_con_from">Support Team</span>
                                    <span class="menu_con_msg">Why not buy a new awesome theme?</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown ">
                    <a href="#" class="nav_size data-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-bell"></i>
                        <span class="yellowcol ad_head_count">9</span>
                    </a>
                    <ul class="dropdown-menu navmenu">
                        <li class="menu_header">You have 4 messages</li>
                        <li class="menu_con">
                            <a href="" class="menu_con_a">
                            <img src="../imgages/" class="menu_con_img" />
                            <div class="menu_con_con">
                                <div class="ad_con_alarm">
                                <span class="glyphicon-alarm"></span>
                                <span>5 minutes</span>
                                </div>
                                <span class="menu_con_from">Support Team</span>
                                <span class="menu_con_msg">Why not buy a new awesome theme?</span>
                            </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown ">
                    <a href="#" class="nav_size data-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-flag"></i>
                    <span class="redcol ad_head_count">10</span>
                    </a>
                    <ul class="dropdown-menu navmenu">
                    <li class="menu_header">You have 4 messages</li>
                    <li class="menu_con">
                        <a href="" class="menu_con_a">
                        <img src="../imgages/" class="menu_con_img" />
                        <div class="menu_con_con">
                            <div class="ad_con_alarm">
                            <span class="glyphicon-alarm"></span>
                            <span>5 minutes</span>
                            </div>
                            <span class="menu_con_from">Support Team</span>
                            <span class="menu_con_msg">Why not buy a new awesome theme?</span>
                        </div>
                        </a>
                    </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="nav_size data-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i>
                    <span class="ad_head_count">1</span>
                    </a>
                    <ul class="dropdown-menu navmenu">
                        <li class="menu_header">You have 4 messages</li>
                        <li class="menu_con">
                            <a href="" class="menu_con_a">
                            <img src="../imgages/" class="menu_con_img" />
                            <div class="menu_con_con">
                                <div class="ad_con_alarm">
                                <span class="glyphicon-alarm"></span>
                                <span>5 minutes</span>
                                </div>
                                <span class="menu_con_from">Support Team</span>
                                <span class="menu_con_msg">Why not buy a new awesome theme?</span>
                            </div>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <ul class="nav nav-tabs" id="navmenu">
      <li class="active"><a href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-plus"></span> 添加</a></li>
      <li><a href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-trash"></span> 删除</a></li>
      <li><a href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-edit"></span> 修改</a></li>
      <li><a href="#tab4" data-toggle="tab"><span class="glyphicon glyphicon-search"></span> 查找</a></li>
    </ul>
    <div class="tab-content" id="alltabcontent">

      <!-- 添加start -->
      <div class="tab-pane active" id="tab1">
        <ul class="nav nav-style nav-stacked leftnav">
          <li class="active"><a href="#tab1-tab1-tab1" data-toggle="tab" IsHasHeader="true" HeaderId="tab1-header1-1" id="tab1-leftmenu1-1" tabid="tab1">菜品种类</a></li>
          <li><a href="#tab1-tab1-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab1-header1-2" id="tab1-leftmenu1-2" tabid="tab1">菜品信息</a></li>
          <li><a href="#tab1-tab5-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab1-header5-1" id="tab1-leftmenu5-1" tabid="tab1">工作状态</a></li>
          <li><a href="#tab1-tab6" data-toggle="tab" IsHasHeader="false" HeaderId="tab1-header6-0" id="tab1-leftmenu6-0" tabid="tab1">通知信息</a></li>
        </ul>
        <div class="tab-content righttabcon">
          <ul class="nav" id="tab1-conHeaders">
            <li id="tab1-header1-1" class="flashtitle activeHeader role-header" linkleftid="tab1-leftmenu1-1">
              <a href="#tab1-tab1-1" data-toggle="tab" class="role-header-a">
                <span class="titlename">菜品种类</span>
                <span class="glyphicon glyphicon-remove closeicon" tabid="tab1"></span>
              </a>
            </li>
          </ul>        
          <%--添加菜品种类begin--%>
           <div class="tab-pane active" id="tab1-tab1-tab1">
               <table class="table text-center table-bordered">
                   <caption class="table-title">添加菜品种类</caption>
                   <thead>
                        <tr>
                            <td>新种类名称</td>
                            <td>种类图片</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input class="classinput" type="text" /></td>
                            <td>
                                <div class="centerdiv text-center"><input class="classinput imginput pull-left" type="text" id="url3" />
                                    <span class="btnchooseimg chooseimage" id="image3">选择图片</span>
                                </div>
                                <%--<p><input type="text" id="Text1" value="" /> <input type="button" id="Button1" value="选择图片" />（本地上传）</p>--%>
                            </td>
                            <td>
                                <div class="centerdiv text-center">
                                    <span class="txtaction clearaction" parent="parent3">清空</span>
                                    <span class="txtaction delaction" parent="parent3" delerowable="false">删除行</span>
                                    <span class="txtaction conaction" actionclass="addfoodclass" parent="parent3">继续</span>
                                </div>
                            </td>
                        </tr>
                   </tbody>
               </table>
               <span class="btnaction pull-right">全部添加</span>
           </div>
           <%--添加菜品种类end--%>

           <%--添加菜品信息begin--%>
           <div class="tab-pane" id="tab1-tab1-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">添加菜品信息</caption>
                   <thead>
                        <tr>
                            <td>菜名 <span class="redcol">(必填)</span></td>
                            <td>菜品价格 <span class="redcol">(必填)</span></td>
                            <td>菜品图片 <span class="redcol">(必填)</span></td>
                            <td>详细说明 <span class="greencol">(选填)</span></td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input class="classinput" type="text" /></td>
                            <td><input class="classinput rewidth-input100" type="text" /></td>
                            <td><input class="classinput imginput pull-left" type="text" /><span class="btnchooseimg chooseimage">选择图片</span></td>
                            <td><input class="classinput imginput" type="text" placeHolder="详情介绍" /></td>
                            <td>
                                <span class="txtaction clearaction" parent="parent2">清空</span>
                                <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                <span class="txtaction conaction" actionclass="addfoodinfo" parent="parent2">继续</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
               <span class="btnaction pull-right">全部添加</span>
           </div>
           <%--添加菜品信息end--%>

           <%--添加工作状态信息begin--%>
           <div class="tab-pane" id="tab1-tab5-tab1">
                <ul class="addstatelist text-center">
                    <li class="percentage20">
                        <table class="table-bordered">
                            <thead>
                                <tr class="redcol">    
                                    <td>工作状态名称</td>
                                    <td>操作</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="classinput stateinput" type="text" /></td>
                                    <td>
                                        <span class="txtaction clearaction" parent="parent2">清空</span>
                                        <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                        <span class="txtaction conaction" actionclass="addState" parent="parent2">继续</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span class="btnaction">添加</span>
                    </li>
                    <li class="percentage20">
                        <table class="table-bordered">
                            <thead>
                                <tr class="greencol">    
                                    <td>用户状态名称</td>
                                    <td>操作</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="classinput stateinput" type="text" /></td>
                                    <td>
                                        <span class="txtaction clearaction" parent="parent2">清空</span>
                                        <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                        <span class="txtaction conaction" actionclass="addState" parent="parent2">继续</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span class="btnaction">添加</span>
                    </li>
                    <li class="percentage20">
                        <table class="table-bordered">
                            <thead>
                                <tr class="greencol">    
                                    <td>通知状态名称</td>
                                    <td>操作</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="classinput stateinput" type="text" /></td>
                                    <td>
                                        <span class="txtaction clearaction" parent="parent2">清空</span>
                                        <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                        <span class="txtaction conaction" actionclass="addState" parent="parent2">继续</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span class="btnaction">添加</span>
                    </li>
                    <li class="percentage20">
                        <table class="table-bordered">
                            <thead class="redcol">
                                <tr>    
                                    <td>信息状态名称</td>
                                    <td>操作</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="classinput stateinput" type="text" /></td>
                                    <td>
                                        <span class="txtaction clearaction" parent="parent2">清空</span>
                                        <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                        <span class="txtaction conaction" actionclass="addState" parent="parent2">继续</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span class="btnaction">添加</span>
                    </li>
                </ul>
           </div>  
           <%--添加工作状态信息end--%>          

           <%--添加通知信息begin--%>          
           <div class="tab-pane" id="tab1-tab6">
                <table class="table text-center table-bordered">
                   <caption class="table-title">添加通知信息</caption>
                   <thead>
                        <tr>
                            <td>通知内容 <span class="redcol">(必填)</span></td>
                            <td>创建时间 <span class="redcol">(必填)</span></td>
                            <td>通知状态 <span class="redcol">(必填)</span></td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><textarea class="textareacon"></textarea></td>
                            <td><input class="classinput rewidth-input100 pull-left" type="text" /><span class="glyphicon glyphicon-time pull-left"></span></td>
                            <td>
                                <select class="selclass">
                                    <option>通知状态</option>
                                    <option>已公告</option>
                                    <option>未公告</option>
                                    <option>公告中</option>
                                </select>
                            </td>
                            <td>
                                <span class="txtaction clearaction" parent="parent2">清空</span>
                                <span class="txtaction delaction" parent="parent2" delerowable="false">删除行</span>
                                <span class="txtaction conaction" actionclass="addNotice" parent="parent2">继续</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
               <span class="btnaction pull-right">全部添加</span>
           </div> 
           <%--添加通知信息end--%> 
        </div>
      </div>
       <!-- 添加end -->
       <!-- 删除start -->
      <div class="tab-pane" id="tab2">
        <ul class="nav nav-style nav-stacked leftnav">
          <li class="active"><a href="#tab2-tab1-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header1-1" id="tab2-leftmenu1-1" tabid="tab2">菜品种类</a></li>
          <li><a href="#tab2-tab1-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header1-2" id="tab2-leftmenu1-2" tabid="tab2">菜品信息</a></li>
          <li><a href="#tab2-tab2-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header2-2" id="tab2-leftmenu2-2" tabid="tab2">员工信息</a></li>
          <li><a href="#tab2-tab2-tab3" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header2-3" id="tab2-leftmenu2-3" tabid="tab2">管理员信息</a></li>
          <li><a href="#tab2-tab3-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header3-2" id="tab2-leftmenu3-2" tabid="tab2">订单信息</a></li>
          <li><a href="#tab2-tab6" data-toggle="tab" IsHasHeader="false" HeaderId="tab2-header6-0" id="tab2-leftmenu6-0" tabid="tab2">通知信息</a></li>
        </ul>
        <div class="tab-content righttabcon">
          <ul class="nav" id="tab2-conHeaders">
            <li id="tab2-header1-1" class="flashtitle activeHeader role-header" linkleftid="tab2-leftmenu1-1">
              <a href="#tab2-tab1-1" data-toggle="tab" class="role-header-a">
                <span class="titlename">菜品种类</span>
                <span class="glyphicon glyphicon-remove closeicon" tabid="tab2"></span>
              </a>
            </li>
          </ul>
        <%--删除菜品种类begin--%>        
        <div class="tab-pane active" id="tab2-tab1-tab1">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入菜品种类名称" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="tableArea">
                <table class="table text-center table-bordered clearfix">
                    <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>新种类名称</td>
                            <td>种类图片</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody>
                    <asp:Repeater runat="server" ID="redelclass">
                        <ItemTemplate>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td><span class="greenStyle"><%# Eval("classname") %></span></td>
                                <td><div class="centerdiv text-center txtoverflow"><%# Eval("classimg") %></div></td>
                                <td>
                                    <span class="txtaction delaction">删除行</span>
                                    <span class="txtaction conaction">删除</span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                        
                    </tbody>
                </table>    
            </div>
            <%--<table class="table text-center table-bordered">
                   <caption class="table-title">添加菜品种类</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>新种类名称</td>
                            <td>种类图片</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="classinput stateinput txtoverflow">alskalskalskalskalskalskalskngalrng;jlwe</span></td>
                            <td><div class="centerdiv text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>--%>
        </div>
        <%--删除菜品种类end--%> 

        <%--删除菜品信息begin--%> 
        <div class="tab-pane" id="tab2-tab1-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">添加菜品信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>菜名</td>
                            <td>菜品价格</td>
                            <td>菜品图片</td>
                            <td>详细说明</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="classinput">12345</span></td>
                            <td><span class="classinput rewidth-input100">234</span></td>
                            <td><div class="centerdiv stateinput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td><div class="centerdiv imginput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--删除菜品信息end--%> 

        <%--删除员工信息begin--%> 
        <div class="tab-pane" id="tab2-tab2-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">删除员工信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>员工号</td>
                            <td>姓名</td>
                            <td>性别</td>
                            <td>年龄</td>
                            <td>生日</td>
                            <td>手机号</td>
                            <td>职称</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">20150001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td>女</td>
                            <td>23</td>
                            <td>0609</td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td><span class="greenStyle">厨师</span></td>
                            <td>正式员工</td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--删除员工信息end--%> 

        <%--删除管理员信息begin--%> 
        <div class="tab-pane" id="tab2-tab2-tab3">
            <table class="table text-center table-bordered">
                   <caption class="table-title">删除员工信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>管理帐号</td>
                            <td>姓名</td>
                            <td>性别</td>
                            <td>年龄</td>
                            <td>生日</td>
                            <td>手机号</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">20150001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td>女</td>
                            <td>23</td>
                            <td>0609</td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>正式员工</td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--删除管理员信息end--%> 

        <%--删除订单信息begin--%> 
        <div class="tab-pane" id="tab2-tab3-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">删除订单信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>订单号</td>
                            <td>用户姓名</td>
                            <td>用户手机号</td>
                            <td>订单状态</td>
                            <td>总费用</td>
                            <td>处理人</td>
                            <td>订单备注</td>
                            <td>创建时间</td>
                            <td>预定时间</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">201503210001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>处理中</td>
                            <td>44</td>
                            <td><span class="redStyle">李丽</span></td>
                            <td></td>
                            <td>2015-03-21 23:46:38</td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>              
        <%--删除订单信息end--%> 

        <%--删除通知信息begin--%> 
        <div class="tab-pane" id="tab2-tab6">
            <table class="table text-center table-bordered">
                   <caption class="table-title">删除通知信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>通知内容</td>
                            <td>创建时间</td>
                            <td>通知状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><div class="centerdiv imginput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td><span class="redStyle">已公告</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div> 
        <%--删除通知信息end--%> 
        </div>
      </div>
      <!-- 删除end -->
      <!-- 修改start -->
      <div class="tab-pane" id="tab3">
        <ul class="nav nav-style nav-stacked leftnav">
          <li class="active"><a href="#tab3-tab1-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header1-1" id="tab3-leftmenu1-1" tabid="tab3">菜品种类</a></li>
          <li><a href="#tab3-tab1-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header1-2" id="tab3-leftmenu1-2" tabid="tab3">菜品信息</a></li>
          <li><a href="#tab3-tab2-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header2-2" id="tab3-leftmenu2-2" tabid="tab3">员工信息</a></li>
          <li><a href="#tab3-tab2-tab3" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header2-3" id="tab3-leftmenu2-3" tabid="tab3">管理员信息</a></li>
          <li><a href="#tab3-tab3-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header3-2" id="tab3-leftmenu3-2" tabid="tab3">订单信息</a></li>
          <li><a href="#tab3-tab6" data-toggle="tab" IsHasHeader="false" HeaderId="tab3-header6-0" id="tab3-leftmenu6-0" tabid="tab3">通知信息</a></li>
        </ul>
        <div class="tab-content righttabcon">
          <ul class="nav" id="tab3-conHeaders">
            <li id="tab3-header1-1" class="flashtitle activeHeader role-header" linkleftid="tab3-leftmenu1-1">
              <a href="#tab3-tab1-1" data-toggle="tab" class="role-header-a">
                <span class="titlename">菜品种类</span>
                <span class="glyphicon glyphicon-remove closeicon" tabid="tab3"></span>
              </a>
            </li>
          </ul>        
        <%--修改菜品种类begin--%>        
        <div class="tab-pane active" id="tab3-tab1-tab1">
            <table class="table text-center table-bordered">
                <caption class="table-title">修改菜品种类</caption>
                <thead>
                    <tr>
                        <td><input type="checkbox" /> 选择全部</td>
                        <td>新种类名称</td>
                        <td>种类图片</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="classinput stateinput txtoverflow">alskalskalskalskalskalskalskngalrng;jlwe</span></td>
                        <td><div class="centerdiv text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                        <td>
                            <span class="txtaction delaction">删除行</span>
                            <span class="txtaction conaction">删除</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--修改菜品种类end--%>   

        <%--修改菜品信息begin--%> 
        <div class="tab-pane" id="tab3-tab1-tab2">
            <table class="table text-center table-bordered">
                <caption class="table-title">修改菜品信息</caption>
                <thead>
                    <tr>
                        <td><input type="checkbox" /> 选择全部</td>
                        <td>菜名</td>
                        <td>菜品价格</td>
                        <td>菜品图片</td>
                        <td>详细说明</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="classinput">12345</span></td>
                        <td><span class="classinput rewidth-input100">234</span></td>
                        <td><div class="centerdiv stateinput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                        <td><div class="centerdiv imginput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                        <td>
                            <span class="txtaction delaction">删除行</span>
                            <span class="txtaction conaction">删除</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--修改菜品信息end--%> 

        <%--修改员工信息begin--%> 
        <div class="tab-pane" id="tab3-tab2-tab2">
            <table class="table text-center table-bordered">
                <caption class="table-title">修改员工信息</caption>
                <thead>
                    <tr>
                        <td><input type="checkbox" /> 选择全部</td>
                        <td>员工号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>生日</td>
                        <td>手机号</td>
                        <td>职称</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="greenStyle">20150001</span></td>
                        <td><span class="redStyle">王静静</span></td>
                        <td>女</td>
                        <td>23</td>
                        <td>0609</td>
                        <td><span class="redStyle">18021917923</span></td>
                        <td><span class="greenStyle">厨师</span></td>
                        <td>正式员工</td>
                        <td>
                            <span class="txtaction delaction">删除行</span>
                            <span class="txtaction conaction">删除</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--修改员工信息end--%> 

        <%--修改管理员信息begin--%> 
        <div class="tab-pane" id="tab3-tab2-tab3">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改员工信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>管理帐号</td>
                            <td>姓名</td>
                            <td>性别</td>
                            <td>年龄</td>
                            <td>生日</td>
                            <td>手机号</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">20150001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td>女</td>
                            <td>23</td>
                            <td>0609</td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>正式员工</td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--修改管理员信息end--%>
         
        <%--修改订单信息begin--%> 
        <div class="tab-pane" id="tab3-tab3-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改订单信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>订单号</td>
                            <td>用户姓名</td>
                            <td>用户手机号</td>
                            <td>订单状态</td>
                            <td>总费用</td>
                            <td>处理人</td>
                            <td>订单备注</td>
                            <td>创建时间</td>
                            <td>预定时间</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">201503210001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>处理中</td>
                            <td>44</td>
                            <td><span class="redStyle">李丽</span></td>
                            <td></td>
                            <td>2015-03-21 23:46:38</td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--修改订单信息end--%> 
                      
        <%--修改通知信息start--%> 
        <div class="tab-pane" id="tab3-tab6">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改通知信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>通知内容</td>
                            <td>创建时间</td>
                            <td>通知状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><div class="centerdiv imginput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td><span class="redStyle">已公告</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>
        <%--修改通知信息end--%> 

        </div>
      </div>
      <!-- 修改end -->
      <!-- 查找start -->
      <div class="tab-pane" id="tab4">
        <ul class="nav nav-style nav-stacked leftnav">
          <li>
            <a class="myinfo" IsOpen="false"><span class="glyphicon glyphicon-chevron-right"></span> 关于菜单</a>
            <ul class="nav nav-stacked myinfonav">
              <li class="active"><a href="#tab4-tab1-tab1" data-toggle="tab" IsHasHeader="true" HeaderId="tab4-header1-1" id="tab4-leftmenu1-1" tabid="tab4">菜品种类</a></li>
              <li><a href="#tab4-tab1-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header1-2" id="tab4-leftmenu1-2" tabid="tab4">菜品信息</a></li>
            </ul>
          </li>
          <li>
              <a class="myinfo" IsOpen="false">
                  <span class="glyphicon glyphicon-chevron-right"></span> 关于人员
              </a>
            <ul class="nav nav-stacked myinfonav">
              <li><a href="#tab4-tab2-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header2-1" id="tab4-leftmenu2-1" tabid="tab4">用户信息</a></li>
              <li><a href="#tab4-tab2-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header2-2" id="tab4-leftmenu2-2" tabid="tab4">员工信息</a></li>
              <li><a href="#tab4-tab2-tab3" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header2-3" id="tab4-leftmenu2-3" tabid="tab4">管理员信息</a></li>
            </ul>
          </li>
          <li>
            <a class="myinfo" IsOpen="false"><span class="glyphicon glyphicon-chevron-right"></span> 关于购物</a>
            <ul class="nav nav-stacked myinfonav">
              <li><a href="#tab4-tab3-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header3-1" id="tab4-leftmenu3-1" tabid="tab4">购物车</a></li>
              <li><a href="#tab4-tab3-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header3-2" id="tab4-leftmenu3-2" tabid="tab4">订单信息</a></li>
            </ul>
          </li>
          <li>
            <a class="myinfo" IsOpen="false"><span class="glyphicon glyphicon-chevron-right"></span> 留言板</a>
            <ul class="nav nav-stacked myinfonav">
              <li><a href="#tab4-tab4-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header4-1" id="tab4-leftmenu4-1" tabid="tab4">系统留言</a></li>
              <li><a href="#tab4-tab4-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header4-2" id="tab4-leftmenu4-2" tabid="tab4">用户留言</a></li>
              <li><a href="#tab4-tab4-tab3" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header4-3" id="tab4-leftmenu4-3" tabid="tab4">员工留言</a></li>
            </ul>
          </li>
          <li>
            <a class="myinfo" IsOpen="false"><span class="glyphicon glyphicon-chevron-right"></span> 状态信息</a>
            <ul class="nav nav-stacked myinfonav">
              <li><a href="#tab4-tab5-tab1" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header5-1" id="tab4-leftmenu5-1" tabid="tab4">工作状态</a></li>
              <li><a href="#tab4-tab5-tab2" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header5-2" id="tab4-leftmenu5-2" tabid="tab4">用户状态</a></li>
              <li><a href="#tab4-tab5-tab3" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header5-3" id="tab4-leftmenu5-3" tabid="tab4">通知状态</a></li>
              <li><a href="#tab4-tab5-tab4" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header5-4" id="tab4-leftmenu5-4" tabid="tab4">信息状态</a></li>
            </ul>
          </li>
          <li><a href="#tab4-tab6" data-toggle="tab" IsHasHeader="false" HeaderId="tab4-header6-0" id="tab4-leftmenu6-0" tabid="tab4">通知信息</a></li>
        </ul>
        <div class="tab-content righttabcon">
          <ul class="nav" id="tab4-conHeaders">
            <li id="tab4-header1-1" class="flashtitle activeHeader role-header" linkleftid="tab4-leftmenu1-1">
              <a href="#tab4-tab1-tab1" data-toggle="tab" class="role-header-a">
                <span class="titlename">菜品种类</span>
                <span class="glyphicon glyphicon-remove closeicon" tabid="tab4"></span>
              </a>
            </li>
          </ul>       
          
           <%--查找菜品种类--%>
        <div class="tab-pane active" id="tab4-tab1-tab1">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入菜品种类名称" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="tableArea">
                <table class="table text-center table-bordered clearfix">
                    <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>新种类名称</td>
                            <td>种类图片</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody>
                    <asp:Repeater runat="server" ID="bgfoodclass">
                        <ItemTemplate>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td><span class="greenStyle"><%# Eval("classname") %></span></td>
                                <td><div class="centerdiv text-center txtoverflow"><%# Eval("classimg") %></div></td>
                                <td>
                                    <span class="txtaction delaction">删除行</span>
                                    <span class="txtaction conaction">删除</span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                        
                    </tbody>
                </table>    
            </div>
        </div>

         <%--菜品信息--%>
         <script src="Scripts/foodmenu.js" type="text/javascript"></script>

        <div class="tab-pane" id="tab4-tab1-tab2">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入菜的名称" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="foodclass">
                <ul class="pro_type">
					<li class="pro_type" id="kind" foodclassid="0">
						<div class="pro_text">类别:</div>
						<ul class="pro_ways">
							<li class="pro_post">
								<span class="pro_large choose bggreenstyle" identity="kind" foodclassid="0">全部</span>
							</li>
                            <asp:Repeater runat="server" ID="bgfoodclass2">
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <li class="pro_post">
									    <span class="pro_large choose" identity="kind" foodclassid="<%# Eval("classid") %>"><%# Eval("classname") %></span>
								    </li>
                                </ItemTemplate>
                                <FooterTemplate></FooterTemplate>
                            </asp:Repeater>
						</ul>
					</li>
					<li class="pro_type proborder" id="price" minprice="all" maxprice="all">
						<div class="pro_text">价位:</div>
						<ul class="pro_ways">
							<li class="pro_post">
								<span class="pro_large bggreenstyle choose" identity="price" minprice="all" maxprice="all">全部</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="0" identity="price" maxprice="10">小于￥10</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="11" identity="price" maxprice="20">￥11-20</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="21" identity="price" maxprice="30">￥21-30</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="31" identity="price" maxprice="40">￥31-40</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="41" identity="price" maxprice="50">￥41-50</span>
							</li>
							<li class="pro_post">
								<span class="pro_large choose" minprice="51" identity="price" maxprice="all">￥大于50</span>
							</li>
						</ul>
					</li>
				</ul>
            </div>
            <table class="table text-center table-bordered">
                <thead>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>菜名</td>
                        <td>价格</td>
                        <td>图片地址</td>
                        <td>食物类别</td>
                        <td>详细说明</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="bgfoodinfo">
                        <ItemTemplate>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td><span class="classinput redStyle" title="<%# Eval("foodname") %>"><%# Eval("foodname") %></span></td>
                                <td><span class="classinput rewidth-input100"><%# Eval("foodprice") %></span></td>
                                <td><div class="centerdiv stateinput text-center txtoverflow" title="<%# Eval("foodimg") %>"><%# Eval("foodimg") %></div></td>
                                <td><span class="classinput greenStyle"><%# Eval("foodclassname") %></span></td>
                                <td><div class="centerdiv text-center txtoverflow" title="<%# Eval("fooddes") %>"><%# Eval("fooddes") %></div></td>
                                <td>
                                    <span class="txtaction delaction">删除行</span>
                                    <span class="txtaction conaction">删除</span>
                                </td>
                            </tr>   
                        </ItemTemplate> 
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

         <%--用户信息--%>
        <div class="tab-pane" id="tab4-tab2-tab1">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入用户姓名或手机号" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="tableArea">
            <table class="table text-center table-bordered">
                <thead>
                    <tr>
                        <td>头像</td>
                        <td>手机号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>生日</td>
                        <td>地址</td>
                        <td>QQ号</td>
                        <td>Mail</td>
                        <td>等级</td>
                        <td>积分</td>
                        <td>信誉度</td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="reuserlist">
                        <ItemTemplate>
                            <tr>
                                <td><img src="<%# Eval("userimg") %>" class="bgheadimg" alt="?" /></td>
                                <td><span class="greenStyle"><%# Eval("userphone") %></span></td>
                                <td><span class="redStyle"><%# Eval("username") %></span></td>
                                <td><%# Eval("usergender")%></td>
                                <td><%# Eval("userage")%></td>
                                <td><%# String.Format("{0:d}", Eval("userbirth"))%></td>
                                <td><span class="classinput txtoverflow"><%# Eval("useraddr")%></span></td>
                                <td><%# Eval("userqq")%></td>
                                <td><%# Eval("usermail")%></td>
                                <td><%# Eval("userlevel")%></td>
                                <td><%# Eval("userscore")%></td>
                                <td><%# Eval("userfaith")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </tbody>
            </table>
            </div>
        </div>
         <%--员工信息--%>
        <div class="tab-pane" id="tab4-tab2-tab2">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入员工号、姓名、手机号或身份证号" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="tableArea">
             <table class="table text-center table-bordered">
                <thead>
                    <tr>
                        <td><input type="checkbox" /> 选择全部</td>
                        <td>员工号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>生日</td>
                        <td>手机号</td>
                        <td>职称</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="greenStyle">20150001</span></td>
                        <td><span class="redStyle">王静静</span></td>
                        <td>女</td>
                        <td>23</td>
                        <td>0609</td>
                        <td><span class="redStyle">18021917923</span></td>
                        <td><span class="greenStyle">厨师</span></td>
                        <td>正式员工</td>
                        <td>
                            <span class="txtaction delaction">删除行</span>
                            <span class="txtaction conaction">删除</span>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>
        </div>
         <%--管理员信息--%>
        <div class="tab-pane" id="tab4-tab2-tab3">
            <div class="que_searchBox">
				<div class="company"><img src="images_tool/search.jpg" class="comImg" /></div>
				<input type="text" placeHolder="请输入管理员帐号、姓名、手机号或身份证号" class="que_searchInput" />
				<a href="#">搜索</a>
			</div>
            <div class="tableArea">
            <table class="table text-center table-bordered">
                <thead>
                    <tr>
                        <td><input type="checkbox" /> 选择全部</td>
                        <td>员工号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>生日</td>
                        <td>手机号</td>
                        <td>职称</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="greenStyle">20150001</span></td>
                        <td><span class="redStyle">王静静</span></td>
                        <td>女</td>
                        <td>23</td>
                        <td>0609</td>
                        <td><span class="redStyle">18021917923</span></td>
                        <td><span class="greenStyle">厨师</span></td>
                        <td>正式员工</td>
                        <td>
                            <span class="txtaction delaction">删除行</span>
                            <span class="txtaction conaction">删除</span>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>
        </div>
         <%--购物车信息--%>
        <div class="tab-pane" id="tab4-tab3-tab1">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改订单信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>订单号</td>
                            <td>用户姓名</td>
                            <td>用户手机号</td>
                            <td>订单状态</td>
                            <td>总费用</td>
                            <td>处理人</td>
                            <td>订单备注</td>
                            <td>创建时间</td>
                            <td>预定时间</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">201503210001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>处理中</td>
                            <td>44</td>
                            <td><span class="redStyle">李丽</span></td>
                            <td></td>
                            <td>2015-03-21 23:46:38</td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>              
         <%--订单信息--%>
        <div class="tab-pane" id="tab4-tab3-tab2">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改订单信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>订单号</td>
                            <td>用户姓名</td>
                            <td>用户手机号</td>
                            <td>订单状态</td>
                            <td>总费用</td>
                            <td>处理人</td>
                            <td>订单备注</td>
                            <td>创建时间</td>
                            <td>预定时间</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><span class="greenStyle">201503210001</span></td>
                            <td><span class="redStyle">王静静</span></td>
                            <td><span class="redStyle">18021917923</span></td>
                            <td>处理中</td>
                            <td>44</td>
                            <td><span class="redStyle">李丽</span></td>
                            <td></td>
                            <td>2015-03-21 23:46:38</td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div>              
         <%--系统信息--%>
        <div class="tab-pane" id="tab4-tab4-tab1">8</div>            
         <%--用户信息--%>
        <div class="tab-pane" id="tab4-tab4-tab2">9</div>            
         <%--员工信息--%>
        <div class="tab-pane" id="tab4-tab4-tab3">10</div>            
         <%--工作状态信息--%>
        <div class="tab-pane" id="tab4-tab5-tab1">11</div>            
         <%--用户状态信息--%>
        <div class="tab-pane" id="tab4-tab5-tab2">12</div>            
         <%--通知状态信息--%>
        <div class="tab-pane" id="tab4-tab5-tab3">13</div>            
         <%--信息状态信息--%>
        <div class="tab-pane" id="tab4-tab5-tab4">14</div>            
         <%--通知信息--%>
        <div class="tab-pane" id="tab4-tab6">
            <table class="table text-center table-bordered">
                   <caption class="table-title">修改通知信息</caption>
                   <thead>
                        <tr>
                            <td><input type="checkbox" /> 选择全部</td>
                            <td>通知内容</td>
                            <td>创建时间</td>
                            <td>通知状态</td>
                            <td>操作</td>
                        </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td><div class="centerdiv imginput text-center txtoverflow">txtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflowtxtoverflow7889900</div></td>
                            <td><span class="greenStyle">2015-03-22 23:46:38</span></td>
                            <td><span class="redStyle">已公告</span></td>
                            <td>
                                <span class="txtaction delaction">删除行</span>
                                <span class="txtaction conaction">删除</span>
                            </td>
                        </tr>
                   </tbody>
               </table>
        </div> 
        </div>
      </div>
      <!-- 查找end -->
    </div>
    <div class="log_footerA">
		<div class="log_footer">
			<p class="footerInfor">
				<a href="">关于我们</a>
				<span>|</span>
				<a href="">联系我们</a>
				<span>|</span>
				<a href="">企业入住（<span class="redStyle">免费</span>）</a>
				<span>|</span>
				<a href="">交易流程</a>
				<span>|</span>
				<a href="">人才招聘</a>
				<span>|</span>
				<a href="">手机琦益</a>
				<span>|</span>
				<a href="">友情链接 ireoo.com</a>
			</p>
			<p class="footerInfor">
				<a href="">广告服务</a>
				<a href="">科技新闻</a>
				<a href="">淮安万达信息科技有限公司</a>
				<a href="">交流中心</a>
				<span class="redStyle">客服电话：18652327596</span>
			</p>
			<p class="footerInfor">© 2010-2014 琦益网 - 企业产品直销平台 Processed in <p>
			<ul class="footFaith">
				<li><img src="images_tool/qiyifaith1.jpg" /></li>
				<li><img src="images_tool/qiyifaith2.jpg" /></li>
				<li><img src="images_tool/qiyifaith3.jpg" /></li>
				<li><img src="images_tool/qiyifaith4.jpg" /></li>
			</ul>
		</div>
	</div>
    </form>
</body>
</html>
