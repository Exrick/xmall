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
    <title>商品分类</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品分类 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div style="margin-left: 1vw;margin-right: 1vw" class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="category_del()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除所选分类</a> <a class="btn btn-primary radius" onclick="category_add('添加商品分类','product-category-add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加商品分类</a></span> </div>
<table class="table">
    <tr>
        <td style="padding-left: 4vw" width="200" class="va-t"><ul id="treeDemo" class="ztree"></ul></td>
        <td class="va-t">
            <div class="page-container">
                <form action="" method="post" class="form form-horizontal" id="category-edit">
                    <input type="text" hidden class="input-text" value="-1" id="id" name="id">
                    <input type="text" hidden class="input-text" value="0" id="parentId" name="parentId">
                    <input type="text" hidden class="input-text" value="1" id="status" name="status">
                    <input type="text" hidden class="input-text" value="true" id="isParent" name="isParent">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            <span class="c-red">*</span>
                            分类名称：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否为父节点：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <div id="parentSwitch" class="switch" data-on-label="是" data-on="info" data-off-label="否">
                                <input type="checkbox" checked />
                            </div>
                        </div>
                    </div>
                    <div class="row cl" id="choose-parent">
                        <label class="form-label col-xs-4 col-sm-2">选择父节点：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" onclick="chooseParent()" readonly class="input-text" value="" placeholder="请点击选择其父节点分类" id="parentName" name="parentName" style="width:48%">
                            <input type="button" onclick="chooseParent()" class="btn btn-secondary radius" value="选择父节点分类">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            <span class="c-red">*</span>
                            排序优先值：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text" value="" placeholder="请输入0~9999，值越小排序越前" id="sortOrder" name="sortOrder">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否启用：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <div id="mySwitch" class="switch" data-on-label="启用" data-on="info" data-off-label="禁用">
                                <input type="checkbox" checked />
                            </div>
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">备注：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <textarea name="remark" id="remark" cols="" rows="" class="textarea"  placeholder="说点什么...最多输入100个字符"></textarea>
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-9 col-offset-2">
                            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交修改&nbsp;&nbsp;">
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
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

    /*文本输入限制*/
    $(".textarea").Huitextarealength({
        minlength:0,
        maxlength:100
    });

    function refresh(){
        location.reload();
    }

    function chooseParent(){
        layer_show("选择父节点分类","choose-parent-category",300,510);
    }
    
    function setParentId(id,name) {
        $("#parentName").val(name);
        $("#parentId").val(id);
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
            url: "/item/cat/list",
            type: "GET",
            contentType: "application/json",
            autoParam: ["id"]
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    $("#name").val(treeNode.name);
                    $("#id").val(treeNode.id);
                    $("#sortOrder").val(treeNode.sortOrder);
                    $("#remark").val(treeNode.remark);
                    $("#parentId").val(treeNode.pId);
                    if($("#parentId").val()==""){
                        $("#parentId").val(0);
                    }
                    changeSwitch1(1);
                    changeSwitch2(treeNode.status);
                    id=treeNode.id;
                    name=treeNode.name;
                    $("#parentName").val(treeNode.getParentNode().name);
                    return false;
                } else {
                    $("#name").val(treeNode.name);
                    $("#id").val(treeNode.id);
                    $("#sortOrder").val(treeNode.sortOrder);
                    $("#remark").val(treeNode.remark);
                    $("#parentId").val(treeNode.pId);
                    if($("#parentId").val()==""){
                        $("#parentId").val(0);
                    }
                    changeSwitch1(0);
                    changeSwitch2(treeNode.status);
                    id=treeNode.id;
                    name=treeNode.name;
                    $("#parentName").val(treeNode.getParentNode().name);
                    return true;
                }
            }
        }
    };

    function changeSwitch1(value){
        if(value==1){
            $('#parentSwitch').bootstrapSwitch('setState', true);
        }else{
            $('#parentSwitch').bootstrapSwitch('setState', false);
        }
    }

    $('#parentSwitch').on('switch-change', function (e, data) {
        if(data.value==true){
            $("#isParent").val(true);
        }else{
            $("#isParent").val(false);
        }
    });

    function changeSwitch2(value){
        if(value==1){
            $('#mySwitch').bootstrapSwitch('setState', true);
        }else{
            $('#mySwitch').bootstrapSwitch('setState', false);
        }
    }

    $('#mySwitch').on('switch-change', function (e, data) {
        if(data.value==true){
            $("#status").val(1);
        }else{
            $("#status").val(0);
        }
    });

    $(document).ready(function(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting);
        demoIframe = $("#testIframe");
        //demoIframe.on("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });

    //保存提交
    $("#category-edit").validate({
        rules:{
            name:{
                required:true,
                minlength:1,
                maxlength:25,
            },
            sortOrder:{
                required:true,
                digits:true,
                maxlength:4,
            },
        },
        onkeyup:false,
        focusCleanup:false,
        success:"valid",
        submitHandler:function(form){
//            if($("#isParent").val()=="false"&&$("#parentId").val()==""){
//                layer.alert('请点击选择父节点分类! ', {title: '错误信息',icon: 0});
//                return;
//            }
            $(form).ajaxSubmit({
                url: "/item/cat/update",
                type: "POST",
                success: function(data) {
                    if(data.success==true){
                        msgSuccess("编辑成功!");
                    }else{
                        layer.alert('添加失败! '+data.message, {title: '错误信息',icon: 2});
                    }
                },
                error:function(XMLHttpRequest) {
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
                }
            });
        }
    });

    /*分类-添加*/
    function category_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*分类-删除*/
    function category_del() {
        var id=$("#id").val();
        if(id==-1){
            layer.alert('请点击选择要删除的分类! ', {title: '错误信息',icon: 0});
            return;
        }
        layer.confirm('确认要删除所选的\''+name+'\'分类吗？',{icon:0},function(index){
            $.ajax({
                type: 'DELETE',
                url: '/item/cat/del/' +id,
                dataType: 'json',
                success: function(data) {
                    if(data.success==true){
                        msgSuccess("删除成功!");
                    }else{
                        layer.alert('修改失败! '+data.message, {title: '错误信息',icon: 2});
                    }
                },
                error: function (XMLHttpRequest) {
                    layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(XMLHttpRequest.responseText).message, {
                        title: '错误信息',
                        icon: 2
                    });
                }
            });
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
