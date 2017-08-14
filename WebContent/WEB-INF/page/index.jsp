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
    }
    .test{
    	position:absolute;
    	top:0px;
    	left0px;
    	width: 100%;
    	height: 100%;
    }
    </style>
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/themes/js/common.js"></script>
    <!-- <script src='/themes/js/snowfall.min.js'></script> -->
    <script type='text/javascript'>  
    	function gogogo1(){
    		$('#pic2').show();
    		$('#pic1').hide();
    	}
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
	
	<img alt="" src="/themes/img/index_11.jpeg" onclick="gogogo1();" class="test"  id="pic1"  >
	<img alt="" src="/themes/img/index_22.jpeg" style="display: none;" onclick="gogogo();" id="pic2" class="test" >
   </body>
</html>