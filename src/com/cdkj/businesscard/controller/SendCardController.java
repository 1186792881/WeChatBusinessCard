package com.cdkj.businesscard.controller;

import java.util.List;

import com.cdkj.businesscard.interceptor.BindInterceptor;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.businesscard.model.UserInfo;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;

/**
 * 处理已发送的名片
 */
public class SendCardController extends Controller {

	/**
	 * 列出所有收到自己名片的用户
	 */
	@Before(BindInterceptor.class)
	public void listUser(){
		
		String openid = getAttr("openid");
		
		String sql = "select * from card_info where openid = ? and appid = ?";
		CardInfo cardInfo = CardInfo.dao.findFirst(sql, openid, PropKit.get("AppID"));
		
		// 没有名片信息 跳转到编辑页面
		if(cardInfo == null){
			setAttr("openid", openid);
			renderJsp("/template/addCard.jsp");
			return;
		}
		
		// 已经有名片，查询 user_card_relation, user_info 表，列出收到该名片的用户
		sql = "select u.* from user_card_relation r, user_info u where r.openid = u.openid and r.appid = u.appid and r.cardid = ?";
		List<UserInfo> root = UserInfo.dao.find(sql, cardInfo.getInt("id"));
		
		setAttr("root", root);
		renderJsp("/template/listUser.jsp");
		
	}
}
