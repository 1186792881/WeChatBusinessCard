<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>绑定设备</title>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body{
			background-color: rgb(241,250,255);
			padding-top: 100px;
		}
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
	<section class="container-fluid">
		<div class="panel panel-default">
   			<div class="panel-heading">
      			<h2 class="text-center text-warning">
         			您还未绑定过设备
      			</h2>
   			</div>
   			<div class="panel-body">
     			<div class="form-group">
		            <a class="btn btn-primary btn-lg btn-block" href="${menu.BindDeviceUrl }">立即绑定</a>
		         </div>
  			</div>
		</div>
	</section>
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>