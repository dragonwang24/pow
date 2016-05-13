
package com.pow.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.pow.service.CoserService;
import com.pow.utils.SpringBeanUtils;
import com.pow.utils.winxin.ShareUtils;
import com.pow.vo.CoserVO;
import com.primeton.components.rest.annotation.JSONParam;

@Path("/weixin")
public class WeiXinController {
	
	private CoserService  coserService = (CoserService)SpringBeanUtils.getBean("coserService");
	
	public static void main(String[] args) {
		//new WeiXinController().login("01147328d979ac6d9549cb5f32bd171W");
	}
	
	public Map<String, String> getAccessToken(String code){
		if(StringUtils.isBlank(code)){
			return null;
		}
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx7b1ac88a64498095&secret=2cf96a042c0b5a9002eb337711d2ce4f&grant_type=authorization_code&code=";
		return doGet(url+code);
	}
	
	public String getToken(){
		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx7b1ac88a64498095&secret=2cf96a042c0b5a9002eb337711d2ce4f";
		Map<String, String> result =  doGet(url);
		return result.get("access_token");
	}
	
	public String getJsApiTicket(String token){
		String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + token + "&type=jsapi";
		Map<String, String> result = doGet(url);
		if(result != null){
			return result.get("ticket");
		}
		return null;
		
	}
	
	@Path("/access_token")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> token(@JSONParam("code") String code){
		return getAccessToken(code);
	}
	
	@Path("/getjssdkconfig")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> getJSSDKConfig(@Context HttpServletRequest request,@JSONParam("url") String url){
		Map<String, String> result = new HashMap<String, String>();
		String noncestr = ShareUtils.getNoncestr();
		String timestamp = ShareUtils.getTimestamp();
		HttpSession session = request.getSession();
		String token = (String)session.getAttribute("access_token");
		if(StringUtils.isBlank(token)){
			token = getToken();
			session.setAttribute("access_token", token);
			
		}
		String jsApiTicket = (String)session.getAttribute("jsapi_ticket");
		if(StringUtils.isBlank(jsApiTicket)){
			jsApiTicket = getJsApiTicket(token);
			session.setAttribute("jsapi_ticket", jsApiTicket);
		}
		String signature = ShareUtils.getSignature(noncestr, timestamp, jsApiTicket, url);
		result.put("appid", "wx7b1ac88a64498095");
		result.put("noncestr", noncestr);
		result.put("timestamp", timestamp);
		result.put("signature", signature);
		result.put("ticket", jsApiTicket);
		result.put("token", token);
		return result;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Path("/getUserInfo/{openid}")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> getUserInfoByTokenAndOpenId(@Context HttpServletRequest request,@PathParam("openid") String openid){
		Map<String, String> result = (Map<String, String>)request.getSession().getAttribute("userInfo");
		CoserVO coserVO = coserService.queryOneCoser(openid);
		if(result == null){
			result = getUserInfo(coserVO.getWxAccessToken(), openid);
		}
		result.put("cnName", coserVO.getCnName());
		return result;
	}
	
	@Path("/login")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> login(@Context HttpServletRequest request, @JSONParam("code") String code){
		Map<String, String> result = new HashMap<String, String>();
		Map<String, String> map = getAccessToken(code);
		if(map == null){
			return null;
		}
		String accessToken = map.get("access_token");
		final String openid = map.get("openid");
		final String refreshToken = map.get("refresh_token");
		
		CoserVO coser = coserService.queryOneCoser(openid);
		
		HttpSession session = request.getSession();
		session.setAttribute("openid", openid);
		if(coser == null){
			coser = new CoserVO();
			coser.setCnId(openid);
			coser.setWxAccessToken(accessToken);
			coser.setWxRefreshToken(refreshToken);
			new Timer().schedule(new TimerTask() {
				@Override
				public void run() {
					refreshAccessToken(refreshToken,openid);
				}
			},7000,7000);
			coserService.createCoser(coser);
		}else{
			coser.setWxAccessToken(accessToken);
			coser.setWxRefreshToken(refreshToken);
			coserService.updateCoser(coser);
		}
		result = getUserInfo(accessToken,openid);
		session.setAttribute("userInfo", result);
		if(StringUtils.isNotBlank(coser.getPhoneNum())){
			result.put("hasPhone", "true");
		}
		return result;
		
	}
	
	public void refreshAccessToken(String refreshToken,String openid){
		String url = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=wx7b1ac88a64498095&grant_type=refresh_token&refresh_token="+refreshToken;
		
		Map<String, String> result = doGet(url);
		String access_token = result.get("access_token");
		CoserVO coser = new CoserVO();
		coser.setCnId(openid);
		coser.setWxAccessToken(access_token);
		coserService.updateCoser(coser);
		
	}
	
	public Map<String, String> getUserInfo(String token, String openid){
		String url = "https://api.weixin.qq.com/sns/userinfo?lang=zh_CN&access_token="+token+"&openid="+openid;
		return doGet(url);
	}
	
	private Map<String, String> doGet(String url){
		HttpClient client = new HttpClient(); 
		GetMethod method = new GetMethod(url); 
		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		
		try {
			client.executeMethod(method);
			String response = method.getResponseBodyAsString();
//			System.out.println(response);
			Map<String, String> result = JSON.parseObject(response, new TypeReference<Map<String, String>>(){});
			return result;
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}

