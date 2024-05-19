
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
    <style>
        .box1{
            float: left;
            height: 300px;
        }
    </style>


    <title>QR code payment</title>
</head>
<body>
    <h1 style="align-content: center">QR code payment</h1>

    <h2>Choose your payment method:</h2>
     <div class="box1">
         <div><a href="wechat.jsp"><img src="${cp}/img/微信支付.png"></a></div>
         <div><a href="Alipay.jsp"><img src="${cp}/img/支付宝.png"></a></div>

     </div>
</body>
</html>