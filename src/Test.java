import java.io.IOException;
import java.security.Timestamp;
import java.util.Date;

import org.apache.commons.httpclient.HttpException;

/*******************************************************************************
 * $Header$
 * $Revision$
 * $Date$
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Feb 9, 2016
 *******************************************************************************/

public class Test {
	
	public static void main(String[] args) throws HttpException, IOException {
//		HttpClient client = new HttpClient();
//		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); 
//		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
//		NameValuePair[] data ={ new NameValuePair("Uid", "kevin_wang24"),new NameValuePair("Key", "d327485fee3095423a1b"),new NameValuePair("smsMob","15902170401"),new NameValuePair("smsText","新年快乐！！")};
//		post.setRequestBody(data);
//
//		client.executeMethod(post);
//		Header[] headers = post.getResponseHeaders();
//		int statusCode = post.getStatusCode();
//		System.out.println("statusCode:"+statusCode);
//		for(Header h : headers)
//		{
//		System.out.println(h.toString());
//		}
//		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
//		System.out.println(result);
//
//
//		post.releaseConnection();
		
		System.out.println(System.currentTimeMillis()/1000);
		
		String str = "40.0";
		
		int i = Double.valueOf(str).intValue();
		System.out.println(i);
		
		
	}

}

/*
 * 修改历史
 * $Log$ 
 */