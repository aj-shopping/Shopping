<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>购物+</title>
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
    <div class="container-fluid">
        <h1 class="title center">enroll</h1>
        <br/>
        <div class="col-sm-offset-2 col-md-offest-2">
            <!-- 表单输入 -->
            <div  class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">Username</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputUserName" placeholder="Please enter the number"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">mailbox/label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputEmail" placeholder="Please enter the correct email address"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNickname" class="col-sm-2 col-md-2 control-label">nickname</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputNickname" placeholder="GaoShuaiFu" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">password</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="password" class="form-control" id="inputPassword" placeholder="It is forbidden to enter illegal characters" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-sm-2 col-md-2 control-label">Mobile phone number</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputPhoneNumber" placeholder="Please enter your mobile phone number" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="man" class="col-sm-2 col-md-2 control-label">gender</label>
                    <div class="col-sm-6 col-md-6">
                        <label class="radio-inline">
                            <input type="radio" id="man" value="option1"> Male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="woman" value="option2"> Female
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-2 col-md-2 control-label">Date of birth</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="birthday" placeholder="Please enter your date of birth" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="postcodes" class="col-sm-2 col-md-2 control-label">Zip code</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="postcodes" placeholder="Please enter your zip code" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-2 col-md-2 control-label">address</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="address" placeholder="Please enter a shipping address" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="startRegister()">enroll</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </div>

    <!--尾部-->
    <jsp:include page="include/foot.jsp"/>
    <script type="text/javascript">
        function startRegister() {
            var loading = layer.load(0);
            var user = {};
            user.userName = document.getElementById("inputUserName").value;
            user.email = document.getElementById("inputEmail").value;
            user.nickName = document.getElementById("inputNickname").value;
            user.password = document.getElementById("inputPassword").value;
            user.phoneNumber = document.getElementById("inputPhoneNumber").value;
            user.birthday = document.getElementById("birthday").value;
            user.postNumber = document.getElementById("postcodes").value;
            user.address = document.getElementById("address").value;
            user.sex = 0;
            if(document.getElementById("woman").checked)
                user.sex = 1;
            if(user.userName == ''){
                layer.msg('The username cannot be empty',{icon:2});
                return;
            }
            else if(user.userName.length >= 12){
                layer.msg('The username cannot exceed 12 characters in length',{icon:2});
                return;
            }
            if(user.nickName == ''){
                layer.msg('Nicknames cannot be empty',{icon:2});
                return;
            }
            else if(user.nickName.length >= 15){
                layer.msg('The username cannot exceed 15 characters in length',{icon:2});
                return;
            }
            else if(user.password == ''){
                layer.msg('The password cannot be empty',{icon:2});
                return;
            }
            else if(user.password.length>= 20){
                layer.msg('The password cannot exceed 20 characters in length',{icon:2});
                return;
            }
            var registerResult = null;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/doRegister',
                data : user,
                dataType : 'json',
                success : function(result) {
                    registerResult = result.result;
                },
                error : function(result) {
                    layer.alert('There was an error querying the user');
                }
            });
            if(registerResult == 'success'){
                layer.close(loading);
                layer.msg('Registration is successful',{icon:1});
                window.location.href="${cp}/login";
            }
            else if(registerResult == 'nameExist'){
                layer.close(loading);
                layer.msg('This username is already taken!',{icon:2});
            }
            else if(registerResult == 'emailExist'){
                layer.close(loading);
                layer.msg('This username is already registered!',{icon:2});
            }
            else if(registerResult == 'fail'){
                layer.close(loading);
                layer.msg('The server is abnormal',{icon:2});
            }
        }
    </script>
  </body>
</html>