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
      <script src="${cp}/js/ajaxfileupload.js" type="text/javascript"></script>
      <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!-- Navigation bar section -->
    <jsp:include page="include/header.jsp"/>

    <!-- Middle content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-sm-3 col-md-2 sidebar sidebar-1">
                <ul class="nav nav-sidebar">
                    <li class="list-group-item-diy"><a href="#section1">View All Users<span class="sr-only">(current)</span></a></li>
                    <li class="list-group-item-diy"><a href="#section2">View All Products</a></li>
                    <li class="list-group-item-diy"><a href="#section3">Add Product</a></li>
                </ul>
            </div>
            <!-- Main content -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="col-md-12">
                    <h1><a name="section1">User Information</a></h1>
                    <hr/>
                    <table class="table table-hover center" id="userTable">
                    </table>
                </div>

                <div class="col-md-12">
                    <hr/>
                    <h1><a name="section2">Product Information</a></h1>
                    <hr/>
                    <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
                    <br/>
                </div>

                <div class="col-md-12">
                    <hr/>
                    <h1><a name="section3">Add Product</a></h1>
                    <hr/>
                    <div class="col-sm-offset-2 col-md-offest-2">
                         <!-- Form input -->
                        <div  class="form-horizontal">
                            <div class="form-group">
                                <label for="productName" class="col-sm-2 col-md-2 control-label">Product Name</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" id="productName" placeholder="skinny suit in grey" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productDescribe" class="col-sm-2 col-md-2 control-label">Product Description</label>
                                <div class="col-sm-6 col-md-6">
                                    <textarea type="text" class="form-control" id="productDescribe" placeholder="very elegant"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="keyWord" class="col-sm-2 col-md-2 control-label">Keywords</label>
                                <div class="col-sm-6 col-md-6">
                                    <textarea type="text" class="form-control" id="keyWord" placeholder="suit"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productPrice" class="col-sm-2 col-md-2 control-label">Product Price</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" id="productPrice" placeholder="399" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productCount" class="col-sm-2 col-md-2 control-label">Product Count</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" id="productCount" placeholder="100" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productType" class="col-sm-2 col-md-2 control-label">Product Type</label>
                                <div class="col-sm-6 col-md-6">
                                    <select name="productType" class="form-control" id="productType">
                                        <option value="1">Clothing & Accessories</option>
                                        <option value="2">Digital Products</option>
                                        <option value="3">Books & Office Supplies</option>
                                        <option value="4">Gaming Accessories</option>
                                        <option value="5">Daily Necessities</option>
                                        <option value="6">Cosmetics</option>
                                        <option value="7">Sports Equipment</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" accept="image/jpg">Product Image</label>
                                <div class="col-sm-6 col-md-6">
                                    <input name="productImgUpload" type="file"  id="productImgUpload"/>
                                    <p class="help-block">Uploaded image should be 280*160 in size</p>
                                </div>
                                <%--<button class="btn btn-primary col-sm-2 col-md-2" onclick="fileUpload()">Upload Image</button>--%>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6" id="imgPreSee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6">
                                    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="addProduct()">Add Product</button>
                                </div>
                            </div>
                        </div>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- Footer -->
