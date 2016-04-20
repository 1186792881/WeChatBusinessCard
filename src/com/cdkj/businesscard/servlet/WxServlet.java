package com.cdkj.businesscard.servlet;

import java.util.Date;

import javax.servlet.annotation.WebServlet;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.businesscard.model.UserInfo;
import com.cdkj.wechat.message.request.AppInfo;
import com.cdkj.wechat.message.request.BaseEvent;
import com.cdkj.wechat.message.response.BaseMsg;
import com.cdkj.wechat.message.response.TextMsg;
import com.cdkj.wechat.servlet.WeixinServletSupport;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.aop.Before;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;

@WebServlet("/WxServlet")
public class WxServlet extends WeixinServletSupport{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected AppInfo getAppInfo() {
		return new AppInfo(PropKit.get("AppID"), PropKit.get("AppSecret"), PropKit.get("Token"));
	}
	
	/**
	 * 处理关注事件
	 */
	@Before(Tx.class)
	protected BaseMsg handleSubscribe(BaseEvent event) {
		
		// 取出 openid
		String openid = event.getFromUserName();
		
		// 根据openid 获取用户信息
		JSONObject json = UserManagerApi.getUserInfo(openid, PropKit.get("AppID"));
		UserInfo userInfo = new UserInfo();
		userInfo.set("appid", PropKit.get("AppID"));
		userInfo.set("openid", openid);
		userInfo.set("nickname", json.get("nickname"));
		userInfo.set("sex", json.get("sex"));
		userInfo.set("country", json.get("country"));
		userInfo.set("province", json.get("province")); 
		userInfo.set("city", json.get("city"));
		userInfo.set("headimgurl", json.get("headimgurl"));
		userInfo.set("subscribe_time", new Date());
		userInfo.set("unsubscribe_time", null);
		userInfo.set("status", 1);
		userInfo.set("create_time", new Date());
		userInfo.set("update_time", null);
		
		// 查询 user_info 表, 如果没有记录，就添加，否则更新
		String sql = "select * from user_info where appid = ? and openid = ?";
		UserInfo info = UserInfo.dao.findFirst(sql, PropKit.get("AppID"), openid);
		if(info == null){
			userInfo.save();
		} else {
			userInfo.set("id", info.get("id"));
			userInfo.update();
		}
		
		return new TextMsg("终于等到你了!\n赶紧创建自己的微信名片吧!");
	}
	
	/**
	 * 处理取消关注事件
	 */
	@Before(Tx.class)
	protected BaseMsg handleUnsubscribe(BaseEvent event) {
		
		// 取出 openid
		String openid = event.getFromUserName();
		
		// 更新 user_info 表该用户的信息
		String sql = "update user_info set unsubscribe_time = ?, status = ?, update_time = ? where appid = ? and openid = ?";
		Db.update(sql, new Date(), 0, new Date(), PropKit.get("AppID"), openid);
		
		return null;
	}

}
