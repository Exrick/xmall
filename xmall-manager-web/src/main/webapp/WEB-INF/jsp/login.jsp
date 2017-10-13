<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>XMall后台管理系统</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Meta tag Keywords -->

    <!-- css files -->
    <link rel="stylesheet" href="lib/login-css/style.css" type="text/css" media="all" /> <!-- Style-CSS -->
    <link rel="stylesheet" href="lib/login-css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->

    <!-- js -->
    <script type="text/javascript" src="lib/jquery/jquery-2.1.4.min.js"></script>
    <!-- //js -->

    <style>
        .title,h6{
            font-family: "黑体";
        }
    </style>
</head>
<body>
<script src="lib/jquery/jquery.vide.min.js"></script>
<!-- main -->
<div data-vide-bg="lib/video/Ipad">
    <div class="center-container">
        <!--header-->
        <div class="header-w3l">
            <h1>XMall<span class="title">后台管理系统</span></h1>
        </div>
        <!--//header-->
        <div class="main-content-agile">
            <div class="sub-main-w3">
                <div class="wthree-pro">
                    <h2>Login Here</h2>
                </div>
                <form action="/" method="post">
                    <input placeholder="用户名或邮箱" name="Name" class="user" type="email" required="">
                    <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br><br>
                    <input  placeholder="密码" name="Password" class="pass" type="password" required="">
                    <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><br>
                    <div class="sub-w3l">
                        <h6><a href="#">忘记密码?</a></h6>
                        <div class="right-w3l">
                            <input type="submit" class="login" value="登录">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--//main-->

        <!--footer-->
        <div class="footer">
            <p>&copy; 2017 XMall. All rights reserved | Design by <a href="http://blog.exrick.cn">Exrick</a></p>
        </div>
        <!--//footer-->
    </div>
</div>

</body>
</html>
