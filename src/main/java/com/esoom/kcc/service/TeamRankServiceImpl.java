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
public class TeamRankServiceImpl implements TeamRankService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> teamRankHome(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamRankMapper.teamRankHome", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getTeamRank(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamRankMapper.getTeamRank", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamRankList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamRankMapper.teamRankList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamCategoryRankList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamRankMapper.teamCategoryRankList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> seasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		if("avg".equals(paramMap.get("season_gu").toString())) {
			 result =  (List<Map<String, Object>>) dao.getList("TeamRankMapper.seasonAvgList", paramMap);
		}else {
			 result =  (List<Map<String, Object>>) dao.getList("TeamRankMapper.seasonList", paramMap);
		}
		return result;
	}
	@Override
	public List<Map<String, Object>> seasonAvgList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamRankMapper.seasonAvgList", paramMap);
		return result;
	}
}
