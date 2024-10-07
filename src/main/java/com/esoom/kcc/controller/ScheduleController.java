package com.esoom.kcc.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.service.CommonService;
import com.esoom.kcc.service.PlayerService;
import com.esoom.kcc.service.TeamRankService;
import com.esoom.kcc.service.TeamScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ScheduleController {
	@Autowired
	private CommonService commonService;
	@Autowired
	private TeamRankService teamRankService;
	@Autowired
	private TeamScheduleService teamScheduleService;
	@Autowired
	private PlayerService playerService;
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	public ModelAndView schduleList(ModelAndView mv,
			@RequestParam(value = "season_code", defaultValue = "45") String season_code,
			@RequestParam(value = "season_month", defaultValue = "all") String season_month,
			@RequestParam(value = "game_code", defaultValue = "01") String game_code,
			@RequestParam(value = "round", defaultValue = "0") String round,
			@RequestParam(value = "ha", defaultValue = "1") String ha,
			@RequestParam(value = "page", required = false) Integer page)throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;

		// 한페이지당 보여줄 row
		int boardLimit = 27;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("season_month", season_month);
		paramMap.put("game_code", game_code);
		paramMap.put("round", round);
		paramMap.put("ha", ha);
		if(!"all".equals(season_month)) {
			paramMap.put("month", season_month.substring(4, 6));
		}
		//셀렉트 init
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			m.putAll(tempMap);
		}
		List<Map<String,Object>> selectDateList = teamScheduleService.selectDateList(paramMap);
		//이전경기
		Map<String,Object> prevTeamSchedule = teamScheduleService.prevTeamScheduleHome(paramMap);
		//예정경기 2개
		List<Map<String,Object>> teamScheduleList = teamScheduleService.teamScheduleHome(paramMap);
		if(teamScheduleList.size()==2) {//둘다있을때
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			Map<String,Object> currentMap = teamScheduleList.get(0);
			System.out.println("currentMap========================="+currentMap.toString());
			//홈팀최근전적
			paramMap2.put("season_code", "45");
			paramMap2.put("team_code", currentMap.get("home_team"));
			Map<String,Object> currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("home_team_wl_three", currentData.get("wl_three"));
			}
			paramMap2.put("away_code", currentMap.get("away_team"));

			//현재시즌 전적
			paramMap2.put("win_loss", "win");
			int winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win", winCnt);
			currentMap.put("away_team_loss", winCnt);
			paramMap2.put("win_loss", "loss");
			int lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss", lossCnt);
			currentMap.put("away_team_win", lossCnt);
			
			//지난시즌 전적
			paramMap2.put("season_code", "43");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_before", winCnt);
			currentMap.put("away_team_loss_before", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_before", lossCnt);
			currentMap.put("away_team_win_before", lossCnt);
			
			//역대전적
			paramMap2.put("season_code", "");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_total", winCnt);
			currentMap.put("away_team_loss_total", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_total", lossCnt);
			currentMap.put("away_team_win_total", lossCnt);
			
			//어웨이팀최근전적
			paramMap2.put("season_code", "45");
			paramMap2.put("team_code", currentMap.get("away_team"));
			currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("away_team_wl_three", currentData.get("wl_three"));
			}
			
			Map<String,Object> nextMap = teamScheduleList.get(1);
			mv.addObject("currentMap",currentMap);
			mv.addObject("nextMap",nextMap);
		}else if(teamScheduleList.size()==1) {//예정경기 1개
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			Map<String,Object> currentMap = teamScheduleList.get(0);
			//홈팀최근전적
			paramMap2.put("team_code", currentMap.get("home_team"));
			Map<String,Object> currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("home_team_wl_three", currentData.get("wl_three"));
			}
			paramMap2.put("away_code", currentMap.get("away_team"));

			//현재시즌 전적
			paramMap2.put("season_code", "45");
			paramMap2.put("win_loss", "win");
			int winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win", winCnt);
			currentMap.put("away_team_loss", winCnt);
			paramMap2.put("win_loss", "loss");
			int lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss", lossCnt);
			currentMap.put("away_team_win", lossCnt);
			
			//지난시즌 전적
			paramMap2.put("season_code", "43");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_before", winCnt);
			currentMap.put("away_team_loss_before", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_before", lossCnt);
			currentMap.put("away_team_win_before", lossCnt);
			
			//역대전적
			paramMap2.put("season_code", "");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_total", winCnt);
			currentMap.put("away_team_loss_total", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_total", lossCnt);
			currentMap.put("away_team_win_total", lossCnt);
			
			//어웨이팀최근전적
			paramMap2.put("team_code", currentMap.get("away_team"));
			currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("away_team_wl_three", currentData.get("wl_three"));
			}
			mv.addObject("currentMap",currentMap);
		}else {//예정 경기가 없을때
			
		}
		//이달의 생일선수
		List<Map<String,Object>> playerBirthList = playerService.playerBirthList(paramMap);
		//데이터
		int listCount = teamScheduleService.getScheduleListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> scheduleList = teamScheduleService.scheduleList(paramMap);
		
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("prevTeamSchedule",prevTeamSchedule);
		mv.addObject("selectSeasonList",selectSeasonList);
		mv.addObject("selectDateList",selectDateList);
		mv.addObject("playerBirthList",playerBirthList);
		mv.addObject("scheduleList",scheduleList);
		mv.addObject("teamScheduleListSize",teamScheduleList.size());
		mv.addObject("game_code",game_code);
		mv.addObject("season_code",season_code);
		mv.addObject("season_month",season_month);
		mv.addObject("round",round);
		mv.addObject("ha",ha);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("game/scheduleList");
		return mv;
	}
	@RequestMapping(value = "/scheduleCalendar", method = RequestMethod.GET)
	public ModelAndView scheduleCalendar(ModelAndView mv,
			@RequestParam(value = "selectYear",required = false) String selectYear,
			@RequestParam(value = "selectMonth",required = false) String selectMonth)throws Exception {
		// 현재 시스템의 Calendar 인스턴스 생성
        Calendar cal = Calendar.getInstance();
        
        selectYear = (selectYear != null) ? selectYear : String.valueOf(cal.get(Calendar.YEAR));
        selectMonth = (selectMonth != null) ? selectMonth : String.valueOf(cal.get(Calendar.MONTH)+1);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//이전경기
		Map<String,Object> prevTeamSchedule = teamScheduleService.prevTeamScheduleHome(paramMap);
		//예정경기 2개
		List<Map<String,Object>> teamScheduleList = teamScheduleService.teamScheduleHome(paramMap);
		if(teamScheduleList.size()==2) {//둘다있을때
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			Map<String,Object> currentMap = teamScheduleList.get(0);
			System.out.println("currentMap========================="+currentMap.toString());
			//홈팀최근전적
			paramMap2.put("season_code", "45");
			paramMap2.put("team_code", currentMap.get("home_team"));
			Map<String,Object> currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("home_team_wl_three", currentData.get("wl_three"));
			}
			paramMap2.put("away_code", currentMap.get("away_team"));
			
			//현재시즌 전적
			paramMap2.put("win_loss", "win");
			int winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win", winCnt);
			currentMap.put("away_team_loss", winCnt);
			paramMap2.put("win_loss", "loss");
			int lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss", lossCnt);
			currentMap.put("away_team_win", lossCnt);
			
			//지난시즌 전적
			paramMap2.put("season_code", "43");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_before", winCnt);
			currentMap.put("away_team_loss_before", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_before", lossCnt);
			currentMap.put("away_team_win_before", lossCnt);
			
			//역대전적
			paramMap2.put("season_code", "");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_total", winCnt);
			currentMap.put("away_team_loss_total", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_total", lossCnt);
			currentMap.put("away_team_win_total", lossCnt);
			
			//어웨이팀최근전적
			paramMap2.put("season_code", "45");
			paramMap2.put("team_code", currentMap.get("away_team"));
			currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("away_team_wl_three", currentData.get("wl_three"));
			}
			
			Map<String,Object> nextMap = teamScheduleList.get(1);
			mv.addObject("currentMap",currentMap);
			mv.addObject("nextMap",nextMap);
		}else if(teamScheduleList.size()==1) {//예정경기 1개
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			Map<String,Object> currentMap = teamScheduleList.get(0);
			//홈팀최근전적
			paramMap2.put("team_code", currentMap.get("home_team"));
			Map<String,Object> currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("home_team_wl_three", currentData.get("wl_three"));
			}
			paramMap2.put("away_code", currentMap.get("away_team"));
			
			//현재시즌 전적
			paramMap2.put("season_code", "45");
			paramMap2.put("win_loss", "win");
			int winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win", winCnt);
			currentMap.put("away_team_loss", winCnt);
			paramMap2.put("win_loss", "loss");
			int lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss", lossCnt);
			currentMap.put("away_team_win", lossCnt);
			
			//지난시즌 전적
			paramMap2.put("season_code", "43");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_before", winCnt);
			currentMap.put("away_team_loss_before", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_before", lossCnt);
			currentMap.put("away_team_win_before", lossCnt);
			
			//역대전적
			paramMap2.put("season_code", "");
			paramMap2.put("win_loss", "win");
			winCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_win_total", winCnt);
			currentMap.put("away_team_loss_total", winCnt);
			paramMap2.put("win_loss", "loss");
			lossCnt = teamScheduleService.getWinLossCount(paramMap2);
			currentMap.put("home_team_loss_total", lossCnt);
			currentMap.put("away_team_win_total", lossCnt);
			
			//어웨이팀최근전적
			paramMap2.put("team_code", currentMap.get("away_team"));
			currentData = teamRankService.getTeamRank(paramMap2);
			if(currentData != null) {
				currentMap.put("away_team_wl_three", currentData.get("wl_three"));
			}
			mv.addObject("currentMap",currentMap);
		}else {//예정 경기가 없을때
			
		}
		//이달의 생일선수
		paramMap.put("month", selectMonth);
		List<Map<String,Object>> playerBirthList = playerService.playerBirthList(paramMap);
		
		//전월, 다음월
		int preYaer = Integer.parseInt(selectYear)-1;
		int preMonth = Integer.parseInt(selectMonth)-1;
		int nextYaer = Integer.parseInt(selectYear)+1;
		int nextMonth = Integer.parseInt(selectMonth)+1;
		int minYear = 2001;
		int maxYear = cal.get(Calendar.YEAR)+1;
		
		//데이터
		paramMap.put("season_month", selectYear+(Integer.parseInt(selectMonth)<10?"0"+selectMonth:selectMonth));
		List<Map<String,Object>> scheduleList = teamScheduleService.scheduleCalendar(paramMap);
		
		//달력만들기
		cal.set(Integer.parseInt(selectYear), Integer.parseInt(selectMonth)-1, 1);
		int startDay = cal.get(Calendar.DAY_OF_WEEK); 
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<Map<String,Object>> calendar = new ArrayList<Map<String,Object>>();
		for(int i=1;i<=endDay;i++) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("day", i);
			tempMap.put("day_of_week", cal.get(Calendar.DAY_OF_WEEK));
			for(Map m:scheduleList) {	
				if(i==Integer.parseInt(m.get("game_date_dd").toString())) {
					tempMap.putAll(m);
				}
			}
			calendar.add(tempMap);
			cal.add(Calendar.DATE, 1);
		}
		cal.set(Integer.parseInt(selectYear), Integer.parseInt(selectMonth)-1, endDay);
		int endDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		mv.addObject("prevTeamSchedule",prevTeamSchedule);
		mv.addObject("playerBirthList",playerBirthList);
		mv.addObject("calendar",calendar);
