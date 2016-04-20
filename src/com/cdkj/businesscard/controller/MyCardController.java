package com.cdkj.businesscard.controller;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.businesscard.interceptor.BindInterceptor;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.businesscard.service.CardInfoService;
import com.cdkj.util.VcardUtil;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;

/**
 * 处理我的名片下的请求
 */
public class MyCardController extends Controller {

	CardInfoService cardInfoService = Duang.duang(CardInfoService.class);
	
	/**
	 * 显示名片
	 */
	@Before(BindInterceptor.class)
	public void showCard(){
		String openid = getAttr("openid");
		
		CardInfo root = CardInfo.dao.findFirst("select * from card_info where openid = ?", openid);
		
		// 没有名片信息 跳转到编辑页面
		if(root == null){
			setAttr("openid", openid);
			renderJsp("/template/addCard.jsp");
			return;
		}
		
		// 设置名片二维码
		root.put("vcard", VcardUtil.makeVcard(root));
		
		setAttr("root", root);
		renderJsp("/template/myCard.jsp");
	}
	
	/**
	 * 添加名片
	 */
	public void addCard(){
		CardInfo model = getModel(CardInfo.class);
		
		cardInfoService.save(model);
		redirect(PropKit.get("MyCardUrl"));
	}
	
	/**
	 * 编辑名片页面
	 */
	public void editCardUI(){
		
		// 网页授权 获取用户的openid
		String code = getPara("code");
		if (StrKit.isBlank(code)) {renderNull(); return;}
		JSONObject json = UserManagerApi.getOauth2AccessToken(PropKit.get("AppID"), PropKit.get("AppSecret"), code);
		String openid = json.getString("openid");
		
		String sql = "select * from card_info where appid = ? and openid = ?";
		CardInfo root = CardInfo.dao.findFirst(sql, PropKit.get("AppID"), openid);
		
		setAttr("root", root);
		renderJsp("/template/editCard.jsp");
	}
	
	/**
	 * 编辑名片
	 */
	public void editCard(){
		CardInfo model = getModel(CardInfo.class);
		
		CardInfo info = CardInfo.dao.findById(model.getInt("id"));
		info.set("name", model.get("name"));
		info.set("position", model.get("position"));
		info.set("company", model.get("company"));
		info.set("phone", model.get("phone"));
		info.set("email", model.get("email"));
		info.set("fax", model.get("fax")); 
		info.set("address", model.get("address"));
		info.set("qq", model.get("qq"));
		info.set("wechatnumber", model.get("wechatnumber"));
		info.set("site",model.get("site"));
		info.set("telphone", model.get("telphone"));
		
		cardInfoService.update(info);
		redirect(PropKit.get("MyCardUrl"));
	}
	
}
