package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface ClubService {
	public Map<String,Object> teamRankHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> kccadList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> selectSeasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String, Object>> playerRecordList(Map<?, ?> paramMap) throws Exception;
}
