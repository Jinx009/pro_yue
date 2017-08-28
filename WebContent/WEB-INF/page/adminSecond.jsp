<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Index Page</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/layer/3.0.1/mobile/need/layer.min.css" rel="stylesheet">
    <style>
        .info-table{
            margin-top: 10px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">约么</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/adminIndex.html">用户列表</a></li>
                <li  class="active"><a href="javascript:location.reload();">约会列表</a></li>
                <li><a href="/adminThree.html">二维码管理</a></li>
            </ul>
        </div>
    </div>
</nav>
<table class="table table-striped info-table">
    <thead>
    <tr>
        <th>嘉宾一</th>
        <th>嘉宾二</th>
    </tr>
    </thead>
    <tbody id="sb" >
    <tr v-for="model in items" >
        <td v-text="model.userName" ></td>
        <td v-text="model.likeUserName" ></td>
    </tr>
    </tbody>
</table>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/vue/2.4.2/vue.min.js"></script>
<script src="https://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
<script>
    $(function(){
        $.ajax({
         url:'/getConnSuccess.html',
         type:'GET',
         dataType:'JSON',
         success:function(res){
          new Vue({
          el: '#sb',
          data:{items:res.data}
          })
         }
      })
    })
</script>
</body>
</html>