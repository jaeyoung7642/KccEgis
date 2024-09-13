package com.esoom.kcc.service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
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
public class ClubServiceImpl implements ClubService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> teamRankHome(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamRankMapper.teamRankHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> kccadList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("ClubMapper.kccadList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> selectSeasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("ClubMapper.selectSeasonList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerRecordList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("ClubMapper.playerRecordList", paramMap);
		return result;
	}
}
