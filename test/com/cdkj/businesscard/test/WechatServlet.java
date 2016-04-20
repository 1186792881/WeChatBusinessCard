package com.cdkj.businesscard.test;

import javax.servlet.annotation.WebServlet;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.wechat.message.request.AppInfo;
import com.cdkj.wechat.message.request.BaseEvent;
import com.cdkj.wechat.message.request.TextReqMsg;
import com.cdkj.wechat.message.response.BaseMsg;
import com.cdkj.wechat.message.response.TextMsg;
import com.cdkj.wechat.servlet.WeixinServletSupport;
import com.cdkj.wechat.usermanager.UserManagerApi;

@WebServlet("/wechat")
public class WechatServlet extends WeixinServletSupport{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected AppInfo getAppInfo() {
		return new AppInfo("wx8b2d6ebcae83196b", "d4624c36b6795d1d99dcf0547af5443d", "wangyi");
	}
	
	@Override
	protected BaseMsg handleTextMsg(TextReqMsg msg) {
		return new TextMsg("你好：" + msg.getContent());
	}

	@Override
	protected BaseMsg handleSubscribe(BaseEvent event) {
		long createTime = event.getCreateTime();
		String fromUserName = event.getFromUserName();
		String toUserName = event.getToUserName();
		String e = event.getEvent();
		String type = event.getMsgType();
		
		System.out.println("createTime : " + createTime + " fromUserName : " + fromUserName + " toUserName : " + toUserName + " event : " + e + " msgTyep : " + type);
		
		JSONObject json = UserManagerApi.getUserInfo(fromUserName, getAppInfo().getAppid());
		String headimg = json.getString("headimgurl");
		
		System.out.println(json);
		System.out.println(headimg);
		
		return null;
	}

}
