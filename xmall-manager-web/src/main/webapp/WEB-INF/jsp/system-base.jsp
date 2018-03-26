<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
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
    <!--/meta 作为公共模版分离出去-->

    <title>基本设置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>
    系统管理
    <span class="c-gray en">&gt;</span>
    基本设置
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <form class="form form-horizontal" id="base-add">
        <input type="text" id="id" name="id" hidden value="" class="input-text">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                网站名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="webName" name="webName" placeholder="控制在25个字、50个字节以内" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                关键词：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="keyWord" name="keyWord" placeholder="5个左右,每个8汉字以内,用英文,隔开" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="description" name="description" placeholder="控制在160个字符以内" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                css/js/images路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="sourcePath" name="sourcePath" placeholder="默认为空，为相对路径" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                上传目录配置：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="uploadPath" name="uploadPath" placeholder="默认为upload" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                底部版权信息：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="copyright" name="copyright" placeholder="&copy; 2017 exrick.cn" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">前台URL：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="frontUrl" name="frontUrl" placeholder="http://blog.exrick.cn" value="" class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">统计代码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="countCode" name="countCode" class="textarea"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">登录通知开关：</label>
            <div class="formControls col-xs-6 col-sm-6 skin-minimal">
                <div class="radio-box">
                    <input name="hasLogNotice" value="1" type="radio" id="logYes" >
                    <label for="logYes">开</label>
                </div>
                <div class="radio-box">
                    <input name="hasLogNotice" type="radio" id="logNo" value="0" >
                    <label for="logNo">关</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">登录通知：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="logNotice" name="logNotice" class="textarea"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">欢迎通知开关：</label>
            <div class="formControls col-xs-6 col-sm-6 skin-minimal">
                <div class="radio-box">
                    <input name="hasAllNotice" value="1" type="radio" id="allYes" >
                    <label for="allYes">开</label>
                </div>
                <div class="radio-box">
                    <input name="hasAllNotice" type="radio" id="allNo" value="0" >
                    <label for="allNo">关</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">欢迎页通知：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="allNotice" name="allNotice" class="textarea"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">公告：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="notice" name="notice" style="width:100%;visibility:hidden;"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">更新日志：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="updateLog" name="updateLog" style="width:100%;visibility:hidden;"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button id="saveButton" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<link rel="stylesheet" href="lib/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="lib/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="lib/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="lib/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="lib/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
    function radioCheck(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    }

    $(function(){
        radioCheck();
        $("#tab-system").Huitab({
            index:0
        });
    });

    var htmlData1,htmlData2,editor1,editor2;

    KindEditor.ready(function(K) {
        editor1 = K.create('textarea[name="notice"]', {
            cssPath : 'lib/kindeditor/plugins/code/prettify.css',
            uploadJson : '/kindeditor/imageUpload',
            fileManagerJson : '/kindeditor/imageUpload',
            allowFileManager : false,
            height : '250px',
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['base-add'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['base-add'].submit();
                });
            }
        });
        prettyPrint();

        var index = layer.load(3);
        $.ajax({
            url:"/sys/base",
            type: 'GET',
            success:function (data) {
                layer.close(index);
                if(data.success!=true){
                    layer.alert(data.message,{title: '错误信息',icon: 2});
                    return;
                }
                $("#id").val(data.result.id)
                $("#webName").val(data.result.webName);
                $("#keyWord").val(data.result.keyWord);
                $("#description").val(data.result.description);
                $("#sourcePath").val(data.result.sourcePath);
                $("#uploadPath").val(data.result.uploadPath);
                $("#copyright").val(data.result.copyright);
                $("#countCode").val(data.result.countCode);
                $("#frontUrl").val(data.result.frontUrl);
                $("#logNotice").val(data.result.logNotice);
                $("#allNotice").val(data.result.allNotice);
                if(data.result.hasLogNotice==1){
                    $("#logYes").attr('checked', 'checked');
                    radioCheck();
                }else if(data.result.hasLogNotice==0){
                    $("#logNo").attr('checked', 'checked');
                    radioCheck();
                }
                if(data.result.hasAllNotice==1){
                    $("#allYes").attr('checked', 'checked');
                    radioCheck();
                }else if(data.result.hasAllNotice==0){
                    $("#allNo").attr('checked', 'checked');
                    radioCheck();
                }
                htmlData1=data.result.notice;
                KindEditor.html('#notice', htmlData1);
            },
            error:function(XMLHttpRequest){
                layer.close(index);
                if(XMLHttpRequest.status!=200){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            }
        });
    });

    KindEditor.ready(function(K) {
        editor2 = K.create('textarea[name="updateLog"]', {
            cssPath : 'lib/kindeditor/plugins/code/prettify.css',
            uploadJson : '/kindeditor/imageUpload',
            fileManagerJson : '/kindeditor/imageUpload',
            allowFileManager : false,
            height : '250px',
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['base-add'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['base-add'].submit();
                });
            }
        });
        prettyPrint();

        $.ajax({
            url:"/sys/base",
            type: 'GET',
            success:function (data) {
                if(data.success!=true){
                    layer.alert(data.message,{title: '错误信息',icon: 2});
                    return;
                }
                htmlData2=data.result.updateLog;
                KindEditor.html('#updateLog', htmlData2);
            },
            error:function(XMLHttpRequest){
                if(XMLHttpRequest.status!=200){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
                }
            }
        });
    });

    $(function(){
        $("#base-add").validate({
            rules:{
                webName:{
                    maxlength:100,
                    required:true
                },
                keyWord:{
                    maxlength:100,
                    required:true,
                },
                description:{
                    maxlength:100,
                    required:true
                },
            },
            onkeyup:false,
            focusCleanup:false,
            success:"valid",
            submitHandler:function(form){
                editor1.sync();
                editor2.sync();
                var index = layer.load(3);
                $(form).ajaxSubmit({
                    url: "/sys/base/update",
                    type: "POST",
                    success: function (data) {
                        layer.close(index);
                        if (data.success == true) {
                            msgSuccess("编辑成功!");
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

    function msgSuccess(content){
        layer.msg(content, {icon: 1,time:3000});
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

