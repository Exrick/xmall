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
    <title>商品列表</title>
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<style>
    .table>tbody>tr>td{
        text-align:center;
    }
</style>

<body class="pos-r">
<div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
    <ul style="margin-top: 15px;margin-left: 20px"><i class="Hui-iconfont Hui-iconfont-fenlei"></i> 商品分类</ul>
    <ul id="treeDemo" style="margin-left: 10px" class="ztree"></ul>
</div>
<div style="margin-left:200px;">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <span class="c-gray en">&gt;</span><span id="category">所有商品</span> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <form id="form-search" class="page-container">
        <div class="text-c"> 日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'maxDate\')||\'%y-%M-%d\'}' })" id="minDate" name="minDate" class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'minDate\')}',maxDate:'%y-%M-%d' })" id="maxDate" name="maxDate" class="input-text Wdate" style="width:120px;">
            <input type="text" name="searchKey" id="searchKey" placeholder=" 商品名称、商品描述、价格" style="width:250px" class="input-text">
            <button name="" id="searchButton" type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加商品','product-add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a></span> <span class="r">共有数据：<strong id="itemListCount">0</strong> 条</span> </div>
        <div class="mt-20">
            <div class="mt-20" style="margin-bottom: 70px">
                <table class="table table-border table-bordered table-bg table-hover table-sort" width="100%">
                    <thead>
                    <tr class="text-c">
                        <th width="30"><input name="" type="checkbox" value=""></th>
                        <th width="40">ID</th>
                        <th width="70">缩略图</th>
                        <th width="150">商品名称</th>
                        <th width="100">描述</th>
                        <th width="60">单价</th>
                        <th width="95">创建日期</th>
                        <th width="95">更新日期</th>
                        <th width="60">发布状态</th>
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
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript">

    function imageShow(data){
        var images= new Array(); //定义一数组
        images=data.split(","); //字符分割
        if(images.length>0){
            return images[0];
        }else{
            return data;
        }
    }

    /*datatables配置*/
    $(document).ready(function () {
        $('.table').DataTable({
            serverSide: true,//开启服务器模式
            "processing": true,//加载显示提示
            "ajax": {
                url:"/item/list",
                type: 'GET',
                data:{
                    "cid":-1
                },
                error:function(XMLHttpRequest){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
                }
            },
            "columns": [
                { "data": null,
                    render : function(data,type, row, meta) {
                        return "<input name=\"checkbox\" value=\""+row.id+"\" type=\"checkbox\" value=\"\">";
                    }
                },
                { "data": "id"},
                { "data": "image",
                    render: function(data, type, row, meta) {
                        return '<img src="'+imageShow(data)+'" style="width: 80px;height: 50px" alt="" />';
                    }
                },
                { "data": "title",
                    render: function(data, type, row, meta) {
                        if (type === 'display') {
                            if (data.length > 20) {
                                return '<span title=' + data + '>' + data.substr(0, 50) + '...</span>';
                            } else {
                                return '<span title=' + data + '>' + data + '</span>';
                            }
                        }
                        return data;
                    }
                },
                { "data": "sellPoint",
                    render: function(data, type, row, meta) {
                        if (type === 'display') {
                            if (data.length > 25) {
                                return '<span title=' + data + '>' + data.substr(0, 25) + '...</span>';
                            } else {
                                return '<span title=' + data + '>' + data + '</span>';
                            }
                        }
                        return data;
                    }
                },
                { "data": "price"},
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
                { "data": "status",
                    render : function(data,type, row, meta) {
                        if(data==0){
                            return "<span class=\"label label-defant radius td-status\">已下架</span>";
                        }else if(data==1){
                            return "<span class=\"label label-success radius td-status\">已发布</span>";
                        }else{
                            return "<span class=\"label label-warning radius td-status\">其它态</span>";
                        }
                    }
                },
                {
                    "data": null,
                    render: function (data, type, row, meta) {
                        if (row.status == 1) {
                            return "<a style=\"text-decoration:none\" onClick=\"product_stop(this,"+row.id+")\" href=\"javascript:;\" title=\"下架\"><i class=\"Hui-iconfont\">&#xe6de;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_edit('商品编辑','product-edit',"+row.id+")\" href=\"javascript:;\" title=\"编辑\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_del(this,"+row.id+")\" href=\"javascript:;\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>";
                        } else {
                            return "<a style=\"text-decoration:none\" onClick=\"product_start(this,"+row.id+")\" href=\"javascript:;\" title=\"发布\"><i class=\"Hui-iconfont\">&#xe603;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_edit('商品编辑','product-edit',"+row.id+")\" href=\"javascript:;\" title=\"编辑\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_del(this,"+row.id+")\" href=\"javascript:;\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>";
                        }
                    }
                }
            ],
            "aaSorting": [[ 6, "desc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[0,2,4,9]}// 制定列不参与排序
            ],
            language: {
                url: '/lib/datatables/Chinese.json'
            },
            colReorder: true
        });

    });

    productCount();

    function productCount(){
        $.ajax({
            url:"/item/count",
            type: 'GET',
            success:function (result) {
                $("#itemListCount").html(result.recordsTotal);
            },
            error:function(XMLHttpRequest){
                if(XMLHttpRequest.status!=200){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            }
        });
    }
    /*初始化类别数据*/
    var cid=-1;
    /*多条件查询*/
    $("#form-search").validate({
        rules:{
            minDate:{
                required:true,
            },
            maxDate:{
                required:true,
            },
            searchKey:{
                required:false,
            },
        },
        onkeyup:false,
        focusCleanup:false,
        success:"valid",
        submitHandler:function(form){
            var searchKey= $('#searchKey').val();
            var minDate= $('#minDate').val();
            var maxDate= $('#maxDate').val();
            var param = {
                "searchKey": searchKey,
                "minDate": minDate,
                "maxDate":maxDate,
                "cid":cid
            };
            var table = $('.table').DataTable();
            table.settings()[0].ajax.data = param;
            table.ajax.url( '/item/listSearch' ).load();
        }
    });

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
            url: "/item/cat/list",
            type: "GET",
            contentType: "application/json",
            autoParam: ["id"],
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                if (treeNode.isParent) {
                    return false;
                } else {
                    cid=treeNode.id;
                    $("#category").html(treeNode.name);
                    var param = {
                        "cid": treeNode.id,
                    };
                    var table = $('.table').DataTable();
                    table.settings()[0].ajax.data = param;
                    table.ajax.reload();
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

    /*产品-下架*/
    function product_stop(obj,id){
        layer.confirm('确认要下架ID为\''+id+'\'的商品吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'PUT',
                url: '/item/stop/'+id,
                dataType: 'json',
                success: function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return;
                    }
                    refresh();
                    layer.msg('已下架!',{icon: 5,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });

        });
    }

    /*产品-发布*/
    function product_start(obj,id){
        layer.confirm('确认要发布ID为\''+id+'\'的商品吗？',{icon:3},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'PUT',
                url: '/item/start/'+id,
                dataType: 'json',
                success: function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return;
                    }
                    refresh();
                    layer.msg('已发布!',{icon: 6,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });
        });
    }

    /*产品-编辑*/
    function product_edit(title,url,id){
        setId(id);
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    var ID=0;
    function setId(id){
        ID=id;
    }

    function getId(){
        return ID;
    }

    /*产品-删除*/
    function product_del(obj,id){
        layer.confirm('确认要删除ID为\''+id+'\'的商品吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'DELETE',
                url: '/item/del?ids='+id,
                dataType: 'json',
                success: function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return;
                    }
                    productCount();
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
                url: '/item/del/?ids='+ids,
                dataType: 'json',
                success:function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                    }
                    layer.msg('已删除!',{icon:1,time:1000});
                    productCount();
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
