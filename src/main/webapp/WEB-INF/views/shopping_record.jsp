<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping+</title>
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--导航栏部分-->
<jsp:include page="include/header.jsp"/>

<!-- 中间内容 -->
<div class="container-fluid bigHead">
    <div class="row">
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="jumbotron">
                <h1>Welcome to the order page</h1>
                <p>Your purchase list is:</p>
            </div>
        </div>
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="row">
                <ul class="nav nav-tabs list-group-diy" role="tablist">
                    <li role="presentation" class="active list-group-item-diy"><a href="#unHandle"
                                                                                  aria-controls="unHandle" role="tab"
                                                                                  data-toggle="tab">Orders to be shipped&nbsp;<span
                            class="badge" id="unHandleCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#transport" aria-controls="transport"
                                                                           role="tab" data-toggle="tab">Orders in
                        transit&nbsp;<span class="badge" id="transportCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#receive" aria-controls="receive"
                                                                           role="tab" data-toggle="tab">The order
                        received&nbsp;<span class="badge" id="receiveCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#all" aria-controls="all" role="tab"
                                                                           data-toggle="tab">All orders&nbsp;<span
                            class="badge" id="allCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#refund" aria-controls="refund"
                                                                           role="tab" data-toggle="tab">The order
                        refunded&nbsp;<span class="badge" id="refundCount">0</span></a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="unHandle">
                        <table class="table table-hover center" id="unHandleTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="transport">
                        <table class="table table-hover center" id="transportTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="receive">
                        <table class="table table-hover center" id="receiveTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="all">
                        <table class="table table-hover center" id="allTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="refund">
                        <table class="table table-hover center" id="refundTable">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>

