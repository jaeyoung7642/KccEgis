package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.esoom.kcc.common.PageInfo;


public interface CommonService {
	public String filesave(MultipartFile file) throws Exception;
	public String filesave(MultipartFile file,String filePathTail) throws Exception;
	public Map<String,Object> fileUpload(MultipartFile file,String filePathTail) throws Exception;
	public Map<String,Object> fileUpload(MultipartFile file) throws Exception;
	
	public String HtmlUnescape(String str) throws Exception;
	
	public String getRandomPassword(int length) throws Exception;
	
}
