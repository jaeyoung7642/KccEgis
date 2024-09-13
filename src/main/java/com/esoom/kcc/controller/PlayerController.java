package com.esoom.kcc.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.Mac;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
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

import com.esoom.kcc.common.AesUtil;
import com.esoom.kcc.common.IpUtil;
import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.common.ShaUtil;
import com.esoom.kcc.service.CommonService;
import com.esoom.kcc.service.FanzoneService;
import com.esoom.kcc.service.MemberService;
import com.esoom.kcc.service.NewsService;
import com.esoom.kcc.service.PlayerService;
import com.esoom.kcc.service.TeamRankService;
import com.esoom.kcc.service.TeamScheduleService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PlayerController {
	@Autowired
	private CommonService commonService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
	private PlayerService service;
	@Autowired
	private TeamScheduleService teamScheduleService;
	@Autowired
	private NewsService newsService;
	private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);
	@RequestMapping(value = "/coachList", method = RequestMethod.GET)
	public ModelAndView freeList(ModelAndView mv,HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> coachList = service.coachList(paramMap);
		mv.addObject("coachList", coachList);
		mv.setViewName("player/coachList");
		return mv;
	}
	@RequestMapping(value = "/playerList", method = RequestMethod.GET)
	public ModelAndView playerList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "pos_code", defaultValue = "all") String pos_code) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pl_pos_code", pos_code);
		List<Map<String, Object>> playerList = service.playerAllList(paramMap);
		for(Map m : playerList) {
			paramMap.put("player_no", m.get("pl_no"));
			List<Map<String, Object>> avgList = service.seasonList(paramMap);
			if(avgList.size()>0) {
				m.put("avg_score", avgList.get(0).get("pts"));
				m.put("avg_r_tot", avgList.get(0).get("r_tot"));
				m.put("avg_a_s", avgList.get(0).get("a_s"));
			}else {
				m.put("avg_score", "0");
				m.put("avg_r_tot", "0");
				m.put("avg_a_s", "0");
			}
			Map<String, Object> sumMap = service.getPlayerSum(paramMap);
			if(sumMap != null) {
				m.put("sum_score", sumMap.get("score"));
				m.put("sum_r_tot", sumMap.get("r_tot"));
				m.put("sum_a_s", sumMap.get("a_s"));
			}else {
				m.put("sum_score", "0");
				m.put("sum_r_tot", "0");
				m.put("sum_a_s", "0");
			}
		}
		mv.addObject("playerList", playerList);
		mv.addObject("pos_code", pos_code);
		mv.setViewName("player/playerList");
		return mv;
	}
	@RequestMapping(value = "/playerInfo", method = RequestMethod.GET)
	public ModelAndView playerInfo(ModelAndView mv,HttpServletRequest request,HttpSession session,
			@RequestParam(value = "pl_no") String pl_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pl_no", pl_no);
		paramMap.put("player_no", pl_no);
		Map<String, Object> playerMap = service.getPlayer(paramMap);
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		if(loginUserMap != null) {
			paramMap.put("id", loginUserMap.get("id"));
			Map<String, Object> likePlayerMap = service.getLikePlayerImg(paramMap);
			mv.addObject("likePlayerMap", likePlayerMap);
		}
		List<Map<String, Object>> playerMediaList = newsService.playerMediaList(paramMap);
		List<Map<String, Object>> playerRankListCategory = service.playerRankListCategory(paramMap);
		System.out.println(playerRankListCategory.size());
		if(playerRankListCategory.size()>0) {
			Map<String, Object> playerRankMap = new HashMap<String, Object>(); 
			playerRankMap.putAll(playerRankListCategory.get(0));
			playerRankMap.put("pointRk", playerRankListCategory.get(0).get("rn"));
			playerRankMap.put("reboundRk", playerRankListCategory.get(1).get("rn"));
			playerRankMap.put("assistRk", playerRankListCategory.get(2).get("rn"));
			playerRankMap.put("stealRk", playerRankListCategory.get(3).get("rn"));
			playerRankMap.put("blockRk", playerRankListCategory.get(4).get("rn"));
			mv.addObject("playerRankMap", playerRankMap);
		}
		//시즌 init
		List<Map<String,Object>> playerSeasonList = service.playerSeasonList(paramMap);
		List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
		List<Map<String,Object>> selectSeason = new ArrayList<Map<String,Object>>();
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			for(int i=0;i<playerSeasonList.size();i++) {
				if(playerSeasonList.get(i).get("season_code").equals(m.get("season_code"))) {
					tempMap.put("seasonCode", m.get("season_code"));
					tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
					selectSeason.add(tempMap);
				}
			}
		}
		if(selectSeason.size()>0) {
			paramMap.put("season_code", selectSeason.get(0).get("seasonCode"));
			paramMap.put("category", "avg");
			Map<String, Object> playerRecordMap = service.playerRecordMap(paramMap);
			mv.addObject("playerRecordMap", playerRecordMap);
		}
		//최근경기 init
		List<Map<String,Object>> selectYearMonth = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> selectYearMonthList = service.selectYearMonthList(paramMap);
		for(Map m: selectYearMonthList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("dateCode", m.get("year_month"));
			tempMap.put("dateCodeNm", m.get("year_month").toString().substring(0, 4)+"년 "+m.get("year_month").toString().substring(4, 6)+"월");
			selectYearMonth.add(tempMap);
		}
		if(selectYearMonthList.size()>0) {
			paramMap.put("year_month", selectYearMonth.get(0).get("dateCode"));
			List<Map<String,Object>> playerYearMonthList = service.playerYearMonthList(paramMap);
			mv.addObject("playerYearMonthList", playerYearMonthList);
		}
		//하단 선수 list
		List<Map<String,Object>> footPlayerList = service.footPlayerList(paramMap);
		
		mv.addObject("footPlayerList", footPlayerList);
		mv.addObject("selectYearMonth", selectYearMonth);
		mv.addObject("selectSeason", selectSeason);
		mv.addObject("playerMediaList", playerMediaList);
		mv.addObject("playerMap", playerMap);
		mv.addObject("pos_code", playerMap.get("pl_pos_code"));
		mv.setViewName("player/playerInfo");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/playerSeasonReacordAjax", method = RequestMethod.GET)
	public ModelAndView playerSeasonReacordAjax(ModelAndView mv,
			@RequestParam(value = "season_code") String season_code,
			@RequestParam(value = "category") String category,
			@RequestParam(value = "player_no") String player_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("season_code", season_code);
		paramMap.put("category", category);
		Map<String, Object> playerRecordMap = service.playerRecordMap(paramMap);
		mv.addObject("playerRecordMap", playerRecordMap);
		mv.setViewName("player/playerInfoSeasonRecordAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/playerTotalReacordAjax", method = RequestMethod.GET)
	public ModelAndView playerTotalReacordAjax(ModelAndView mv,
			@RequestParam(value = "category") String category,
			@RequestParam(value = "player_no") String player_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("category", category);
		Map<String, Object> playerRecordMap = service.playerTabRecordMap(paramMap);
		mv.addObject("playerRecordMap", playerRecordMap);
		mv.setViewName("player/playerInfoSeasonRecordAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/playerYearMonthReacordAjax", method = RequestMethod.GET)
	public ModelAndView playerYearMonthReacordAjax(ModelAndView mv,
			@RequestParam(value = "year_month") String year_month,
			@RequestParam(value = "player_no") String player_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		paramMap.put("year_month", year_month);
		List<Map<String,Object>> playerYearMonthList = service.playerYearMonthList(paramMap);
		mv.addObject("playerYearMonthList", playerYearMonthList);
		mv.setViewName("player/playerInfoYearMonthRecordAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/playerTabReacordAjax", method = RequestMethod.GET)
	public ModelAndView playerTabReacordAjax(ModelAndView mv,
			@RequestParam(value = "tab") String tab,
			@RequestParam(value = "player_no") String player_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		if("season".equals(tab)) {
			//시즌 init
			List<Map<String,Object>> playerSeasonList = service.playerSeasonList(paramMap);
			List<Map<String,Object>> selectSeasonList = teamScheduleService.selectSeasonList(paramMap);
			List<Map<String,Object>> selectSeason = new ArrayList<Map<String,Object>>();
			for(Map m: selectSeasonList) {
				Map<String,Object> tempMap = new HashMap<String, Object>();
				for(int i=0;i<playerSeasonList.size();i++) {
					if(playerSeasonList.get(i).get("season_code").equals(m.get("season_code"))) {
						tempMap.put("seasonCode", m.get("season_code"));
						tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
						selectSeason.add(tempMap);
					}
				}
			}
			if(selectSeason.size()>0) {
				paramMap.put("season_code", selectSeason.get(0).get("seasonCode"));
				paramMap.put("category", "avg");
				Map<String, Object> playerRecordMap = service.playerRecordMap(paramMap);
				mv.addObject("playerRecordMap", playerRecordMap);
			}
			mv.addObject("selectSeason", selectSeason);
		}else {
			paramMap.put("category", "avg");
			Map<String, Object> tabMap = service.playerTabRecordMap(paramMap);
			mv.addObject("playerRecordMap", tabMap);
		}
		mv.addObject("tab", tab);
		mv.setViewName("player/playerInfoTabRecordAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/updateLikePlayer", method = RequestMethod.GET)
	public String updateLikePlayer(String player_no,String img_order,HttpSession session,ModelAndView mv)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pl_no", player_no);
		paramMap.put("player_no", player_no);
		Map<String, Object> playerMap = service.getPlayer(paramMap);
		if("0".equals(img_order)) {
			paramMap.put("img", playerMap.get("pl_actioncut_1"));
		}
		if("1".equals(img_order)) {
			paramMap.put("img", playerMap.get("pl_actioncut_2"));
		}
		if("2".equals(img_order)) {
			paramMap.put("img", playerMap.get("pl_actioncut_3"));
		}
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		paramMap.put("id", loginUserMap.get("id"));
		int result=service.updateLikePlayer(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteLikePlayer", method = RequestMethod.GET)
	public String deleteLikePlayer(String player_no,HttpSession session,ModelAndView mv)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("player_no", player_no);
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		paramMap.put("id", loginUserMap.get("id"));
		int result=service.deleteLikePlayer(paramMap);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/cheer_song", method = RequestMethod.GET)
	public ModelAndView cheer_song(ModelAndView mv) throws Exception {
		
		mv.setViewName("player/cheer_song");
		return mv;
	}
	@RequestMapping(value = "/cheer", method = RequestMethod.GET)
	public ModelAndView cheer(ModelAndView mv) throws Exception {
		
		mv.setViewName("player/cheer");
		return mv;
	}
	@RequestMapping(value = "/cheer_profile", method = RequestMethod.GET)
	public ModelAndView cheer_profile(ModelAndView mv,String cheer_num) throws Exception {
		
		mv.setViewName("player/cheer_profile");
		return mv;
	}
}
