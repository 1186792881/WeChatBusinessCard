package com.cdkj.businesscard.config;

import java.util.HashMap;
import java.util.Map;

import com.cdkj.businesscard.controller.MyCardController;
import com.cdkj.businesscard.controller.ReceiveCardController;
import com.cdkj.businesscard.controller.SendCardController;
import com.cdkj.businesscard.controller.ShakeCardController;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.businesscard.model.CardModel;
import com.cdkj.businesscard.model.UserDevice;
import com.cdkj.businesscard.model.UserInfo;
import com.cdkj.businesscard.test.TestController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;

/**
 * jfinal 环境配置
 */
public class BusinessCardConfig extends JFinalConfig{
	
	/**
	 * 常量配置
	 */
	public void configConstant(Constants me) {
		PropKit.use("configure.properties");
		me.setDevMode(PropKit.getBoolean("devMode"));
	}

	/**
	 * controller 路由配置
	 */
	public void configRoute(Routes me) {
		me.add("/businesscard/test", TestController.class);
		me.add("/businesscard/myCard", MyCardController.class);
		me.add("/businesscard/receiveCard", ReceiveCardController.class);
		me.add("/businesscard/sendCard", SendCardController.class);
		me.add("/businesscard/shakeCard", ShakeCardController.class);
	}

	/**
	 * 插件配置
	 */
	public void configPlugin(Plugins me) {
		
		// Druid 数据源配置
		DruidPlugin dp = new DruidPlugin(PropKit.get("jdbc.jdbcUrl"), PropKit.get("jdbc.username"), PropKit.get("jdbc.password"));
		me.add(dp);
		
		// ActiveRecord 操作数据库
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		arp.setShowSql(true);
		arp.addMapping("card_info", CardInfo.class);
		arp.addMapping("card_model", CardModel.class);
		arp.addMapping("user_device", UserDevice.class);
		arp.addMapping("user_info", UserInfo.class);
		me.add(arp);
	}

	/**
	 * 拦截器配置
	 */
	public void configInterceptor(Interceptors me) {
		
	}

	@Override
	public void configHandler(Handlers me) {
		
	}

	/**
	 * 在jfinal加载完后，初始化一些系统参数
	 */
	public void afterJFinalStart() {
		// 将菜单URL，添加到 application 中
		Map<String, String> menu = new HashMap<String, String>();
		menu.put("MyCardUrl",PropKit.get("MyCardUrl"));
		menu.put("ReceiveCardUrl",PropKit.get("ReceiveCardUrl"));
		menu.put("SendCardUrl",PropKit.get("SendCardUrl"));
		menu.put("EditCardUIUrl",PropKit.get("EditCardUIUrl"));
		menu.put("BindDeviceUrl",PropKit.get("BindDeviceUrl"));
		menu.put("UnBindDeviceUrl",PropKit.get("UnBindDeviceUrl"));
		menu.put("OpenDeviceUrl",PropKit.get("OpenDeviceUrl"));
		menu.put("CloseDeviceUrl",PropKit.get("CloseDeviceUrl"));
		menu.put("TempOpenDeviceUrl",PropKit.get("TempOpenDeviceUrl"));
		JFinal.me().getServletContext().setAttribute("menu", menu);
	}
	
	

}
