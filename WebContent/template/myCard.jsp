<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<title>${root.name}的名片</title>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/showCard.css" />
    <style>
    	#call button{
    		width:50px;
    		height:50px;
    		border-radius:50% ;
    		padding-left: 6px;
    		margin-left: 20px;
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
    <section class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide" id="pag1">
				<section id="content1">
					<div><img src="${root.headimgurl }" alt="用户头像" class="img-responsive img-circle center-block" /></div>
					<div id="user_name">${root.name}</div>
					<div id="user_position">${root.position }</div>
					<div id="user_company">${root.company }</div>
				</section>
            </div>
            <div class="swiper-slide" id="pag2">
				<section id="content2">
					<div class="list-group">
					   <div class="list-group-item">
					      <h4 class="list-group-item-heading" style="color: black;">
					         	联系方式
					      </h4>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">手机:</span>
					         	<span>${root.phone }</span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">邮箱:</span>
					         	<span>${root.email }</span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span  class="label-info">Q Q:</span>
					         	<span>&nbsp;${root.qq }</span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span  class="label-info">微信:</span>
					         	<span>${root.wechatnumber }</span>
					      </p>
					   </div>
					</div>
					<div class="list-group">
					   <div class="list-group-item">
					      <h4 class="list-group-item-heading" style="color: black;">
					         	公司信息
					      </h4>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">公司电话:</span>
					         	<span>${root.telphone }</span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">公司地址:</span>
					         	<span>${root.address }</span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">公司网址:</span>
					         	<span><a href="${root.site }">${root.site }</a></span>
					      </p>
					   </div>
					   <div class="list-group-item">
					      <p class="list-group-item-text">
					         	<span class="label-info">公司传真:</span>
					         	<span>${root.fax }</span>
					      </p>
					   </div>
					</div>
					<div id="call">
						<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${menu.EditCardUIUrl}'">编辑</button>
						<a href="tel:${root.phone }">
							<img src="${pageContext.request.contextPath }/img/call.jpg" alt="拨打电话" class="img-circle"/>
						</a>
					</div>
				</section>
            </div>
            <div class="swiper-slide" id="pag3">
				<section id="content3">
					<img src="data:image/jpeg;base64,${root.vcard }" alt="名片二维码"/>
					<div>扫一扫或长按识别二维码，添加到通讯录</div>
				</section>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </section>
	
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/swiper.min.js"></script>
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        effect: 'cube',
        grabCursor: true,
        cube: {
            shadow: true,
            slideShadows: true,
            shadowOffset: 20,
            shadowScale: 0.94
        }
    });
    </script>
</body>
</html>