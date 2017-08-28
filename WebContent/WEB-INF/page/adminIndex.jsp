<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>用户管理</title>
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
<input type="hidden" id="_now" value="${_now }" >
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
                <li class="active"><a href="javascript:location.reload();">用户列表</a></li>
                <li><a href="/yue/adminSecond.html">约会管理</a></li>
                <li><a href="/yue/adminThree.html">二维码管理</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="form-group has-success has-feedback">
    <label class="control-label col-sm-3" for="inputGroupSuccess2">选择平台</label>
    <div class="col-sm-9">
      <div class="input-group">
        <span class="input-group-addon">用户:<font id="qrcodeNum" ></font>人</span>
        <select class="form-control" id="codes" onchange="_getUserData();" >
		  
		</select>
      </div>
    </div>
  </div>
<table class="table table-striped info-table">
    <thead>
        <tr>
            <th>图片</th>
            <th>姓名</th>
            <th>手机号码</th>
            <th>性别</th>
            <th>年龄</th>
            <th>学历</th>
            <th>推荐人数</th>
            <th>被推荐者姓名</th>
        </tr>
    </thead>
    <tbody id="users" >
        <tr v-for="model in users" >
            <td>
                <img v-bind:src="model.pic1" height="38px" >
            </td>
            <td v-text="model.realName" ></td>
            <td v-text="model.mobilePhone" ></td>
            <td v-text="model.sex" ></td>
            <td v-text="model.age" ></td>
            <td v-text="model.edu" ></td>
            <td v-text="model.beReNum" ></td>
            <td v-text="model.reName" ></td>
        </tr>
    </tbody>
</table>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/vue/2.4.2/vue.min.js"></script>
<script src="https://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
 <script>
    var ress = {};
    ress.data = new Array();
     $(function(){
        getqrcode();
     })
     function getqrcode(){
    	 $.ajax({
    		url:'/yue/admin/QRCodeList.html',
    	 	type:'GET',
    	 	dataType:'json',
    	 	success:function(res){
    	 		var _now = $('#_now').val();
    	 		if(res!=null&&res.data!=null){
    	 			var _html = '';
    	 			for(var i in res.data){
    	 				if(_now == res.data[i].keyword){
    	 					_html += '<option value = "'+res.data[i].keyword+'" selected="selected" >'+res.data[i].description+'</option>';
    	 				}else{
    	 					_html += '<option value = "'+res.data[i].keyword+'"  >'+res.data[i].description+'</option>';
    	 				}
    	 			}
    	 			$('#codes').html(_html);
    	 			getUserData();
    	 		}
    	 	}
    	 })
     }
     function getUserData(){
    	 var qrcode = $('#codes').val();
    	 ress.data = [];
    	 $.ajax({
             url:'/yue/admin/getAllUserList.html?qrcode='+qrcode,
             type:'GET',
             dataType:'JSON',
             success:function(res){
             	if(res!=null&&res.data!=null){
             		for(var i = 0;i<res.data.length;i++){
             			if(res.data[i].pic1!=null&&'null'!=res.data[i].pic1){
             				res.data[i].pic1 = '/yue/themes/data/'+res.data[i].pic1;
             				ress.data.push(res.data[i]);
             			}
             		}
             	}
             	console.log(ress)
        		 new Vue({
                    el: '#users',
                    data:{users:ress.data}
                })
        		$('#qrcodeNum').html('<font style="color:red;">'+res.size+'</font>');
             }
         })
     }
     function _getUserData(){
    	 var qrcode = $('#codes').val();
    	 location.href = '/yue/adminIndex.html?_now='+qrcode;
     }
 </script>
</body>
</html>