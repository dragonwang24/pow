
package com.pow.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class SMSUtils {
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	private static Map<String, String> SmsMap = new HashMap<String, String>();
	
	public static String sendSecurityCode(final String phoneNum){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		
		String mobile_code = String.valueOf((int)((Math.random()*9+1)*100000));

	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。"); 
	    System.out.println(content);

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_dragon"), 
			    new NameValuePair("password", "qwert12345"), //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", phoneNum), 
			    new NameValuePair("content", content),
		};
		
		method.setRequestBody(data);		
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
						
			 if("2".equals(code)){
				System.out.println("短信提交成功");
				SmsMap.put(phoneNum, mobile_code);
				new Timer().schedule(new TimerTask() {
					@Override
					public void run() {
						//SmsMap.remove(phoneNum);
					}
				},1000*60*2);
				return mobile_code;
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
		return null;
	}
	
	public static boolean checkSecurityCode(String phoneNum, String securityCode){
		String catchCode = SmsMap.get(phoneNum);
		if(StringUtils.isNotBlank(catchCode) && catchCode.equals(securityCode)){
			return true;
		}
		return false;
	}
	
}

