<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>二维码管理</title>
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
                <li  class="active"><a href="javascript:location.reload();">二维码管理</a></li>
            </ul>
        </div>
    </div>
</nav>
<table class="table info-table">
    <thead>
	    <tr>
	        <th width="50%;" >展示区</th>
	        <th width="50%;">新建</th>
	    </tr>
    </thead>
    <tbody>
    <tr  >
        <td>
        	<select class="form-control" id="codes" onchange="drawQ();" >
			  <option v-for="code in codes" v-bind:value="code.index" v-text="code.description" ></option>
			</select>
			<div style="margin-top: 20px;margin-left: 15px;" id="qrcodeCanvas" ></div>
        </td>
        <td>
        	<table class="table table-striped info-table">
        		<tr>
        			<th>关键字</th>
        			<td>
        				<input type="text" placeholder="仅限英文" id="key" class="form-control" >
        			</td>
        		</tr>
        		<tr>
        			<th>描述</th>
        			<td>
        				<input type="text" id="description" class="form-control" >
        			</td>
        		</tr>
        		<tr>
        			<td colspan="2">
        				<a class="btn btn-info" onclick="save();" >保存</a>
        			</td>
        		</tr>
        	</table>
        </td>
    </tr>
    </tbody>
</table>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/vue/2.4.2/vue.min.js"></script>
<script src="https://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
<script src="/themes/js/jquery.qrcode.min.js"></script>
<script>
   var _code = {};
    $(function(){
    	 $.ajax({
     		url:'/admin/QRCodeList.html',
     	 	type:'GET',
     	 	dataType:'json',
     	 	success:function(res){
     	 		if(res!=null&&res.data!=null){
     	 			for(var i in res.data){
     	 				res.data[i].index = i;
     	 			}
     	 			_code = res.data;
     	 			 new Vue({
                          el: '#codes',
                          data:{codes:res.data}
                      })
     	 			 drawQ();
     	 		}
     	 	}
     	 })
    })
    function drawQ(){
    	var _index = $('#codes').val();
    	var _url = _code[parseInt(_index)].url;
    	getQRCode(_url);
    }
    function getQRCode(url){
    	 $('#qrcodeCanvas').html('');
    	 
    	 $('#qrcodeCanvas').qrcode({
			width:120,
			height:120,
			text:url
		});
    }
    function  save(){
    	var key = $('#key').val();
    	var description = $('#description').val();
    	$.ajax({
    		url:'/admin/saveQRCode.html',
    		data:'key='+key+'&desc='+description,
    		type:'post',
    		dataType:'json',
    		success:function(res){
    			layer.alert('新建成功！',function(){
    				location.reload();
    			})
    		}
    	})
    }
</script>
</body>
</html>