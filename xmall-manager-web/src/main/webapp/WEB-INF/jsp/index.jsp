<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="favicon.ico" >
    <link rel="Shortcut Icon" href="icon/all.png" />
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
    <title>XMall后台管理系统 v1.0</title>
    <meta name="keywords" content="XMall后台管理系统 v1.0,XMall,XMall购物商城后台管理系统">
    <meta name="description" content="XMall后台管理系统 v1.0，是一款电商后台管理系统，适合中小型CMS后台系统。">
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/">XMall后台管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/">H-ui</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onclick="product_add('添加商品','product-add')"><i class="Hui-iconfont">&#xe620;</i> 商品</a></li>
                            <li><a href="javascript:;" onclick="member_add('添加用户','member-add','','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
                        </ul>
                        <li class="navbar-levelone current"><a href="javascript:;">平台</a></li>
                        <li class="navbar-levelone"><a href="javascript:;">财务</a></li>
                        <li ><a href="http://xpay.exrick.cn" target="_blank">XPay支付系统</a></li>
                        <li ><a href="http://xmall.exrick.cn" target="_blank">商城前台</a></li>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li style="right:5px" id="role"></li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A"><sapn id="username"></sapn> <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
                            <li><a onclick="logout()">切换账户</a></li>
                            <li><a onclick="logout()">退出</a></li>
                        </ul>
                    </li>
                    <li id="thanks"> <a onclick="thanks()" title="捐赠"><i class="Hui-iconfont" style="font-size:18px">&#xe6bb;</i></a> </li>
                    <li id="LockScreen"> <a href="lock-screen" title="锁屏"><i class="Hui-iconfont" style="font-size:18px">&#xe60e;</i></a> </li>
                    <li id="Hui-msg"> <a onclick="thanks()" title="消息"><span class="badge badge-danger">3</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（蓝色）">默认（蓝色）</a></li>
                            <li><a href="javascript:;" data-val="black" title="黑色">黑色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 商城管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="content-category" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>
                    <li><a data-href="content-list" data-title="内容管理" href="javascript:void(0)">内容管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="picture-list.html" data-title="图片管理" href="javascript:void(0)">图片管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="product-category" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
                    <li><a data-href="product-list" data-title="商品列表" href="javascript:void(0)">商品列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-search">
            <dt><i class="Hui-iconfont">&#xe665;</i> 搜索管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="refresh-index" data-title="同步索引" href="javascript:void(0)">同步索引</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="http://changyan.kuaizhan.com/" data-title="畅言评论管理" href="javascript:void(0)">畅言评论管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="member-list" data-title="会员列表" href="javascript:;">会员列表</a></li>
                    <li><a data-href="member-del" data-title="删除的会员" href="javascript:;">删除的会员</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="admin-role" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
                    <li><a data-href="admin-permission" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
                    <li><a data-href="admin-list" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="system-shiro" data-title="权限配置" href="javascript:void(0)">权限配置</a></li>
                    <li><a data-href="system-base" data-title="基本设置" href="javascript:void(0)">基本设置</a></li>
                    <li><a data-href="system-log" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
                </ul>
            </dd>
        </dl>
    </div>

    <div class="menu_dropdown bk_2" style="display:none">
        <dl id="menu-a">
            <dt><i class="Hui-iconfont">&#xe627;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="order-list" data-title="订单列表" href="javascript:void(0)">订单列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-b">
            <dt><i class="Hui-iconfont">&#xe6b7;</i> 捐赠管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="thanks-list" data-title="捐赠列表" href="javascript:void(0)">捐赠列表</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的首页" data-href="welcome">我的首页</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="welcome"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">

    $(function(){
        $("body").Huitab({
            tabBar:".navbar-wrapper .navbar-levelone",
            tabCon:".Hui-aside .menu_dropdown",
            className:"current",
            index:0,
        });
    });

    /*个人信息*/
    function myselfinfo(){
        layer_show('管理员信息','admin-show',360,400);
    }
    
    /*产品-添加*/
    function product_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    var username="",description="",sex="",phone="",email="",address="",created="",file="";
    $.ajax({
        type: 'GET',
        url: '/user/userInfo',
        success:function (data) {
            if(data.success==true){
                $("#role").html(data.result.description);
                $("#username").html(data.result.username);
                username=data.result.username;
                description=data.result.description;
                sex=data.result.sex;
                phone=data.result.phone;
                email=data.result.email;
                address=data.result.address;
                created=data.result.created;
                file=data.result.file;
            }else {
                layer.alert(data.message,{title: '错误信息',icon: 2});
            }
        },
        error:function(XMLHttpRequest){
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
        }
    });
    
    function logout() {
        $.ajax({
            type: 'GET',
            url: '/user/logout',
            success:function (data) {
                window.location.href="/login";
            },
            error:function(XMLHttpRequest){
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
            }
        });
    }

    function thanks(){
        layer.open({
            title: '捐赠',
            type: 2,
            skin: 'layui-layer-rim', //加上边框
            area: ['525px', '300px'], //宽高
            content: ['thanks-pic','no']
        });
    }
</script>
</body>
</html>
