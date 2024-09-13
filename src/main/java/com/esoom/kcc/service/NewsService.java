package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface NewsService {
	public List<Map<String,Object>> newsHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mediaUHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mediaSHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> photoHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> getPlayerMediaList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerMediaList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mypageMovieList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mypageNoticeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> searchKeywordList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> gameList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> newsList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> movieList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> tailList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> footMovieList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> photoList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> photoChildList(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getRoundDate(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> gameSchedule(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> topMovie(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getDetail(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getDetail2(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> nextDetail(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> prevDetail(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getDateDetail(Map<?, ?> paramMap) throws Exception;
	
	public int getNewsListCount(Map<?, ?> paramMap);
	
	public int getMovieListCount(Map<?, ?> paramMap);
	
	public int getTailListCount(Map<?, ?> paramMap);
	
	public int getPhotoListCount(Map<?, ?> paramMap);
	
	public int contentWrite(Map<?, ?> paramMap) throws Exception;
	
	public int visitedUpdate(Map<?, ?> paramMap) throws Exception;
	
	public int contentDelete(Map<?, ?> paramMap) throws Exception;
}
