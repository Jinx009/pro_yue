<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>魅力排行</title>
    <script src="/themes/js/jquery.js" ></script>
    <script src="/themes/js/common.js" ></script>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
    <script type="text/javascript" src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
    <script src="/themes/js/common.js" ></script>
    <script src="/themes/js/vue.min.js" ></script>
     <link rel="stylesheet" type="text/css" href="/themes/css/buildDate.css">
    <script>
    
    $(function(){
    	var menuStatus = 1;
        $('.menu-btn').on('click',function(){
            toggleMenu();
        });
        function toggleMenu(){
            if(1==menuStatus){
                $('.menu').show();
                menuStatus = 2;
            }else{
                $('.menu').hide();
                menuStatus = 1;
            }
        }
    	
    	var userId = $('#userId').val();
    	$.ajax({
    		url:'/getRankingList.html',
    		type:'GET',
    		dataType:'JSON',
    		success:function(res){
    			 if(res.data!=null&&res.data.length>0){
		    		  for ( var i = 0;i<res.data.length;i++) {
		    			  alert(res.data[i].realName);
					}new Vue({
	  	   				  el: 'body',
	  	   				  data:{items:res.data}
	  	    		})
    			 }
    		}
    	}) 
    	
    })
    </script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId }" >
	<header>
        <a href="javascript:;" class="menu-btn"><img src="/themes/img/321.png"/></a>
        <span class="center">魅力排行</span>
         <a href="/select.html?userId=${userId }" class="right"><img src="/themes/img/home.png"  /></a>
    </header>
    <div class="love-list">
    		<div  v-for="model in items">
	        <div  class="love-list-col" >
	            <div class="love-head-icon" ><img v-bind:src="model.pic" /></div>
	                <p class="top" v-text="model.realName" ></p>
	        </div>
        </div>
          <nav class="menu">
    <div class="menu-logo">
        <img src="/themes/data/${sessionScope.pic}" onclick="javascript:location.href='/person.html?id=${userId}&userId=${userId }';"/>
        <p>${sessionScope.name}</p>
    </div>
	     <ul>
	        <li><a href="javascript:location.href='/ranking.html?userId=${userId }';"><img  style="height: auto;" src="/themes/img/love_icon.png"/>魅力排行</a></li>
	        <li><a href="javascript:location.href='/list.html?userId=${userId }';"><img  style="height: auto;" src="/themes/img/love_icon.png"/>我心仪的</a></li>
	        <li><a href="javascript:location.href='/listGo.html?userId=${userId }';"><img src="/themes/img/123.png"/>互相心仪</a></li>
	        <li><a href="javascript:location.href='/person.html?userId=${userId }&id=${userId }';"><img src="/themes/img/person.png"/>个人主页</a></li>
	    	<li><a href="javascript:location.href='/select.html?userId=${userId }&id=${userId }';"><img src="/themes/img/home.png"/>返回筛选</a></li>
	    </ul>
	</nav>
     </div>
</body>
</html>