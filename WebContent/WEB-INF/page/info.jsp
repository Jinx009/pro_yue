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
<title>身份认证</title>
<script src="/themes/js/jquery.js"></script>
<script
	src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
<script type="text/javascript"
	src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
<script src="/themes/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/themes/css/buildDate.css">
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">
	wx.config({
		debug : false,
		appId : '${appId}',
		timestamp : '${timestamp}',
		nonceStr : '${nonceStr}',
		signature : '${signature}',
		jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
				'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo',
				'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem',
				'showAllNonBaseMenuItem', 'translateVoice', 'startRecord',
				'stopRecord', 'onRecordEnd', 'playVoice', 'pauseVoice',
				'stopVoice', 'uploadVoice', 'downloadVoice', 'chooseImage',
				'previewImage', 'uploadImage', 'downloadImage',
				'getNetworkType', 'openLocation', 'getLocation',
				'hideOptionMenu', 'showOptionMenu', 'closeWindow',
				'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
				'addCard', 'chooseCard', 'openCard' ]
	});

	wx.ready(function() {

	});
	wx.error(function(res) {
		alert(res.errMsg);
	});
	/**
	 *
	 */
	var imgArray = new Array();
	imgArray[0] = {
		localId : [],
		serverId : [],
		restId : null
	};
	imgArray[1] = {
		localId : [],
		serverId : [],
		restId : null
	};
	imgArray[2] = {
		localId : [],
		serverId : [],
		restId : null
	};
	function chooseImg(num) {
		num = parseInt(num);
		wx.chooseImage({
			success : function(res) {
				imgArray[num].localId = res.localIds;
				if (imgArray[num].localId.length > 1) {
					alert('最多可选择一张!');
				} else {
					$('#img' + num).attr('src', imgArray[num].localId[0]);
					wx.uploadImage({
						localId : imgArray[num].localId[0],
						isShowProgressTips : 1,
						success : function(res) {
							imgArray[num].serverId.push(res.serverId);
							imgArray[num].restId = upload(num);
						},
						fail : function(res) {
							alert(JSON.stringify(res));
						}
					});
				}
			}
		});
	}

	function upload(num) {
		var url = "/saveImg.html";
		var params = 'wechatMediaId=' + imgArray[num].serverId[0]
				+ '&mediaType=1';
		$.ajax({
			url : url,
			type : 'POST',
			data : params,
			dataType : 'json',
			success : function(res) {
				imgArray[num].restId = res;
				var realUrl = res.data;
				return realUrl;
			},
			error : function(textStatus, errorThrown) {
				alert(textStatus.toString());
				alert(errorThrown.toString());
			}
		})
	}

	function sendData() {
		hideAlert();
		var thisAge = parseInt($('#age').val());
		if ($('#age').val() == null || $('#age').val() == '') {
			alert('年龄未填写！');
		} else if ($('#realName').val() == null || $('#realName').val() == '') {
			alert('姓名未填写！');
		} else if ($('#mobilePhone').val() == null
				|| $('#mobilePhone').val() == '') {
			alert('手机号未填写！');
		} else if (thisAge<22||thisAge>50) {
			alert('您填写的年龄超出活动要求，请重新填写!');
		}else if($('#wechatAccount').val()==null&&$('#wechatAccount').val()==''){
    		alert('微信号未填写！');
   	 	}/* else if($('#likes').val()==null&&$('#likes').val()==''){
       		alert('兴趣爱好不能为空！');
       	} *//* else if($('#address').val()==null&&$('#address').val()==''){
       		alert('户籍未填写！');
       	}else if($('#job').val()==null&&$('#job').val()==''){
       		alert('职业未填写！');
       	}else if($('#danwei').val()==null&&$('#danwei').val()==''){
       		alert('单位未填写！');
       	} */
		else if (imgArray[0].restId == null&& imgArray[1].restId == null && imgArray[2].restId == null) {
			alert('您必须上传至少一张图片！');
		} else {
			if (imgArray[0].restId == null && imgArray[1].restId == null
					&& imgArray[2].restId != null) {
				imgArray[0].restId = imgArray[1].restId;
				imgArray[1].restId = null;
			}
			if (imgArray[0].restId == null && imgArray[1].restId != null
					&& imgArray[2].restId != null) {
				imgArray[0].restId = imgArray[1].restId;
				imgArray[1].restId = imgArray[2].restId;
				imgArray[2].restId = null
			}
			if (imgArray[0].restId != null && imgArray[1].restId == null
					&& imgArray[2].restId != null) {
				imgArray[1].restId = imgArray[2].restId;
				imgArray[2].restId = null
			}
			//realName searcher num age address job likes request zodiac edu tag info
			var params = 'realName=' + $('#realName').val() + '&sex='
					+ $('#sexText input[name="searcher"]:checked ').val()
					+ '&num=' + $('#num').val() + '&age=' + $('#age').val()
					+ '&address=' + $('#address').val() + '&job='
					+ $('#job').val() + '&likes=' + $('#likes').val()
					+ '&request=' + $('#request').val() + '&zodiac='
					+ $('#zodiac').text() + '&edu=' + $('#edu').text()
					+ '&tag=' + $('#tag').val() + '&info=' + $('#info').val()
					+ '&pic1=' + imgArray[0].restId + '&pic2='
					+ imgArray[1].restId + '&pic3=' + imgArray[2].restId
					+ '&userId=' + $('#userId').val() + '&mobilePhone='
					+ $('#mobilePhone').val() + '&wechatAccount='
					+ $('#wechatAccount').val() + '&danwei='
					+ $('#danwei').val();

			$.ajax({
				url : '/saveInfo.html',
				type : 'POST',
				data : params,
				dataType : 'json',
				success : function(res) {
					if ('success' == res.status) {
						alert('资料认证成功！');
						location.href = '/select.html?userId='
								+ $('#userId').val();
					} else {
						alert('该编号已经存在！');
					}
				}
			})
		}
	}
	function hideAlert() {
		$('#alertDiv').hide();
		$('#noGoDiv1').hide();
	}
	function showAlert1(id) {
		hideAlert();
		$('#' + id).css('display', '-webkit-flex');
	}
	function goPro() {
		var userId = $('#userId').val();
		location.href = '/res.html?userId=' + userId;
	}
