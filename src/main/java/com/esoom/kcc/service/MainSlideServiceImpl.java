package com.esoom.kcc.service;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.dao.Dao;

@Service
public class MainSlideServiceImpl implements MainSlideService {
	@Autowired
	private Dao dao;
	
	@Override
	public List<Map<String, Object>> mainSlideHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("MainSlideMapper.mainSlideHome", paramMap);
		return result;
	}
}
