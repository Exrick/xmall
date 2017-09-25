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
    <title>图片列表</title>
</head>
<style>
    .table>tbody>tr>td{
        text-align:center;
    }
</style>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span class="c-gray en">&gt;</span> 图片列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort" width="100%">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="100">所属栏目</th>
                <th width="100">缩略图</th>
                <th width="100">超链接</th>
                <th width="100">创建时间</th>
                <th width="100">更新时间</th>
                <th width="100">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    /*刷新表格*/
    function refresh(){
        var table = $('.table').DataTable();
        table.ajax.reload(null,false);// 刷新表格数据，分页信息不会重置
    }

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
        return (y+"-"+m+"-"+d+" "+h+":"+mm);
    }

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
            "processing": true,//加载显示提示
            "ajax": {
                url:"/image/list",
                type: 'GET',
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
                { "data": "category"},
                { "data": "image",
                    render: function(data, type, row, meta) {
                        return '<img src="'+imageShow(data)+'" style="width: 80px;height: 50px" alt="" />';
                    }
                },
                { "data": "link"},
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
                        return "<a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_edit('图片编辑','picture-edit',"+row.id+")\" href=\"javascript:;\" title=\"编辑\"><i class=\"Hui-iconfont\">&#xe6df;</i></a>";
                    }
                }
            ],
            "aaSorting": [[ 5, "desc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[0,2,3,4,7]}// 制定列不参与排序
            ],
            language: {
                url: '/lib/datatables/Chinese.json'
            }
        });
    });

    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    var categoryId,id,link,image;
    /*图片-编辑*/
    function picture_edit(title,url,Id){
        var table = $('.table').DataTable();
        $('.table tbody').on( 'click', 'tr', function () {
            var category = table.row( this ).data().category;
            if(category=="官方精选"){
                categoryId=2;
            }else{
                categoryId=3;
            }
            id=Id;
            link=table.row( this ).data().link;
            image=table.row( this ).data().image;
        });
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    function msgSuccess(content){
        layer.msg(content, {icon: 1,time:3000});
    }
</script>
</body>
</html>
