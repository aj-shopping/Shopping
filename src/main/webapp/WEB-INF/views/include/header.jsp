
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping+</title>
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>

    <style>
        .sidebar1 {

            position: fixed;
            top: 51px;
            right: -400px;
            width: 400px;
            height: 100%;
            background-color: #f8f9fa;
            transition: right 0.3s ease;
            z-index: 1000;
        }

        .sidebar1.sidebar-show {
            right: 0;
        }

        .sidebar-content {
            padding: 20px;
        }

        .col-inside-lg {
            padding: 20px;
        }

        .chat {
            overflow-y: auto;
            height: calc(75vh - 1px);
            position: fixed;
            bottom: 20px;
            right: 7px;
            width: 450px;
        }

        /*.decor-default {*/
        /*    background-color: #ffffff;*/
        /*}*/
        .chat-users h6 {
            font-size: 20px;
            margin: 0 0 20px;
        }
        .chat-users .user {
            position: relative;
            padding: 0 0 0 50px;
            display: block;
            cursor: pointer;
            margin: 0 0 20px;
        }
        .chat-users .user .avatar {
            top: 0;
            left: 0;
        }
        .chat .avatar {
            width: 40px;
            height: 40px;
            position: absolute;
        }
        .chat .avatar img {
            display: block;
            border-radius: 20px;
            height: 100%;
        }
        .chat .avatar .status.off {
            border: 1px solid #5a5a5a;
            background: #ffffff;
        }
        .chat .avatar .status.online {
            background: #4caf50;
        }
        .chat .avatar .status.busy {
            background: #ffc107;
        }
        .chat .avatar .status.offline {
            background: #ed4e6e;
        }
        .chat-users .user .status {
            bottom: 0;
            left: 28px;
        }
        .chat .avatar .status {
            width: 10px;
            height: 10px;
            border-radius: 5px;
            position: absolute;
        }
        .chat-users .user .name {
            font-size: 14px;
            font-weight: bold;
            line-height: 20px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .chat-users .user .mood {
            font: 200 14px/20px "Raleway", sans-serif;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .chat-body {
            max-height: 100%; /* 限制最大高度 */
            overflow-y: auto; /* 添加滚动条 */
        }


        .chat-body h6 {
            font-size: 20px;
            margin: 0 0 20px;
        }
        .chat-body .answer.left {
            padding: 0 0 0 58px;
            text-align: left;
            float: left;
        }
        .chat-body .answer {
            position: relative;
            max-width: 300px;
            overflow: hidden;
            clear: both;
        }
        .chat-body .answer.left .avatar {
            left: 0;
        }
        .chat-body .answer .avatar {
            bottom: 36px;
        }
        .chat-body .answer .name {
            font-size: 14px;
            line-height: 36px;
        }
        .chat-body .answer.left .avatar .status {
            right: 4px;
        }
        .chat-body .answer .avatar .status {
            bottom: 0;
        }
        .chat-body .answer.left .text {
            background: #ebebeb;
            color: #333333;
            border-radius: 8px 8px 8px 0;
        }
        .chat-body .answer .text {
            padding: 12px;
            font-size: 16px;
            line-height: 26px;
            position: relative;
        }
        .chat-body .answer.left .text:before {
            left: -30px;
            border-right-color: #ebebeb;
            border-right-width: 12px;
        }
        .chat-body .answer .text:before {
            content: '';
            display: block;
            position: absolute;
            bottom: 0;
            border: 18px solid transparent;
            border-bottom-width: 0;
        }
        .chat-body .answer.left .time {
            padding-left: 12px;
            color: #333333;
        }
        .chat-body .answer .time {
            font-size: 16px;
            line-height: 36px;
            position: relative;
            padding-bottom: 1px;
        }

        .chat-body .answer.right {
            padding: 0 58px 0 0;
            text-align: right;

        }
        .chat-body .answer.right .avatar {
            right: 0;
        }
        .chat-body .answer.right .avatar .status {
            left: 4px;
        }
        .chat-body .answer.right .text {
            padding-right: 20px;
            background: #7266ba;
            color: #ffffff;
            border-radius: 8px 8px 0 8px;
        }
        .chat-body .answer.right .text:before {
            right: -30px;
            border-left-color: #7266ba;
            border-left-width: 12px;
        }
        .chat-body .answer.right .time {
            padding-right: 12px;
            color: #333333;
        }

        .chat-body .answer-add {
            clear: both;
            position: relative;
            margin: 20px -20px -20px;
            padding: 20px;
            background: #ebebeb;
        }
        .chat-body .answer-add input {
            border: none;
            background: none;
            display: block;
            width: 100%;
            font-size: 16px;
            line-height: 20px;
            padding: 0;
            color: #0e0101;
        }

        .answer-add2 {
            padding: 20px;
            background: #ffffff;
            position: relative;
            bottom: 0px;
            right: 7px;
            width: 350px;
        }

        .answer-add2 textarea {
            width: 100%;
            padding: 15px;
            margin: -17px -50px 1px 0;
            border: none;
            background: #f1f1f1;
            resize: none;
            min-height: 80px;
        }

        .chat input {
            border-radius: 0;
        }

        textarea:focus, input:focus{
            outline: none;
        }

        .chat input::-webkit-input-placeholder {
            color: rgba(14, 13, 13, 0.603);
        }

        .chat input:-moz-placeholder {
            color: #fff;
        }

        .chat input::-moz-placeholder {
            color: #fff;
        }

        .chat input:-ms-input-placeholder {
            color: #fff;
        }
        .chat input {
            -webkit-appearance: none;
            border-radius: 0;
        }

        .shaddowAdd {
            -webkit-box-shadow: 0px 12px 35px -14px rgba(0,0,0,0.47);
            -moz-box-shadow: 0px 12px 35px -14px rgba(0,0,0,0.47);
            box-shadow: 0px 12px 35px -14px rgba(0,0,0,0.47);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${cp}/main">Shopping+</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">


                <c:if test="${empty currentUser}">
                    <li onclick="toggleChatSidebar();"><a>Customer Service</a></li>
                    <li><a href="${cp}/register" methods="post">Register</a></li>
                    <li><a href="${cp}/login" methods="post">Log in</a></li>
                </c:if>
                <c:if test="${not empty currentUser}">
                    <c:if test="${currentUser.role == 0}">
                        <li onclick="toggleChatSidebar();"><a>Customer Service</a></li>
                    </c:if>
                    <c:if test="${currentUser.role == 1}">
                        <li onclick="toAnswer();"><a href="${cp}/answer">Answer</a></li>
                        <li><a href="${cp}/control" methods="post">Control Panel</a></li>
                    </c:if>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            ${currentUser.nickName}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${cp}/shopping_car">Shopping Cart</a></li>
                            <li><a href="${cp}/shopping_record">Order Status</a></li>
                            <c:if test="${currentUser.role == 1}">
                                <li><a href="${cp}/shopping_handle">Process Order</a></li>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="${cp}/amend_info">Edit Profile</a></li>
                            <li><a href="${cp}/doLogout">Log out</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>

            <div class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Database" id="searchKeyWord"/>
                </div>
                <button class="btn btn-default" onclick="searchProduct();">Search Products</button>
            </div>
        </div>
    </div>
</nav>

<div id="chatSidebar" class="sidebar1">
    <div class="sidebar-content">

        <c:if test="${empty currentUser}">
            <a>Please log in first!</a>
        </c:if>
         <c:if test="${not empty currentUser}">

             <c:if test="${currentUser.role == 0}">
                <div class="content container">
                    <div class="row row-broken">
                        <div class="col-sm-5 col-xs-5 chat shaddowAdd">
                            <div class="col-inside-lg decor-default">
                                <div class="chat-body" id="chatbody">

                                    <div class="answer left">
                                        <div class="avatar">
                                            <img src="./img/chat1.png" alt="User name">
                                            <div class="status offline"></div>
                                        </div>
                                        <div class="name">Speedy</div>
                                        <div class="text">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec ex nec nisi ullamcorper mattis non vel diam. Nullam eleifend sapien mauris, sed facilisis justo volutpat sed. Proin fringilla varius nulla sit amet fermentum.
                                        </div>
                                        <div class="time">5 min ago</div>
                                    </div>

                                    <div class="answer right">
                                        <div class="avatar">
                                            <img src="./img/chat2.png" alt="User name">
                                            <div class="status offline"></div>
                                        </div>
                                        <div class="name">Lucky dube</div>
                                        <div class="text">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec ex nec nisi ullamcorper mattis non vel diam. Nullam eleifend sapien mauris, sed facilisis justo volutpat sed. Proin fringilla varius nulla sit amet fermentum.
                                        </div>
                                        <div class="time">5 min ago</div>
                                    </div>

                                    <div class="answer left">
                                        <div class="avatar">
                                            <img src="./img/chat1.png" alt="User name">
                                            <div class="status offline"></div>
                                        </div>
                                        <div class="name">Speedy</div>
                                        <div class="text">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec ex nec nisi ullamcorper mattis non vel diam. Nullam eleifend sapien mauris, sed facilisis justo volutpat sed. Proin fringilla varius nulla sit amet fermentum.
                                        </div>
                                        <div class="time">5 min ago</div>
                                    </div>

                                    <div class="answer right">
                                        <div class="avatar">
                                            <img src="./img/chat2.png" alt="User name">
                                            <div class="status offline"></div>
                                        </div>
                                        <div class="name">Lucky dube</div>
                                        <div class="text">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec ex nec nisi ullamcorper mattis non vel diam. Nullam eleifend sapien mauris, sed facilisis justo volutpat sed. Proin fringilla varius nulla sit amet fermentum.
                                        </div>
                                        <div class="time">5 min ago</div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                        <!-- 添加一个输入框和发送按钮 -->
                    <div class="answer-add2">
                        <div class="row">
                            <div class="col-sm-10">
                                <textarea id="messageInput"></textarea>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-dark" style="border-radius: 50%;" onclick="sendMessage()">
                                    Send
                                </button>
                            </div>
                        </div>
                    </div>

                </div>

             </c:if>
         </c:if>
    </div>
</div>
<script type="text/javascript">
    function toggleChatSidebar() {
        var sidebar = document.getElementById("chatSidebar");
        sidebar.classList.toggle("sidebar-show");
    }



    function searchProduct() {
        var search = {};
        search.searchKeyWord = document.getElementById("searchKeyWord").value;
        var searchResult = "";
        $.ajax({
            async: false,
            type: 'POST',
            url: '${cp}/searchPre',
            data: search,
            dataType: 'json',
            success: function (result) {
                searchResult = result.result;
            },
            error: function (result) {
                layer.alert('查询出错');
            }
        });
        if (searchResult == "success")
            window.location.href = "${cp}/search";
    }



    // 发送消息到后端的函数
    function sendMessageToBackend(message) {
        var sender = "${currentUser.nickName}";
        var text = message;
        var receiver = "admin" ;
        $.ajax({
            type: "POST", // 使用 POST 方法发送消息
            url: "/Shopping/sendMessage", // 后端提供的接收消息的 URL
            data: {
                sender : sender,
                text: text,
                receiver : receiver// 将消息作为数据发送到后端
            },
            success: function(response) {
                console.log("Message sent successfully."); // 在控制台打印消息发送成功的信息
            },
            error: function() {
                console.log("Error while sending message."); // 在控制台打印消息发送失败的信息
            }
        });
    }


    function sendMessage() {
        var message = document.getElementById("messageInput").value;
        //alert(message);
        // 发送消息到后端的逻辑
        sendMessageToBackend(message);
        //alert("send message");
        // 这里可以使用 AJAX 或其他方法将消息发送到后端
        // 发送成功后，将消息显示在聊天窗口中
        displayMessage("${currentUser.nickName}", message);
        // 清空输入框
        document.getElementById("messageInput").value = "";
    }

    function displayMessage(username, message) {
        var position = username === "admin" ? "left" : "right";
        var img = username === "admin" ? "./img/chat1.png" : "./img/chat2.png"
        var inputArea = document.getElementById("chatbody")
        var messageHtml = '<div class="answer ' +position+ '">'+
                    '<div class="avatar">'+
                    '<img src="'+img+'" alt="'+username+'">'+
                    '<div class="status offline"></div>'+
                    '</div>'+
                    '<div class="name">'+username+'</div>'+
                    '<div class="text">'+message+'</div>'+
                    '<div class="time">'+'Just Now'+'</div>'+
                    '</div>';

        inputArea.innerHTML += messageHtml;
        scrollChatToBottom();
    }



    function receiveMessages() {


        var user = {};
        user.nickName = "${currentUser.nickName}";
        setInterval(function() {
            $.ajax({
                type: "POST",
                url: "/Shopping/getMessages",
                data : user,
                dataType : 'json',
                success: function(result) {
                    var messages = result.messagesByReceiver;
                    messages = eval("("+messages+")");
                    displayReceivedMessages(messages);
                },
                error: function() {
                    console.log("Error while fetching messages.");
                }
            });
        }, 3000);
    }

    function displayReceivedMessages(messages) {
        var inputArea = document.getElementById("chatbody");
        inputArea.innerHTML = "";
        for (let i = 0; i < messages.length; i++) {
            var message = messages[i];
            var position = message.sender === "admin" ? "left" : "right";
            var avatar = message.sender === "admin" ? "./img/chat1.png" : "./img/chat2.png";
            var messageHtml = '<div class="answer ' +position+ '">'+
                    '<div class="avatar">'+
                    '<img src="'+avatar+'" alt="'+message.sender+'">'+
                    '<div class="status offline"></div>'+
                    '</div>'+
                    '<div class="name">'+message.sender+'</div>'+
                    '<div class="text">'+message.text+'</div>'+
                    '<div class="time">'+message.times+'</div>'+
                    '</div>';
            inputArea.innerHTML += messageHtml;
        }

    }


    // 页面加载完成后开始接收消息
    $(document).ready(function() {
        if(${currentUser.role == 0}){
            receiveMessages();
        }

    });

    function scrollChatToBottom() {
        var chatElement = $(".chat");
        if (chatElement.length) {
            chatElement.scrollTop(chatElement[0].scrollHeight);
        }
    }

</script>
</body>
</html>