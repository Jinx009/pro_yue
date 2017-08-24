<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>Login Page</title>
	<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/layer/3.0.1/mobile/need/layer.min.css" rel="stylesheet">
	<style>
	.login-input {
		margin-bottom: 10px;
	}
	.inner-div {
		position: absolute;
		top: 10%;
		left: 2%;
		width: 96%;
		text-align: center;
	}
	.inner-div h2 {
		margin-bottom: 30px;
	}
	.login-btn {
		width: 90%;
		margin-top: 30px;
	}
	</style>
</head>
<body>
	<div class="inner-div">
		<h2>登录</h2>
		<input type="text" class="form-control login-input" id="userName">
		<input type="password" class="form-control login-input" id="password">
		<a class="btn btn-info login-btn" onclick="doLogin();">后台登录</a>
	</div>
	<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/vue/2.4.2/vue.min.js"></script>
	<script src="https://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
	<script>
		$(function() {
			var width = parseInt($(window).width());
			console.log(width)
			if (width > 420) {
				$('.inner-div').css({
					'left' : (width - 380) / 2,
					'width' : '380px'
				});
			}
		})
		function doLogin() {
			var userName = $('#userName').val();
			var password = $('#password').val();
			var params = 'userName=' + userName + '&password=' + password;
			$.ajax({
				url : '/yue/doLogin.html',
				type : 'POST',
				dataType : 'json',
				data : params,
				success : function(res) {
					if ('success' == res.status) {
						location.href = '/yue/adminIndex.html';
					} else {
						layer.alert('账号密码错误！');
					}
				}
			})
		}
		document.onkeydown = function(e) {
			if (!e) {
				e = window.event;
			}
			if ((e.keyCode || e.which) == 13) {
				doLogin();
			}
		}
	</script>
</body>
</html>