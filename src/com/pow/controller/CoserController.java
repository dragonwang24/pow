package com.pow.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.commons.io.IOUtils;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;

import com.pow.service.CoserService;
import com.pow.service.SignUpService;
import com.pow.utils.FileUploadUtis;
import com.pow.utils.SMSUtils;
import com.pow.utils.SpringBeanUtils;
import com.pow.vo.CoserVO;
import com.pow.vo.SignUpVO;
import com.primeton.components.rest.annotation.JSONParam;

@Path("/cosers")
public class CoserController {
	
	private CoserService  coserService = (CoserService)SpringBeanUtils.getBean("coserService");
	private SignUpService signUpService = (SignUpService)SpringBeanUtils.getBean("signUpService");

	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public CoserVO createCoser(@JSONParam("coser") CoserVO coserVO){
		coserVO.setCnId(UUID.randomUUID().toString());
		return coserService.createCoser(coserVO);
	}
	
	@POST
	@Path("/update2")
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateCoserTwo(@JSONParam("coser") CoserVO coserVO){
		coserService.updateCoserTwo(coserVO);
	}
	
	@POST
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	public void update(@JSONParam("coser") CoserVO coserVO){
		coserService.updateCoser(coserVO);
	}
	
	@POST
	@Path("/update3")
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateCoserThree(@JSONParam("coser") CoserVO coserVO){
		coserService.updateCoserThree(coserVO);
	}
	
	@POST
	@Path("/list")
	@Produces(MediaType.APPLICATION_JSON)
	public List<CoserVO> listCosers(){
		return coserService.queryAllCosers();
	}
	
	@POST
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public CoserVO getCoserById(@PathParam("id") String id){
		return coserService.queryOneCoser(id);
	}
	
	@POST
	@Path("/delete/{id}")
	public void deleteCoserById(@PathParam("id") String id){
		coserService.deleteCoser(id);
	}
	
	@POST
	@Path("/workses/delete")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> deleteWorks(String key){
		System.out.println(key);
		return new HashMap<String, String>();
	}
	
	@POST
	@Path("/upload")
	@Consumes("multipart/form-data;charset=UTF-8")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, Object> uploadFile(MultipartFormDataInput input,@Context HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		String fileRealPath = "";
		List<String> imagePaths = new ArrayList<String>();
		Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
		List<InputPart> inputParts = uploadForm.get("uploadedFile");
		if(inputParts != null){
			for (InputPart inputPart : inputParts) {
				try {
					inputPart.setMediaType(MediaType.TEXT_HTML_TYPE);
					MultivaluedMap<String, String> header = inputPart.getHeaders();
					String fileName = FileUploadUtis.getFileName(header);
					InputStream inputStream = inputPart.getBody(InputStream.class, null);
					byte[] bytes = IOUtils.toByteArray(inputStream);
					String relativePath = "images"+File.separator + "coserinfo_works"+File.separator+UUID.randomUUID().toString()+fileName.substring(fileName.indexOf("."));
					fileRealPath = request.getServletContext().getRealPath("/") + relativePath;
					System.out.println(fileRealPath);
					imagePaths.add(relativePath);
					FileUploadUtis.writeFile(bytes, fileRealPath);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			result.put("success", "true");
			result.put("imagePaths", imagePaths);
		}else{
			result.put("error", "Request has no files");
		}
		return result;
	}
	
	@POST
	@Path("/sendSecurityCode")
	@Consumes(MediaType.APPLICATION_JSON)
	public String sendSecurityCode(@JSONParam("phoneNum") String phoneNum){
		SMSUtils.sendSecurityCode(phoneNum);
		return "success";
	}
	
	@POST
	@Path("/checkSecurityCode")
	@Consumes(MediaType.APPLICATION_JSON)
	public String checkSecurityCode(@JSONParam("phoneNum") String phoneNum, @JSONParam("securityCode") String securityCode, @JSONParam("openid") String openid){
		if(SMSUtils.checkSecurityCode(phoneNum, securityCode)){
			CoserVO coser = new CoserVO();
			coser.setCnId(openid);
			coser.setPhoneNum(phoneNum);
			coserService.updateCoser(coser);
			return "true";
		}
		return "false";
	}
	
	@POST
	@Path("/signup/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public CoserVO signup(@PathParam("id") String id,@JSONParam("coserId") String coserId){
		SignUpVO signUpVO = new SignUpVO();
		signUpVO.setAnnouncementId(id);
		signUpVO.setCoserId(coserId);
		signUpService.insertSignUp(signUpVO);
		return coserService.queryOneCoser(coserId);
	}
}
