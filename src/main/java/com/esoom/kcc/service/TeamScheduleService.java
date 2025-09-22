package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface TeamScheduleService {
	public Map<String,Object> prevTeamScheduleHome(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> nextHomeSchedule(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> scheduleDetail(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> teamDailyMap(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamScheduleHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamScheduleHome2(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> selectDateList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> selectSeasonList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> scheduleList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> scheduleCalendar(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> quarterList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> roundList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamListPrev(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamListTotal(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamWlThreeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamDataList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamRecordList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> smsRelay(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> smsRelay2(Map<?, ?> paramMap) throws Exception;
	
	public int getScheduleListCount(Map<?, ?> paramMap);
	
	public int getWinLossCount(Map<?, ?> paramMap);
}