<jsp:include page="include/foot.jsp"/>
<script type="text/javascript">

    var loading = layer.load(0);
    listAllUser();
    listAllProduct();
    layer.close(loading);
    // List all users
    function listAllUser() {
        var userTable = document.getElementById("userTable");
        var allUser = getAllUsers();
        userTable.innerHTML = '<tr>'+
                                '<th> User ID </th>'+
                                '<th> Username</th>'+
                                '<th> Nickname</th>'+
                                '<th> Email</th>'+
                                '<th> Deleted?</th>'+
                              '</tr>';
        var html = "";
        for(var i=0; i<allUser.length; i++){
            html += '<tr>'+
                    '<td>'+allUser[i].id+'</td>'+
                    '<td>'+allUser[i].name+'</td>'+
                    '<td>'+allUser[i].nickName+'</td>'+
                    '<td>'+allUser[i].email+'</td>'+
                    '<td>'+
                    '<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser('+allUser[i].id+')">Delete</button>'+
                    '</td>'+
                    '</tr>';
        }
        userTable.innerHTML += html;
    }


      function getAllUsers() {
          var allUsers = "";
          var nothing = {};
          $.ajax({
              async: false, // Set to synchronous
              type: 'POST',
              url: '${cp}/getAllUser',
              data: nothing,
              dataType: 'json',
              success: function(result) {
                  if (result != null) {
                      allUsers = result.allUsers;
                  } else {
                      layer.alert('Error querying all users');
                  }
              },
              error: function(resoult) {
                  layer.alert('Error querying all users');
              }
          });
          allUsers = eval("(" + allUsers + ")");
          return allUsers;
      }



      function listAllProduct() {
          var productArea = document.getElementById("productArea");
          var allProduct = getAllProducts();
          var html = "";
          productArea.innerHTML = '';
          for (var i = 0; i < allProduct.length; i++) {
              var imgURL = "${cp}/img/" + allProduct[i].url + ".jpg";
              html += '<div class="col-sm-4 col-md-4 pd-5">' +
                  '<div class="boxes">' +
                  '<div class="big bigimg">' +
                  '<img src="' + imgURL + '">' +
                  '</div>' +
                  '<p class="font-styles center">' + allProduct[i].name + '</p>' +
                  '<p class="pull-right">Price: ' + allProduct[i].price + '</p>' +
                  '<p class="pull-left">Stock: ' + allProduct[i].counts + '</p>' +
                  '<div class="row">' +
                  '<button class="btn btn-primary delete-button" type="submit" onclick="deleteProduct(' + allProduct[i].id + ')">Delete Product</button>' +
                  '</div>' +
                  '</div>' +
                  '</div>';
          }
          productArea.innerHTML += html;
      }
      // List all products


      function getAllProducts() {
          var allProducts = null;
          var nothing = {};
          $.ajax({
              async: false, // Set to synchronous
              type: 'POST',
              url: '${cp}/getAllProducts',
              data: nothing,
              dataType: 'json',
              success: function(result) {
                  if (result != null) {
                      allProducts = result.allProducts;
                  } else {
                      layer.alert('Error querying all products');
                  }
              },
              error: function(resoult) {
                  layer.alert('Error querying all products');
              }
          });
          allProducts = eval("(" + allProducts + ")");
          return allProducts;
      }


      function deleteUser(id) {
          var user = {};
          user.id = id;
          var deleteResult = "";
          $.ajax({
              async: false,
              type: 'POST',
              url: '${cp}/deleteUser',
              data: user,
              dataType: 'json',
              success: function(result) {
                  deleteResult = result;
              },
              error: function(result) {
                  layer.alert('Error querying user');
              }
          });
          layer.msg(deleteResult.message);
          listAllUser();
      }


      function deleteProduct(id) {
          var product = {};
          product.id = id;
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/deleteProduct',
              data : product,
              dataType : 'json',
              success : function(result) {
                  deleteResult = result;
              },
              error : function(result) {
                  layer.alert('Error in deleting goods');
              }
          });
          layer.msg(deleteResult.message);
          listAllProduct();
      }
      
      function addProduct() {
          var loadings = layer.load(0);
          var product = {};
          product.name = document.getElementById("productName").value;
          product.description = document.getElementById("productDescribe").value;
          product.keyWord = document.getElementById("keyWord").value;
          product.price = document.getElementById("productPrice").value;
          product.counts = document.getElementById("productCount").value;
          product.type = document.getElementById("productType").value;
          product.url = extractFileName(document.getElementById("productImgUpload"));
          var addResult="";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/addProduct',
              data : product,
              dataType : 'json',
              success : function(result) {
                  addResult = result.result;
              },
              error : function(result) {
                  layer.alert('Error in deleting goods');
              }
          });
          if(addResult == "success") {
              fileUpload();
              layer.msg('Adding goods succeeded', {icon: 1, time: 1000});
              layer.close(loadings)
          }
          listAllProduct();
      }
      function extractFileName(inputElement) {
            var filePath = inputElement.value;


            var fileName = filePath.split('\\').pop();


            if (!fileName) {
                fileName = filePath;
            }


            var dotIndex = fileName.lastIndexOf('.');
            if (dotIndex > -1) {
                fileName = fileName.slice(0, dotIndex);
            }

            return fileName;
        }

      function fileUpload() {
          var results = "";
          var name = extractFileName(document.getElementById("productImgUpload"));
          $.ajaxFileUpload({
              url:'${cp}/uploadFile?name='+name,
              secureuri:false ,
              fileElementId:'productImgUpload',
              type:'POST',
              dataType : 'text',
              success: function (result){
                  result = result.replace(/<pre.*?>/g, '');
                  result = result.replace(/<PRE.*?>/g, '');
                  result = result.replace("<PRE>", '');
                  result = result.replace("</PRE>", '');
                  result = result.replace("<pre>", '');
                  result = result.replace("</pre>", '');
                  result = JSON.parse(result);
                  results = result.result;
                  if(results == "success") {
                      layer.msg("Image uploaded successfully", {icon: 1});
                      window.location.href = "${cp}/control";

                      //var imgPreSee = document.getElementById("imgPreSee");
                      //var imgSrc = '${cp}/img/'+name+'.jpg';
                      //imgPreSee.innerHTML +='<img src="'+imgSrc+')" class="col-sm-12 col-md-12 col-lg-12"/>';
                  }
                  else {
                      layer.msg("Image upload failed", {icon: 0});
                  }

              }}
          );
      }
      // function navigateWithInterval(url, duration, interval) {
      //       setTimeout(function() {
      //           window.location.href = url;
      //       }, duration);
      //
      //       setInterval(function() {
      //           window.location.href = url;
      //       }, interval);
      //   }
      //
      //   // 在1秒内每隔0.5秒执行一次跳转


  </script>
  </body>
</html>