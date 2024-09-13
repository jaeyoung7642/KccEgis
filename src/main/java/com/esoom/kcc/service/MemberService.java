package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface MemberService {
	public Map<String,Object> getMember(Map<?, ?> paramMap) throws Exception;

	public Map<String,Object> duplicateDi(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> findId(Map<?, ?> paramMap) throws Exception;
	
	public Map<String,Object> findPwd(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> teamAndteamRecordList(Map<?, ?> paramMap) throws Exception;
	
	public int duplicateMember(Map<?, ?> paramMap);
	
	public int insertMember(Map<?, ?> paramMap) throws Exception;
	
	public int updatePlayerNo(Map<?, ?> paramMap) throws Exception;
	
	public int updateMember(Map<?, ?> paramMap) throws Exception;
	
	public int deleteMember(Map<?, ?> paramMap) throws Exception;
	
	public int loginUpdate(Map<?, ?> paramMap) throws Exception;
	
}