<script type="text/javascript">
    var loading = layer.load(0);
    updateShoppingRecords();

    function updateShoppingRecords() {
        var orderArray = new Array;
        orderArray[0] = "Not shipped";
        orderArray[1] = "In Progress";
        orderArray[2] = "Received";
        orderArray[3] = "Refunded";
        var unHandleTable = document.getElementById("unHandleTable");
        var transportTable = document.getElementById("transportTable");
        var receiveTable = document.getElementById("receiveTable");
        var refundTable = document.getElementById("refundTable");
        var allTable = document.getElementById("allTable");

        var unHandleCount = document.getElementById("unHandleCount");
        var transportCount = document.getElementById("transportCount");
        var receiveCount = document.getElementById("receiveCount");
        var allCount = document.getElementById("allCount");
        var refundCount = document.getElementById("refundCount");

        var unHandleCounts = parseInt(unHandleCount.innerHTML);
        var transportCounts = parseInt(transportCount.innerHTML);
        var receiveCounts = parseInt(receiveCount.innerHTML);
        var allCounts = parseInt(allCount.innerHTML);
        var refundCounts = parseInt(refundCount.innerHTML);

        var allShoppingRecords = getShoppingRecords();
        unHandleTable.innerHTML = "";
        transportTable.innerHTML = "";
        receiveTable.innerHTML = "";
        refundTable.innerHTML = "";

        allTable.innerHTML = "";
        var unHandleHTML = '<tr>' +
            '<th>The title of the product</th>' +
            '<th>Quantity purchased</th>' +
            '<th>The amount of the payment</th>' +
            '<th>Address</th>' +
            '<th>Delivery ID</th>' +
            '<th>Order status</th>' +
            '</tr>';
        var transportHTML = '<tr>' +
            '<th>The title of the product</th>' +
            '<th>Quantity purchased</th>' +
            '<th>The amount of the payment</th>' +
            '<th>Shipping address</th>' +
            '<th>Contact number</th>' +
            '<th>Delivery ID</th>' +
            '<th>Order status</th>' +
            '<th>Confirm receipt</th>' +
            '</tr>';
        var receiveHTML = '<tr>' +
            '<th>The title of the product</th>' +
            '<th>Quantity purchased</th>' +
            '<th>The amount of the payment</th>' +
            '<th>Delivery ID</th>' +
            '<th>Order status</th>' +
            '<th>Refund</th>' +
            '<th>appraise</th>' +
            '</tr>';
        var allHTML = '<tr>' +
            '<th>The title of the product</th>' +
            '<th>Quantity purchased</th>' +
            '<th>The amount of the payment</th>' +
            '<th>Address</th>' +
            '<th>Delivery ID</th>' +
            '<th>Order status</th>' +
            '</tr>';
        var refundHTML = '<tr>' +
            '<th>Purchaser</th>' +
            '<th>The title of the product</th>' +
            '<th>Quantity purchased</th>' +
            '<th>The amount of the payment</th>' +
            '<th>Shipping address</th>' +
            '<th>Contact number</th>' +
            '<th>Delivery ID</th>' +
            '<th>Order status</th>' +
            '</tr>';
        var unHandleHTMLTemp = "";
        var transportHTMLTemp = "";
        var receiveHTMLTemp = "";
        var refundHTMLTemp = "";
        var allHTMLTemp = "";

        for (var i = 0; i < allShoppingRecords.length; i++) {
            var product = getProductById(allShoppingRecords[i].productId);
            allHTMLTemp += '<tr>' +
                '<td>' + product.name + '</td>' +
                '<td>' + allShoppingRecords[i].counts + '</td>' +
                '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                '<td>' + allShoppingRecords[i].address + '</td>' +
                '<td>' + allShoppingRecords[i].delivery_id + '</td>' +
                '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                '</tr>';
            allCounts++;
            if (allShoppingRecords[i].orderStatus == 0) {
                unHandleHTMLTemp += '<tr>' +
                    '<td>' + product.name + '</td>' +
                    '<td>' + allShoppingRecords[i].counts + '</td>' +
                    '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                    '<td>' + allShoppingRecords[i].address + '</td>' +
                    '<td>' + allShoppingRecords[i].delivery_id + '</td>' +
                    '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                    '</tr>';
                unHandleCounts++;
            } else if (allShoppingRecords[i].orderStatus == 1) {
                var address = getUserAddress(allShoppingRecords[i].userId);
                var phoneNumber = getUserPhoneNumber(allShoppingRecords[i].userId)
                transportHTMLTemp += '<tr>' +
                    '<td>' + product.name + '</td>' +
                    '<td>' + allShoppingRecords[i].counts + '</td>' +
                    '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                    '<td>' + address + '</td>' +
                    '<td>' + phoneNumber + '</td>' +
                    '<td>' + allShoppingRecords[i].delivery_id + '</td>' +
                    '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                    '<td>' +
                    '<button class="btn btn-primary btn-sm" onclick="receiveProducts(' + allShoppingRecords[i].userId + ',' + allShoppingRecords[i].productId + ',\'' + allShoppingRecords[i].time + '\')">Confirm receipt</button>' +
                    '</td>' +
                    '</tr>';
                transportCounts++;
            } else if (allShoppingRecords[i].orderStatus == 2) {
                receiveHTMLTemp += '<tr>' +
                    '<td>' + product.name + '</td>' +
                    '<td>' + allShoppingRecords[i].counts + '</td>' +
                    '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                    '<td>' + allShoppingRecords[i].delivery_id + '</td>' +
                    '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                    '<td>' +
                    '<button class="btn btn-primary btn-sm" onclick="returnGood(' + allShoppingRecords[i].productId + ',\'' + allShoppingRecords[i].time + '\')">refund</button>' +
                    '</td>' +
                    '<td>' +
                    '<button class="btn btn-primary btn-sm" onclick="productDetail(' + allShoppingRecords[i].productId + ')">appraise</button>' +
                    '</td>' +
                    '</tr>';
                receiveCounts++;
            } else if (allShoppingRecords[i].orderStatus == 3) {
                var address = getUserAddress(allShoppingRecords[i].userId);
                var phoneNumber = getUserPhoneNumber(allShoppingRecords[i].userId)
                refundHTMLTemp += '<tr>' +
                    '<td>' + '${currentUser.nickName}' + '</td>' +
                    '<td>' + product.name + '</td>' +
                    '<td>' + allShoppingRecords[i].counts + '</td>' +
                    '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                    '<td>' + address + '</td>' +
                    '<td>' + phoneNumber + '</td>' +
                    '<td>' + allShoppingRecords[i].delivery_id + '</td>' +
                    '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                    '</tr>';
                refundCounts++;
            }
        }
        if (unHandleHTMLTemp == "") {
            unHandleHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>There are no related orders</h2>' +
                '</div>' +
                '</div>';
        } else
            unHandleHTML += unHandleHTMLTemp;
        if (transportHTMLTemp == "") {
            transportHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>There are no related orders</h2>' +
                '</div>' +
                '</div>';
        } else
            transportHTML += transportHTMLTemp;
        if (receiveHTMLTemp == "") {
            receiveHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>There are no related orders</h2>' +
                '</div>' +
                '</div>';
        } else
            receiveHTML += receiveHTMLTemp;
        if (allHTMLTemp == "") {
            allHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>There are no related orders</h2>' +
                '</div>' +
                '</div>';
        } else
            allHTML += allHTMLTemp;
        if (refundHTMLTemp == "") {
            refundHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>There are no related orders</h2>' +
                '</div>' +
                '</div>';
        } else
            refundHTML += refundHTMLTemp;

        unHandleCount.innerHTML = unHandleCounts;
        transportCount.innerHTML = transportCounts;
        receiveCount.innerHTML = receiveCounts;
        allCount.innerHTML = allCounts;
        refundCount.innerHTML = refundCounts;

        unHandleTable.innerHTML += unHandleHTML;
        transportTable.innerHTML += transportHTML;
        receiveTable.innerHTML += receiveHTML;
        allTable.innerHTML += allHTML;
        refundTable.innerHTML += refundHTML;
        layer.close(loading);
    }

    function getShoppingRecords() {
        judgeIsLogin();
        var shoppingRecordProducts = "";
        var user = {};
        user.userId = ${currentUser.id};
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/getShoppingRecords',
            data: user,
            dataType: 'json',
            success: function (result) {
                shoppingRecordProducts = result.result;
            },
            error: function (result) {
                layer.alert('Query error');
            }
        });
        shoppingRecordProducts = eval("(" + shoppingRecordProducts + ")");
        return shoppingRecordProducts;
    }

    function getProductById(id) {
        var productResult = "";
        var product = {};
        product.id = id;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/getProductById',
            data: product,
            dataType: 'json',
            success: function (result) {
                productResult = result.result;
            },
            error: function (result) {
                layer.alert('Query error');
            }
        });
        productResult = JSON.parse(productResult);
        return productResult;
    }

    function getUserAddress(id) {
        var address = "";
        var user = {};
        user.id = id;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/getUserAddressAndPhoneNumber',
            data: user,
            dataType: 'json',
            success: function (result) {
                address = result.address;
            },
            error: function (result) {
                layer.alert('Query error');
            }
        });
        return address;
    }

    function getUserPhoneNumber(id) {
        var phoneNumber = "";
        var user = {};
        user.id = id;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/getUserAddressAndPhoneNumber',
            data: user,
            dataType: 'json',
            success: function (result) {
                phoneNumber = result.phoneNumber;
            },
            error: function (result) {
                layer.alert('Query error');
            }
        });
        return phoneNumber;
    }

    function judgeIsLogin() {
        if ("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" == "") {
            window.location.href = "${cp}/login";
        }
    }

    function receiveProducts(userId, productId, time) {
        var receiveResult = "";
        var shoppingRecord = {};
        shoppingRecord.userId = userId;
        shoppingRecord.productId = productId;
        shoppingRecord.time = time;
        shoppingRecord.orderStatus = 2;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/changeShoppingRecord',
            data: shoppingRecord,
            dataType: 'json',
            success: function (result) {
                receiveResult = result.result;
            },
            error: function (result) {
                layer.alert('Query error');
            }
        });
        if (receiveResult = "success")
            window.location.href = "${cp}/shopping_record";
    }

    function productDetail(id) {
        var product = {};
        var jumpResult = '';
        product.id = id;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/productDetail',
            data: product,
            dataType: 'json',
            success: function (result) {
                jumpResult = result.result;
            },
            error: function (resoult) {
                layer.alert('Query error');
            }
        });

        if (jumpResult == "success") {
            window.location.href = "${cp}/product_detail";
        }
    }

    function returnGood(productId, time) {
        judgeIsLogin();
        var product = getProductById(productId);
        var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>' +
            '<div class="col-sm-10 col-md-10 col-lg-10">' +
            '<table class="table confirm-margin">' +
            '<tr>' +
            '<th>Product Name:</th>' +
            '<td>' + product.name + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>Unit price of the product:</th>' +
            '<td>' + product.price + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>Time of Purchase:</th>' +
            '<td>' + time + '</td>' +
            '</tr>' +
            '</table>' +
            '<div class="row">' +
            '<div class="col-sm-4 col-md-4 col-lg-4"></div>' +
            '<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="ReturnsConfirm(' + productId + ',' + ${currentUser.id} +',\'' + time + '\')">confirm</button>' +
            '</div>' +
            '</div>';
        layer.open({
            type: 1,
            title: 'Please confirm your returns information:',
            content: html,
            area: ['650px', '350px'],
        });

    }

    function ReturnsConfirm(productId, userId, time) {
        var shoppingRecord = {};
        shoppingRecord.userId = userId;
        shoppingRecord.productId = productId;
        shoppingRecord.time = time;
        $.ajax({
            async: false, //设置同步
            type: 'POST',
            url: '${cp}/returnGood',
            data: shoppingRecord,
            dataType: 'json',
            success: function (result) {
                if (result == true) {
                    layer.alert('Returns succeed');
                } else {
                    layer.alert('Returns failed');
                }
            },

            error: function (result) {
                layer.alert('Returns failed');
            }
        });
        window.location.href = "${cp}/shopping_record";
    }
</script>
</body>
</html>