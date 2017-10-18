<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Exrick">
    <link rel="Shortcut Icon" href="icon/all.png" />
    <title>XMall后台管理系统 v1.0</title>
    <meta name="keywords" content="XMall后台管理系统 v1.0,XMall,XMall购物商城后台管理系统">
    <meta name="description" content="XMall后台管理系统 v1.0，是一款电商后台管理系统，适合中小型CMS后台系统。">

    <!-- Bootstrap core CSS -->
    <link href="lib/flatlab/css/bootstrap.min.css" rel="stylesheet">
    <link href="lib/flatlab/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="lib/flatlab/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="lib/flatlab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="lib/flatlab/css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="lib/flatlab/css/style.css" rel="stylesheet">
    <link href="lib/flatlab/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="lib/flatlab/js/html5shiv.js"></script>
    <script src="lib/flatlab/js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    #main-content {
        margin-left: 20px;
        margin-top: -50px;
    }
    .text-center a{
        color: #53bee6;
    }
</style>
<body>
<section id="container" >
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--state overview start-->
            <div class="row state-overview">
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol terques">
                            <i class="icon-user"></i>
                        </div>
                        <div class="value">
                            <h1 class="count">
                                0
                            </h1>
                            <p>用户总数</p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol red">
                            <i class="icon-tags"></i>
                        </div>
                        <div class="value">
                            <h1 class=" count2">
                                0
                            </h1>
                            <p>商品总数</p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol yellow">
                            <i class="icon-shopping-cart"></i>
                        </div>
                        <div class="value">
                            <h1 class=" count3">
                                0
                            </h1>
                            <p>订单总数</p>
                        </div>
                    </section>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <section class="panel">
                        <div class="symbol blue">
                            <i class="icon-bar-chart"></i>
                        </div>
                        <div class="value">
                            <h1 class=" count4">
                                0
                            </h1>
                            <p>浏览量</p>
                        </div>
                    </section>
                </div>
            </div>
            <!--state overview end-->

            <div class="row">
                <div class="col-lg-8">
                    <!--custom chart start-->
                    <div class="border-head">
                        <h3>系统统计</h3>
                    </div>
                    <div class="custom-bar-chart">
                        <ul class="y-axis">
                            <li><span>100</span></li>
                            <li><span>80</span></li>
                            <li><span>60</span></li>
                            <li><span>40</span></li>
                            <li><span>20</span></li>
                            <li><span>0</span></li>
                        </ul>
                        <div class="bar">
                            <div class="title">JAN</div>
                            <div class="value tooltips" data-original-title="80%" data-toggle="tooltip" data-placement="top">80%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">FEB</div>
                            <div class="value tooltips" data-original-title="50%" data-toggle="tooltip" data-placement="top">50%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">MAR</div>
                            <div class="value tooltips" data-original-title="40%" data-toggle="tooltip" data-placement="top">40%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">APR</div>
                            <div class="value tooltips" data-original-title="55%" data-toggle="tooltip" data-placement="top">55%</div>
                        </div>
                        <div class="bar">
                            <div class="title">MAY</div>
                            <div class="value tooltips" data-original-title="20%" data-toggle="tooltip" data-placement="top">20%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">JUN</div>
                            <div class="value tooltips" data-original-title="39%" data-toggle="tooltip" data-placement="top">39%</div>
                        </div>
                        <div class="bar">
                            <div class="title">JUL</div>
                            <div class="value tooltips" data-original-title="75%" data-toggle="tooltip" data-placement="top">75%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">AUG</div>
                            <div class="value tooltips" data-original-title="45%" data-toggle="tooltip" data-placement="top">45%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">SEP</div>
                            <div class="value tooltips" data-original-title="50%" data-toggle="tooltip" data-placement="top">50%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">OCT</div>
                            <div class="value tooltips" data-original-title="42%" data-toggle="tooltip" data-placement="top">42%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">NOV</div>
                            <div class="value tooltips" data-original-title="60%" data-toggle="tooltip" data-placement="top">60%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">DEC</div>
                            <div class="value tooltips" data-original-title="90%" data-toggle="tooltip" data-placement="top">90%</div>
                        </div>
                    </div>
                    <!--custom chart end-->
                </div>
                <div class="col-lg-4">
                    <!--new earning start-->
                    <div class="panel terques-chart">
                        <div class="panel-body chart-texture">
                            <div class="chart">
                                <div class="heading">
                                    <span>Friday</span>
                                    <strong>$ 57,00 | 15%</strong>
                                </div>
                                <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
                            </div>
                        </div>
                        <div class="chart-tittle">
                            <span class="title">New Earning</span>
                            <span class="value">
                                  <a href="#" class="active">Market</a>
                                  |
                                  <a href="#">Referal</a>
                                  |
                                  <a href="#">Online</a>
                              </span>
                        </div>
                    </div>
                    <!--new earning end-->

                    <!--total earning start-->
                    <div class="panel green-chart">
                        <div class="panel-body">
                            <div class="chart">
                                <div class="heading">
                                    <span>June</span>
                                    <strong>23 Days | 65%</strong>
                                </div>
                                <div id="barchart"></div>
                            </div>
                        </div>
                        <div class="chart-tittle">
                            <span class="title">Total Earning</span>
                            <span class="value">$, 76,54,678</span>
                        </div>
                    </div>
                    <!--total earning end-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <!--user info table start-->
                    <section class="panel">
                        <div class="panel-body">
                            <a href="http://blog.exrick.cn" target="_blank" class="task-thumb">
                                <img width="83px" height="83px" src="lib/flatlab/img/avatar1.jpg" alt="">
                            </a>
                            <div class="task-thumb-details">
                                <h1><a href="http://blog.exrick.cn" target="_blank">Exrick</a></h1>
                                <p>Author</p>
                            </div>
                        </div>
                        <table class="table table-hover personal-task">
                            <tbody>
                            <tr>
                                <td>
                                    <i class=" icon-tasks"></i>
                                </td>
                                <td>New Task Issued</td>
                                <td> 02</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="icon-warning-sign"></i>
                                </td>
                                <td>Task Pending</td>
                                <td> 14</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="icon-envelope"></i>
                                </td>
                                <td>Inbox</td>
                                <td> 45</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class=" icon-bell-alt"></i>
                                </td>
                                <td>New Notification</td>
                                <td> 09</td>
                            </tr>
                            </tbody>
                        </table>
                    </section>
                    <!--user info table end-->
                </div>
                <div class="col-lg-8">
                    <!--work progress start-->
                    <section class="panel">
                        <div class="panel-body progress-panel">
                            <div class="task-progress">
                                <h1>工作进度</h1>
                                <p>Exrick</p>
                            </div>
                            <div class="task-option">
                                <select class="styled">
                                    <option>Exrick</option>
                                    <option>欢迎您加入开发</option>
                                </select>
                            </div>
                        </div>
                        <table class="table table-hover personal-task">
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    Target Sell
                                </td>
                                <td>
                                    <span class="badge bg-important">75%</span>
                                </td>
                                <td>
                                    <div id="work-progress1"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    Product Delivery
                                </td>
                                <td>
                                    <span class="badge bg-success">43%</span>
                                </td>
                                <td>
                                    <div id="work-progress2"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    Payment Collection
                                </td>
                                <td>
                                    <span class="badge bg-info">67%</span>
                                </td>
                                <td>
                                    <div id="work-progress3"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>
                                    Work Progress
                                </td>
                                <td>
                                    <span class="badge bg-warning">30%</span>
                                </td>
                                <td>
                                    <div id="work-progress4"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>
                                    Delivery Pending
                                </td>
                                <td>
                                    <span class="badge bg-primary">15%</span>
                                </td>
                                <td>
                                    <div id="work-progress5"></div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </section>
                    <!--work progress end-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <!--timeline start-->
                    <section class="panel">
                        <div class="panel-body">
                            <div class="text-center mbot30">
                                <h3 class="timeline-title">XMall更新日志</h3>
                                <p class="t-info">This is a project timeline</p>
                            </div>

                            <div class="timeline">
                                <article class="timeline-item">
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <span class="arrow"></span>
                                                <span class="timeline-icon red"></span>
                                                <span class="timeline-date">08:25 am</span>
                                                <h1 class="red">12 July | Sunday</h1>
                                                <p>Lorem ipsum dolor sit amet consiquest dio</p>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-item alt">
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <span class="arrow-alt"></span>
                                                <span class="timeline-icon green"></span>
                                                <span class="timeline-date">10:00 am</span>
                                                <h1 class="green">10 July | Wednesday</h1>
                                                <p><a href="#">Jonathan Smith</a> added new milestone <span><a href="#" class="green">ERP</a></span></p>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-item">
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <span class="arrow"></span>
                                                <span class="timeline-icon blue"></span>
                                                <span class="timeline-date">11:35 am</span>
                                                <h1 class="blue">05 July | Monday</h1>
                                                <p><a href="#">Anjelina Joli</a> added new album <span><a href="#" class="blue">PARTY TIME</a></span></p>
                                                <div class="album">
                                                    <a href="#">
                                                        <img alt="" src="lib/flatlab/img/sm-img-1.jpg">
                                                    </a>
                                                    <a href="#">
                                                        <img alt="" src="lib/flatlab/img/sm-img-2.jpg">
                                                    </a>
                                                    <a href="#">
                                                        <img alt="" src="lib/flatlab/img/sm-img-3.jpg">
                                                    </a>
                                                    <a href="#">
                                                        <img alt="" src="lib/flatlab/img/sm-img-1.jpg">
                                                    </a>
                                                    <a href="#">
                                                        <img alt="" src="lib/flatlab/img/sm-img-2.jpg">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-item alt">
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <span class="arrow-alt"></span>
                                                <span class="timeline-icon purple"></span>
                                                <span class="timeline-date">3:20 pm</span>
                                                <h1 class="purple">29 June | Saturday</h1>
                                                <p>Lorem ipsum dolor sit amet consiquest dio</p>
                                                <div class="notification">
                                                    <i class=" icon-exclamation-sign"></i> New task added for <a href="#">Denial Collins</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-item">
                                    <div class="timeline-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <span class="arrow"></span>
                                                <span class="timeline-icon light-green"></span>
                                                <span class="timeline-date">07:49 pm</span>
                                                <h1 class="light-green">10 June | Friday</h1>
                                                <p><a href="#">Jonatha Smith</a> added new milestone <span><a href="#" class="light-green">prank</a></span> Lorem ipsum dolor sit amet consiquest dio</p>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <div class="clearfix">&nbsp;</div>
                        </div>
                    </section>
                    <!--timeline end-->
                </div>
                <div class="col-lg-4">
                    <!--revenue start-->
                    <section class="panel">
                        <div class="revenue-head">
                              <span>
                                  <i class="icon-bar-chart"></i>
                              </span>
                            <h3>Revenue</h3>
                            <span class="rev-combo pull-right">
                                 June 2013
                              </span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 text-center">
                                    <div class="easy-pie-chart">
                                        <div class="percentage" data-percent="35"><span>35</span>%</div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="chart-info chart-position">
                                        <span class="increase"></span>
                                        <span>Revenue Increase</span>
                                    </div>
                                    <div class="chart-info">
                                        <span class="decrease"></span>
                                        <span>Revenue Decrease</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer revenue-foot">
                            <ul>
                                <li class="first active">
                                    <a href="javascript:;">
                                        <i class="icon-bullseye"></i>
                                        Graphical
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class=" icon-th-large"></i>
                                        Tabular
                                    </a>
                                </li>
                                <li class="last">
                                    <a href="javascript:;">
                                        <i class=" icon-align-justify"></i>
                                        Listing
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </section>
                    <!--revenue end-->
                    <!--features carousel start-->
                    <section class="panel">
                        <div class="flat-carousal">
                            <div id="owl-demo" class="owl-carousel owl-theme">
                                <div class="item">
                                    <h1>Flatlab is new model of admin dashboard for happy use</h1>
                                    <div class="text-center">
                                        <a href="javascript:;" class="view-all">View All</a>
                                    </div>
                                </div>
                                <div class="item">
                                    <h1>Fully responsive and build with Bootstrap 3.0</h1>
                                    <div class="text-center">
                                        <a href="javascript:;" class="view-all">View All</a>
                                    </div>
                                </div>
                                <div class="item">
                                    <h1>Responsive Frontend is free if you get this.</h1>
                                    <div class="text-center">
                                        <a href="javascript:;" class="view-all">View All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <ul class="ft-link">
                                <li class="active">
                                    <a href="javascript:;">
                                        <i class="icon-reorder"></i>
                                        Sales
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class=" icon-calendar-empty"></i>
                                        promo
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class=" icon-camera"></i>
                                        photo
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class=" icon-circle"></i>
                                        other
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </section>
                    <!--features carousel end-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <!--latest product info start-->
                    <section class="panel post-wrap pro-box">
                        <aside>
                            <div class="post-info">
                                <span class="arrow-pro right"></span>
                                <div class="panel-body">
                                    <h1><strong>popular</strong> <br> Brand of this week</h1>
                                    <div class="desk yellow">
                                        <h3>Dimond Ring</h3>
                                        <p>Lorem ipsum dolor set amet lorem ipsum dolor set amet ipsum dolor set amet</p>
                                    </div>
                                    <div class="post-btn">
                                        <a href="javascript:;">
                                            <i class="icon-chevron-sign-left"></i>
                                        </a>
                                        <a href="javascript:;">
                                            <i class="icon-chevron-sign-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </aside>
                        <aside class="post-highlight yellow v-align">
                            <div class="panel-body text-center">
                                <div class="pro-thumb">
                                    <img src="lib/flatlab/img/ring.jpg" alt="">
                                </div>
                            </div>
                        </aside>
                    </section>
                    <!--latest product info end-->
                    <!--twitter feedback start-->
                    <section class="panel post-wrap pro-box">
                        <aside class="post-highlight terques v-align">
                            <div class="panel-body">
                                <h2>Flatlab is new model of admin dashboard <a href="javascript:;"> http://demo.com/</a> 4 days ago  by jonathan smith</h2>
                            </div>
                        </aside>
                        <aside>
                            <div class="post-info">
                                <span class="arrow-pro left"></span>
                                <div class="panel-body">
                                    <div class="text-center twite">
                                        <h1>Twitter Feed</h1>
                                    </div>

                                    <footer class="social-footer">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                    <i class="icon-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="#">
                                                    <i class="icon-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="icon-google-plus"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="icon-pinterest"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </footer>
                                </div>
                            </div>
                        </aside>
                    </section>
                    <!--twitter feedback end-->
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-xs-6">
                            <!--pie chart start-->
                            <section class="panel">
                                <div class="panel-body">
                                    <div class="chart">
                                        <div id="pie-chart" ></div>
                                    </div>
                                </div>
                                <footer class="pie-foot">
                                    Free: 260GB
                                </footer>
                            </section>
                            <!--pie chart start-->
                        </div>
                        <div class="col-xs-6">
                            <!--follower start-->
                            <section class="panel">
                                <div class="follower">
                                    <div class="panel-body">
                                        <h4>Jonathan Smith</h4>
                                        <div class="follow-ava">
                                            <img src="lib/flatlab/img/follower-avatar.jpg" alt="">
                                        </div>
                                    </div>
                                </div>

                                <footer class="follower-foot">
                                    <ul>
                                        <li>
                                            <h5>2789</h5>
                                            <p>Follower</p>
                                        </li>
                                        <li>
                                            <h5>270</h5>
                                            <p>Following</p>
                                        </li>
                                    </ul>
                                </footer>
                            </section>
                            <!--follower end-->
                        </div>
                    </div>
                    <!--weather statement start-->
                    <section class="panel">
                        <div class="weather-bg">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <i class="icon-cloud"></i>
                                        California
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="degree">
                                            24°
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <footer class="weather-category">
                            <ul>
                                <li class="active">
                                    <h5>humidity</h5>
                                    56%
                                </li>
                                <li>
                                    <h5>precip</h5>
                                    1.50 in
                                </li>
                                <li>
                                    <h5>winds</h5>
                                    10 mph
                                </li>
                            </ul>
                        </footer>

                    </section>
                    <!--weather statement end-->
                </div>
            </div>

        </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            Copyright &copy;2017 <a href="http://blog.exrick.cn" target="_blank">exrick.cn</a> All Rights Reserved.
            本后台系统由<a href="http://www.h-ui.net/" target="_blank"> H-ui</a>、<a href="https://themeforest.net/item/flatlab-bootstrap-3-responsive-admin-template/5902687" target="_blank">FlatLab </a>提供前端静态页面支持
            <a href="#" class="go-top">
                <i class="icon-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="lib/flatlab/js/jquery.js"></script>
