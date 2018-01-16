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
    <title>同步索引</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商城管理 <span class="c-gray en">&gt;</span> 同步索引 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div style="margin-left: 1vw;margin-right: 1vw" class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="refresh_index()" href="javascript:;"><i class="Hui-iconfont">&#xe645;</i> 一键手动同步索引</a></span> <span id="loading" hidden>&nbsp;&nbsp;&nbsp;同步中...</span> </div>
<table class="table">
    <tr>
        <td class="va-t">
            <div class="page-container">
                <form action="" method="post" class="form form-horizontal" id="index-information">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            连接状态：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input class="btn btn-success radius" type="button" style="display: none" value="连接成功" id="success">
                            <input class="btn btn-danger radius" type="button" style="display: none" value="连接失败" id="fail">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            集群名：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text" value="" readonly id="cluster_name">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            节点名：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text" value="" readonly id="name">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            文档数：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text" value="" readonly id="num" name="num">
                        </div>
                    </div>
                </form>
            </div>
        </td>
    </tr>
</table>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

    function refresh(){
        location.reload();
    }

    $.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:9200',
        dataType: 'json',
        success: function(data) {
            $("#cluster_name").val(data.cluster_name);
            $("#name").val(data.name);
            $("#success").css('display','block');
        },
        error: function (XMLHttpRequest) {
            $("#fail").css('display','block');
        }
    });

    $.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:9200/_search',
        dataType: 'json',
        success: function(data) {
            $("#num").val(data.hits.total);
        },
        error: function (XMLHttpRequest) {
            layer.alert('连接失败! 错误码:' + XMLHttpRequest.status, {
                title: '错误信息',
                icon: 2
            });
        }
    });

    /*同步索引*/
    function refresh_index(){
        $("#loading").removeAttr("hidden");
        $.ajax({
            type: 'GET',
            url: 'http://localhost:7777/goods/importIndex',
            dataType: 'JSONP',
            jsonpCallback: "callback",
            success: function(data) {
                $("#loading").attr("hidden","hidden");
                msgSuccess("同步成功");
            },
            error:function(XMLHttpRequest){
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
            }
        });
    }

    function msgSuccess(content){
        layer.alert(content,{icon: 1}, function(index){
            refresh();
        });
    }
</script>
</body>
</html>
