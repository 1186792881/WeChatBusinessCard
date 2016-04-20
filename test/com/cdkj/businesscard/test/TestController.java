package com.cdkj.businesscard.test;

import java.util.List;

import com.cdkj.businesscard.model.CardInfo;
import com.jfinal.core.Controller;

public class TestController extends Controller {

	public void index() {
		List<CardInfo> cardInfoList = CardInfo.dao.find("select * from card_info");
		
		renderJson(cardInfoList);
	}
}
