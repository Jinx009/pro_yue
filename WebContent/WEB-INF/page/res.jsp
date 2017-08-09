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
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
     <script src="/themes/js/common.js" ></script>
    <script type="text/javascript">
    $(function(){
    	
    })
    function goPage(){
    	var status = $('#status').val();
    	var userId = $('#userId').val();
    	//location.href = '/info.html?userId='+userId;
    	window.history.go(-1);
    }
    </script>
    <title>约么指南</title>
    <style type="text/css">
    html,body{
    	margin: 0;
    	padding: 0;
    	background: white;
    	width: 100%;
    	height: 100%;
    }
    .p-div{
    	width: 94%;
    	margin-left: 3%;
    }
    .p-div p{
    	font-size: 14px;
    	letter-spacing: 1px;
    	text-indent: 0em;
    	line-height: 24px;
    }
    .p-div h4{
    	text-align: center;
    	font-size: 16px;
    	letter-spacing: 1px;
    	padding-top: 20px;
    	padding-bottom: 15px;
    }
    .footer-btn{
		width: 100%;
		border-top: 1px solid #bfbfbf;
		background: #fff;
		padding: .27rem 0;
		margin-top: .67rem;
	}
	.footer-btn .btn{
		display: block;
		width: 92%;
		margin: 0 auto;
		height: 1.17rem;
		border-radius: 10px;
		background: #00a1ea;
		line-height: 1.17rem;
		text-align: center;
		color: #fff;
		font-size: 16px;
	}
    </style>
</head>
<body>
	<input type="hidden" value="${status }" id="status" >
	<input type="hidden" value="${userId }" id="userId" >
	<div class="p-div" >
		<h4>《约么》平台免责声明</h4>
		<p>这里的指引界面可能关乎到你的终身幸福大事，所以请仔细阅读：</p>
		<p>1、一切移动客户端用户在登录并注册“《约么》平台”－以下简称“平台”时均被视为已经仔细阅读本条款并完全同意。凡以任何方式登录平台，或直接、间接使用平台资料者，均被视为自愿接受本平台软件相关声明和用户服务协议的约束。</p>
		<p>2、平台转载的内容并不代表平台及责任企业之意见及观点，也不意味着本平台赞同其观点或证实其内容的真实性。</p>
		<p>3、平台转载的文字、图片、音视频等资料均由本平台用户提供，其真实性、准确性和合法性由信息发布人负责。平台只起到监督作用，并不提供任何保证，不承担任何法律责任。</p>
		<p>4、平台所转载的文字、图片、音视频等资料，如果侵犯了第三方的知识产权或其他权利，责任由发布者或转载者本人承担，本平台对此不承担责任。</p>
		<p>5、平台不涉及任何外部链接。</p>
		<p>6、用户明确并同意其使用平台网络服务所存在的风险将完全由其本人承担；因其使用平台网络服务而产生的一切后果也由其本人承担，平台对此不承担任何责任。</p>
		<p>7、除平台注明之服务条款外，其它因不当使用本平台系统而导致的任何意外、疏忽、合约毁坏、诽谤、版权或其他知识产权及肖像侵犯及其所造成的任何损失，平台概不负责，亦不承担任何法律责任。</p>
		<p>8、对于因不可抗力或因黑客攻击、通讯线路中断等平台不能控制的原因造成的网络服务中断或其他缺陷，导致用户不能正常使用平台，平台不承担任何责任，但将尽力减少因此给用户造成的损失或影响。</p>
		<p>9、本声明未涉及的问题请参见国家有关法律法规，当本声明与国家有关法律法规冲突时，以国家法律法规为准。</p>
		<p>10、本平台相关声明版权及其修改权、更新权和最终解释权均属上海市妇女儿童服务指导中心（巾帼园）所有。</p>
		<div class="footer-btn" style="border-top: 0 solid white;" ><a href="javascript:goPage();" class="btn">返回</a></div>
	</div>
</body>
</html>