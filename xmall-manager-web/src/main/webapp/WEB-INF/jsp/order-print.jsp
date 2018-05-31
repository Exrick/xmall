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
    <title>订单信息</title>
</head>
<style>
    .title{
        margin-bottom: 15px;
    }
    .item{
        width: 24%;
        text-align: left;
        display: inline-block;
        line-height: 30px;
    }
    .itemAdress {
        width: 50%;
        text-align: left;
        display: inline-block;
        line-height: 30px;
    }
</style>
<body>
<div class="page-container">
    <div id="print">
        <form class="form form-horizontal">
            <div>
                <h3 class="text-c title">XMall商城订单信息</h3>
                <div class="item">会员名称：<span id="customerName"></span></div>
                <div class="item">下单时间：<span id="createTime"></span></div>
                <div class="item">订单编号：<span id="orderCode"></span></div>
                <div class="item">支付方式：<span id="payType"></span></div>
                <div class="item">付款时间：<span id="payTime"></span></div>
                <div class="item">发货时间：<span id="deliverTime"></span></div>
                <div class="item">发货单号：<span id="expressId"></span></div>
                <div class="item">收货人：<span id="receiver"></span></div>
                <div class="item">手机：<span id="telephone"></span></div>
                <div class="itemAdress">收货地址：<span id="expressAdress"></span></div>
            </div>
        </form>

        <div class="mt-20">
            <table class="table table-border table-bg table-bordered table-striped table-hover">
                <thead>
                    <tr class="text-c">
                        <th width="40">商品名称</th>
                        <th width="40">商品ID号</th>
                        <th width="20">价格(￥)</th>
                        <th width="10">数量(件)</th>
                        <th width="20">小计(￥)</th>
                    </tr>
                </thead>
                <tbody id="products">

                </tbody>

            </table>
        </div>

        <div class="text-r"  style="margin-top: 1vw">
            运费：￥<span id="expressCost"></span> + 支付费用：￥<span id="orderPrice"></span> - 订单折扣：￥0
            = 订单总金额：￥<span id="orderPriceAll"></span>
        </div>
        <div class="text-r">= 应付款金额：￥<span id="orderPriceAll2"></div>
        <div class="text-l">订单备注：<span id="remark"></div>
    </div>

    <div class="row cl" style="margin-top: 1vw">
        <div class="text-c">
            <input id="saveButton" class="btn btn-primary radius" onclick="print()" value="打印">
        </div>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/datatables/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript" src="lib/jQuery.print.js"></script>
<script type="text/javascript">
    function print() {
        jQuery('#print').print();
    }

    //加载数据
    var index = layer.load(3);
    $.ajax({
        type: 'GET',
        url: "/order/detail/"+parent.orderId,
        dataType: 'json',
        success: function(data){
            layer.close(index);
            if(data.success!=true){
                layer.alert(data.message,{title: '错误信息',icon: 2},function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
                return;
            }
            $("#customerName").html(data.result.tbOrder.buyerNick);
            $("#createTime").html(date(data.result.tbOrder.createTime));
            $("#orderCode").html(data.result.tbOrder.orderId);
            $("#payType").html("在线支付");
            $("#deliverTime").html(date(data.result.tbOrder.consignTime));
            $("#expressId").html(data.result.tbOrder.shippingCode);
            $("#expressAdress").html(data.result.tbOrderShipping.receiverAddress);
            $("#payTime").html(date(data.result.tbOrder.paymentTime));
            $("#receiver").html(data.result.tbOrderShipping.receiverName);
            $("#telephone").html(data.result.tbOrderShipping.receiverPhone);

            var products=data.result.tbOrderItem;
            var i=0;
            for(i=0;i<products.length;i++){
                $("#products").append("<tr class='text-c'><td>"+products[i].title+"</td>" +
                    "<td>"+products[i].itemId+"</td><td>"+products[i].price+"</td><td>"+products[i].num+"</td>" +
                    "<td>"+products[i].totalFee+"</td></tr>");
            }
            if(data.result.tbOrder.postFee==null||data.result.tbOrder.postFee==""){
                data.result.tbOrder.postFee=0;
            }
            $("#expressCost").html(data.result.tbOrder.postFee);
            $("#orderPrice").html(data.result.tbOrder.payment);
            $("#orderPriceAll").html(data.result.tbOrder.payment);
            $("#orderPriceAll2").html(data.result.tbOrder.payment);
            $("#remark").html(data.result.tbOrder.buyerMessage);
        },
        error:function(XMLHttpRequest){
            layer.close(index);
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
        }
    });

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>