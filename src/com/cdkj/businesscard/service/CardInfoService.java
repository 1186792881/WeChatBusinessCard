package com.cdkj.businesscard.service;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.businesscard.model.UserDevice;
import com.cdkj.http.utils.HttpRequest;
import com.cdkj.wechat.message.request.Page;
import com.cdkj.wechat.shake.DeviceRelationPageApi;
import com.cdkj.wechat.shake.PageManagerApi;
import com.cdkj.wechat.token.AccessTokenApi;
import com.cdkj.wechat.usermanager.UserManagerApi;
import com.jfinal.aop.Before;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;

public class CardInfoService {
	
	private static Log log = Log.getLog(CardInfoService.class);

	@Before(Tx.class)
	public void update(CardInfo model){
		// 修改名片信息
		model.update();
		
		// 修改摇一摇页面
		Record map = Db.findFirst("select d.page_id,d.page_url,d.icon_url from user_device d, card_info c where c.id = ? and d.openid = c.openid", model.get("id"));
		Page page = new Page();
		page.setPage_id(map.getInt("page_id"));
		page.setTitle(model.getStr("name"));
		page.setDescription(model.getStr("name") + "的名片");
		page.setIcon_url(map.getStr("icon_url"));
		page.setPage_url(map.getStr("page_url"));
		boolean isSuccess = PageManagerApi.EditPage(page, PropKit.get("AppID"));
		log.info("修改摇一摇页面返回标记： " + isSuccess);
	}

	@Before(Tx.class)
	public void save(CardInfo model) {
		JSONObject userInfoJson = UserManagerApi.getUserInfo(model.getStr("openid"), PropKit.get("AppID"));
		model.set("appid", PropKit.get("AppID"));
		model.set("headimgurl", userInfoJson.getString("headimgurl"));
		model.save();
		
		// 新增摇一摇页面
		String icon_url = getIconUrl(model.getStr("headimgurl"));
		Page page = new Page();
		page.setTitle(model.getStr("name"));
		page.setDescription(model.getStr("name") + "的名片");
		page.setIcon_url(icon_url);
		page.setPage_url(PropKit.get("ShakePageUrl").replace("CARDID", model.getInt("id").toString()));
		JSONObject json = PageManagerApi.CreatePage(page, PropKit.get("AppID"));
		log.info("创建摇一摇页面返回信息：" + json.toString());
		
		// 配置页面与设备之间的关系
		int page_id = json.getJSONObject("data").getIntValue("page_id");
		List<Integer> pageIds = new ArrayList<Integer>();
		pageIds.add(page_id);
		UserDevice userDevice = UserDevice.dao.findFirst("select * from user_device where openid = ?", model.getStr("openid"));
		boolean isConfig = DeviceRelationPageApi.ConfigDevicePage(userDevice.getStr("uuid"), userDevice.getStr("major"), userDevice.getStr("minor"), pageIds, PropKit.get("AppID"));
		log.info("配置页面与设备之间的关系，返回标记：" + isConfig);
		
		// 修改 user_device 表的 page_url, icon_url 和 page_id 字段
		Object[] params = {page.getPage_url(), page_id, icon_url, model.get("openid"), PropKit.get("AppID")};
		Db.update("update user_device set page_url = ?, page_id = ?, icon_url = ? where openid = ? and appid = ?", params);
	}
	
	/**
	 * 获取上传的摇一摇图片url
	 * @param headimgurl
	 * @return
	 */
	public String getIconUrl(String headimgurl){
		String url = "https://api.weixin.qq.com/shakearound/material/add?access_token=ACCESS_TOKEN&type=TYPE";
		InputStream is = HttpRequest.get(headimgurl.replace("/0", "/132")).stream();
		String str = HttpRequest.post(url.replace("ACCESS_TOKEN", AccessTokenApi.getAccessTokenStr(PropKit.get("AppID"))).replace("TYPE", "icon")).part("media", "img.jpg", "image/jpeg", resizeImage(is, 120,120)).body();
		log.info("上传摇一摇图片素材：" + str);
		return JSON.parseObject(str).getJSONObject("data").getString("pic_url");
	}
	
	/*** 
     * 功能 :调整图片大小
     * @param is 原始的图片流
     * @param width   转换后图片宽度 
     * @param height  转换后图片高度 
     */  
    public static InputStream resizeImage(InputStream is, int width, int height){
    	try {
    		Image srcImg = ImageIO.read(is);
            BufferedImage buffImg = null;
            buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
            buffImg.getGraphics().drawImage(srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);  
      
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(buffImg, "JPEG", bos);
            is.close();
            return new ByteArrayInputStream(bos.toByteArray());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new RuntimeException(e);
		}
    }  
    
    public static void main(String[] args) throws Exception {
		String headimgurl = "http://wx.qlogo.cn/mmopen/BfRL3E0G1pfXsJuXAq03ujr9J0MWP7OWlN1XMUuytYhsKibrerP9vvqsCYdwIVn5Dq4FmYVSzcoM30DibSrlKrAds8HbEJxshl/132";
		String url = "https://api.weixin.qq.com/shakearound/material/add?access_token=ACCESS_TOKEN&type=TYPE";
		InputStream is = HttpRequest.get(headimgurl).stream();
		
		String token = "rajZ0CvYogBZqkettHAyMjcx8OaIeZofz683orxnwjMJ20WOBReQDzFCsGdJVoIzMlj_6KQBcXr2NFS1ooZMIV8nJK8PPbYVu9r7ih0r7g6AfzDEYGJuk8jA-ERHHP9JIUTbAAACON";
		String str = HttpRequest.post(url.replace("ACCESS_TOKEN", token).replace("TYPE", "icon")).part("media", "img.jpg", "image/jpeg", resizeImage(is, 120,120)).body();
		System.out.println(str);
	}
	
}
