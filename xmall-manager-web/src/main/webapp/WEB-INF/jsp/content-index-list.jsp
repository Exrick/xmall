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
    <title>首页板块</title>
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<style>
    .table>tbody>tr>td{
        text-align:center;
    }
</style>

<body class="pos-r">
<div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
    <ul style="margin-top: 15px;margin-left: 20px"><i class="Hui-iconfont Hui-iconfont-fenlei"></i> 首页板块</ul>
    <ul id="treeDemo" style="margin-left: 10px" class="ztree"></ul>
</div>
<div style="margin-left:200px;">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商城管理 <span class="c-gray en">&gt;</span> 首页板块内容管理 <span class="c-gray en">&gt;</span><span id="name"></span> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <form id="form-search" class="page-container">
        <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加展示内容','content-product-add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加展示内容</a></span> <span class="r">最大容纳内容(商品)数：<strong id="limitNum"></strong></span> </div>
        <div class="mt-20">
            <div class="mt-20" style="margin-bottom: 70px">
                <table class="table table-border table-bordered table-bg table-hover table-sort" width="100%">
                    <thead>
                    <tr class="text-c">
                        <th width="30"><input name="" type="checkbox" value=""></th>
                        <th width="40">ID</th>
                        <th width="50">类型</th>
                        <th width="70">缩略图</th>
                        <th width="150">跳转链接</th>
                        <th width="100">展示商品ID</th>
                        <th width="150">商品名称</th>
                        <th width="100">商品价格(￥)</th>
                        <th width="60">排序值</th>
                        <th width="95">创建日期</th>
                        <th width="95">更新日期</th>
                        <th width="90">操作</th>
                    </tr>
                    </thead>
                </table>
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
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/datatables/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript">

    function imageShow(data){
        if(data==""||data==null){
            return "http://ow2h3ee9w.bkt.clouddn.com/nopic.jpg";
        }
        var images= new Array(); //定义一数组
        images=data.split(","); //字符分割
        if(images.length>0){
            return images[0];
        }else{
            return data;
        }
    }

    var index = layer.load(3);

    var panelId=1,name="",limitCount=0,currentCount=0,position=0,panelType=0;
    /*初始化类别数据*/
    $.ajax({
        type: 'GET',
        url: '/panel/index/list',
        dataType: 'json',
        success: function(data){
            if(data.length<=0||data==""){
                return
            }
            panelId = data[0].id;
            $("#name").html(data[0].name);
            name=data[0].name;
            $("#limitNum").html(data[0].limitNum);
            limitCount=data[0].limitNum;
            panelType=data[0].type;
            initTable("/content/list/"+panelId);
            updateCurrentCount("/content/list/"+panelId);
        },
        error:function(XMLHttpRequest) {
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
        },
    });

    function updateCurrentCount(url) {
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            success: function(data){
                currentCount=data.data.length;
            },
            error:function(XMLHttpRequest) {
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
            },
        });
    }

    /*datatables配置*/
    function initTable(url) {
        $('.table').DataTable({
            "processing": true,//加载显示提示
            "ajax": {
                url: url,
                type: 'GET',
            },
            "columns": [
                { "data": null,
                    render : function(data,type, row, meta) {
                        return "<input name=\"checkbox\" value=\""+row.id+"\" type=\"checkbox\" value=\"\">";
                    }
                },
                { "data": "id"},
                { "data": "type",
                    render : function(data,type, row, meta) {
                        if(data==0){
                            return "<span class=\"label label-success radius td-status\">关联商品</span>";
                        }else if(data==1){
                            return "<span class=\"label label-warning radius td-status\">其他链接</span>";
                        }else if(data==2){
                            return "<span class=\"label label-primary radius td-status\">封面(关联商品)</span>";
                        }else if(data==3){
                            return "<span class=\"label label-primary radius td-status\">封面(其它链接)</span>";
                        }
                    }
                },
                { "data": "picUrl",
                    render: function(data, type, row, meta) {
                        return '<img src="'+imageShow(data)+'" style="width: 80px;height: 70px" alt="" />';
                    }
                },
                { "data": "fullUrl"},
                { "data": "productId"},
                { "data": "productName"},
                { "data": "salePrice"},
                { "data": "sortOrder"},
                { "data": "created",
                    render : function(data,type, row, meta) {
                        return date(data);
                    }
                },
                { "data": "updated",
                    render : function(data,type, row, meta) {
                        return date(data);
                    }
                },
                {
                    "data": null,
                    render: function (data, type, row, meta) {
                        return "<a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_edit('内容编辑','content-product-edit')\" href=\"javascript:;\" title=\"编辑\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_del(this,"+row.id+")\" href=\"javascript:;\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>";
                    }
                }
            ],
            "aaSorting": [[ 8, "asc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[0,3,11]}// 制定列不参与排序
            ],
            language: {
                url: '/lib/datatables/Chinese.json'
            },
            colReorder: true
        });
    }

    var setting = {
        view: {
            dblClickExpand: true,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        async: {
            enable: true,
            url: "/panel/index/list",
            type: "GET",
            contentType: "application/json",
            autoParam: ["id"],
        },
        callback: {
            onAsyncSuccess: function(){
                layer.close(index);
            },
            beforeClick: function(treeId, treeNode) {
                if (treeNode.isParent) {
                    return false;
                } else {
                    panelId=treeNode.id;
                    $("#name").html(treeNode.name);
                    name=treeNode.name;
                    $("#limitNum").html(treeNode.limitNum);
                    limitCount=treeNode.limitNum;
                    panelType=treeNode.type;

                    updateCurrentCount("/content/list/"+panelId);
                    var table = $('.table').DataTable();
                    var url="/content/list/"+panelId;
                    table.ajax.url(url).load();
                    return true;
                }
            }
        }
    };

    $(document).ready(function(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting);
        var zTree = $.fn.zTree.getZTreeObj("tree");
    });

    /*产品-添加*/
    function product_add(title,url){
        if(currentCount>=limitCount){
            layer.alert('当前板块内容数量已达上限',{title: '错误信息',icon: 0});
            return;
        }
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*产品-查看*/
    function product_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    var id=0,productId=0,productName="",fullUrl="",type=0;

    /*产品-编辑*/
    function product_edit(title,url){
        var table = $('.table').DataTable();
        $('.table tbody').on( 'click', 'tr', function () {
            id = table.row(this).data().id;
            productId = table.row(this).data().productId;
            productName = table.row(this).data().productName;
            fullUrl = table.row(this).data().fullUrl;
            type = table.row(this).data().type;
            sortOrder = table.row(this).data().sortOrder;
        });
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*内容-删除*/
    function product_del(obj,id){
        layer.confirm('确认要删除ID为\''+id+'\'的数据吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'DELETE',
                url: '/content/del/'+id,
                dataType: 'json',
                success: function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return;
                    }
                    refresh();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(XMLHttpRequest) {
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                },
            });
        });
    }

    /*批量删除*/
    function datadel() {
        var cks=document.getElementsByName("checkbox");
        var count=0,ids="";
        for(var i=0;i<cks.length;i++){
            if(cks[i].checked){
                count++;
                ids+=cks[i].value+",";
            }
        }
        if(count==0){
            layer.msg('您还未勾选任何数据!',{icon:5,time:3000});
            return;
        }
        /*去除末尾逗号*/
        if(ids.length>0){
            ids=ids.substring(0,ids.length-1);
        }
        layer.confirm('确认要删除所选的'+count+'条数据吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'DELETE',
                url: '/content/del/'+ids,
                dataType: 'json',
                success:function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return;
                    }
                    layer.msg('已删除!',{icon:1,time:1000});
                    refresh();
                },
                error:function(XMLHttpRequest){
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });
        });
    }

    function msgSuccess(content){
        layer.msg(content, {icon: 1,time:3000});
    }
</script>
</body>
</html>
