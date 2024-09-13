package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface PlayerService {
	public Map<String,Object> prevTeamScheduleHome(Map<?, ?> paramMap) throws Exception;

	public Map<String,Object> getPlayer(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> getPlayer2(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> getPlayerSum(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> getMvp(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> playerRecordMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> playerTabRecordMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> getLikePlayerImg(Map<?, ?> paramMap) throws Exception;

	public List<Map<String, Object>> playerTop(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerRankHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerBirthList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerDailyList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerRankListTop(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerRankListCategory(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerRankList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerAllList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerSeasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> coachList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> prevSeasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> seasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> roundPlayerList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> seasonSearchList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> selectYearMonthList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerYearMonthList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> footPlayerList(Map<?, ?> paramMap) throws Exception;
	
	public int updateLikePlayer(Map<String, Object> paramMap) throws Exception;
	
	public int deleteLikePlayer(Map<String, Object> paramMap) throws Exception;
}
