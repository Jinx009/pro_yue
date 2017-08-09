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
            background: #010101;
            overflow: hidden;
        }
        .heart {
            z-index: 1;
            width: 150px;
            height: 150px;
            position: absolute;
            top: 50%;
            margin-top: -75px;
            left: 50%;
            margin-left: -75px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-image:url("data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjE3M3B4IiBoZWlnaHQ9IjE1OHB4IiB2aWV3Qm94PSIwIDAgMTczIDE1OCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTczIDE1OCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8cGF0aCBmaWxsPSIjRUY0NjU3IiBkPSJNMTU3LjMzMSwxNS41MDRjLTE5LjU1OS0xOS41NTktNTEuMjcxLTE5LjU1OS03MC44MzEsMGMtMTkuNTU5LTE5LjU1OS01MS4yNzEtMTkuNTU5LTcwLjgzMSwwDQoJYy0xOS41NTksMTkuNTU5LTE5LjU1OSw1MS4yNzEsMCw3MC44MzFsNzAuODMxLDcwLjgzbDcwLjgzMS03MC44M0MxNzYuODksNjYuNzc1LDE3Ni44OSwzNS4wNjQsMTU3LjMzMSwxNS41MDR6Ii8+DQo8L3N2Zz4=");
            animation: HEARTBEAT 2.5s infinite;
            -webkit-animation: HEARTBEAT 2.5s infinite;
        }
        .heart {
            animation: HEARTBEAT 2.5s infinite;
        }
        @keyframes HEARTBEAT {
            0% {
                transform: scale(1);
            }
            5% {
                transform: scale(1.3);
            }
            10% {
                transform: scale(1.1);
            }
            15% {
                transform: scale(1.5);
            }
            50% {
                transform: scale(1);
            }
            100% {
                transform: scale(1);
            }
        }
        @-webkit-keyframes HEARTBEAT {
            0% {
                transform: scale(1);
            }
            5% {
                transform: scale(1.3);
            }
            10% {
                transform: scale(1.1);
            }
            15% {
                transform: scale(1.5);
            }
            50% {
                transform: scale(1);
            }
            100% {
                transform: scale(1);
            }
        }


        @-webkit-keyframes scale-animate{
            0%{
                transform:scale(1,1);

            }
            50%{
                transform:scale(3.5,3.5);
            }
            100%{
                transform:scale(1,1);

            }
        }
        @-webkit-keyframes rotateIn {
            0% {
                -webkit-transform-origin: center;
                transform-origin: center;
                -webkit-transform: rotate3d(0, 0, 1, -200deg);
                transform: rotate3d(0, 0, 1, -200deg);
                opacity: 1;
            }
            50% {
                -webkit-transform-origin: center;
                transform-origin: center;
                -webkit-transform: none;
                transform: none;
                opacity: 1;
            }
            75%{
                transform:scale(0.5,0.5);
            }
            100%{
                transform:scale(1,1);
            }
        }
        @keyframes rotateIn {
            0% {
                -webkit-transform-origin: center;
                transform-origin: center;
                -webkit-transform: rotate3d(0, 0, 1, -200deg);
                transform: rotate3d(0, 0, 1, -200deg);
                opacity: 1;
            }
            50% {
                -webkit-transform-origin: center;
                transform-origin: center;
                -webkit-transform: none;
                transform: none;
                opacity: 1;
            }
            75%{
                transform:scale(0.5,0.5);
            }
            100%{
                transform:scale(1,1);
            }
        }
        .logo-none{
            display: none;
        }
        .logo{
            animation: rotateIn 2s  normal 0s infinite;
            -webkit-animation: rotateIn 2s  normal 0s infinite;
            animation-iteration-count:1;
            -webkit-animation-iteration-count:1;
            display: -webkit-box;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }
         .logo img{
            display: block;
            margin: 0 auto;
            width: 70%;
            margin-left: 15%;
            margin-top:5%;
        }
        
        
      .stars{
            position:absolute;
            top:0;
            left:0;
            right:0;
            bottom:0;
            width:100%;
            height:100%;
            display:block;
        }

        .stars {
            background:#000 url(/themes/img/stars.png) repeat top center;
            z-index:0;
        }

    </style>
</head>
<body>
<input type="hidden" id="userId" value="${userId }" >
<input type="hidden" id="status" value="${status }" >
<input type="hidden" id="name" value="${name }" >
<input type="hidden" id="pic" value="${pic }" >
<div class="heart"></div>
<div class="stars"></div>
<div id="logo" class="logo-none"><img src="/themes/img/logo2.png" /></div>
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/themes/js/common.js"></script>
    <script src='/themes/js/snowfall.min.js'></script>
    <script type='text/javascript'>  
    		var name = $('#name').val();
    		var pic = $('#pic').val();
    		var userId = $('#userId').val();
			var status = $('#status').val();
            setTimeout(function(){
               doGo();
            }, 4000);
            function doGo(){
            	$('.stars').hide();
            	$('.heart').hide();
            	 $('#logo').removeClass('logo-none').addClass('logo');
            	setTimeout(function(){
	                 setStorage("userId",userId);
	                if(0==status){
	             	   location.href = '/info.html?userId='+userId;
	                }else{
	             	   location.href = '/select.html?userId='+userId;
	                }
            	}, 4000);
            }
    </script>
   </body>
</html>