package com.esoom.kcc.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.esoom.kcc.common.PageInfo;

@Repository
public class Dao {
	
	private static final Logger Log = LoggerFactory.getLogger(Dao.class);
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public int insert(String queryId, Map<?, ?> insertMap) throws Exception {
		int cnt = sqlsession.insert(queryId, insertMap );
		return cnt;
	}
	public int update(String queryId, Map<?, ?> updateMap) throws Exception {
		int cnt = sqlsession.update(queryId, updateMap );
		return cnt;
	}
	public int delete(String queryId, Map<?, ?> deleteMap) throws Exception {
		int cnt = sqlsession.delete(queryId, deleteMap );
		return cnt;
	}
	public Map<?, ?> getMap(String queryId, Map<?, ?> paramMap) throws Exception {
		Map<?,?> map = sqlsession.selectOne(queryId, paramMap); 
		if(map != null) {
			Log.debug("┌────────────────── "+queryId+" Result Map Start────────────────────────");
			Log.debug("│  "+map.toString());
			Log.debug("└────────────────── "+queryId+" Result Map End──────────────────────────");
		}
		return map;
	}
	public Collection<?> getList(String queryId, Map<?, ?> paramMap) throws Exception {
		Collection<?> collection = sqlsession.selectList(queryId, paramMap);
		Object[] rtnMap = collection.toArray();
		List list1 = new ArrayList();
		Log.debug("┌────────────────── "+queryId+" Result List Start────────────────────────");
		for(Object m:rtnMap){
			Map tempMap = (Map) m;

			Set keySet1 = tempMap.keySet();
			Iterator KeyIter = keySet1.iterator();

			while( KeyIter.hasNext()){
				String keyName = (String) KeyIter.next();

				Object value1 = tempMap.get(keyName);

				if ( value1 instanceof String ){

					String tempStr = ((String)value1).replace('','\'');
					tempStr = tempStr.replace('',',');

					tempMap.put(keyName, tempStr);
				}
			}

			list1.add(tempMap);

		}
		Log.debug("└────────────────── "+queryId+" Result List End──────────────────────────");

		return list1;
	}
	public Collection<?> getList(PageInfo pi,String queryId, Map<?, ?> paramMap) throws Exception {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Collection<?> collection = sqlsession.selectList(queryId, paramMap,rowBounds);
		Object[] rtnMap = collection.toArray();
		List list1 = new ArrayList();
		Log.debug("┌────────────────── "+queryId+" Result List Start────────────────────────");
		for(Object m:rtnMap){
			Map tempMap = (Map) m;

			Set keySet1 = tempMap.keySet();
			Iterator KeyIter = keySet1.iterator();

			while( KeyIter.hasNext()){
				String keyName = (String) KeyIter.next();

				Object value1 = tempMap.get(keyName);

				if ( value1 instanceof String ){

					String tempStr = ((String)value1).replace('','\'');
					tempStr = tempStr.replace('',',');

					tempMap.put(keyName, tempStr);
				}
			}

			list1.add(tempMap);

		}
		Log.debug("└────────────────── "+queryId+" Result List End──────────────────────────");

		return list1;
	}
	public int getListSearchCount(String queryId, Map<?, ?> paramMap){
		 return sqlsession.selectOne(queryId, paramMap);
	}
	public Map<String, Object> getUnReadCntOne(String queryId, Map<String, Object> paramMap){
		 return sqlsession.selectOne(queryId, paramMap);
	}
	
	public List<Map<String, Object>>adFindId(String queryId, Map<String, Object> paramMap){
		return sqlsession.selectList(queryId, paramMap);
	}
	public int updateProType (Map<String,Object> paramMap) {
		int result1= sqlsession.delete("MemberMapper.deleteProType", paramMap);
		int result2= sqlsession.update("MemberMapper.updateProType", paramMap);
		return result1+result2;
	}
	
}
