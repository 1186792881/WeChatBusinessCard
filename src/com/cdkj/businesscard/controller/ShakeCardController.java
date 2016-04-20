package com.cdkj.businesscard.controller;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.util.VcardUtil;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * 处理摇出名片后的请求
 */
public class ShakeCardController extends Controller{

	/**
	 * 展示摇出的名片
	 */
	@Before(Tx.class)
	public void showCard(){
		// 网页授权 获取用户的openid
		String code = getPara("code");
		if (StrKit.isBlank(code)) {renderNull(); return;}
		int cardId = getParaToInt("state");
		JSONObject json = UserManagerApi.getOauth2AccessToken(PropKit.get("AppID"), PropKit.get("AppSecret"), code);
		String openid = json.getString("openid");
		
		// 查询 card_info 表，展示名片信息
		CardInfo root = CardInfo.dao.findById(cardId);
		
		// 查询 user_card_relation 表，如果该用户没有领取过该名片，就添加一条记录
		String sql = "select count(*) from user_card_relation where openid = ? and cardid = ? and appid = ?";
		Number count = Db.queryNumber(sql, openid, cardId, PropKit.get("AppID"));
		if(0 == count.intValue()){
			sql = "insert into user_card_relation(openid,cardid,appid) values(?,?,?)";
			Db.update(sql, openid, cardId, PropKit.get("AppID"));
		}
		
		// 设置名片二维码
		root.put("vcard", VcardUtil.makeVcard(root));
		
		// 渲染页面
		setAttr("root", root);
		renderJsp("/template/showCard.jsp");
	}
	
}
