$(function () {
    //    alert("ok");

    //清空
    $(document).on("click", ".clearaction", function () {
        var parent = $(this).attr("parent");
        if (parent == "parent2") {
            $(this).parent().parent().find("input").val("");
        } else {
            $(this).parent().parent().parent().find("input").val("");
        }
    });

    //删除行
    $(document).on("click", ".delaction", function () {
        var parent = $(this).attr("parent");
        var delerowable = $(this).attr("delerowable");
        if (delerowable == "false") {//变灰、清空
            $(this).css({ "color": "#999", "font-weight": "400", "font-family": "@新宋体" }); //改成normal样式
            if (parent == "parent2") {
                $(this).parent().parent().find("input").val("");
            } else {
                $(this).parent().parent().parent().find("input").val("");
            }
        } else {
            if (parent == "parent3") {
                $(this).parent().parent().parent().remove();
            } else {
                $(this).parent().parent().remove();
            }
        }

    });

    //继续begin
    $(document).on("click", ".conaction", function () {
        var parent = $(this).attr("parent");
        var actionclass = $(this).attr("actionclass");
        var html = '';

        if (actionclass == "addfoodclass") {//添加食物种类

            html += '<tr>';
            html += '    <td><input class="classinput" type="text" /></td>';
            html += '    <td>';
            html += '        <div class="centerdiv text-center"><input class="classinput imginput pull-left" type="text" />';
            html += '            <span class="btnchooseimg chooseimage">选择图片</span>';
            html += '        </div>';
            html += '    </td>';
            html += '    <td>';
            html += '        <div class="centerdiv text-center">';
            html += '            <span class="txtaction clearaction" parent="parent3">清空</span>';
            html += '            <span class="txtaction delaction" parent="parent3" delerowable="true">删除行</span>';
            html += '            <span class="txtaction conaction" actionclass="addfoodclass" parent="parent3">继续</span>';
            html += '        </div>';
            html += '    </td>';
            html += '</tr>';
        }
        if (actionclass == "addfoodinfo") {//添加食物信息
            html += '<tr>';
            html += '    <td><input class="classinput" type="text" /></td>';
            html += '    <td><input class="classinput rewidth-input100" type="text" /></td>';
            html += '    <td><input class="classinput imginput pull-left" type="text" /><span class="btnchooseimg chooseimage">选择图片</span></td>';
            html += '    <td><input class="classinput imginput" type="text" placeHolder="详情介绍" /></td>';
            html += '    <td>';
            html += '        <span class="txtaction clearaction" parent="parent2">清空</span>';
            html += '        <span class="txtaction delaction" parent="parent2" delerowable="true">删除行</span>';
            html += '        <span class="txtaction conaction" actionclass="addfoodinfo" parent="parent2">继续</span>';
            html += '    </td>';
            html += '</tr>';
        }
        if (actionclass == "addState") {//添加状态信息
            html += '<tr>';
            html += '    <td><input class="classinput stateinput" type="text" /></td>';
            html += '    <td>';
            html += '        <span class="txtaction clearaction" parent="parent2">清空</span>';
            html += '        <span class="txtaction delaction" parent="parent2" delerowable="true">删除行</span>';
            html += '        <span class="txtaction conaction" actionclass="addState" parent="parent2">继续</span>';
            html += '    </td>';
            html += '</tr>';
        }
        if (actionclass == "addNotice") {//添加通知信息
            html += '<tr>';
            html += '    <td><textarea class="textareacon"></textarea></td>';
            html += '    <td><input class="classinput rewidth-input100 pull-left" type="text" /><span class="glyphicon glyphicon-time pull-left"></span></td>';
            html += '    <td>';
            html += '        <select class="selclass">';
            html += '            <option>通知状态</option>';
            html += '            <option>已公告</option>';
            html += '            <option>未公告</option>';
            html += '            <option>公告中</option>';
            html += '        </select>';
            html += '    </td>';
            html += '    <td>';
            html += '        <span class="txtaction clearaction" parent="parent2">清空</span>';
            html += '        <span class="txtaction delaction" parent="parent2" delerowable="true">删除行</span>';
            html += '        <span class="txtaction conaction" actionclass="addNotice" parent="parent2">继续</span>';
            html += '    </td>';
            html += '</tr>';
        }
        if (parent == "parent2") {

            $(this).parent().parent().after(html);
        } else {
            
            $(this).parent().parent().parent().after(html);
        }


    });
    //继续end

});