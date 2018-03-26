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
    <title>编辑管理员</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-admin-add">
        <input type="text" hidden value="" placeholder="" id="id" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="username" name="username">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="sex" value="男" type="radio" id="sex-1" checked>
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" value="女" id="sex-2" name="sex">
                    <label for="sex-2">女</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="@" name="email" id="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box" style="width:150px;">
                    <select id="select" class="select" name="roleId" size="1"></select>
			    </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="description" name="description" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
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
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

    $("#id").val(parent.userId);
    $("#username").val(parent.username);
    $("#phone").val(parent.phone);
    $("#email").val(parent.email);
    $("#description").val(parent.description);
    var roleNames=parent.roleNames;
    var sex=parent.sex;
    if(sex=='女'){
        $("#sex-2").attr('checked', 'checked');
        radioCheck();
    }else{
        $("#sex-1").attr('checked', 'checked');
        radioCheck();
    }

    var index = layer.load(3);
    $.ajax({
        url:"/user/getAllRoles",
        type: 'GET',
        success:function (data) {
            layer.close(index);
            if(data.success==true){
                var size=data.result.length;
                for(var i=0;i<size;i++){
                    if(data.result[i].name==roleNames.trim()){
                        $("#select").append("<option selected value="+data.result[i].id+">"+data.result[i].name+"</option>");
                    }else{
                        $("#select").append("<option value="+data.result[i].id+">"+data.result[i].name+"</option>");
                    }
                }
            }else {
                layer.alert(data.message, {title: '错误信息', icon: 2});
            }
        },
        error:function(XMLHttpRequest){
            layer.close(index);
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
        }
    });

    /*文本输入限制*/
    $(".textarea").Huitextarealength({
        minlength:0,
        maxlength:100
    });

    function radioCheck(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    }

    $(function(){
        radioCheck();

        $("#form-admin-add").validate({
            rules:{
                username:{
                    required:true,
                    minlength:1,
                    maxlength:16,
                    remote: "/user/edit/username/"+parent.userId
                },
                sex:{
                    required:true,
                },
                phone:{
                    required:true,
                    isPhone:true,
                    remote: "/user/edit/phone/"+parent.userId
                },
                email:{
                    required:true,
                    email:true,
                    remote: "/user/edit/email/"+parent.userId
                },
                roleId:{
                    required:true,
                },
            },
            messages: {
                username: {
                    remote: "该用户名已被注册"
                },
                phone: {
                    remote: "该手机号已被注册"
                },
                email: {
                    remote: "该邮箱已被注册"
                }
            },
            onkeyup:false,
            focusCleanup:false,
            success:"valid",
            submitHandler:function(form){
                var index = layer.load(3);
                $(form).ajaxSubmit({
                    url: "/user/updateUser",
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