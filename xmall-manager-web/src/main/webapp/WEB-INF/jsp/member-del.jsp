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
    <title>删除的用户</title>
</head>
<style>
    .table>tbody>tr>td{
        text-align:center;
    }
</style>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form id="form-search" class="text-c"> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'maxDate\')||\'%y-%M-%d\'}' })" id="minDate" name="minDate" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'minDate\')}',maxDate:'%y-%M-%d' })" id="maxDate" name="maxDate" class="input-text Wdate" style="width:120px;">
        <input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱等信息" id="searchKey" name="searchKey">
        <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
    </form>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="restoreAll()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe66b;</i> 批量还原</a></span> <span class="r">共有数据：<strong id="memberRemoveListCount">0</strong> 条</span> </div>
    <div class="mt-20" style="margin-bottom: 70px">
        <table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
            <thead>
            <tr class="text-c">
                <th width="30"><input type="checkbox" name="" value=""></th>
                <th width="40">ID</th>
                <th width="80">用户名</th>
                <th width="40">性别</th>
                <th width="90">手机</th>
                <th width="110">邮箱</th>
                <th width="130">地址</th>
                <th width="100">创建时间</th>
                <th width="50">状态</th>
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
<script type="text/javascript" src="lib/datatables/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript">

    $(function(){
        $('.table').dataTable({
            serverSide: true,//开启服务器模式
            "processing": true,//加载显示提示
            "ajax": {
                url:"member/list/remove",
                type: 'GET',
                data:{
                    "searchKey": "",
                    "minDate": "",
                    "maxDate": "",
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
                { "data": "username"},
                { "data": "sex"},
                { "data": "phone"},
                { "data": "email"},
                { "data": "address"},
                { "data": "created",
                    render : function(data,type, row, meta) {
                        return date(data);
                    }
                },
                { "data": "state",
                    render : function(data,type, row, meta) {
                        if(data==2){
                            return "<span class=\"label label-danger radius td-status\">已删除</span>";
                        }else{
                            return "<span class=\"label label-warning radius td-status\">其它态</span>";
                        }
                    }
                },
                { "data": null,
                    render : function(data,type, row, meta) {
                        return "<a style=\"text-decoration:none\" href=\"javascript:;\" onClick=\"member_restore(this,"+row.id+")\" title=\"还原\"><i class=\"Hui-iconfont\">&#xe66b;</i></a> <a title=\"彻底删除\" href=\"javascript:;\" onclick=\"member_del(this,"+row.id+")\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>";
                    }
                }
            ],
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ],
            buttons: [
                'copy', 'excel', 'pdf'
            ],
            language: {
                url: '/lib/datatables/Chinese.json'
            },
            colReorder: true
        });

    });

    memberRemoveCount();

    /*统计移除用户数*/
    function memberRemoveCount(){
        $.ajax({
            url:"/member/count/remove",
            type:"GET",
            success:function (data) {
                $("#memberRemoveListCount").html(data.recordsTotal);
            },
            error:function(XMLHttpRequest){
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+XMLHttpRequest.responseText,{title: '错误信息',icon: 2});
            }
        });
    }

    /*用户-还原*/
    function member_restore(obj,id){
        layer.confirm('确认要还原ID为\''+id+'\'的会员吗？',{icon:3},function(index){
            $.ajax({
                type: 'PUT',
                url: '/member/start/'+id,
                dataType: 'json',
                success: function(data){
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return ;
                    }
                    memberRemoveCount();
                    refresh();
                    layer.msg('已还原!',{icon: 6,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+XMLHttpRequest.responseText,{title: '错误信息',icon: 2});
                }
            });
        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要彻底删除ID为\''+id+'\'的会员吗？',{icon:0},function(index){
            $.ajax({
                type: 'DELETE',
                url: '/member/del?ids='+id,
                dataType: 'json',
                success: function(data){
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                        return ;
                    }
                    memberRemoveCount();
                    refresh();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
                }
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
        layer.confirm('确认要彻底删除所选的'+count+'条数据吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'DELETE',
                url: '/member/del?ids='+ids,
                dataType: 'json',
                success:function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                    }
                    memberRemoveCount();
                    refresh();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });
        });
    }

    /*批量还原*/
    function restoreAll(obj,id){
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
        layer.confirm('确认要还原所选的'+count+'条数据吗？',{icon:0},function(index){
            var index = layer.load(3);
            $.ajax({
                type: 'PUT',
                url: '/member/start/'+ids,
                dataType: 'json',
                success:function(data){
                    layer.close(index);
                    if(data.success!=true){
                        layer.alert(data.message,{title: '错误信息',icon: 2});
                    }
                    memberRemoveCount();
                    refresh();
                    layer.msg('已还原!',{icon:1,time:1000});
                },
                error:function(XMLHttpRequest){
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });

        });
    }
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
                "maxDate":maxDate
            };
            var table = $('.table').DataTable();
            table.settings()[0].ajax.data = param;
            table.ajax.reload();
        }
    });
</script>
</body>
</html>
