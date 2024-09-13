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
public class NewsServiceImpl implements NewsService {
	@Autowired
	private Dao dao;
	
	@Override
	public List<Map<String, Object>> newsHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.newsHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mediaUHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.mediaUHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mediaSHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.mediaSHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> photoHome(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.photoHome", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> getPlayerMediaList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.getPlayerMediaList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerMediaList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.playerMediaList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mypageMovieList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.mypageMovieList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mypageNoticeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.mypageNoticeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> searchKeywordList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.searchKeywordList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> gameList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.gameList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.playerList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> newsList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.newsList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> movieList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.movieList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> tailList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.tailList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> footMovieList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.footMovieList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> photoList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.photoList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> photoChildList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("NewsMapper.photoChildList", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getRoundDate(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.getRoundDate", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> topMovie(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.topMovie", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.getDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getDetail2(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.getDetail2", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> nextDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.nextDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> prevDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.prevDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> gameSchedule(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.gameSchedule", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getDateDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("NewsMapper.getDateDetail", paramMap);
		return result;
	}
	@Override
	public int getNewsListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("NewsMapper.getNewsListCount",paramMap);
	}
	@Override
	public int getMovieListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("NewsMapper.getMovieListCount",paramMap);
	}
	@Override
	public int getTailListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("NewsMapper.getTailListCount",paramMap);
	}
	@Override
	public int getPhotoListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("NewsMapper.getPhotoListCount",paramMap);
	}
	@Override
	public int contentWrite(Map<?, ?> paramMap) throws Exception{
		return dao.insert("NewsMapper.contentWrite",paramMap);
	}
	@Override
	public int visitedUpdate(Map<?, ?> paramMap) throws Exception{
		return dao.update("NewsMapper.visitedUpdate",paramMap);
	}
	@Override
	public int contentDelete(Map<?, ?> paramMap) throws Exception{
		return dao.delete("NewsMapper.contentDelete",paramMap);
	}
}
