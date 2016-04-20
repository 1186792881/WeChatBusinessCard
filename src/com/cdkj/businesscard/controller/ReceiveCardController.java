package com.cdkj.businesscard.controller;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.util.VcardUtil;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;

/**
 * 处理收到名片菜单下的请求
 */
public class ReceiveCardController extends Controller{
	
	/**
	 * 列出所有收到的名片
	 */
	public void listCard(){
		
		// 网页授权 获取用户的openid
		String code = getPara("code");
		if (StrKit.isBlank(code)) {renderNull(); return;}
		JSONObject json = UserManagerApi.getOauth2AccessToken(PropKit.get("AppID"), PropKit.get("AppSecret"), code);
		String openid = json.getString("openid");
		
		// 根据 openid 查询 user_card_relation, card_info 表， 获取用户收到的名片
		String sql = "select c.* from card_info c, user_card_relation r where r.appid = ? and r.openid = ? and r.cardid = c.id";
		List<CardInfo> root = CardInfo.dao.find(sql, PropKit.get("AppID"), openid);
		for(CardInfo card : root){
			card.put("vcard", VcardUtil.makeVcard(card));
		}
		
		// 渲染名片列表页面
		setAttr("root", root);
		renderJsp("/template/listCard.jsp");
	
	}
	
	/**
	 * 点击列表中条目后展示名片详细信息
	 */
	public void showCard(){
		CardInfo root = CardInfo.dao.findById(getParaToInt("id"));
		root.put("vcard", VcardUtil.makeVcard(root));
		
		setAttr("root", root);
		renderJsp("/template/showCard.jsp");
	}
}
