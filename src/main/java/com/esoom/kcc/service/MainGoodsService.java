package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;


import com.esoom.kcc.common.PageInfo;


public interface MainGoodsService {
	public List<Map<String,Object>> mainGoodsBHome(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mainGoodsCHome(Map<?, ?> paramMap) throws Exception;
}
