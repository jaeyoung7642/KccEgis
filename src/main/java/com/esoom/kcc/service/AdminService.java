package com.esoom.kcc.service;

import java.util.List;
import java.util.Map;

import com.esoom.kcc.common.PageInfo;


public interface AdminService {
	public Map<String, Object> getAdmin(Map<?, ?> paramMap) throws Exception;
	
	public int getRequestcListCount(Map<?, ?> paramMap);
	
	public int getCoachProfileListCount(Map<?, ?> paramMap);
	
	public List<Map<String,Object>> gScheduleList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> gScheduleDetail(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> stadiumList(Map<?, ?> paramMap) throws Exception;

	public List<Map<String,Object>> teamList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> quarterList(Map<?, ?> paramMap) throws Exception;

	public List<Map<String,Object>> playerDailyList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> DailyRankList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> coachProfileList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerProfileList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> newsList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> newsList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> MovieList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> MovieList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> photoList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> photoList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> noticeList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> freeList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> freeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> popupList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> eventList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> eventTailList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mainGoodsList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> searchKeywordList(Map<?, ?> paramMap) throws Exception;
	
	public int getNewsListCount(Map<?, ?> paramMap);
	
	public int getMovieListCount(Map<?, ?> paramMap);
	
	public int getFreeTailListCount(Map<?, ?> paramMap);
	
	public int getEventTailListCount(Map<?, ?> paramMap);
	
	public int getPhotoListCount(Map<?, ?> paramMap);
	
	public int getMemberListCount(Map<?, ?> paramMap);
	
	public int getNoticeListCount(Map<?, ?> paramMap);
	
	public int getEventListCount(Map<?, ?> paramMap);
	
	public int getTotalNoticeListCount(Map<?, ?> paramMap);
	
	public int getTotalNewsListCount(Map<?, ?> paramMap);
	
	public int getTotalFreeListCount(Map<?, ?> paramMap);
	
	public int getTotalProposalListCount(Map<?, ?> paramMap);
	
	public int getProposalListCount(Map<?, ?> paramMap);
	
	public int getTotalWallpaperCount(Map<?, ?> paramMap);
	
	public int getWallpaperCount(Map<?, ?> paramMap);
	
	public int getTotalMemberListCount(Map<?, ?> paramMap);
	
	public int getTotalKccAdListCount(Map<?, ?> paramMap);
	
	public int getTotalMainGoodsListCount(Map<?, ?> paramMap);
	
	public int getMainGoodsListCount(Map<?, ?> paramMap);
	
	public int getFreeListCount(Map<?, ?> paramMap);
	
	public int getKccAdListCount(Map<?, ?> paramMap);
	
	public int getPopupListCount(Map<?, ?> paramMap);
	
	public int getMainsildeListCount(Map<?, ?> paramMap);
	
	public int getUseynCount(Map<?, ?> paramMap);
	
	public int mainGoodsCount(Map<?, ?> paramMap);
	
	public int changePwd(Map<String, Object> paramMap) throws Exception;
	
	public int mainChkCount(Map<?, ?> paramMap);
	
	public List<Map<String,Object>> pSupportstaffProfileList(PageInfo pi,Map<?, ?> paramMap) throws Exception;
	
	public int insertLoginInfo(Map<String, Object> paramMap) throws Exception;
	
	public int insertFreeTail(Map<String, Object> paramMap) throws Exception;
	
	public int insertTeamSchedule(Map<String, Object> paramMap) throws Exception;
	
	public int insertTeamDailyRank(Map<String, Object> paramMap) throws Exception;
	
	public int mergeTeamDailyRank(Map<String, Object> paramMap) throws Exception;
	
	public int insertTeamQuarterList(Map<String, Object> paramMap) throws Exception;
	
	public int insertTeamDailyList(Map<String, Object> paramMap) throws Exception;
	
	public int insertPlayerDailyList(Map<String, Object> paramMap) throws Exception;
	
	public int insertTeamSum(Map<String, Object> paramMap) throws Exception;
	
	public int insertPlayerSum(Map<String, Object> paramMap) throws Exception;
	
	public int insertEventTail(Map<String, Object> paramMap) throws Exception;
	
	public int insertSearchKeyword(Map<String, Object> paramMap) throws Exception;
	
	public int deleteSearchKeyword(Map<String, Object> paramMap) throws Exception;

	public int deleteNewsPhoto(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTeamSchedule(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTeamSum(Map<String, Object> paramMap) throws Exception;
	
	public int deletePlayerSum(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTeamDailyRank(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTeamDailyList(Map<String, Object> paramMap) throws Exception;
	
	public int deletePlayerDailyList(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTeamQuarterList(Map<String, Object> paramMap) throws Exception;
	
	public int deleteFree(Map<String, Object> paramMap) throws Exception;
	
	public int deleteFreeTail(Map<String, Object> paramMap) throws Exception;
	
	public int deleteTail(Map<String, Object> paramMap) throws Exception;
	
	public int deleteMember(Map<String, Object> paramMap) throws Exception;
	
	public int changeShow(Map<String, Object> paramMap) throws Exception;
	
	public int updateState(Map<String, Object> paramMap) throws Exception;
	
	public int updateTeamSchedule(Map<String, Object> paramMap) throws Exception;
	
	public int updateTeamScheduleOnair(Map<String, Object> paramMap) throws Exception;
	
	public int updateTeamQuaterList(Map<String, Object> paramMap) throws Exception;
	
	public int updateTeamDailyList(Map<String, Object> paramMap) throws Exception;
	
	public int changeChkDel(Map<String, Object> paramMap) throws Exception;
	
	public int changeYn(Map<String, Object> paramMap) throws Exception;
	
	public int changeUseYn(Map<String, Object> paramMap) throws Exception;
	
	public int orderSave(Map<String, Object> paramMap) throws Exception;
	
	public int bannerOrderSave(Map<String, Object> paramMap) throws Exception;
	
	public Map<String, Object> pCoachProfile(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> pProfileCheck(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> mediaMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> lastMediaMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> kccAdMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> popupMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getRoundDate(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> mainSlideMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> memberMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> mainGoodsMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> freeMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> wallpaperMap(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> proposalDetail(Map<?, ?> paramMap) throws Exception;
	
	public int mergeWallpaper(Map<String, Object> paramMap) throws Exception;
	
	public int playerMerge(Map<String, Object> paramMap) throws Exception;
	
	public int deleteWallpaper(Map<String, Object> paramMap) throws Exception;
	
	public int deletePlayer(Map<String, Object> paramMap) throws Exception;
	
	public int deleteNews(Map<String, Object> paramMap) throws Exception;
	
	public int deleteKccAd(Map<String, Object> paramMap) throws Exception;
	
	public int deletePopup(Map<String, Object> paramMap) throws Exception;
	
	public int deleteMainSlide(Map<String, Object> paramMap) throws Exception;
	
	public int deleteMainGoods(Map<String, Object> paramMap) throws Exception;
	
	public int mediaMerge(Map<String, Object> paramMap) throws Exception;
	
	public int mediaPhotoMerge(Map<String, Object> paramMap) throws Exception;
	
	public int mergePopup(Map<String, Object> paramMap) throws Exception;
	
	public int mergeMainSlide(Map<String, Object> paramMap) throws Exception;
	
	public int mergeMainGoods(Map<String, Object> paramMap) throws Exception;
	
	public int mergeKccAd(Map<String, Object> paramMap) throws Exception;
	
	public int mergeFree(Map<String, Object> paramMap) throws Exception;
	
	public List<Map<String,Object>> gameList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> newsPhotoList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> gameListPop(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> playerList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> topNoticeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> topFreeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> cKccAdList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> wallpaperList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> mainsildeList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> memberList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> freeTailList(Map<?, ?> paramMap) throws Exception;
	
	public List<Map<String,Object>> proposalList(Map<?, ?> paramMap) throws Exception;
	
}
