
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


    <title>Wechat Payment</title>
</head>
<body>
<h1 style="align-content: center">Wechat Payment</h1>
    <img src="${cp}/img/微信二维码.png">
<script>
    $(document).ready(function() {
        // 等待 3 秒后弹出确认框
        setTimeout(function() {
            layer.confirm('Go to order status?', {
                icon: 1,
                title: 'The purchase was successful',
                btn: ['Go to Order', 'Continue Purchase']
            }, function() {
                // 点击“前往订单”按钮后执行的回调函数
                window.location.href = "${cp}/shopping_record";
            }, function(index) {
                // 点击“继续购买”按钮后执行的回调函数
                layer.close(index); // 关闭确认框
                layer.msg('Continue Buying', { icon: 1 }); // 弹出提示信息
            });
        }, 3000); // 3 秒后弹出确认框
    });
</script>



</body>
</html>