</script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId }">
	<header>
		<span class="center">身份认证</span>
	</header>
	<!--    <div class="ID-col"></div> -->
	<div class="ID-list">
		<div class="ID-col ID-col-three">
			<p class="left">
				<b>*</b><span>姓名</span>
			</p>
			<div class="right">
				<input type="text" id="realName" placeholder="请填写您的姓名" />
			</div>
		</div>
		<div class="ID-col ID-col-three">
			<p class="left">
				<b>*</b><span>性别</span>
			</p>
			<div class="right" id="sexText">
				<label class="one_radio-button"> <input type="radio"
					name="searcher" id="male" value="男" checked>
					<div class="one_radio-button__checkmark"></div> <span>男</span>
				</label> <label class="one_radio-button"> <input type="radio"
					name="searcher" id="female" value="女">
					<div class="one_radio-button__checkmark"></div> <span>女</span>
				</label>
			</div>
		</div>
		<!--    -->
		<div class="ID-col ID-col-three">
			<p class="left">
				<b>*</b><span>手机号</span>
			</p>
			<div class="right">
				<input type="text" id="mobilePhone" placeholder="手机号不会显示在个人信息中" />
			</div>
		</div>
		<div class="ID-col ID-col-three">
			<p class="left">
				<b>*</b><span>微信号</span>
			</p>
			<div class="right">
				<input type="text" id="wechatAccount" placeholder="请输入您的微信号" />
			</div>
		</div>
		<div class="ID-col ID-col-three">
			<p class="left">
				<b>*</b><span>年龄</span>
			</p>
			<div class="right">
				<input type="tel" id="age" placeholder="请输入您的年龄(22-50)" />
			</div>
		</div>
		<div style="display: none;">
			<div class="ID-col ID-col-three">
				<p class="left">
					<b>*</b><span>嘉宾号</span>
				</p>
				<div class="right">
					<input type="text" id="num" placeholder="请输入您的嘉宾号（入场券号）" />
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>户籍</span>
				</p>
				<div class="right">
					<input type="text" id="address" placeholder="请输入您的户籍" />
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>职业</span>
				</p>
				<div class="right">
					<input type="text" id="job" placeholder="请输入您的职业" />
				</div>
			</div>
			<div class="ID-col ID-col-three" style="display: none;">
				<p class="left">
					<b>*</b><span>单位</span>
				</p>
				<div class="right">
					<input type="text" id="danwei" placeholder="请输入您的单位" />
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>兴趣爱好</span>
				</p>
				<div class="right">
					<input type="text" id="likes" placeholder="请输入您的兴趣爱好" />
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>择偶要求</span>
				</p>
				<div class="right">
					<input type="text" id="request" placeholder="请输入您心仪的年龄、职业、爱好等" />
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>星座</span>
				</p>
				<div class="right sel">
					<p id="zodiac">白羊座</p>
					<ul>
						<li data-value='白羊座'>白羊座</li>
						<li data-value='金牛座'>金牛座</li>
						<li data-value='双子座'>双子座</li>
						<li data-value='巨蟹座'>巨蟹座</li>
						<li data-value='狮子座'>狮子座</li>
						<li data-value='处女座'>处女座</li>
						<li data-value='天秤座'>天秤座</li>
						<li data-value='天蝎座'>天蝎座</li>
						<li data-value='射手座'>射手座</li>
						<li data-value='摩羯座'>摩羯座</li>
						<li data-value='水瓶座'>水瓶座</li>
						<li data-value='双鱼座'>双鱼座</li>
					</ul>
				</div>
			</div>
			<div class="ID-col ID-col-one">
				<p class="left">
					<span>学历</span>
				</p>
				<div class="right sel1">
					<p id="edu">本科</p>
					<ul>
						<li data-value='初中'>初中</li>
						<li data-value='高中'>高中</li>
						<li data-value='大专'>大专</li>
						<li data-value='本科'>本科</li>
						<li data-value='硕士'>硕士</li>
						<li data-value='博士'>博士</li>
						<li data-value='海归'>海归</li>
					</ul>
				</div>
			</div>
			<div class="ID-list">
				<h3>我的标签</h3>
				<textarea placeholder="给自己贴上一些标签吧（可用逗号隔开）" id="tag"></textarea>
			</div>
			<div class="ID-list">
				<h3>个人简介</h3>
				<textarea placeholder="请输入一段介绍自己的话吧(200字数以内)" id="info"
					maxlength="200"></textarea>
			</div>
		</div>
		<div class="ID-list" style="border-top: 0 solid white;">
			<h3>
				<b style="color: #fe0100;">*</b>上传照片
			</h3>
			<div class="add-pic">
				<div>
					<img src="/themes/img/add_pic.jpg" id="img0" onclick="chooseImg(0)" />
				</div>
				<div>
					<img src="/themes/img/add_pic.jpg" id="img1" onclick="chooseImg(1)" />
				</div>
				<div>
					<img src="/themes/img/add_pic.jpg" id="img2" onclick="chooseImg(2)" />
				</div>
			</div>
		</div>
		<div style="margin-left: 10px; margin-top: 20px;">
			<input type="checkbox" onclick="return  false;"
				style="-webkit-appearance:  none;" checked="checked">&nbsp;&nbsp;<span
				onclick="goPro();" style="font-size: 14px;">阅读并同意《免责声明》</span>
		</div>
		<div class="footer-btn" style="border-top: 0 solid white;">
			<a href="javascript:showAlert1('noGoDiv1');" class="btn">立即提交</a>
		</div>
		<div class="g-dialog-contianer" id="alertDiv">
			<div class="dialog-window ">
				<div class="dialog-header"></div>
				<div class="dialog-content" style="padding: 0;">嘉宾个人信息输入后无法修改，</div>
				<div class="dialog-content" style="padding: 0;">请务必认真填写哦！</div>
				<div class="dialog-content" style="padding: 0;">请尽量上传拍摄的竖屏的照片，</div>
				<div class="dialog-content" style="padding: 0;">以免造成照片变形.</div>
				<div class="dialog-footer"></div>
				<div class="dialog-close" onclick="hideAlert();"></div>
			</div>
		</div>
		<div class="g-dialog-contianer" id="noGoDiv1" style="display: none;">
			<div class="dialog-window ">
				<div class="dialog-header"></div>
				<div class="dialog-content" style="padding: 0;">请确认您所填的信息正确，</div>
				<div class="dialog-content" style="padding: 0;">点击确认后无法更改。</div>
				<div class="dialog-footer">
					<div class="dialog-footer">
						<a class="green dogreen" style="padding: 0.15rem 1.8em;"
							onclick="sendData();">确认</a>&nbsp;&nbsp;&nbsp; <a
							class="green dogreen" style="padding: 0.15rem 1.8em;"
							onclick="hideAlert();">取消</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('.sel > p').on('click', function(event) {
				$('.sel').toggleClass('open');
			});
			$('.sel ul li').on('click', function(event) {
				var _this = $(this);
				$('.sel > p').text(_this.attr('data-value'));
				_this.addClass('selected').siblings().removeClass('selected');
				$('.sel').removeClass('open');
			});
			$('.sel1 > p').on('click', function(event) {
				$('.sel1').toggleClass('open');
			});
			$('.sel1 ul li').on('click', function(event) {
				var _this = $(this);
				$('.sel1 > p').text(_this.attr('data-value'));
				_this.addClass('selected').siblings().removeClass('selected');
				$('.sel1').removeClass('open');
			});
		</script>
</body>
</html>