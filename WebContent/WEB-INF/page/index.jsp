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
    <title>首页</title>
    <style type="text/css">
    html,body{
        width: 100%;
	    height: 100%;
	    margin: 0;
	    padding: 0;
	 /*    background: url(/themes/img/love-1080p.gif) no-repeat center center fixed;
	    background-size: cover; */
    }
    .test{
    	position:absolute;
    	top:0px;
    	left0px;
    	width: 100%;
    	height: 100%;
    }
    </style>
    <!-- <div id="logo" class="logo-none"><img src="/themes/img/logo2.png" /></div> -->
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/themes/js/common.js"></script>
    <!-- <script src='/themes/js/snowfall.min.js'></script> -->
    <script type='text/javascript'>  
    	$(function(){
    	/* 	$('.test').load(function(){
    			var name = $('#name').val();
        		var pic = $('#pic').val();
        		var userId = $('#userId').val();
    			var status = $('#status').val();
                setTimeout(function(){
                	setStorage("userId",userId);
               		if(0==status){
                     	   location.href = '/info.html?userId='+userId;
                    }else{
                     	   location.href = '/select.html?userId='+userId;
                    }
                },3000);   
    		}); */
    	})
    	function gogogo(){
    		var name = $('#name').val();
    		var pic = $('#pic').val();
    		var userId = $('#userId').val();
			var status = $('#status').val();
			setStorage("userId",userId);
       		if(0==status){
             	   location.href = '/info.html?userId='+userId;
            }else{
             	   location.href = '/select.html?userId='+userId;
            }
    	}
    </script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId }" >
	<input type="hidden" id="status" value="${status }" >
	<input type="hidden" id="name" value="${name }" >
	<input type="hidden" id="pic" value="${pic }" >
	<div class="heart"></div>
	<div class="stars"></div>
	<img alt="" src="<%=request.getContextPath() %>/themes/img/bg.jpeg" onclick="gogogo();" class="test" >
   </body>
</html>