<script src="lib/flatlab/js/jquery-1.8.3.min.js"></script>
<script src="lib/flatlab/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="lib/flatlab/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/flatlab/js/jquery.scrollTo.min.js"></script>
<script src="lib/flatlab/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="lib/flatlab/js/jquery.sparkline.js" type="text/javascript"></script>
<script src="lib/flatlab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script src="lib/flatlab/js/owl.carousel.js" ></script>
<script src="lib/flatlab/js/jquery.customSelect.min.js" ></script>
<script src="lib/flatlab/js/respond.min.js" ></script>

<script class="include" type="text/javascript" src="lib/flatlab/js/jquery.dcjqaccordion.2.7.js"></script>

<!--common script for all pages-->
<script src="lib/flatlab/js/common-scripts.js"></script>

<!--script for this page-->
<script src="lib/flatlab/js/sparkline-chart.js"></script>
<script src="lib/flatlab/js/easy-pie-chart.js"></script>
<script src="lib/flatlab/js/count.js"></script>

<script>

    //owl carousel
    $(document).ready(function() {
        $("#owl-demo").owlCarousel({
            navigation : true,
            slideSpeed : 300,
            paginationSpeed : 400,
            singleItem : true,
            autoPlay:true

        });
    });

    //custom select box
    $(function(){
        $('select.styled').customSelect();
    });

</script>

</body>
</html>
