<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
    <img id="avatar" class="avatar size-XL l" src="static/h-ui/images/ucnter/avatar-default.jpg">
    <dl style="margin-left:80px; color:#fff">
        <dt>
            <span id="username" class="f-18"></span>
            <span class="pl-10 f-12">余额：<span id="balance"></span></span>
        </dt>
        <dd id="description" class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
    </dl>
</div>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th class="text-r" width="80">性别：</th>
            <td id="sex"></td>
        </tr>
        <tr>
            <th class="text-r">手机：</th>
            <td id="phone"></td>
        </tr>
        <tr>
            <th class="text-r">邮箱：</th>
            <td id="email"></td>
        </tr>
        <tr>
            <th class="text-r">地址：</th>
            <td id="address"></td>
        </tr>
        <tr>
            <th class="text-r">注册时间：</th>
            <td id="created"></td>
        </tr>
        <tr>
            <th class="text-r">积分：</th>
            <td id="points"></td>
        </tr>
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

    var getId=window.location.search.slice(window.location.search.lastIndexOf("?")+1);

    /*时间转换*/
    function date(data){
        var time = new Date(data);
        var y = time.getFullYear();//年
        var m = time.getMonth() + 1;//月
        var d = time.getDate();//日
        var h = time.getHours();//时
        if (h >= 0 && h <= 9) {
            h = "0" + h;
        }
        var mm = time.getMinutes();//分
        if (mm >= 0 && mm <= 9) {
            mm = "0" + mm;
        }
        var s = time.getSeconds();//秒
        if (s >= 0 && s <= 9) {
            s = "0" + s;
        }
        return (y+"-"+m+"-"+d+" "+h+":"+mm+":"+s);
    }

    $.ajax({
        url:"/member/"+getId,
        type:"GET",
        success:function (data) {
            document.getElementById("username").innerHTML = data.result.username;
            document.getElementById("sex").innerHTML = data.result.sex;
            document.getElementById("phone").innerHTML = data.result.phone;
            document.getElementById("email").innerHTML = data.result.email;
            document.getElementById("address").innerHTML = data.result.address;
            document.getElementById("created").innerHTML = date(data.result.created);
            if(data.result.description!=null){
                document.getElementById("description").innerHTML = data.result.description;
            }
            document.getElementById("balance").innerHTML = data.result.balance;
            document.getElementById("points").innerHTML = data.result.points;
            if(data.result.file!=null&&data.result.file!=""){
                $("#avatar").attr("src", data.result.file);
            }
        },
        error:function(XMLHttpRequest){
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
        }
    });
</script>
</body>
</html>
