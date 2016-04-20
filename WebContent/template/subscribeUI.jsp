<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jfinal.kit.PropKit"%>
<%
	String cardid = request.getParameter("cardid");
	String ShakeCardUrl = PropKit.get("ShakeCardUrl").replace("STATE", cardid);
	request.setAttribute("ShakeCardUrl", ShakeCardUrl);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>微信名片</title>
</head>
<body>
<script type="text/javascript" src="http://zb.weixin.qq.com/nearbycgi/addcontact/BeaconAddContactJsBridge.js"></script>
<script type="text/javascript">
	BeaconAddContactJsBridge.ready(function(){
		//判断是否关注
		BeaconAddContactJsBridge.invoke('checkAddContactStatus',{} ,function(apiResult){
			if(apiResult.err_code == 0){
				var status = apiResult.data;
				if(status == 1){
					window.location.href = "${ShakeCardUrl}";
				}else{
					//跳转到关注页
					BeaconAddContactJsBridge.invoke('jumpAddContact');
				}
			}else{
				alert(apiResult.err_msg);
			}
		});
	});
</script>
</body>
</html>