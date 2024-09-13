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
public class PlayerServiceImpl implements PlayerService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> prevTeamScheduleHome(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("TeamScheduleMapper.prevTeamScheduleHome", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getPlayer(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("PlayerMapper.getPlayer", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getPlayer2(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("PlayerMapper.getPlayer2", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getLikePlayerImg(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("PlayerMapper.getLikePlayerImg", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getPlayerSum(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("PlayerMapper.getPlayerSum", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getMvp(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("PlayerMapper.getMvp", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerTop(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerTop", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerRankList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerRankList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerRankListCategory(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerRankListCategory", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerRankListTop(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerRankListTop", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerRankHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerRankHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerBirthList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerBirthList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerDailyList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerDailyList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> footPlayerList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.footPlayerList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> prevSeasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.prevSeasonList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> seasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.seasonList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerSeasonList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerSeasonList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> roundPlayerList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.roundPlayerList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> coachList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.coachList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerAllList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerAllList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> selectYearMonthList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.selectYearMonthList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerYearMonthList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.playerYearMonthList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> seasonSearchList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		if("avg".equals(paramMap.get("category").toString())) {
			 result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.seasonSearchAvgList", paramMap);
		}else {
			 result =  (List<Map<String, Object>>) dao.getList("PlayerMapper.seasonSearchTotalList", paramMap);
		}
		return result;
	}
	@Override
	public Map<String, Object> playerRecordMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  new HashMap<String, Object>();
		if("avg".equals(paramMap.get("category").toString())) {
			 result =  (Map<String, Object>) dao.getMap("PlayerMapper.playerRecordAvgMap", paramMap);
		}else {
			 result =  (Map<String, Object>) dao.getMap("PlayerMapper.playerRecordTotalMap", paramMap);
		}
		return result;
	}
	@Override
	public Map<String, Object> playerTabRecordMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  new HashMap<String, Object>();
		if("avg".equals(paramMap.get("category").toString())) {
			result =  (Map<String, Object>) dao.getMap("PlayerMapper.playerTabRecordAvgMap", paramMap);
		}else {
			result =  (Map<String, Object>) dao.getMap("PlayerMapper.playerTabRecordTotalMap", paramMap);
		}
		return result;
	}
	@Override
	public int deleteLikePlayer(Map<String, Object> paramMap) throws Exception {
		return dao.delete("PlayerMapper.deleteLikePlayer", paramMap);
	}
	@Override
	public int updateLikePlayer(Map<String, Object> paramMap) throws Exception {
		return dao.update("PlayerMapper.updateLikePlayer", paramMap);
	}
}
