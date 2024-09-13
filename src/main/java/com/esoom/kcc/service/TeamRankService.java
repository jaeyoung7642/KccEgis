package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface TeamRankService {
	public Map<String,Object> teamRankHome(Map<?, ?> paramMap) throws Exception;

	public Map<String,Object> getTeamRank(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> teamRankList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> teamCategoryRankList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> seasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> seasonAvgList(Map<?, ?> paramMap) throws Exception;
}
