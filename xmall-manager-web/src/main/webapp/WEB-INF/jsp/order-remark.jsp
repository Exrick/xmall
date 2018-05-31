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
    <title>备注</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="remark-form">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">详细描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="remark" id="remark" cols="" rows="" class="textarea"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input id="saveButton" class="btn btn-primary radius" onclick="submitSave()" value="提交">
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script type="text/javascript">

    var v=parent.oldRemark;
    if(v==null||v=="null"){
        v="";
    }
    $("#remark").val(v);

    function submitSave() {
        var index = layer.load(3);
        $.ajax({
            type: 'POST',
            url: "/order/remark",
            dataType: 'json',
            data:{
                orderId: parent.orderId,
                message: $("#remark").val()
            },
            success: function(data){
                layer.close(index);
                if(data.success==true) {
                    parent.msgSuccess('操作成功!');
                    parent.refresh();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    layer.alert(data.message,{title: '错误信息',icon: 2});
                }
            },
            error:function(XMLHttpRequest){
                layer.close(index);
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
            }
        });
    }

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>