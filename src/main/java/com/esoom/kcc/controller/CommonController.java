package com.esoom.kcc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.esoom.kcc.common.FileDown;
import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.service.AdminService;
import com.esoom.kcc.service.CommonService;
import com.google.gson.JsonObject;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Autowired
	private AdminService aService;
	@Autowired
	private CommonService commonService;


	@ResponseBody
	@RequestMapping(value = "fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();
						//로컬	
//						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/common/images/upload"); // 저장경로
						//개발	
						String uploadPath = "D:\\apache-tomcat-9.0.89\\upload"; // 저장경로
						System.out.println("uploadPath:" + uploadPath);

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdir();
						}
						String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
						String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
						String fileName2 = UUID.randomUUID() + extension; // 저장될 파일 명
						uploadPath = uploadPath + "/" + fileName2;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/common/images/upload/" + fileName2; // url경로
						System.out.println("fileUrl :" + fileUrl);
						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);
						System.out.println(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
	}
	
	 @RequestMapping(value = "fileupload.do/drag", produces = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public Object handleFileUpload(@RequestParam("upload") MultipartFile file) {

	        HashMap<String, Object> map = new HashMap<>();
	        try {
	             Map<String,Object> result = commonService.fileUpload(file);
	            
	            map.put("uploaded", 1);
	            map.put("url", result.get("url"));
	            map.put("fileName", result.get("fileName"));

	            return map;
	        } catch (Exception e) {
	            map.put("uploaded", 0);
	            map.put("error", "{'message': '" + e.getMessage() + "'}");
	            return map;
	        }     
	    }  
	@RequestMapping(value="/filedown")
	public void fileDownload(@RequestParam("fileName") String saveFileName,@RequestParam("fileNameOrg") String fileNameOrg,
			@RequestParam(value = "filePathTail",defaultValue = "")String filePathTail,
			HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String filePath = "";
		//로컬
//		filePath = "C:\\Users\\user\\kccEgis\\KccEgis\\src\\main\\webapp\\resources\\common\\images\\upload\\";
		//개발
		filePath = "D:\\apache-tomcat-9.0.89\\upload\\";
		if(!"".equals(filePathTail)) {
			filePath = filePath +filePathTail+ "\\";
		}
		try {
			FileDown fileDown = new FileDown();
			fileDown.fileDown(req, res, filePath, saveFileName, fileNameOrg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
