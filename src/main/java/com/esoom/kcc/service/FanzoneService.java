package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface FanzoneService {
	public List<Map<String,Object>> noticeList(Map<?, ?> paramMap) throws Exception;

	public List<Map<String,Object>> eventList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> freeList(Map<?, ?> paramMap) throws Exception;

	public List<Map<String,Object>> topNoticeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> topFreeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> freeTailList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> wallpaperList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mypageFreeList(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getFreeDetail(Map<?, ?> paramMap) throws Exception;

	public Map<String, Object> nextFreeDetail(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> prevFreeDetail(Map<?, ?> paramMap) throws Exception;
	
	public int getBeforeListCnt(Map<?, ?> paramMap);
	
	public int getWallpaperListCount(Map<?, ?> paramMap);
	
	public int getNoticeListCount(Map<?, ?> paramMap);
	
	public int getEventListCount(Map<?, ?> paramMap);
	
	public int getFreeListCount(Map<?, ?> paramMap);
	
	public int visitedUpdate(Map<?, ?> paramMap) throws Exception;

	public int getFreeTailListCount(Map<?, ?> paramMap);
	
	public int contentWrite(Map<?, ?> paramMap) throws Exception;
	
	public int contentDelete(Map<?, ?> paramMap) throws Exception;
	
	public int mergeFree(Map<String, Object> paramMap) throws Exception;
	
	public int freeDelete(Map<String, Object> paramMap) throws Exception;
}
