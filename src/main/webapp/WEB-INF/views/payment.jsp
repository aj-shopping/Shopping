
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>


    <title>二维码支付</title>
</head>
<body>
    <h1>二维码支付</h1>


    <h2>请使用支付宝、微信等扫描以下二维码进行支付：</h2>
    <img src="${cp}/img/qr.jpg">

    <script>
        $(document).ready(function() {
            // 等待 3 秒后弹出确认框
            setTimeout(function() {
                layer.confirm('前往订单状态？', {
                    icon: 1,
                    title: '购买成功',
                    btn: ['前往订单', '继续购买']
                }, function() {
                    // 点击“前往订单”按钮后执行的回调函数
                    window.location.href = "${cp}/shopping_record";
                }, function(index) {
                    // 点击“继续购买”按钮后执行的回调函数
                    layer.close(index); // 关闭确认框
                    layer.msg('继续购买', { icon: 1 }); // 弹出提示信息
                });
            }, 3000); // 3 秒后弹出确认框
        });
    </script>



</body>
</html>