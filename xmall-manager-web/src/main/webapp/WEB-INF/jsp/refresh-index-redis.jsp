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
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>首页缓存管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 缓存管理 <span class="c-gray en">&gt;</span> 首页缓存管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div style="margin-left: 1vw;margin-right: 1vw" class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l">
        <a class="btn btn-primary radius" onclick="refreshIndexRedis()" href="javascript:;"><i class="Hui-iconfont">&#xe6bd;</i> 刷新首页缓存</a>
    </span>
</div>
<table class="table">
    <div class="page-container">
        <form action="" method="post" class="form form-horizontal" id="content-cat-edit">
            <div class="row cl">
                <label class="form-label col-xs-6 col-sm-6" style="color: red;margin-bottom: 1vw;">当首页关联商品修改时请记得在此处刷新首页缓存</label>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-1">首页缓存内容：</label>
                <div class="formControls col-xs-6 col-sm-6">
                    <textarea name="content" id="content" class="textarea"  placeholder="当前首页缓存已是最新" style="height: 350px"></textarea>
                </div>
            </div>
        </form>
    </div>
</table>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

    getIndexRedisData();
    function getIndexRedisData() {
        var index = layer.load(3);
        $.ajax({
            type: 'GET',
            url: '/redis/index/list',
            dataType: 'json',
            success: function(data) {
                layer.close(index);
                if(data.success==true){
                    $("#content").val(data.result);
                }else{
                    layer.alert('读取缓存数据失败! '+data.message, {title: '错误信息',icon: 2});
                }
            },
            error: function (XMLHttpRequest) {
                layer.close(index);
                layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status , {
                    title: '错误信息',
                    icon: 2
                });
            }
        });
    }

    function refreshIndexRedis() {
        layer.confirm('确认要刷新首页缓存吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'GET',
                url: '/redis/index/update',
                dataType: 'json',
                success: function(data) {
                    layer.close(index);
                    if(data.success==true){
                        getIndexRedisData();
                        msgSuccess("刷新成功!重新打开首页即可重新存入新缓存");
                    }else{
                        layer.alert('刷新失败! '+data.message, {title: '错误信息',icon: 2});
                    }
                },
                error: function (XMLHttpRequest) {
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status , {
                        title: '错误信息',
                        icon: 2
                    });
                }
            });
        });
    }

    function msgSuccess(content){
        layer.alert(content,{icon: 1});
    }
</script>
</body>
</html>