//		mv.addObject("scheduleList",scheduleList);
		mv.addObject("teamScheduleListSize",teamScheduleList.size());
		mv.addObject("selectYear",selectYear);
		mv.addObject("selectMonth",selectMonth);
		mv.addObject("preYaer",preYaer);
		mv.addObject("preMonth",preMonth);
		mv.addObject("nextYaer",nextYaer);
		mv.addObject("nextMonth",nextMonth);
		mv.addObject("maxYear",maxYear);
		mv.addObject("minYear",minYear);
		mv.addObject("startDay",startDay);
		mv.addObject("endDay",endDay);
		mv.addObject("endDayOfWeek",endDayOfWeek);
		mv.addObject("selectMonth",selectMonth);
		mv.setViewName("game/scheduleCalendar");
		return mv;
	}
	@RequestMapping(value = "/scheduleResult", method = RequestMethod.GET)
	public ModelAndView scheduleResult(ModelAndView mv,
			@RequestParam(value = "season_code") String season_code,
			@RequestParam(value = "game_code") String game_code,
			@RequestParam(value = "game_no") String game_no)throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("game_no", game_no);
		Map<String, Object> scheduleDetail = teamScheduleService.scheduleDetail(paramMap);
		resultMap.putAll(scheduleDetail);
		String home_team = scheduleDetail.get("home_team").toString();
		String away_team = scheduleDetail.get("away_team").toString();
		
		//mvp
		Map<String, Object> mvp = playerService.getMvp(paramMap);
		String pl_no = mvp.get("player_no").toString();
		paramMap.put("pl_no", pl_no);
		Map<String,Object> mvpImgMap = playerService.getPlayer2(paramMap);
		if(mvpImgMap != null) {
			mvp.put("pl_webdetail", mvpImgMap.get("pl_webdetail"));
		}
		//선수기록 셋팅
		Map<String, Object> kccParam = new HashMap<String, Object>();
		Map<String, Object> otherParam = new HashMap<String, Object>();
		kccParam.put("season_code", season_code);
		kccParam.put("game_code", game_code);
		kccParam.put("game_no", game_no);
		otherParam.put("season_code", season_code);
		otherParam.put("game_code", game_code);
		otherParam.put("game_no", game_no);
		if("60".equals(home_team)) {
			kccParam.put("team_code", home_team);
			otherParam.put("team_code", away_team);
		}else {
			kccParam.put("team_code", away_team);
			otherParam.put("team_code", home_team);
		}
		//팀기록 
		Map<String,Object> kccTeam = teamScheduleService.teamDailyMap(kccParam);
		Map<String,Object> otherTeam = teamScheduleService.teamDailyMap(otherParam);
		resultMap.put("kccTeam", kccTeam);
		resultMap.put("otherTeam", otherTeam);
		List<Map<String, Object>> kccTeamList = playerService.playerDailyList(kccParam);
		List<Map<String, Object>> otherTeamList = playerService.playerDailyList(otherParam);
		mv.addObject("kccTeamList", kccTeamList);
		mv.addObject("otherTeamList", otherTeamList);
		//top기록
		List<Map<String, Object>> topList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> kccTop = playerService.playerTop(kccParam);
		List<Map<String, Object>> otherTop = playerService.playerTop(otherParam);
		for(Map m:kccTop) {
			String player_no = m.get("player_no").toString();
			kccParam.put("pl_no", player_no);
			Map<String,Object> imgMap = playerService.getPlayer2(kccParam);
			if(imgMap != null) {
				m.put("pl_webdetail", imgMap.get("pl_webdetail"));
			}
		}
		for(int i=0;i<kccTop.size();i++) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("kccTop", kccTop.get(i));
			tempMap.put("otherTop", otherTop.get(i));
			if(i==0) {
				double kccScore = Double.parseDouble(kccTop.get(i).get("score").toString());
				double otherScore = Double.parseDouble(otherTop.get(i).get("score").toString());
				if(kccScore<otherScore) {
					double result = Math.round(kccScore/otherScore*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", result);
					tempMap.put("otherRatio", "100");
				}else if(kccScore>otherScore) {
					double result = Math.round(otherScore/kccScore*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", result);
				}else {
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", "100");	
				}
				tempMap.put("part", "득점");
				tempMap.put("kccData", kccTop.get(i).get("score")+"점");
				tempMap.put("otherData", otherTop.get(i).get("score")+"점");
			}
			if(i==1) {
				double kccRebound = Double.parseDouble(kccTop.get(i).get("r_tot").toString());
				double otherRebound = Double.parseDouble(otherTop.get(i).get("r_tot").toString());
				if(kccRebound<otherRebound) {
					double result = Math.round(kccRebound/otherRebound*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", result);
					tempMap.put("otherRatio", "100");
				}else if(kccRebound>otherRebound) {
					double result = Math.round(otherRebound/kccRebound*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", result);
				}else {
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", "100");	
				}
				tempMap.put("part", "리바운드");
				tempMap.put("kccData", kccTop.get(i).get("r_tot")+"개");
				tempMap.put("otherData", otherTop.get(i).get("r_tot")+"개");
			}
			if(i==2) {
				double kccAssist = Double.parseDouble(kccTop.get(i).get("a_s").toString());
				double otherAssist = Double.parseDouble(otherTop.get(i).get("a_s").toString());
				if(kccAssist<otherAssist) {
					double result = Math.round(kccAssist/otherAssist*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", result);
					tempMap.put("otherRatio", "100");
				}else if(kccAssist>otherAssist) {
					double result = Math.round(otherAssist/kccAssist*100 * 1000.0) / 1000.0;
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", result);
				}else {
					tempMap.put("kccRatio", "100");
					tempMap.put("otherRatio", "100");	
				}
				tempMap.put("part", "어시스트");
				tempMap.put("kccData", kccTop.get(i).get("a_s")+"개");
				tempMap.put("otherData", otherTop.get(i).get("a_s")+"개");
			}
			topList.add(tempMap);
		}
		
		//쿼터셋팅
		List<Map<String, Object>> quarterList = teamScheduleService.quarterList(paramMap);
		Map<String, Object> homeTeamMap = new HashMap<String, Object>();
		Map<String, Object> awayTeamMap = new HashMap<String, Object>();
		int home_total = 0;
		int away_total = 0;
		int h_EQ = 0;
		int a_EQ = 0;
		if(quarterList != null && quarterList.size()>0) {
			for(Map m:quarterList) {
				String home_away = m.get("home_away").toString();
				String quarter_gu = m.get("quarter_gu").toString();
				int score = Integer.parseInt(m.get("score").toString());
				if("1".equals(home_away)) {
					home_total += score;
					switch(quarter_gu) {
						case "Q1":
							homeTeamMap.put("Q1", m.get("score"));
							break;
						case "Q2":
							homeTeamMap.put("Q2", m.get("score"));
							break;
						case "Q3":
							homeTeamMap.put("Q3", m.get("score"));
							break;
						case "Q4":
							homeTeamMap.put("Q4", m.get("score"));
							break;
						default:
							h_EQ += Integer.parseInt(m.get("score").toString());
							break;
					}
				}else {
					away_total += score;
					switch(quarter_gu) {
						case "Q1":
							awayTeamMap.put("Q1", m.get("score"));
							break;
						case "Q2":
							awayTeamMap.put("Q2", m.get("score"));
							break;
						case "Q3":
							awayTeamMap.put("Q3", m.get("score"));
							break;
						case "Q4":
							awayTeamMap.put("Q4", m.get("score"));
							break;
						default:
							a_EQ += Integer.parseInt(m.get("score").toString());
							break;
					}
				}
			}
		}
		homeTeamMap.put("home_total", home_total);
		homeTeamMap.put("EQ", h_EQ);
		awayTeamMap.put("away_total", away_total);
		awayTeamMap.put("EQ", a_EQ);
		//없을때 0점처리
		if(!homeTeamMap.containsKey("Q1")) {
			homeTeamMap.put("Q1", "0");
		}
		if(!homeTeamMap.containsKey("Q2")) {
			homeTeamMap.put("Q2", "0");
		}
		if(!homeTeamMap.containsKey("Q3")) {
			homeTeamMap.put("Q3", "0");
		}
		if(!homeTeamMap.containsKey("Q4")) {
			homeTeamMap.put("Q4", "0");
		}
		if(!awayTeamMap.containsKey("Q1")) {
			awayTeamMap.put("Q1", "0");
		}
		if(!awayTeamMap.containsKey("Q2")) {
			awayTeamMap.put("Q2", "0");
		}
		if(!awayTeamMap.containsKey("Q3")) {
			awayTeamMap.put("Q3", "0");
		}
		if(!awayTeamMap.containsKey("Q4")) {
			awayTeamMap.put("Q4", "0");
		}
		resultMap.put("homeTeam", homeTeamMap);
		resultMap.put("awayTeam", awayTeamMap);
		resultMap.put("mvp", mvp);
		
		//문자중계
		List<Map<String, Object>> smsRelay = teamScheduleService.smsRelay(paramMap);
		mv.addObject("smsRelay", smsRelay);
		//문자중계 연장
		List<Map<String, Object>> smsRelay2 = teamScheduleService.smsRelay2(paramMap);
		mv.addObject("smsRelay2", smsRelay2);
		
		mv.addObject("result", resultMap);
		mv.addObject("topList", topList);
		mv.addObject("season_code", season_code);
		mv.addObject("game_code", game_code);
		mv.addObject("game_no", game_no);
		mv.setViewName("game/scheduleResult");
		return mv;
	}
	@RequestMapping(value = "/teamRank", method = RequestMethod.GET)
	public ModelAndView teamRank(ModelAndView mv,
			@RequestParam(value = "season_code", defaultValue = "45") String season_code)throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//셀렉트 init
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			if(season_code.equals(m.get("season_code").toString())) {
				mv.addObject("seasonCodeNm", m.get("season_name_1"));
			}
			m.putAll(tempMap);
		}
		paramMap.put("season_code", season_code);
		List<Map<String,Object>> teamRankList = teamRankService.teamRankList(paramMap);
		List<Map<String,Object>> teamCategoryRankList = teamRankService.teamCategoryRankList(paramMap);
		
		mv.addObject("selectSeasonList", selectSeasonList);
		mv.addObject("teamCategoryRankList", teamCategoryRankList);
		mv.addObject("teamRankList", teamRankList);
		mv.addObject("season_code", season_code);
		mv.setViewName("game/teamRanking");
		return mv;
	}
	@RequestMapping(value = "/playerRank", method = RequestMethod.GET)
	public ModelAndView playerRank(ModelAndView mv,
			@RequestParam(value = "season_code", defaultValue = "45") String season_code,
			@RequestParam(value = "game_code", defaultValue = "01") String game_code,
			@RequestParam(value = "category", defaultValue = "point") String category)throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("category", category);
		
		//셀렉트 init
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			m.putAll(tempMap);
		}
		List<Map<String, Object>> playerRankListTop = playerService.playerRankListTop(paramMap);
		List<Map<String, Object>> pointRankList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> reboundRankList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> assistRankList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> stealRankList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> blockRankList = new ArrayList<Map<String,Object>>();
		for(Map m: playerRankListTop) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			String player_no = m.get("player_no").toString();
			tempMap.put("player_no", player_no);
			List<Map<String, Object>> playerRankListCategory = playerService.playerRankListCategory(tempMap);
			if(playerRankListCategory.size()>0) {
				m.put("pointRk", playerRankListCategory.get(0).get("rn"));
				m.put("reboundRk", playerRankListCategory.get(1).get("rn"));
				m.put("assistRk", playerRankListCategory.get(2).get("rn"));
				m.put("stealRk", playerRankListCategory.get(3).get("rn"));
				m.put("blockRk", playerRankListCategory.get(4).get("rn"));
				if("POINT".equals(m.get("cate"))) {
					pointRankList.add(m);
				}
				if("REBOUND".equals(m.get("cate"))) {
					reboundRankList.add(m);
				}
				if("ASSIST".equals(m.get("cate"))) {
					assistRankList.add(m);
				}
				if("STEAL".equals(m.get("cate"))) {
					stealRankList.add(m);
				}
				if("BLOCK".equals(m.get("cate"))) {
					blockRankList.add(m);
				}
			}
		}
		
		//data
		List<Map<String, Object>> playerRankList = playerService.playerRankList(paramMap);
		
		mv.addObject("selectSeasonList", selectSeasonList);
		mv.addObject("pointRankList", pointRankList);
		mv.addObject("reboundRankList", reboundRankList);
		mv.addObject("assistRankList", assistRankList);
		mv.addObject("stealRankList", stealRankList);
		mv.addObject("blockRankList", blockRankList);
		mv.addObject("playerRankList", playerRankList);
		mv.addObject("season_code", season_code);
		mv.addObject("game_code", game_code);
		mv.addObject("category", category);
		mv.setViewName("game/playerRanking");
		return mv;
	}
	@RequestMapping(value = "/playerRecord", method = RequestMethod.GET)
	public ModelAndView playerRecord(ModelAndView mv,
			@RequestParam(value = "player_no", defaultValue ="290788") String player_no,
			@RequestParam(value = "game_round", defaultValue ="1") String game_round,
			@RequestParam(value = "game_code", defaultValue ="01") String game_code,
			@RequestParam(value = "season_code", defaultValue ="45") String season_code,
			@RequestParam(value = "category", defaultValue ="avg") String category,
			@RequestParam(value = "str", defaultValue ="pl_back") String str,
			@RequestParam(value = "sort", defaultValue ="ASC") String sort)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("pl_no", player_no);
		paramMap.put("game_round", game_round);
		Map<String,Object> playerMap = playerService.getPlayer(paramMap);
		Map<String, Object> playerRank = new HashMap<String, Object>();
		List<Map<String, Object>> playerRankListCategory = playerService.playerRankListCategory(paramMap);
		if(playerRankListCategory.size()>0) {
			playerRank.put("pointRk", playerRankListCategory.get(0).get("rn"));
			playerRank.put("reboundRk", playerRankListCategory.get(1).get("rn"));
			playerRank.put("assistRk", playerRankListCategory.get(2).get("rn"));
			playerRank.put("stealRk", playerRankListCategory.get(3).get("rn"));
			playerRank.put("blockRk", playerRankListCategory.get(4).get("rn"));
		}else {
			playerRank.put("pointRk", "-");
			playerRank.put("reboundRk", "-");
			playerRank.put("assistRk", "-");
			playerRank.put("stealRk", "-");
			playerRank.put("blockRk", "-");
		}
		//init 선수목록
		List<Map<String, Object>> playerList = playerService.playerList(paramMap);
		for(Map m: playerList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("playerCode", m.get("pl_no"));
			tempMap.put("playerCodeNm", m.get("pl_name"));
			m.putAll(tempMap);
		}
		//작년시즌
		List<Map<String, Object>> prevSeasonList = playerService.prevSeasonList(paramMap);
		if(prevSeasonList.size()>0) {
			mv.addObject("prevSeason", prevSeasonList.get(0));
		}
		//올시즌
		List<Map<String, Object>> currentSeasonList = playerService.seasonList(paramMap);
		if(currentSeasonList.size()>0) {
			mv.addObject("currentSeason", currentSeasonList.get(0));
		}
		//라운드
		List<Map<String, Object>> roundPlayerList = playerService.roundPlayerList(paramMap);
	    //시즌별선수기록
		//init
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("category", category);
		paramMap.put("str", str);
		paramMap.put("sort", sort);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			m.putAll(tempMap);
		}
		List<Map<String,Object>> seasonSearchList = playerService.seasonSearchList(paramMap);
		mv.addObject("seasonSearchList", seasonSearchList);
		mv.addObject("roundPlayerList", roundPlayerList);
		mv.addObject("selectSeasonList", selectSeasonList);
		mv.addObject("playerList", playerList);
		mv.addObject("playerRank", playerRank);
		mv.addObject("playerMap", playerMap);
		mv.addObject("player_no", player_no);
		mv.addObject("game_round", game_round);
		mv.addObject("season_code", season_code);
		mv.addObject("game_code", game_code);
		mv.addObject("category", category);
		mv.addObject("prevSeasonList",prevSeasonList);
		mv.addObject("currentSeasonList",currentSeasonList);
		mv.setViewName("game/playerRecord");
		return mv;
	}
	@RequestMapping(value = "/selectSeasonSrot", method = RequestMethod.GET)
	public ModelAndView selectSeasonSrot(ModelAndView mv,
			@RequestParam(value = "game_code", defaultValue ="01") String game_code,
			@RequestParam(value = "season_code", defaultValue ="45") String season_code,
			@RequestParam(value = "category", defaultValue ="avg") String category,
			@RequestParam(value = "str", defaultValue ="pl_back") String str,
			@RequestParam(value = "sort", defaultValue ="ASC") String sort)throws Exception {
		if(!"pl_back".equals(str)) {
			mv.addObject("str", str);
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		switch(str) {
			case "PTS":
				str = "pts";
				break;
			case "2P":
				str = "fg";
				break;
			case "2PA":
				str = "fg_a";
				break;
			case "2P%":
				str = "fgp";
				break;
			case "3P":
				str = "threep";
				break;
			case "3PA":
				str = "threep_a";
				break;
			case "3P%":
				str = "threepp";
				break;
			case "PP":
				str = "pp";
				break;
			case "PPA":
				str = "pp_a";
				break;
			case "PP%":
				str = "ppp";
				break;
			case "OFF REB":
				str = "o_r";
				break;
			case "DEF REB":
				str = "d_r";
				break;
			case "TOT":
				str = "r_tot";
				break;
			case "AST":
				str = "a_s";
				break;
			case "FT":
				str = "ft";
				break;
			case "FTA":
				str = "ft_a";
				break;
			case "FT%":
				str = "ftp";
				break;
			case "TO":
				str = "t_o";
				break;
			case "BS":
				str = "b_s";
				break;
			case "PF":
				str = "foul_tot";
				break;
		}
		paramMap.put("game_code", game_code);
		paramMap.put("season_code", season_code);
		paramMap.put("category", category);
		paramMap.put("str", str);
		paramMap.put("sort", sort);
		System.out.println(paramMap.toString());
		List<Map<String,Object>> seasonSearchList = playerService.seasonSearchList(paramMap);
		mv.addObject("seasonSearchList", seasonSearchList);
		mv.addObject("game_code", game_code);
		mv.addObject("season_code", season_code);
		mv.addObject("category", category);
		mv.setViewName("game/playerRecordSortAjax");
		return mv;
	}
	@RequestMapping(value = "/selectPlayer", method = RequestMethod.GET)
	public ModelAndView selectPlayer(ModelAndView mv,@RequestParam(value = "player_no", defaultValue ="290552") String player_no,
			@RequestParam(value = "game_round", defaultValue ="1") String game_round)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("pl_no", player_no);
		paramMap.put("game_round", game_round);
		Map<String,Object> playerMap = playerService.getPlayer(paramMap);
		Map<String, Object> playerRank = new HashMap<String, Object>();
		List<Map<String, Object>> playerRankListCategory = playerService.playerRankListCategory(paramMap);
		if(playerRankListCategory.size()>0) {
			playerRank.put("pointRk", playerRankListCategory.get(0).get("rn"));
			playerRank.put("reboundRk", playerRankListCategory.get(1).get("rn"));
			playerRank.put("assistRk", playerRankListCategory.get(2).get("rn"));
			playerRank.put("stealRk", playerRankListCategory.get(3).get("rn"));
			playerRank.put("blockRk", playerRankListCategory.get(4).get("rn"));
		}else {
			playerRank.put("pointRk", "-");
			playerRank.put("reboundRk", "-");
			playerRank.put("assistRk", "-");
			playerRank.put("stealRk", "-");
			playerRank.put("blockRk", "-");
		}
		//init 선수목록
		List<Map<String, Object>> playerList = playerService.playerList(paramMap);
		for(Map m: playerList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("playerCode", m.get("pl_no"));
			tempMap.put("playerCodeNm", m.get("pl_name"));
			m.putAll(tempMap);
		}
		//작년시즌
		List<Map<String, Object>> prevSeasonList = playerService.prevSeasonList(paramMap);
		if(prevSeasonList.size()>0) {
			mv.addObject("prevSeason", prevSeasonList.get(0));
		}
		//올시즌
		List<Map<String, Object>> currentSeasonList = playerService.seasonList(paramMap);
		if(currentSeasonList.size()>0) {
			mv.addObject("currentSeason", currentSeasonList.get(0));
		}
		//라운드
		List<Map<String, Object>> roundPlayerList = playerService.roundPlayerList(paramMap);
		mv.addObject("roundPlayerList", roundPlayerList);
		mv.addObject("playerList", playerList);
		mv.addObject("playerRank", playerRank);
		mv.addObject("playerMap", playerMap);
		mv.addObject("player_no", player_no);
		mv.addObject("game_round", game_round);
		mv.addObject("prevSeasonList",prevSeasonList);
		mv.addObject("currentSeasonList",currentSeasonList);
		mv.setViewName("game/playerRecordPlayerAjax");
		return mv;
	}
	@RequestMapping(value = "/selectRound", method = RequestMethod.GET)
	public ModelAndView selectRound(ModelAndView mv,@RequestParam(value = "player_no", defaultValue ="290552") String player_no,
			@RequestParam(value = "game_round", defaultValue ="1") String game_round)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("pl_no", player_no);
		paramMap.put("game_round", game_round);
		//라운드
		List<Map<String, Object>> roundPlayerList = playerService.roundPlayerList(paramMap);
		System.out.println(roundPlayerList.size());
		mv.addObject("roundPlayerList", roundPlayerList);
		mv.addObject("player_no", player_no);
		mv.addObject("game_round", game_round);
		mv.setViewName("game/playerRecordRoundAjax");
		return mv;
	}
	@RequestMapping(value = "/teamRecord", method = RequestMethod.GET)
	public ModelAndView teamRecord(ModelAndView mv,
			@RequestParam(value = "row_count", defaultValue ="3") Integer row_count,
			@RequestParam(value = "season_gu", defaultValue ="avg") String season_gu,
			@RequestParam(value = "round_gu", defaultValue ="avg") String round_gu,
			@RequestParam(value = "str", defaultValue ="game_round") String str,
			@RequestParam(value = "sort", defaultValue ="ASC") String sort,
			@RequestParam(value = "team_code", defaultValue ="") String team_code)throws Exception {
			String otherTeamNm = "";
			String otherTeamNm2 = "";
		if(!"".equals(team_code)) {
				switch(team_code) {
				case "06":
					otherTeamNm = "수원 KT";
					otherTeamNm2 = "KT";
					break;
				case "10":
					otherTeamNm = "울산 현대모비스";
					otherTeamNm2 = "현대모비스";
					break;
				case "16":
					otherTeamNm = "원주 DB";
					otherTeamNm2 = "DB";
					break;
				case "35":
					otherTeamNm = "서울 삼성";
					otherTeamNm2 = "삼성";
					break;
				case "50":
					otherTeamNm = "창원 LG";
					otherTeamNm2 = "LG";
					break;
				case "55":
					otherTeamNm = "서울 SK";
					otherTeamNm2 = "SK";
					break;
				case "64":
					otherTeamNm = "대구 한국가스공사";
					otherTeamNm2 = "한국가스공사";
					break;
				case "66":
					otherTeamNm = "고양 소노";
					otherTeamNm2 = "소노";
					break;
				case "70":
					otherTeamNm = "안양 정관장";
					otherTeamNm2 = "정관장";
					break;
		}
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//시즌별기록
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		row_count = row_count>selectSeasonList.size() ? selectSeasonList.size() : row_count;
		row_count = row_count <= 3 ?  3 : row_count;
		paramMap.put("season_gu", season_gu);
		paramMap.put("round_gu", round_gu);
		paramMap.put("str", str);
		paramMap.put("sort", sort);
		List<Map<String,Object>> seasonList = teamRankService.seasonList(paramMap);
		List<Map<String,Object>> seasonResultList = new ArrayList<Map<String,Object>>();
		for(int i=0;i<row_count;i++) {
			Map<String,Object> temp = new HashMap<String, Object>();
			temp.put("season", selectSeasonList.get(i).get("season_name_1").toString().substring(2, 4)+"-"+selectSeasonList.get(i).get("season_name_1").toString().substring(7));
			String season_code = selectSeasonList.get(i).get("season_code").toString();
			for(Map m : seasonList) {
				if(season_code.equals(m.get("season_code").toString())) {
					temp.putAll(m);
				}
			}
			seasonResultList.add(temp);
		}
		//라운드별기록
		List<Map<String,Object>> roundList = teamScheduleService.roundList(paramMap);
		//팀&팀기록비교
		List<Map<String,Object>> teamAndteamList = teamScheduleService.teamAndteamList(paramMap);
		if(!"".equals(team_code)) {
			Map<String, Object> result = new HashMap<String, Object>();
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			Map<String, Object> kccParamMap = new HashMap<String, Object>();
			paramMap2.put("season_code", "45");
			paramMap2.put("team_code", team_code);
			paramMap2.put("away_team", "60");
			kccParamMap.put("season_code", "45");
			kccParamMap.put("team_code", "60");
			kccParamMap.put("away_team", team_code);
			Map<String,Object> kccRank = teamRankService.getTeamRank(kccParamMap);
			Map<String,Object> otherRank = teamRankService.getTeamRank(paramMap2);
			result.put("kccRank", kccRank);
			result.put("otherRank", otherRank);
			
			List<Map<String,Object>> teamAndteamList2 = teamScheduleService.teamAndteamList(paramMap2);
			if(teamAndteamList2.size()>0) {
				result.put("currentSeason", teamAndteamList2.get(0));
			}
			List<Map<String,Object>> teamAndteamListPrev = teamScheduleService.teamAndteamListPrev(paramMap2);
			if(teamAndteamListPrev.size()>0) {
				result.put("prevSeason", teamAndteamListPrev.get(0));
			}
			List<Map<String,Object>> teamAndteamListTotal = teamScheduleService.teamAndteamListTotal(paramMap2);
			if(teamAndteamListTotal.size()>0) {
				result.put("totalSeason", teamAndteamListTotal.get(0));
			}
			List<Map<String,Object>> teamAndteamWlThreeList = teamScheduleService.teamAndteamWlThreeList(paramMap2);
			String wl_three = "";
			if(teamAndteamWlThreeList.size()!= 0) {
				for(Map m:teamAndteamWlThreeList) {
					wl_three += m.get("win");
				}
			}
			result.put("wl_three",wl_three);
			List<Map<String,Object>> teamAndteamKccDataList = teamScheduleService.teamAndteamDataList(kccParamMap);
			List<Map<String,Object>> teamAndteamOtherDataList = teamScheduleService.teamAndteamDataList(paramMap2);
			if(teamAndteamKccDataList.size()>0) {
				mv.addObject("kccData", teamAndteamKccDataList.get(0));
			}
			if(teamAndteamOtherDataList.size()>0) {
				mv.addObject("otherData", teamAndteamOtherDataList.get(0));
			}
			List<Map<String,Object>> teamAndteamKccRecordList = teamScheduleService.teamAndteamRecordList(kccParamMap);
			List<Map<String,Object>> teamAndteamOtherRecordList = teamScheduleService.teamAndteamRecordList(paramMap2);
			List<Map<String,Object>> teamAndteamRecordList = new ArrayList<Map<String,Object>>();
			if(teamAndteamKccRecordList.size()>0) {
				for(int i=0;i<teamAndteamKccRecordList.size();i++) {
					Map<String,Object> temp = new HashMap<String, Object>();
					temp.put("game_date", teamAndteamKccRecordList.get(i).get("game_date"));
					temp.put("season_code", teamAndteamKccRecordList.get(i).get("season_code"));
					temp.put("game_code", teamAndteamKccRecordList.get(i).get("game_code"));
					temp.put("game_no", teamAndteamKccRecordList.get(i).get("game_no"));
					
					temp.put("kcc_score", teamAndteamKccRecordList.get(i).get("score"));
					temp.put("other_score", teamAndteamOtherRecordList.get(i).get("score"));
					
					temp.put("kcc_r_tot", teamAndteamKccRecordList.get(i).get("r_tot"));
					temp.put("other_r_tot", teamAndteamOtherRecordList.get(i).get("r_tot"));
					
					temp.put("kcc_a_s", teamAndteamKccRecordList.get(i).get("a_s"));
					temp.put("other_a_s", teamAndteamOtherRecordList.get(i).get("a_s"));
					
					temp.put("kcc_s_t", teamAndteamKccRecordList.get(i).get("s_t"));
					temp.put("other_s_t", teamAndteamOtherRecordList.get(i).get("s_t"));
					
					temp.put("kcc_b_s", teamAndteamKccRecordList.get(i).get("b_s"));
					temp.put("other_b_s", teamAndteamOtherRecordList.get(i).get("b_s"));
					
					temp.put("kcc_fg", teamAndteamKccRecordList.get(i).get("fg"));
					temp.put("other_fg", teamAndteamOtherRecordList.get(i).get("fg"));
					
					temp.put("kcc_threep", teamAndteamKccRecordList.get(i).get("threep"));
					temp.put("other_threep", teamAndteamOtherRecordList.get(i).get("threep"));
					
					temp.put("kcc_ft", teamAndteamKccRecordList.get(i).get("ft"));
					temp.put("other_ft", teamAndteamOtherRecordList.get(i).get("ft"));
					
					temp.put("kcc_t_o", teamAndteamKccRecordList.get(i).get("t_o"));
					temp.put("other_t_o", teamAndteamOtherRecordList.get(i).get("t_o"));
					
					temp.put("kcc_fgp", teamAndteamKccRecordList.get(i).get("fgp"));
					temp.put("other_fgp", teamAndteamOtherRecordList.get(i).get("fgp"));
					
					temp.put("kcc_threepp", teamAndteamKccRecordList.get(i).get("threepp"));
					temp.put("other_threepp", teamAndteamOtherRecordList.get(i).get("threepp"));
					
					temp.put("kcc_ftp", teamAndteamKccRecordList.get(i).get("ftp"));
					temp.put("other_ftp", teamAndteamOtherRecordList.get(i).get("ftp"));
					
					temp.put("kcc_ygp", teamAndteamKccRecordList.get(i).get("ygp"));
					temp.put("other_ygp", teamAndteamOtherRecordList.get(i).get("ygp"));
					
					temp.put("kcc_ppp", teamAndteamKccRecordList.get(i).get("ppp"));
					temp.put("other_ppp", teamAndteamOtherRecordList.get(i).get("ppp"));
					teamAndteamRecordList.add(temp);
				}
			}
			mv.addObject("result", result);
			mv.addObject("teamAndteamRecordList", teamAndteamRecordList);
			mv.addObject("team_code", team_code);
		}
		mv.addObject("otherTeamNm", otherTeamNm);
		mv.addObject("otherTeamNm2", otherTeamNm2);
		mv.addObject("row_count", row_count);
		mv.addObject("season_gu", season_gu);
		mv.addObject("seasonResultList", seasonResultList);
		mv.addObject("teamAndteamList", teamAndteamList);
		mv.addObject("roundList", roundList);
		mv.setViewName("game/teamRecord");
		return mv;
	}
	@RequestMapping(value = "/selectSeasonGu", method = RequestMethod.GET)
	public ModelAndView selectSeasonGu(ModelAndView mv,
			@RequestParam(value = "row_count", defaultValue ="3") Integer row_count,
			@RequestParam(value = "season_gu", defaultValue ="avg") String season_gu)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		row_count = row_count>selectSeasonList.size() ? selectSeasonList.size() : row_count;
		row_count = row_count <= 3 ?  3 : row_count;
		paramMap.put("season_gu", season_gu);
		List<Map<String,Object>> seasonList = teamRankService.seasonList(paramMap);
		List<Map<String,Object>> seasonResultList = new ArrayList<Map<String,Object>>();
		for(int i=0;i<row_count;i++) {
			Map<String,Object> temp = new HashMap<String, Object>();
			temp.put("season", selectSeasonList.get(i).get("season_name_1").toString().substring(2, 4)+"-"+selectSeasonList.get(i).get("season_name_1").toString().substring(7));
			String season_code = selectSeasonList.get(i).get("season_code").toString();
			for(Map m : seasonList) {
				if(season_code.equals(m.get("season_code").toString())) {
					temp.putAll(m);
				}
			}
			seasonResultList.add(temp);
		}
		mv.addObject("seasonResultList", seasonResultList);
		mv.addObject("row_count", row_count);
		mv.addObject("season_gu", season_gu);
		mv.setViewName("game/teamRecordSeasonAjax");
		return mv;
	}
	@RequestMapping(value = "/selectRoundGu", method = RequestMethod.GET)
	public ModelAndView selectRoundGu(ModelAndView mv,
			@RequestParam(value = "round_gu", defaultValue ="avg") String round_gu,
			@RequestParam(value = "str", defaultValue ="game_round") String str,
			@RequestParam(value = "sort", defaultValue ="ASC") String sort)throws Exception {
		if(!"game_round".equals(str)) {
			mv.addObject("str", str);
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		switch(str) {
			case "PTS":
				str = "pts";
				break;
			case "2P":
				str = "fg";
				break;
			case "2PA":
				str = "fg_a";
				break;
			case "2P%":
				str = "fgp";
				break;
			case "3P":
				str = "threep";
				break;
			case "3PA":
				str = "threep_a";
				break;
			case "3P%":
				str = "threepp";
				break;
			case "PP":
				str = "pp";
				break;
			case "PPA":
				str = "pp_a";
				break;
			case "PP%":
				str = "ppp";
				break;
			case "OFF REB":
				str = "o_r";
				break;
			case "DEF REB":
				str = "d_r";
				break;
			case "TOT":
				str = "r_tot";
				break;
			case "FT":
				str = "ft";
				break;
			case "FTA":
				str = "ft_a";
				break;
			case "FT%":
				str = "ftp";
				break;
			case "TO":
				str = "t_o";
				break;
			case "BS":
				str = "b_s";
				break;
			case "PF":
				str = "foul_tot";
				break;
		}
		paramMap.put("round_gu", round_gu);
		paramMap.put("str", str);
		paramMap.put("sort", sort);
		List<Map<String,Object>> roundList = teamScheduleService.roundList(paramMap);
		mv.addObject("round_gu", round_gu);
		mv.addObject("roundList", roundList);
		mv.setViewName("game/teamRecordRoundAjax");
		return mv;
	}
	@RequestMapping(value = "/selectTeam", method = RequestMethod.GET)
	public ModelAndView selectTeam(ModelAndView mv,
			@RequestParam(value = "team_code") String team_code)throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> kccParamMap = new HashMap<String, Object>();
		paramMap.put("season_code", "45");
		paramMap.put("team_code", team_code);
		paramMap.put("away_team", "60");
		kccParamMap.put("season_code", "45");
		kccParamMap.put("team_code", "60");
		kccParamMap.put("away_team", team_code);
		Map<String,Object> kccRank = teamRankService.getTeamRank(kccParamMap);
		Map<String,Object> otherRank = teamRankService.getTeamRank(paramMap);
		result.put("kccRank", kccRank);
		result.put("otherRank", otherRank);
		
		List<Map<String,Object>> teamAndteamList = teamScheduleService.teamAndteamList(paramMap);
		if(teamAndteamList.size()>0) {
			result.put("currentSeason", teamAndteamList.get(0));
		}
		List<Map<String,Object>> teamAndteamListPrev = teamScheduleService.teamAndteamListPrev(paramMap);
		if(teamAndteamListPrev.size()>0) {
			result.put("prevSeason", teamAndteamListPrev.get(0));
		}
		List<Map<String,Object>> teamAndteamListTotal = teamScheduleService.teamAndteamListTotal(paramMap);
		if(teamAndteamListTotal.size()>0) {
			result.put("totalSeason", teamAndteamListTotal.get(0));
		}
		List<Map<String,Object>> teamAndteamWlThreeList = teamScheduleService.teamAndteamWlThreeList(paramMap);
		String wl_three = "";
		if(teamAndteamWlThreeList.size()!= 0) {
			for(Map m:teamAndteamWlThreeList) {
				wl_three += m.get("win");
			}
		}
		result.put("wl_three",wl_three);
		List<Map<String,Object>> teamAndteamKccDataList = teamScheduleService.teamAndteamDataList(kccParamMap);
		List<Map<String,Object>> teamAndteamOtherDataList = teamScheduleService.teamAndteamDataList(paramMap);
		if(teamAndteamKccDataList.size()>0) {
			mv.addObject("kccData", teamAndteamKccDataList.get(0));
		}
		if(teamAndteamOtherDataList.size()>0) {
			mv.addObject("otherData", teamAndteamOtherDataList.get(0));
		}
		List<Map<String,Object>> teamAndteamKccRecordList = teamScheduleService.teamAndteamRecordList(kccParamMap);
		List<Map<String,Object>> teamAndteamOtherRecordList = teamScheduleService.teamAndteamRecordList(paramMap);
		List<Map<String,Object>> teamAndteamRecordList = new ArrayList<Map<String,Object>>();
		if(teamAndteamKccRecordList.size()>0) {
			for(int i=0;i<teamAndteamKccRecordList.size();i++) {
				Map<String,Object> temp = new HashMap<String, Object>();
				temp.put("game_date", teamAndteamKccRecordList.get(i).get("game_date"));
				temp.put("season_code", teamAndteamKccRecordList.get(i).get("season_code"));
				temp.put("game_code", teamAndteamKccRecordList.get(i).get("game_code"));
				temp.put("game_no", teamAndteamKccRecordList.get(i).get("game_no"));
				
				temp.put("kcc_score", teamAndteamKccRecordList.get(i).get("score"));
				temp.put("other_score", teamAndteamOtherRecordList.get(i).get("score"));
				
				temp.put("kcc_r_tot", teamAndteamKccRecordList.get(i).get("r_tot"));
				temp.put("other_r_tot", teamAndteamOtherRecordList.get(i).get("r_tot"));
				
				temp.put("kcc_a_s", teamAndteamKccRecordList.get(i).get("a_s"));
				temp.put("other_a_s", teamAndteamOtherRecordList.get(i).get("a_s"));
				
				temp.put("kcc_s_t", teamAndteamKccRecordList.get(i).get("s_t"));
				temp.put("other_s_t", teamAndteamOtherRecordList.get(i).get("s_t"));
				
				temp.put("kcc_b_s", teamAndteamKccRecordList.get(i).get("b_s"));
				temp.put("other_b_s", teamAndteamOtherRecordList.get(i).get("b_s"));
				
				temp.put("kcc_fg", teamAndteamKccRecordList.get(i).get("fg"));
				temp.put("other_fg", teamAndteamOtherRecordList.get(i).get("fg"));
				
				temp.put("kcc_threep", teamAndteamKccRecordList.get(i).get("threep"));
				temp.put("other_threep", teamAndteamOtherRecordList.get(i).get("threep"));
				
				temp.put("kcc_ft", teamAndteamKccRecordList.get(i).get("ft"));
				temp.put("other_ft", teamAndteamOtherRecordList.get(i).get("ft"));
				
				temp.put("kcc_t_o", teamAndteamKccRecordList.get(i).get("t_o"));
				temp.put("other_t_o", teamAndteamOtherRecordList.get(i).get("t_o"));
				
				temp.put("kcc_fgp", teamAndteamKccRecordList.get(i).get("fgp"));
				temp.put("other_fgp", teamAndteamOtherRecordList.get(i).get("fgp"));
				
				temp.put("kcc_threepp", teamAndteamKccRecordList.get(i).get("threepp"));
				temp.put("other_threepp", teamAndteamOtherRecordList.get(i).get("threepp"));
				
				temp.put("kcc_ftp", teamAndteamKccRecordList.get(i).get("ftp"));
				temp.put("other_ftp", teamAndteamOtherRecordList.get(i).get("ftp"));
				
				temp.put("kcc_ygp", teamAndteamKccRecordList.get(i).get("ygp"));
				temp.put("other_ygp", teamAndteamOtherRecordList.get(i).get("ygp"));
				
				temp.put("kcc_ppp", teamAndteamKccRecordList.get(i).get("ppp"));
				temp.put("other_ppp", teamAndteamOtherRecordList.get(i).get("ppp"));
				teamAndteamRecordList.add(temp);
			}
		}
		
		mv.addObject("result", result);
		mv.addObject("teamAndteamRecordList", teamAndteamRecordList);
		mv.addObject("team_code", team_code);
		mv.setViewName("game/teamRecordSelectTeamAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/selectSeason", method = RequestMethod.POST)
	public List<Map<String, Object>> selectSeason(@RequestParam(value = "season_code") String season_code) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code);
		List<Map<String, Object>> selectDateList = teamScheduleService.selectDateList(paramMap);
		return selectDateList;
	}
	@RequestMapping(value = "/ticket", method = RequestMethod.GET)
	public ModelAndView ticket(ModelAndView mv) throws Exception {
		mv.setViewName("game/ticket");
		return mv;
	}
	@RequestMapping(value = "/ticket_faq", method = RequestMethod.GET)
	public ModelAndView ticket_faq(ModelAndView mv) throws Exception {
		mv.setViewName("game/ticket_faq");
		return mv;
	}
}
