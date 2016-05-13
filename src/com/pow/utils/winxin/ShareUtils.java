
package com.pow.utils.winxin;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.UUID;

public class ShareUtils {

	public static String getNoncestr() {
		return UUID.randomUUID().toString();
	}

	public static String getTimestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	public static String getSignature(String nonceStr, String timestamp,String jdApiTicket,String url){
		
		String signature = "";
		String string1 = "jsapi_ticket=" + jdApiTicket +
                "&noncestr=" + nonceStr +
                "&timestamp=" + timestamp +
                "&url=" + url;
	
	      try
	      {
	          MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	          crypt.reset();
	          crypt.update(string1.getBytes("UTF-8"));
	          signature = byteToHex(crypt.digest());
	      }
	      catch (NoSuchAlgorithmException e)
	      {
	          e.printStackTrace();
	      }
	      catch (UnsupportedEncodingException e)
	      {
	          e.printStackTrace();
	      }
	      return signature;
		
		
	}

	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	// public static String SHA1(String decript) {
	// try {
	// MessageDigest digest = java.security.MessageDigest
	// .getInstance("SHA-1");
	// digest.update(decript.getBytes());
	// byte messageDigest[] = digest.digest();
	// // Create Hex String
	// StringBuffer hexString = new StringBuffer();
	// // 字节数组转换为 十六进制 数
	// for (int i = 0; i < messageDigest.length; i++) {
	// String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
	// if (shaHex.length() < 2) {
	// hexString.append(0);
	// }
	// hexString.append(shaHex);
	// }
	// return hexString.toString();
	//
	// } catch (NoSuchAlgorithmException e) {
	// e.printStackTrace();
	// }
	// return "";
	// }

}
