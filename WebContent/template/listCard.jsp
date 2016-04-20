<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title>收到的名片</title>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/listCard.css" rel="stylesheet">
	<style>
		.follow{font-size:20px;line-height:30px;color:#fff;text-align:center;padding-top:20%;z-index:2000;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.8);display:none;}
		.follow span{font-size:40px;position:absolute;top:10px;left:10px;}
		.follow img{width:80%;margin-top:10px;}
	</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<!-- 屏幕小到一定的尺寸时候导航栏发生的变化 -->
			<div class="navbar-header">
				<button class="navbar-toggle" data-target="#navigation-list" data-toggle="collapse" type="button">
					<span class="sr-only">切换</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="javascript:void(0);">微信名片</a>
			</div>
			<!-- 正常尺寸下的导航拦 -->
			<div class="collapse navbar-collapse" id="navigation-list">
			  <ul class="nav navbar-nav">
				<li><a href="${menu.MyCardUrl }">我的名片</a></li>
				<li><a href="${menu.ReceiveCardUrl }">收到的名片</a></li>
				<li><a href="${menu.SendCardUrl }">发出的名片</a></li>
			  </ul>
			  <ul class="nav navbar-nav navbar-right">		
				<li><a href="#">绑定设备</a></li>
				<li><a href="#">解除绑定</a></li>
				<li><a href="#">打开设备</a></li>
				<li><a href="#">关闭设备</a></li>
				<li><a href="#">临时打开</a></li>
			  </ul>
			</div>
		</nav>
	</header>
	<section>
		<c:forEach items="${root }" var="card">
		<div class="row">
			<div id="card_${card.id }" class="col-xs-3">
				<img src="${card.headimgurl }" alt="头像" class="img-responsive headimg"/>
			</div>
			<div class="col-xs-7">
				<div class="content">
					<span class="title">${card.name }</span>
					<span>${card.company }</span>
				</div>
			</div>
			<%-- <div class="col-xs-2">
				<img src="data:image/jpeg;base64,${card.vcard }" alt="头像" class="img-thumbnail qrcode" data-toggle="modal" data-target="#myModal_${card.id }"/>
			</div> --%>
			
			<div class="col-xs-2">
				<img src="data:image/jpeg;base64,${card.vcard }" alt="头像" class="img-thumbnail qrcode" onclick="show(${card.id })"/>
			</div>
			<div id="follow_${card.id }" class="follow">
				<span class="close" onclick="hide(${card.id })">×</span>
				<p>扫一扫或长按识别二维码</p>
				<p>添加到系统联系人</p>
				<img src="data:image/jpeg;base64,${card.vcard }" alt="名片二维码">
			</div>
			
			<!-- 模态框（Modal） -->
			<%-- <div class="modal" id="myModal_${card.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			   	<div class="modal-dialog">
			      	<div class="modal-content">
			         	<div class="modal-header">
			            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			            	<h4 class="modal-title" id="myModalLabel">
			               		<span class="title">${card.name }</span>
								<span>${card.company }</span>
			            	</h4>
			         	</div>
			         	<div class="modal-body">
			            	<img src="data:image/jpeg;base64,${card.vcard }" class="img-responsive" alt="名片二维码" />
			         	</div>
			         	<div class="modal-footer">
			            	扫一扫或长按识别二维码，添加到通讯录
			         	</div>
			      </div>
				</div>
			</div> --%>
		</div>
		</c:forEach>
	</section>
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("div[id^='card']").click(function(){
				var cardid = $(this).attr("id");
				var id = cardid.substr(5);
				window.location.href="${pageContext.request.contextPath }/businesscard/receiveCard/showCard?id=" + id;
			});
		});
		function show(id){
			document.getElementById("follow_" + id).style.display = "block"; 
		};
		function hide(id){
			document.getElementById("follow_" + id).style.display = "none"; 
		};
	</script>
</body>
</html>
