package com.pow.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.apache.commons.lang.StringUtils;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;

import com.pow.log.LoggerService;
import com.pow.service.AnnouncementService;
import com.pow.service.SignUpService;
import com.pow.utils.FileUploadUtis;
import com.pow.utils.SpringBeanUtils;
import com.pow.vo.AnnouncementVO;
import com.primeton.components.rest.annotation.JSONParam;

@Path("/announcements")
public class AnnouncementController {
	
	private AnnouncementService  announcementService = (AnnouncementService)SpringBeanUtils.getBean("announcementService");
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	public void createAnnouncement(@JSONParam("announcement") AnnouncementVO announcementVO){
		announcementService.createAnnouncement(announcementVO);
	}
	
	@POST
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateAnnouncement(@JSONParam("announcement") AnnouncementVO announcementVO){
		announcementService.updateAnnouncement(announcementVO);
	}
	
	@POST
	@Path("/list")
	@Produces(MediaType.APPLICATION_JSON)
	public List<AnnouncementVO> listAnnouncements(){
		return announcementService.queryAllAnnouncements();
	}
	
	@POST
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public AnnouncementVO getAnnouncementById(@PathParam("id") String id){
		return announcementService.queryOneAnnouncement(id);
	}
	
	@POST
	@Path("/delete/{id}")
	public void deleteAnnouncementById(@PathParam("id") String id){
		announcementService.deleteAnnouncement(id);
	}
	
	@POST
	@Path("/upload")
	@Consumes("multipart/form-data;charset=UTF-8")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> uploadFile(@Context HttpServletRequest request, MultipartFormDataInput input) {
		Map<String, String> result = new HashMap<String, String>();
		String fileRealPath = "";
		String relativePath = null;
		Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
		List<InputPart> dataParts = uploadForm.get("relativePath");
		if(dataParts != null && dataParts.size() > 0){
			try{
				relativePath = new String(IOUtils.toByteArray(dataParts.get(0).getBody(InputStream.class, null)));
			}catch(Exception e){
				LoggerService.getTraceLogger(getClass()).error(e.getMessage());
				e.printStackTrace();
			}
		}
		List<InputPart> inputParts = uploadForm.get("uploadedFile");
		if(inputParts != null){
			for (InputPart inputPart : inputParts) {
				try {
					inputPart.setMediaType(MediaType.TEXT_HTML_TYPE);
					MultivaluedMap<String, String> header = inputPart.getHeaders();
					String fileName = FileUploadUtis.getFileName(header);
					InputStream inputStream = inputPart.getBody(InputStream.class, null);
					byte[] bytes = IOUtils.toByteArray(inputStream);
					if(StringUtils.isBlank(relativePath)){
						relativePath = "images"+File.separator + System.currentTimeMillis()+"_"+fileName;
					}
					fileRealPath = request.getServletContext().getRealPath("/") + relativePath;
					System.out.println(fileRealPath);
					FileUploadUtis.writeFile(bytes, fileRealPath);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			result.put("success", "true");
			result.put("imagePath", relativePath);
		}else{
			result.put("error", "Request has no files");
		}
		return result;
	}
}
