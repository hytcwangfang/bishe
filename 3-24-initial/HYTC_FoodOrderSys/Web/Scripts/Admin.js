$(function () {

	//alert("ok");

	//显示或隐藏左侧导航
	$(document).on("click",".varsizebtn",function(){
		var IsOpen = $(this).attr("IsOpen");
		if (IsOpen == "true") {//关闭导航并设置为false
			$(".leftnav").hide();
			$(".righttabcon").css({"width":"100%"});
			$(this).attr("IsOpen","false");
		}else{//打开导航并设置为true
			$(".leftnav").show();
			$(".righttabcon").css({"width":"88%"});
			$(this).attr("IsOpen","true");
		}
	});

	//二级目录打开或关闭
	$(document).on("click",".myinfo",function(){
		var IsOpen = $(this).attr("IsOpen");
		if (IsOpen == "false") {//打开
			$(this).next().css({"display":"block"});
			$(this).attr("IsOpen","true");
			$(this).children("span").removeClass("glyphicon-chevron-right");
			$(this).children("span").addClass("glyphicon-chevron-down");
		}else{//关闭
			$(this).next().css({"display":"none"});
			$(this).attr("IsOpen","false");
			$(this).children("span").removeClass("glyphicon-chevron-down");
			$(this).children("span").addClass("glyphicon-chevron-right");
		}
	});

	//打开左侧目录对应的窗口与标题
	$(document).on("click",".nav > li > a",function(){
		var IsHasHeader = $(this).attr("IsHasHeader");
		//alert(IsHasHeader);
		if (typeof(IsHasHeader) == "undefined" || IsHasHeader == "" || IsHasHeader == null) {
			return;
		}else if (IsHasHeader == "false") { 
			var id = $(this).attr("id");
			var HeaderId = $(this).attr("HeaderId");
			var href = $(this).attr("href");
			var tabid = $(this).attr("tabid");
			var headtitle = $(this).html();
			//alert(tabid);
			//未曾打开过对应标题
				
				//alert(html);

				//其它标题去掉.flashtitle与.activeHeader样式，改为headertitle样式
				$("#" + tabid + "-conHeaders li").removeClass("flashtitle");
				$("#" + tabid + "-conHeaders li").removeClass("activeHeader");
				$("#" + tabid + "-conHeaders li").addClass("headertitle");
				//alert($("#" + tabid + "-conHeaders li").attr("class"));

				var html = $("#" + tabid + "-conHeaders").html();
				html += '<li id="' + HeaderId + '" class="activeHeader flashtitle role-header" linkleftid="' + id + '">';
	            html += '  <a href="' + href + '" data-toggle="tab">';
	            html += '    <span class="titlename">' + headtitle + '</span>';
	            html += '    <span class="glyphicon glyphicon-remove closeicon" tabid="' + tabid + '"></span>';
	            html += '  </a>';
	            html += '</li>';
	            $("#" + tabid + "-conHeaders").html(html);
	            $("#" + tabid + "-conHeaders").show();
	            $(this).attr("IsHasHeader","true");
	            //$("#" + tabid).find(".righttabcon").show();
				// $("#" + href).show();

	   			// $("#" + tabid + "-conHeaders li").removeClass("flashtitle");
				// $("#" + tabid + "-conHeaders li").addClass("headertitle");
		}else{
			var HeaderId = $(this).attr("HeaderId");
			var tabid = $(this).attr("tabid");
			$("#" + tabid + "-conHeaders li").removeClass("flashtitle");
			$("#" + tabid + "-conHeaders li").removeClass("activeHeader");
			$("#" + tabid + "-conHeaders li").addClass("headertitle");
			$("#" + HeaderId).addClass("activeHeader");

		}
		// $("#" + tabid + "-conHeaders li").removeClass("flashtitle");
		// $("#" + tabid + "-conHeaders li").addClass("headertitle");
		
		
	});


	//选中标题改变为对应样式
	$(document).on("click",".role-header",function(){
		$(".role-header").removeClass("activeHeader");
		$(this).addClass("activeHeader");
	});

	//关闭标题对应窗口
	$(document).on("click",".closeicon",function(){
		var tabid = $(this).attr("tabid");//整个页面的id(Home/Profiles1...)
		var href = $(this).parent().attr("href");//标题连接的页面id
		//alert(href);
		var linkleftid = $(this).parent().parent().attr("linkleftid");//对应左侧的导航id

		//出错
		var showpageid = $("#" + tabid).find(".righttabcon").children(".active").attr("id");//当前显示页面的id

		//alert("href:"+href+",showpageid:"+showpageid);
		if( href == "#" + showpageid){//当前显示的页面为标题连接页面
			//alert("当前显示的页面为标题连接页面:href:"+href+" showpageid:"+showpageid);

			if ($(this).parent().parent().next().length == 0 && $(this).parent().parent().prev().length == 0) {
				//当前只有一个标题窗口
				//alert("当前只有一个标题窗口");
				$("#" + tabid + "-conHeaders").html("");
				$("#" + tabid + "-conHeaders").hide();
				$(href).removeClass("active");
				//$("#" + tabid).find(".righttabcon").hide();
				// $("#" + href).hide();
				$("#" + linkleftid).attr("IsHasHeader","false");
			}else if ($(this).parent().parent().next().length != 0 && $(this).parent().parent().prev().length == 0) {
				//只有下一个标题窗口
				//alert("只有下一个标题窗口");

				$(".role-header").removeClass("activeHeader");
				$(this).parent().parent().next().addClass("activeHeader");//下一个标题设为选中时样式

				var nexthref = $(this).parent().parent().next().find("a").attr("href");
				var nextlinkleftid = $(this).parent().parent().next().attr("linkleftid");
				//alert("nexthref: " + nexthref + " nextlinkleftid: " + nextlinkleftid);
				$(href).removeClass("active");//关闭当前页面
				$(nexthref).addClass("active");//显示下一个标题页面
				$("#" + nextlinkleftid).attr("IsHasHeader","true");
				$("#" + linkleftid).attr("IsHasHeader","false");

				$(this).parent().parent().remove();//将该标题移除

			}else if ($(this).parent().parent().next().length == 0 && $(this).parent().parent().prev().length != 0) {
				//只有上一个标题窗口
				//alert("只有上一个标题窗口");
				$(".role-header").removeClass("activeHeader");
				$(this).parent().parent().prev().addClass("activeHeader");//上一个标题设为选中时样式

				var prevhref = $(this).parent().parent().prev().find("a").attr("href");
				var prevlinkleftid = $(this).parent().parent().prev().attr("linkleftid");
				//alert("prevhref: " + prevhref + " prevlinkleftid: " + prevlinkleftid);
				$(href).removeClass("active");//关闭当前页面
				$(prevhref).addClass("active");//显示上一个标题页面
				$("#" + prevlinkleftid).attr("IsHasHeader","true");
				$("#" + linkleftid).attr("IsHasHeader","false");
				//alert($("#" + prevlinkleftid).attr("IsHasHeader"));

				$(this).parent().parent().remove();//将该标题移除
				//alert($(this).parent().parent().html());

			}else{//有上一个也有下一个标题窗口
				//alert("有上一个也有下一个标题窗口");

				$(".role-header").removeClass("activeHeader");
				$(this).parent().parent().next().addClass("activeHeader");//下一个标题设为选中时样式

				var nexthref = $(this).parent().parent().next().find("a").attr("href");
				var nextlinkleftid = $(this).parent().parent().next().attr("linkleftid");
				//alert("nexthref: " + nexthref + " nextlinkleftid: " + nextlinkleftid);
				$(href).removeClass("active");//关闭当前页面
				$(nexthref).addClass("active");//显示下一个标题页面
				$("#" + nextlinkleftid).attr("IsHasHeader","true");
				$("#" + linkleftid).attr("IsHasHeader","false");

				$(this).parent().parent().remove();//将该标题移除

			}
	}else{//当前显示的页面不是标题连接页面
		//alert("当前显示的页面不是标题连接页面:href:"+href+" showpageid:"+showpageid);
		$(this).parent().parent().remove();//直接将该标题移除
		$("#" + linkleftid).attr("IsHasHeader","false");//表示左侧导航对应的标题未显示
	}
			
			
		// }
		return false;
	});
});