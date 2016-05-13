package com.pow.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.ws.rs.core.MultivaluedMap;

public class FileUploadUtis {

	public static String getFileName(MultivaluedMap<String, String> header) {
		 
		String[] contentDisposition = header.getFirst("Content-Disposition").split(";");
 
		for (String filename : contentDisposition) {
			if ((filename.trim().startsWith("filename"))) {
 
				String[] name = filename.split("=");
 
				String finalFileName = name[1].trim().replaceAll("\"", "");
				return finalFileName;
			}
		}
		return "unknown";
	}
 
	public static void writeFile(byte[] content, String filename) throws IOException {
 
		File file = new File(filename);
		File parent = file.getParentFile();
		if(!parent.exists()){
			parent.mkdirs();
		}
		if (!file.exists()) {
			file.createNewFile();
		}
 
		FileOutputStream fop = new FileOutputStream(file);
 
		fop.write(content);
		fop.flush();
		fop.close();
 
	}
}
