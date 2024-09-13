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
public class FanzoneServiceImpl implements FanzoneService {
	@Autowired
	private Dao dao;
	
	@Override
	public List<Map<String, Object>> noticeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.noticeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mypageFreeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.mypageFreeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> eventList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.eventList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> freeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.freeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> topNoticeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.topNoticeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> topFreeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.topFreeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> freeTailList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.freeTailList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> wallpaperList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("FanzoneMapper.wallpaperList", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getFreeDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("FanzoneMapper.getFreeDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> nextFreeDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("FanzoneMapper.nextFreeDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> prevFreeDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("FanzoneMapper.prevFreeDetail", paramMap);
		return result;
	}
	@Override
	public int getWallpaperListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("FanzoneMapper.getWallpaperListCount",paramMap);
	}
	@Override
	public int getNoticeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("FanzoneMapper.getNoticeListCount",paramMap);
	}
	@Override
	public int getEventListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("FanzoneMapper.getEventListCount",paramMap);
	}
	@Override
	public int getFreeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("FanzoneMapper.getFreeListCount",paramMap);
	}
	@Override
	public int visitedUpdate(Map<?, ?> paramMap) throws Exception{
		return dao.update("FanzoneMapper.visitedUpdate",paramMap);
	}
	@Override
	public int getFreeTailListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("FanzoneMapper.getFreeTailListCount",paramMap);
	}
	@Override
	public int contentWrite(Map<?, ?> paramMap) throws Exception{
		return dao.insert("FanzoneMapper.contentWrite",paramMap);
	}
	@Override
	public int contentDelete(Map<?, ?> paramMap) throws Exception{
		return dao.delete("FanzoneMapper.contentDelete",paramMap);
	}
	@Override
	public int mergeFree(Map<String, Object> paramMap) throws Exception {
		return dao.update("FanzoneMapper.mergeFree", paramMap);
	}
	@Override
	public int freeDelete(Map<String, Object> paramMap) throws Exception {
		return dao.update("FanzoneMapper.freeDelete", paramMap);
	}
}
