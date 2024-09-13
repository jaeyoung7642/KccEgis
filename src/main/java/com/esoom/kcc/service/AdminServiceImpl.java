package com.esoom.kcc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.dao.Dao;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private Dao dao;
	
	@Override
	public Map<String, Object> getAdmin(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.getAdmin", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> memberMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.memberMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> gScheduleDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.gScheduleDetail", paramMap);
		return result;
	}
	@Override
	public int changeChkDel(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.changeChkDel", paramMap);
	}
	@Override
	public int changeYn(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.changeYn", paramMap);
	}
	@Override
	public int changeUseYn(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.changeUseYn", paramMap);
	}
	@Override
	public int orderSave(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.orderSave", paramMap);
	}
	@Override
	public int bannerOrderSave(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.bannerOrderSave", paramMap);
	}
	@Override
	public int changePwd(Map<String, Object> paramMap)throws Exception {
		return dao.update("AdminMapper.changePwd", paramMap);
	}
	@Override
	public int mergeTeamDailyRank(Map<String, Object> paramMap)throws Exception {
		return dao.update("AdminMapper.mergeTeamDailyRank", paramMap);
	}
	@Override
	public int insertFreeTail(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertFreeTail", paramMap);
	}
	@Override
	public int insertEventTail(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertEventTail", paramMap);
	}
	@Override
	public int insertTeamSchedule(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertTeamSchedule", paramMap);
	}
	@Override
	public int insertTeamDailyList(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertTeamDailyList", paramMap);
	}
	@Override
	public int insertTeamDailyRank(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertTeamDailyRank", paramMap);
	}
	@Override
	public int insertTeamSum(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertTeamSum", paramMap);
	}
	@Override
	public int insertPlayerSum(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertPlayerSum", paramMap);
	}
	@Override
	public int insertTeamQuarterList(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertTeamQuarterList", paramMap);
	}
	@Override
	public int insertPlayerDailyList(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertPlayerDailyList", paramMap);
	}
	@Override
	public int insertSearchKeyword(Map<String, Object> paramMap) throws Exception {
		return dao.insert("AdminMapper.insertSearchKeyword", paramMap);
	}
	@Override
	public int deleteFreeTail(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteFreeTail", paramMap);
	}
	@Override
	public int deleteFree(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteFree", paramMap);
	}
	@Override
	public int deletePlayerSum(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deletePlayerSum", paramMap);
	}
	@Override
	public int deleteSearchKeyword(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteSearchKeyword", paramMap);
	}
	@Override
	public int deleteTeamSchedule(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTeamSchedule", paramMap);
	}
	@Override
	public int deletePlayerDailyList(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deletePlayerDailyList", paramMap);
	}
	@Override
	public int deleteTeamDailyRank(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTeamDailyRank", paramMap);
	}
	@Override
	public int deleteTeamSum(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTeamSum", paramMap);
	}
	@Override
	public int deleteTeamDailyList(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTeamDailyList", paramMap);
	}
	@Override
	public int deleteTeamQuarterList(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTeamQuarterList", paramMap);
	}
	@Override
	public int deleteMember(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteMember", paramMap);
	}
	
	@Override
	public int getRequestcListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getListCount",paramMap);
	}
	@Override
	public int getFreeTailListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getFreeTailListCount",paramMap);
	}
	@Override
	public int getEventTailListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getFreeTailListCount",paramMap);
	}
	@Override
	public int getUseynCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getUseynCount",paramMap);
	}
	@Override
	public int mainGoodsCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.mainGoodsCount",paramMap);
	}
	@Override
	public int mainChkCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.mainChkCount",paramMap);
	}
	@Override
	public int getFreeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getFreeListCount",paramMap);
	}
	@Override
	public int getNewsListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getNewsListCount",paramMap);
	}
	@Override
	public int getMovieListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getMovieListCount",paramMap);
	}
	@Override
	public int getMemberListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getMemberListCount",paramMap);
	}
	@Override
	public int getPhotoListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getPhotoListCount",paramMap);
	}
	@Override
	public int getTotalProposalListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalProposalListCount",paramMap);
	}
	@Override
	public int getTotalFreeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalFreeListCount",paramMap);
	}
	@Override
	public int getProposalListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getProposalListCount",paramMap);
	}
	@Override
	public int getNoticeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getNoticeListCount",paramMap);
	}
	@Override
	public int getTotalNoticeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalNoticeListCount",paramMap);
	}
	@Override
	public int getTotalNewsListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalNewsListCount",paramMap);
	}
	@Override
	public int getTotalWallpaperCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalWallpaperCount",paramMap);
	}
	@Override
	public int getWallpaperCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getWallpaperCount",paramMap);
	}
	@Override
	public int getTotalMemberListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalMemberListCount",paramMap);
	}
	@Override
	public int getTotalKccAdListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalKccAdListCount",paramMap);
	}
	@Override
	public int getTotalMainGoodsListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getTotalMainGoodsListCount",paramMap);
	}
	@Override
	public int getMainGoodsListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getMainGoodsListCount",paramMap);
	}
	@Override
	public int getEventListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getEventListCount",paramMap);
	}
	@Override
	public int getPopupListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getPopupListCount",paramMap);
	}
	@Override
	public int getCoachProfileListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getCoachProfileListCount",paramMap);
	}
	@Override
	public int getKccAdListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getKccAdListCount",paramMap);
	}
	@Override
	public int getMainsildeListCount(Map<?, ?> paramMap) {
		return dao.getListSearchCount("AdminMapper.getMainsildeListCount",paramMap);
	}
	@Override
	public List<Map<String, Object>> freeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.freeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> popupList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.popupList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> eventList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.eventList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> eventTailList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.eventTailList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> memberList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.memberList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> MovieList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.movieList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> newsList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.newsList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> searchKeywordList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.searchKeywordList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> gScheduleList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.gScheduleList", paramMap);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> stadiumList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.stadiumList", paramMap);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> teamList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.teamList", paramMap);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> quarterList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.quarterList", paramMap);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> playerDailyList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.playerDailyList", paramMap);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> DailyRankList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.DailyRankList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> coachProfileList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.coachProfileList", paramMap);
		return result;
	}
	@Override
	public int changeShow(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.changeShow", paramMap);
	}
	@Override
	public int updateTeamSchedule(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.updateTeamSchedule", paramMap);
	}
	@Override
	public int updateTeamScheduleOnair(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.updateTeamScheduleOnair", paramMap);
	}
	@Override
	public int updateTeamQuaterList(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.updateTeamQuaterList", paramMap);
	}
	@Override
	public int updateTeamDailyList(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.updateTeamDailyList", paramMap);
	}
	@Override
	public int updateState(Map<String, Object> paramMap) throws Exception{
		return dao.update("AdminMapper.updateState", paramMap);
	}
	@Override
	public Map<String, Object> pCoachProfile(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.pCoachProfile", paramMap);
		return result;
	}
	@Override
	public int playerMerge(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.playerMerge", paramMap);
	}
	@Override
	public int mergeWallpaper(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergeWallpaper", paramMap);
	}
	@Override
	public int mediaPhotoMerge(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mediaPhotoMerge", paramMap);
	}
	@Override
	public int mergePopup(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergePopup", paramMap);
	}
	@Override
	public int mergeMainSlide(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergeMainSlide", paramMap);
	}
	@Override
	public int mergeMainGoods(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergeMainGoods", paramMap);
	}
	@Override
	public int mergeKccAd(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergeKccAd", paramMap);
	}
	@Override
	public int mergeFree(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mergeFree", paramMap);
	}
	@Override
	public int mediaMerge(Map<String, Object> paramMap) throws Exception {
		return dao.update("AdminMapper.mediaMerge", paramMap);
	}
	@Override
	public int deleteNews(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteNews", paramMap);
	}
	@Override
	public int deleteWallpaper(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteWallpaper", paramMap);
	}
	@Override
	public int deleteTail(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteTail", paramMap);
	}
	@Override
	public int deleteMainSlide(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteMainSlide", paramMap);
	}
	@Override
	public int deleteMainGoods(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteMainGoods", paramMap);
	}
	@Override
	public int deleteKccAd(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deleteKccAd", paramMap);
	}
	@Override
	public int deletePopup(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deletePopup", paramMap);
	}
	@Override
	public int deletePlayer(Map<String, Object> paramMap) throws Exception {
		return dao.delete("AdminMapper.deletePlayer", paramMap);
	}
	@Override
	public Map<String, Object> pProfileCheck(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.pProfileCheck", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> pSupportstaffProfileList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.pSupportstaffProfileList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerProfileList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.playerProfileList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> newsList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.newsList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> playerList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.playerList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> newsPhotoList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.newsPhotoList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> photoList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.photoList2", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> topNoticeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.topNoticeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> topFreeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.topFreeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> cKccAdList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.cKccAdList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mainsildeList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.mainsildeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> mainGoodsList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.mainGoodsList", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> mediaMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.mediaMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> kccAdMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.kccAdMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> lastMediaMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.lastMediaMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> freeMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.freeMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> popupMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.popupMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> proposalDetail(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.proposalDetail", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> mainGoodsMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.mainGoodsMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> wallpaperMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.wallpaperMap", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> mainSlideMap(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.mainSlideMap", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> MovieList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		 List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.movieList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> photoList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.photoList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> noticeList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.noticeList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> freeList(PageInfo pi, Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList(pi,"AdminMapper.freeList", paramMap);
		return result;
	}
	@Override
	public Map<String, Object> getRoundDate(Map<?, ?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("AdminMapper.getRoundDate", paramMap); 
		return result;
	}
	@Override
	public List<Map<String, Object>> gameList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.gameList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> freeTailList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.freeTailList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> wallpaperList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.wallpaperList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> proposalList(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  (List<Map<String, Object>>) dao.getList("AdminMapper.proposalList", paramMap);
		return result;
	}
	@Override
	public List<Map<String, Object>> gameListPop(Map<?, ?> paramMap) throws Exception {
		List<Map<String, Object>> result =  new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> gameList =  (List<Map<String, Object>>) dao.getList("AdminMapper.gameList", paramMap);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				Map<String, Object> temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+" " + " vs" + m.get("away_team_name");
				}else {
					gameNm = dateformat+" " + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				result.add(temp);
			}
		}
		return result;
	}
}
