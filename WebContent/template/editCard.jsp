<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title>编辑名片</title>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrapValidator.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/saveCard.css">
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
		<form id="saveCard" method="post" class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/businesscard/myCard/editCard">
		<input type="hidden" name="cardInfo.id" value="${root.id }">
		<div class="panel-group" id="accordion">
		  <div class="panel panel-info">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		          <span>基本信息</span>
		          <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne">
					<span class="caret"></span>
   				  </button>
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in">
		      <div class="panel-body">
		      	<div class="form-group">
			        <div class="input-group input-group-xs">
	         			<span class="input-group-addon danger">姓名</span>
	         			<input type="text" class="form-control" name="cardInfo.name" value="${root.name }" placeholder="请输入姓名">
	      			</div>
      			</div>
      			<div class="form-group">
      				<div class="input-group input-group-xs">
         				<span class="input-group-addon danger">公司</span>
         				<input type="text" class="form-control" name="cardInfo.company" value="${root.company }" placeholder="请输入公司">
      				</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon danger">职位</span>
	         			<input type="text" class="form-control" name="cardInfo.position" value="${root.position }" placeholder="请输入职位">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon danger">手机</span>
	         			<input type="tel" class="form-control" name="cardInfo.phone" value="${root.phone }" placeholder="请输入手机">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon danger">邮箱</span>
	         			<input type="email" class="form-control" name="cardInfo.email" value="${root.email }" placeholder="请输入邮箱">
	      			</div>
      			</div>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-info">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		          <span>即时通讯</span>
		          <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="collapse" data-parent="#accordion" data-target="#collapseTwo">
					<span class="caret"></span>
   				  </button>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
		      <div class="panel-body">
		      	<div class="form-group">
			        <div class="input-group input-group-xs">
	         			<span class="input-group-addon">Q Q</span>
	         			<input type="text" class="form-control" name="cardInfo.qq" value="${root.qq }" placeholder="请输入QQ号">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon">微信</span>
	         			<input type="text" class="form-control" name="cardInfo.wechatnumber" value="${root.wechatnumber }" placeholder="请输入微信号">
	      			</div>
      			</div>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-info">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		      	  <span>其他信息</span>
		      	  <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="collapse" data-parent="#accordion" data-target="#collapseThree">
					<span class="caret"></span>
   				  </button>
		      </h4>
		    </div>
		    <div id="collapseThree" class="panel-collapse collapse">
		      <div class="panel-body">
		      	<div class="form-group">
			    	<div class="input-group input-group-xs">
	         			<span class="input-group-addon">网址</span>
	         			<input type="text" class="form-control" name="cardInfo.site" value="${root.site }" placeholder="请输入公司网址">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon">电话</span>
	         			<input type="tel" class="form-control" name="cardInfo.telphone" value="${root.telphone }" placeholder="请输入公司电话">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon">地址</span>
	         			<input type="text" class="form-control" name="cardInfo.address" value="${root.address }" placeholder="请输入公司地址">
	      			</div>
      			</div>
      			<div class="form-group">
	      			<div class="input-group input-group-xs">
	         			<span class="input-group-addon">传真</span>
	         			<input type="text" class="form-control" name="cardInfo.fax" value="${root.fax }" placeholder="请输入公司传真">
	      			</div>
      			</div>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-info">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		      	  <span>名片模板</span>
		      	  <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="collapse" data-parent="#accordion" data-target="#collapseFour">
					<span class="caret"></span>
   				  </button>
		      </h4>
		    </div>
		    <div id="collapseFour" class="panel-collapse collapse">
		      <div class="panel-body">
		        Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
		        cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
		        vice lomo.
		      </div>
		    </div>
		  </div>
		</div>
		<button id="submit" type="submit" class="btn btn-primary btn-lg btn-block">保存名片</button>
		</form>
	</section>
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrapValidator.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/saveCard.js"></script>
</body>
</html>