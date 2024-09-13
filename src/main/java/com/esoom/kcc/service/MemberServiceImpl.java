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
public class MemberServiceImpl implements MemberService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> getMember(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("MemberMapper.getMember", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> findId(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("MemberMapper.findId", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> findPwd(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("MemberMapper.findPwd", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> duplicateDi(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result =  (Map<String, Object>) dao.getMap("MemberMapper.duplicateDi", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> teamAndteamRecordList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("TeamScheduleMapper.teamAndteamRecordList", paramMap);
		return result;
	}
	@Override
	public int duplicateMember(Map<?, ?> paramMap) {
		return dao.getListSearchCount("MemberMapper.duplicateMember",paramMap);
	}
	@Override
	public int insertMember(Map<?, ?> paramMap) throws Exception{
		return dao.insert("MemberMapper.insertMember",paramMap);
	}
	@Override
	public int updatePlayerNo(Map<?, ?> paramMap) throws Exception{
		return dao.update("MemberMapper.updatePlayerNo",paramMap);
	}
	@Override
	public int updateMember(Map<?, ?> paramMap) throws Exception{
		return dao.update("MemberMapper.updateMember",paramMap);
	}
	@Override
	public int deleteMember(Map<?, ?> paramMap) throws Exception{
		return dao.update("MemberMapper.deleteMember",paramMap);
	}
	@Override
	public int loginUpdate(Map<?, ?> paramMap) throws Exception{
		return dao.update("MemberMapper.loginUpdate",paramMap);
	}
}
