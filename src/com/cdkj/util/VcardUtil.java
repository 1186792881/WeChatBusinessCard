package com.cdkj.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import sun.misc.BASE64Encoder;

import com.cdkj.businesscard.model.CardInfo;
import com.cdkj.http.utils.HttpRequest;

/**
 * 生成联系人二维码
 */
public class VcardUtil {

	/**
	 * 为名片对象生成联系人二维码
	 * @param card
	 * @return
	 */
	public static String makeVcard(CardInfo card){
		try {
			
			String address = (card.getStr("address") == null || card.getStr("address").isEmpty()) ? "" : "\nADR;TYPE=WORK;CHARSET=utf8:" + card.getStr("address");
			
			String vcard = 	"BEGIN:VCARD" +
				    		"\nVERSION:3.0" +
				    		"\nN;CHARSET=utf8:" + card.getStr("name") +
				    		"\nEMAIL;CHARSET=utf8:" + card.getStr("email") +
				    		"\nTEL;TYPE=WORK;VOICE;CHARSET=utf8:" + card.getStr("phone") +
				    		address +
				    		"\nORG;CHARSET=utf8:" + card.getStr("company") +
				    		"\nTITLE;CHARSET=utf8:" + card.getStr("position") +
				    		"\nEND:VCARD";
			
			InputStream is = HttpRequest.get(card.getStr("headimgurl")).stream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			QrcodeUtil.encode(vcard, is, out);
			String headimg = new BASE64Encoder().encode(out.toByteArray());
			 
			return headimg;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
