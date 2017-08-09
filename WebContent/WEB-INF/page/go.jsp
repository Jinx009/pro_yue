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
    <title>互相心仪</title>
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
        var resStatus = getStorage('resStatus');
        if(resStatus==null||resStatus==''){
        	showDiv('noGoDiv1');
        }
    	var userId = $('#userId').val();
    	$.ajax({
    		url:'/getPersonConnSuccess.html?id='+userId+'&status=2',
    		type:'GET',
    		dataType:'JSON',
    		success:function(res){
    		    if(res.data!=null&&res.data.length>0){
    		    	for(var i = 0;i<res.data.length;i++){
    		    		res.data[i].xx = userId;
    		    		if(userId==res.data[i].first){
    		    			res.data[i].goStatus = res.data[i].userGo;
    		    			res.data[i].userId = res.data[i].likeUser.id;
    		    			res.data[i].age = res.data[i].likeUser.age;
    		    			res.data[i].realName = res.data[i].likeUser.realName;
    		    			res.data[i].pic = '/themes/data/'+res.data[i].likeUser.pic1;
    		    		}else{
    		    			res.data[i].goStatus = res.data[i].likeGo;
    		    			res.data[i].userId = res.data[i].user.id;
    		    			res.data[i].age = res.data[i].user.age;
    		    			res.data[i].realName = res.data[i].user.realName;
    		    			res.data[i].pic = '/themes/data/'+res.data[i].user.pic1;
    		    		}	
    		    		
    		    	}
    		    	console.log(res.data[0].goStatus);
    		    	new Vue({
    	   				  el: 'body',
    	   				  data:{items:res.data}
    	    		})
    		    	setTimeout(function(){
    		    		$('.love-list').show();
    		        }, 1000); 
    		    }else{
    		    	$('.love-list').css('display','none');
    		    	$('#noDiv').css('display','-webkit-flex');
    				$('#noDiv').css('display','flex');
    				$('#noDiv').css('display','-moz-flex');
		    	}
    		}
    	}) 
    })
    /**
 	*跳转至个人详情页
 	*/
    function doGo(userId,id){
    	var seeStatus = getStorage('seeStatus');
    	if(seeStatus!=null&&seeStatus!=''&&seeStatus==1){
    		var url = '/person.html?userId='+userId+'&id='+id+'&statusA=1';
    		location.href = url;
    	}else{
    		var url = '/person.html?userId='+userId+'&id='+id+'&statusA=1';
    		$('#go1').attr('onclick','javascript:location.href="'+url+'"');
    		setStorage('seeStatus',1);
        	showDiv('noGoDiv');
    	}
    }
    function hideDiv(){
    	$('#noGoDiv').hide();
    }
    function hideDiv1(){
    	$('#noGoDiv').hide();
    	showDiv('alertDiv');
    }
    function showDiv(id){
		$('#main').hide();
		$('#noDiv').hide();
		$('#noGoDiv').hide();
		$('#noGoDiv1').hide();
		$('#alertDiv').hide();
		$('#successDiv').hide();
		$('#'+id).css('display','-webkit-flex');
		$('#'+id).css('display','flex');
		$('#'+id).css('display','-moz-flex');
	}
    function hideGoAlert(){
    	setStorage('resStatus',1);
    	$('#noGoDiv1').hide();
    }
    </script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId }" >
	<header>
       <a href="javascript:;" class="menu-btn"><img src="/themes/img/321.png"/></a>
        <span class="center">约会列表</span>
         <a href="/select.html?userId=${userId }" class="right"><img src="/themes/img/home.png" /></a>
    </header>
    <div class="love-list" style="display: none;"  >
    	<div  v-for="model in items">
	        <div  class="love-list-col" >
	            <div class="love-head-icon" ><img v-bind:src="model.pic" /></div>
	            <div class="love-right" onclick="doGo('{{model.userId}}','{{model.xx}}');" >
	                <p class="top" v-if="model.goStatus==1" v-text="model.realName" ></p>
	                <p class="top" v-if="model.goStatus==0" v-text="model.realName" ></p>
	                <p class="age" ><b v-text="model.age+'岁'" ></b>&nbsp;&nbsp;</p>
	            </div>
	        </div>
        </div>
   <nav class="menu">
    <div class="menu-logo">
        <img src="/themes/data/${sessionScope.pic}" onclick="javascript:location.href='/person.html?id=${userId}&userId=${userId }';"/>
        <p>${sessionScope.name}</p>
    </div>
	     <ul>
	        <li><a href="javascript:location.href='/ranking.html?userId=${userId }';"><img style="height: auto;" src="/themes/img/love_icon.png"/>魅力排行</a></li>
	        <li><a href="javascript:location.href='/list.html?userId=${userId }';"><img style="height: auto;" src="/themes/img/love_icon.png"/>我心仪的</a></li>
	        <li><a href="javascript:location.href='/listGo.html?userId=${userId }';"><img src="/themes/img/123.png"/>互相心仪</a></li>
	        <li><a href="javascript:location.href='/person.html?userId=${userId }&id=${userId }';"><img src="/themes/img/person.png"/>个人主页</a></li>
	    	<li><a href="javascript:location.href='/select.html?userId=${userId }&id=${userId }';"><img src="/themes/img/home.png"/>返回筛选</a></li>
	    </ul>
	</nav>
     </div>
     <div class="g-dialog-contianer" id="noDiv" style="display: none;" >
        <div class="dialog-window ">
            <div class="dialog-header"></div>
            <div class="dialog-content">很抱歉您还没有互相心仪对象</div>
            <div class="dialog-footer">
                <a class="green" href="/select.html?userId=${userId }">去寻找我的心仪对象</a>
            </div>
        </div>
    </div>
    <div class="g-dialog-contianer"  id="noGoDiv" style="display: none;" >
        <div class="dialog-window ">
            <div class="dialog-header"></div>
            <div class="dialog-content" style="padding: 0;" >恭喜你和TA互相心仪，</div>
            <div class="dialog-content" style="padding: 0;" >请关注巾帼园微信公众号</div>
            <div class="dialog-content" style="padding: 0;" >约么专栏的活动安排通知</div>
            <div class="dialog-content" style="padding: 0;" >或关注现场微信客服通知，</div>
            <div class="dialog-content" style="padding: 0;" >及时参加活动与TA互动吧！</div>
            <div class="dialog-footer">
               <a class="green dogreen" id="go1" >我知道了</a>
            </div>
        </div>
    </div>
    <div class="g-dialog-contianer"  id="noGoDiv1" style="display: none;" >
        <div class="dialog-window ">
            <div class="dialog-header"></div>
            <div class="dialog-content" style="padding: 0;" >请通过微信号码</div>
            <div class="dialog-content" style="padding: 0;" >联系您心仪的嘉宾</div>
            <div class="dialog-footer">
               <a class="green dogreen" onclick="hideGoAlert();" >我知道了</a>
            </div>
        </div>
    </div>
       <div class="g-dialog-contianer"  id="alertDiv" style="display: none;" >
        <div class="dialog-window ">
            <div class="dialog-header"></div>
            <div class="dialog-content">恭喜您操作成功！</div>
            <div class="dialog-footer">
            </div>
            <div class="dialog-close" onclick="javascript:location.reload();" ></div>
        </div>
    </div>
</body>
</html>