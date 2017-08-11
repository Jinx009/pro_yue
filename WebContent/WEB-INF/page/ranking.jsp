<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no,email=no" name="format-detection">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>魅力排行</title>
<script src="/themes/js/jquery.js"></script>
<script src="/themes/js/common.js"></script>
<script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/themes/css/buildDate.css">
<script type="text/javascript" src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
<script src="/themes/js/common.js"></script>
<script src="/themes/js/vue.min.js"></script>
<style type="text/css">
#_p{
	width: 100%;
	position: absolute;
	top: 3.29rem;
	left: 0px;
	z-index: 999;
	color: white;
	text-align: center;
	font-size: 18px;
	letter-spacing: 1px;
	font-family: 'Microsoft Yahei';
}
#small_img{
	width: 40px;
	position: absolute;
	top: 1.89rem;
	left: 50px;
	z-index: 999;
}
#_bg{
	width: 100%;
	position: absolute;
	top:0.9rem;
	left: 0;
}
._table{
	width:96%;
	margin-left: 2%;
}
</style>
</head>
<body>
	<input type="hidden" id="userId" value="${userId }">
	<header>
		<a href="javascript:;" class="menu-btn"><img
			src="/themes/img/321.png" /></a> <span class="center">魅力排行</span> <a
			href="/select.html?userId=${userId }" class="right"><img
			src="/themes/img/home.png" /></a>
	</header>
	<img src="/themes/img/tuoyuan.png" id="_bg" >
	<img src="/themes/img/mofa.png" id="small_img"  >
	<p  id="_p" >魅力排行</p>
	<div class="love-list">
		<table class="_table" >
			<tr  v-for="model in items" style="border-bottom: 1px solid gray;" onclick="gogo1('{{model.id}}','${userId}')" >
				<td width="20%;" style="text-align: left;" >
					<img style="width: 40px;height:40px;border-radius:40px;border: 3px solid gray;border-color:gray;margin-top: 10px; " v-bind:src="model.pic1" />
				</td>
				<td width="55%" style="text-align: left;font-size: 16px;"><b style="margin-top: -10px;" v-text="model.realName" ></b></td>
				<td width="20%" style="text-align: center;" >
					<div><img alt="" src="/themes/img/copy.png" width="25px;" ></div>
					<div><font style="color: red;"  v-text="model.starNum" ></font>人喜欢TA</div>
				</td>
				<td width="5%;"></td>
			</tr>
		</table>
	<!-- 	<div v-for="model in items">
			<div class="love-list-col">
				<div class="love-head-icon">
					
				</div>
				<p class="top" v-text="model.realName"></p>
				<p class="top" v-text="model.starNum"></p>
			</div>
		</div> -->
		<nav class="menu">
			<div class="menu-logo">
				<img src="/themes/data/${sessionScope.pic}"
					onclick="javascript:location.href='/person.html?id=${userId}&userId=${userId }';" />
				<p>${sessionScope.name}</p>
			</div>
			<ul>
				<li><a
					href="javascript:location.href='/ranking.html?userId=${userId }';"><img
						style="height: auto;" src="/themes/img/love_icon.png" />魅力排行</a></li>
				<li><a
					href="javascript:location.href='/list.html?userId=${userId }';"><img
						style="height: auto;" src="/themes/img/love_icon.png" />我心仪的</a></li>
				<li><a
					href="javascript:location.href='/listGo.html?userId=${userId }';"><img
						src="/themes/img/123.png" />互相心仪</a></li>
				<li><a
					href="javascript:location.href='/person.html?userId=${userId }&id=${userId }';"><img
						src="/themes/img/person.png" />个人主页</a></li>
				<li><a
					href="javascript:location.href='/select.html?userId=${userId }&id=${userId }';"><img
						src="/themes/img/home.png" />返回筛选</a></li>
			</ul>
		</nav>
	</div>
	<script>
		$(function() {
			var menuStatus = 1;
			$('.menu-btn').on('click', function() {
				toggleMenu();
			});
			function toggleMenu() {
				if (1 == menuStatus) {
					$('.menu').show();
					menuStatus = 2;
				} else {
					$('.menu').hide();
					menuStatus = 1;
				}
			}
			var _width = $(window).width();
			var _height = parseInt(_width/2.4);
			var _left = (_width-40)/2;
			$('#small_img').css('left',_left+'px');
			$('.love-list').css('margin-top',(_height+20)+'px');
			var userId = $('#userId').val();
			$.ajax({
				url : '/front/getStars.html',
				type : 'GET',
				dataType : 'JSON',
				success : function(res) {
					if (res.data != null && res.data.length > 0) {
						for(var i in res.data){
							res.data[i].pic1 = '/themes/data/'+res.data[i].pic1;
							if(res.data[i].starNum==null||res.data[i].starNum==''){
								res.data[i].starNum = 0;
							}
						}
						new Vue({
							el : 'body',
							data : {
								items : res.data
							}
						})
					}
				}
			})

		})
		function gogo1(userId,id){
			location.href = '/person.html?id='+id+'&userId='+userId;
		}
	</script>
</body>
</html>