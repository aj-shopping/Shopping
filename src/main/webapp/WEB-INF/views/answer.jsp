<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>shopping+</title>
    <link href="${cp}/Shopping/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/Shopping/css/style.css" rel="stylesheet">

    <script src="${cp}/Shopping/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/Shopping/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="${cp}/Shopping/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/Shopping/js/layer.js" type="text/javascript"></script>
    <style>
        body {
            display: flex;
            height: 100vh;
        }
        .customer-list {
            width: 25%;
            border-right: 1px solid #ccc;
            overflow-y: auto;
        }
        .chat-window {
            width: 75%;
            display: flex;
            flex-direction: column;
        }
        .messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
        }
        .message-input {
            display: flex;
            border-top: 1px solid #ccc;
            padding: 10px;
        }
        .message-input textarea {
            flex: 1;
            resize: none;
        }



        .messages {
            max-height: 100%; /* 限制最大高度 */
            overflow-y: auto; /* 添加滚动条 */
        }


        .messages h6 {
            font-size: 20px;
            margin: 0 0 20px;
        }
        .messages .answer.left {
            padding: 0 0 0 58px;
            text-align: left;
            float: left;
        }
        .messages .answer {
            position: relative;
            max-width: 300px;
            overflow: hidden;
            clear: both;
        }
        .messages .answer.left .avatar {
            left: 0;
        }
        .messages .answer .avatar {
            bottom: 36px;
        }
        .messages .answer .name {
            font-size: 14px;
            line-height: 36px;
        }
        .messages .answer.left .avatar .status {
            right: 4px;
        }
        .messages .answer .avatar .status {
            bottom: 0;
        }
        .messages .answer.left .text {
            background: #ebebeb;
            color: #333333;
            border-radius: 8px 8px 8px 0;
        }
        .messages .answer .text {
            padding: 12px;
            font-size: 16px;
            line-height: 26px;
            position: relative;
        }
        .messages .answer.left .text:before {
            left: -30px;
            border-right-color: #ebebeb;
            border-right-width: 12px;
        }
        .messages .answer .text:before {
            content: '';
            display: block;
            position: absolute;
            bottom: 0;
            border: 18px solid transparent;
            border-bottom-width: 0;
        }
        .messages .answer.left .time {
            padding-left: 12px;
            color: #333333;
        }
        .messages .answer .time {
            font-size: 16px;
            line-height: 36px;
            position: relative;
            padding-bottom: 1px;
        }

        .messages .answer.right {
            padding: 0 58px 0 0;
            text-align: right;

        }
        .messages .answer.right .avatar {
            right: 0;
        }
        .messages .answer.right .avatar .status {
            left: 4px;
        }
        .messages .answer.right .text {
            padding-right: 20px;
            background: #7266ba;
            color: #ffffff;
            border-radius: 8px 8px 0 8px;
        }
        .messages .answer.right .text:before {
            right: -30px;
            border-left-color: #7266ba;
            border-left-width: 12px;
        }
        .messages .answer.right .time {
            padding-right: 12px;
            color: #333333;
        }


        .messages .avatar img{
            display: block;
            border-radius: 20px;
            height: 100%;
        }

        .messages .avatar {
            width: 40px;
            height: 40px;
            position: absolute;
        }


    </style>
</head>
<body>
<div class="customer-list">
    <ul id="customerList" class="list-group">
        <li class="list-group-item" onclick="loadChat('user1')"> user1 </li>
        <!-- 动态加载客户列表 -->
    </ul>
</div>
<div class="chat-window">

     <div id="chatMessages" class="messages">

<%--        <div class="content container">--%>
<%--                    <div class="row row-broken">--%>
<%--                        <div class="col-sm-5 col-xs-5 chat shaddowAdd">--%>
<%--                            <div class="col-inside-lg decor-default">--%>
<%--                                <div class="chat-body" id="chatbody">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--        </div>--%>

    </div>
    <div class="message-input">
        <textarea id="messageInput" class="form-control" placeholder="输入消息..."></textarea>
        <button id="sendMessageButton" class="btn btn-primary" onclick="sendMessage()">send</button>
    </div>
