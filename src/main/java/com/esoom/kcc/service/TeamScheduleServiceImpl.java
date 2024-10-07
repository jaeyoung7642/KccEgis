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
public class TeamScheduleServiceImpl implements TeamScheduleService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> prevTeamScheduleHome(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamScheduleMapper.prevTeamScheduleHome", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> scheduleDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamScheduleMapper.scheduleDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> teamDailyMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamScheduleMapper.teamDailyMap", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamScheduleHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamScheduleHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> selectDateList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.selectDateList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> selectSeasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.selectSeasonList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> scheduleList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.scheduleList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> scheduleCalendar(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.scheduleCalendar", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> quarterList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.quarterList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamListPrev(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamListPrev", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamListTotal(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamListTotal", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamWlThreeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamWlThreeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamDataList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamDataList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamRecordList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamRecordList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> smsRelay(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.smsRelay", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> smsRelay2(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.smsRelay2", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> roundList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		if("avg".equals(paramMap.get("round_gu").toString())) {
			 result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.roundAvgList", paramMap);
		}else {
			 result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.roundList", paramMap);
		}
		return result;
	}
	@Override
	public int getScheduleListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("TeamScheduleMapper.getScheduleListCount",paramMap);
	}
	@Override
	public int getWinLossCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("TeamScheduleMapper.getWinLossCount",paramMap);
	}
}
