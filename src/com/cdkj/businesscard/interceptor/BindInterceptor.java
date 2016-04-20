package com.cdkj.businesscard.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;

/**
 * 设备绑定拦截器，判断用户是否绑定设备<br>
 * 如果已经绑定，就放行；没有绑定重定向到绑定的链接上<br>
 * 
 * @author wangyi
 */
public class BindInterceptor implements Interceptor {

	public void intercept(Invocation inv) {
		Controller action = inv.getController();

		// 根据网页授权的code获取openid
		String code = action.getPara("code");
		if (StrKit.isBlank(code)) {action.renderNull(); return;}
		JSONObject json = UserManagerApi.getOauth2AccessToken(PropKit.get("AppID"), PropKit.get("AppSecret"), code);
		String openid = json.getString("openid");
		
		System.out.println("openid : " + openid);
		
		if (StrKit.isBlank(openid)) {action.renderNull(); return;}
		// 根据openid查询 user_device 表，判断该用户是否已经绑定设备
		int count = Db.queryNumber("select count(id) from user_device where openid = ?", openid).intValue();
		if (0 == count) { // 还未绑定，跳转到提示绑定的页面
			action.setAttr("bindUrl", PropKit.get("BindUrl"));
			action.renderJsp("/template/noticeBind.jsp");
			return;
		}

		// 已经绑定，放行
		action.setAttr("openid", openid);
		inv.invoke();

	}

}