</div>

<script type="text/javascript">
    function getAllUsers() {
        var allUsers ;
        var nothing = {};
        $.ajax({
            async: false, // Set to synchronous
            type: 'POST',
            url: '${cp}/Shopping/getAllUser',
            data: nothing,
            dataType: 'json',
            success: function (result) {
                if (result != null) {
                    allUsers = result.allUsers;
                } else {
                    alert('Error querying all users');
                }
            },
            error: function () {
                alert('Error querying all users');
            }
        });
        allUsers = eval("(" + allUsers + ")");
        return allUsers;
    }

    var currentCustomer = null;

    $(document).ready(function () {
        loadCustomerList();
        setInterval(receiveMessages, 3000);
    });

    function loadCustomerList() {
        var customerList = document.getElementById("customerList");
        var customers = getAllUsers();
        customerList.innerHTML = '';
        console.log("Customers:", customers); // Add this line to debug
        console.log("Customer num:", customers.length);
        //customerList.innerHTML = "";

        for (var i = 0; i < customers.length; i++) {
            var customer = customers[i];
            console.log( i + "th:" + customer)
            console.log(customer.nickName)
            console.log(customer.role)
            if (customer.role === 0) {
                var html = '<li class="list-group-item" onclick="loadChat('+ '\''
                    + customer.nickName +'\'' + ')">' +customer.nickName + '</li>';
                console.log(html);
                customerList.innerHTML +=html;
            }
        }

    }

    function loadChat(customerName) {
        currentCustomer = customerName;
        $('#chatMessages').empty();
        $.ajax({
                url: '${cp}/Shopping/getChatMessages',
                method: 'POST',
                data: { customerName: currentCustomer },
                success: function(result) {
                    var messages = result.messagesByReceiver;
                    messages = eval("("+messages+")");
                    displayReceivedMessage1(messages);
                },
            });
    }

    function sendMessage() {
        var message = $('#messageInput').val().trim();
        if (message && currentCustomer) {
            $.ajax({
                url: '${cp}/Shopping/sendMessage',
                //String sender, String text,String receiver
                method: 'POST',
                data: {
                    receiver: currentCustomer,
                    text: message,
                    sender: "admin"
                },
                success: function () {
                    $('#messageInput').val('');

                }
            });
        }
    }

    function receiveMessages() {
        if (currentCustomer) {
            $.ajax({
                url: '${cp}/Shopping/getChatMessages',
                method: 'POST',
                data: { customerName: currentCustomer },
                success: function(result) {
                    var messages = result.messagesByReceiver;
                    messages = eval("("+messages+")");
                    displayReceivedMessage(messages);
                },
            });
        }
    }

    function displayReceivedMessage(messages) {
        var chat = document.getElementById("chatMessages");
        chat.innerHTML = "";
        for (var i = 0; i < messages.length; i++) {
            var message = messages[i];
            var position = message.sender === 'admin' ? 'right' : 'left';
            var img = message.sender === "admin" ? "./img/chat2.png" : "./img/chat1.png"

            var messageHtml = ' <div class="answer '+ position +'">'+
                '<div class="avatar">'+
                '<img src="'+img+'" alt="'+message.sender+'">'+
                '<div class="status offline"></div>'+
                    '</div>'+
                '<div class="name">'+message.sender+'</div>'+
                '<div class="text">'+message.text+'</div>'+
                '<div class="time">'+message.times+'</div>'+
                '</div>';
            chat.innerHTML += messageHtml;
        }

    }

    function displayReceivedMessage1(messages) {
        var chat = document.getElementById("chatMessages");
        chat.innerHTML = "";
        for (var i = 0; i < messages.length; i++) {
            var message = messages[i];
            var position = message.sender === 'admin' ? 'right' : 'left';
            var messageHtml = ' <div class="answer '+ position +'">'+
                '<div class="name">'+message.sender+'</div>'+
                '<div class="text">'+message.text+'</div>'+
                '<div class="time">'+message.times+'</div>'+
                '</div>';
            chat.innerHTML += messageHtml;
        }
    }
</script>
</body>
</html>
