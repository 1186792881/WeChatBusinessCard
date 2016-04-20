<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title>发出的名片</title>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/listUser.css" rel="stylesheet">
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
		<c:forEach items="${root }" var="user">
		<div class="row">
			<div class="col-xs-3">
				<img src="${user.headimgurl }" alt="头像" class="img-responsive headimg"/>
			</div>
			<div class="col-xs-9">
				<div class="content">
					<span class="title">${user.nickname }</span>
					<span>${user.country} ${user.province} ${user.city }</span>
				</div>
			</div>
		</div>
		</c:forEach>
	</section>
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
