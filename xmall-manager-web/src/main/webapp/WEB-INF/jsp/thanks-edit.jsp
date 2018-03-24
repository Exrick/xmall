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
    <title>编辑捐赠 - 捐赠管理</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-admin-add">
        <div class="row cl">
            <input type="text" class="input-text" value="" hidden id="id" name="id">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>昵称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="nickName" name="nickName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">登录账号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" id="username" name="username">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>捐赠金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="money" name="money">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">捐赠信息：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="" name="info" id="info">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">捐赠时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss' })" id="time" name="time" class="input-text Wdate" style="width:180px;">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input id="saveButton" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript">

    $("#id").val(parent.thanksId);
    $("#username").val(parent.username);
    $("#nickName").val(parent.nickName);
    $("#money").val(parent.money);
    $("#info").val(parent.info);
    $("#time").val(parent.time);

    $(function(){

        $("#form-admin-add").validate({
            rules:{
                nickName:{
                    required:true,
                    minlength:1,
                    maxlength:16
                },
                money:{
                    number:true,
                    maxlength:10,
                    required:true,
                }
            },
            onkeyup:false,
            focusCleanup:false,
            success:"valid",
            submitHandler:function(form){
                var index = layer.load(3);
                $(form).ajaxSubmit({
                    url: "/thanks/update",
                    type: "POST",
                    success: function (data) {
                        layer.close(index);
                        if (data.success == true) {
                            parent.refresh();
                            parent.msgSuccess("编辑成功!");
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        } else {
                            layer.alert(data.message, {title: '错误信息', icon: 2});
                        }
                    },
                    error: function (XMLHttpRequest) {
                        layer.close(index);
                        layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status, {
                            title: '错误信息',
                            icon: 2
                        });
                    }
                });
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>