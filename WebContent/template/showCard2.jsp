<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-touch-fullscreen" content="yes">
		<meta name="format-detection" content="telephone=no">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="robots" content="NOINDEX,NOFOLLOW,NOARCHIVE">
		<title>${root.name}的名片</title>
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
		<link href="${pageContext.request.contextPath}/js/a000000.css" media="screen" rel="stylesheet" type="text/css" />
		<style type="text/css">
			body{
				padding-top: 50px;
			}
		</style>
		<script>
			var supportinfo = true;
		</script>
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
		<section style="padding-bottom: 50px;" id="cli_content" class="container-f">
			<div id="touch">
				<div class="content">
					<div class="tree_box" id="0"><span id=""></span>
						<div class="vcard_biz">
							<div style="background-image: url(http://biz.cli.im/Public/images/vcardbg7.jpg);" class="vcard_biz_head tc" databg="img/vcardbg7.jpg">
								<div class="vcard_biz_career" id="vcard_career">
									<img src="${root.headimgurl }" style="margin-top: 50px;">
									<div id="vcard_biz_name">${root.name}</div>
									<div class="vcard_career_title1">${root.position}</div>
									<div class="vcard_career_name1">${root.company}</div>
									<div class="cl"></div>
								</div>
							</div>
							<div style="position:relative;">
								<div class="vcardlist ">
									<ul>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">姓名</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.name}</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">职位</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.position}</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">公司</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.company}</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a href="tel:${user.phone }">
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">电话</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.phone }</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a href="mailto:${root.email }">
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">邮箱</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.email }</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">传真</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.fax}</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">地址</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.address }</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<a>
												<div class="vcard_data_txt clearfloat">
													<span class="vcard_data_title vcard_data_value_mr">QQ号</span>
													<div class="vcard_data_value vcard_data_value_mr clearfloat"><span>${root.qq }</span></div>
												</div>
											</a>
										</li>
										<li class="info">
											<div class="form-group">
										        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/businesscard/myCard/editCardUI?id=${root.id }'">编辑名片</button>
									   		</div>
								   		</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none; bottom: 97.05px;" class="scroll_top" id="tools">
				<a class="scroll_top_a"></a>
			</div>
		</section>
	  	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	</body>

</html>