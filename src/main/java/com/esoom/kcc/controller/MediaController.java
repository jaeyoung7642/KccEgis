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
public class MediaController {
	@Autowired
	private CommonService commonService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
	private PlayerService playerService;
	@Autowired
	private NewsService service;
	private static final Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	@RequestMapping(value = "/newsList", method = RequestMethod.GET)
	public ModelAndView newsList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", "news");
		
		//init
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		List<Map<String, Object>> gameList = service.gameList(paramMap);
		List<Map<String,Object>> selectGame = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("gameCd", "all");
		temp.put("gameNm", "경기 선택");
		selectGame.add(temp);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+ " vs " + m.get("away_team_name");
				}else {
					gameNm = dateformat + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				selectGame.add(temp);
			}
		}
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp2 = new HashMap<String, Object>();
		temp2.put("playerCd", "all");
		temp2.put("playerNm", "선수 선택");
		selectPlayer.add(temp2);
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(!"all".equals(round)) {
			Map<String, Object> roundMap = service.getRoundDate(paramMap);
			if(roundMap != null) {
				paramMap.put("first_game_date", roundMap.get("first_game_date"));
				paramMap.put("last_game_date", roundMap.get("last_game_date"));
			}
		}
		// 상위리스트 카운트
		int listCount = service.getNewsListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> newsList = service.newsList(paramMap);
		if(newsList != null && newsList.size() >0) {
			for(Map m: newsList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("newsList", newsList);
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("selectGame", selectGame);
		mv.addObject("selectPlayer", selectPlayer);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.setViewName("media/newsList");
		return mv;
	}
	@RequestMapping(value = "/photoListH", method = RequestMethod.GET)
	public ModelAndView photoListH(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "part", defaultValue = "photo") String part,
			@RequestParam(value = "otype", defaultValue = "num") String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", part);
		paramMap.put("etc1", "H");
		paramMap.put("otype", otype);
		
		//init
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		List<Map<String, Object>> gameList = service.gameList(paramMap);
		List<Map<String,Object>> selectGame = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("gameCd", "all");
		temp.put("gameNm", "경기 선택");
		selectGame.add(temp);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+ " vs " + m.get("away_team_name");
				}else {
					gameNm = dateformat + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				selectGame.add(temp);
			}
		}
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp2 = new HashMap<String, Object>();
		temp2.put("playerCd", "all");
		temp2.put("playerNm", "선수 선택");
		selectPlayer.add(temp2);
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(!"all".equals(round)) {
			Map<String, Object> roundMap = service.getRoundDate(paramMap);
			if(roundMap != null) {
				paramMap.put("first_game_date", roundMap.get("first_game_date"));
				paramMap.put("last_game_date", roundMap.get("last_game_date"));
			}
		}
		// 상위리스트 카운트
		int listCount = service.getPhotoListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> photoList = service.photoList(paramMap);
		if(photoList != null && photoList.size() >0) {
			for(Map m: photoList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("photoList", photoList);
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("selectGame", selectGame);
		mv.addObject("selectPlayer", selectPlayer);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("part", part);
		mv.addObject("otype", otype);
		mv.setViewName("media/photoListH");
		return mv;
	}
	@RequestMapping(value = "/photoListE", method = RequestMethod.GET)
	public ModelAndView photoListE(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "part", defaultValue = "photo") String part,
			@RequestParam(value = "otype", defaultValue = "num") String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", part);
		paramMap.put("etc1", "E");
		paramMap.put("otype", otype);
		
		//init
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		List<Map<String, Object>> gameList = service.gameList(paramMap);
		List<Map<String,Object>> selectGame = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("gameCd", "all");
		temp.put("gameNm", "경기 선택");
		selectGame.add(temp);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+ " vs " + m.get("away_team_name");
				}else {
					gameNm = dateformat + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				selectGame.add(temp);
			}
		}
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp2 = new HashMap<String, Object>();
		temp2.put("playerCd", "all");
		temp2.put("playerNm", "선수 선택");
		selectPlayer.add(temp2);
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(!"all".equals(round)) {
			Map<String, Object> roundMap = service.getRoundDate(paramMap);
			if(roundMap != null) {
				paramMap.put("first_game_date", roundMap.get("first_game_date"));
				paramMap.put("last_game_date", roundMap.get("last_game_date"));
			}
		}
		// 상위리스트 카운트
		int listCount = service.getPhotoListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> photoList = service.photoList(paramMap);
		if(photoList != null && photoList.size() >0) {
			for(Map m: photoList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("photoList", photoList);
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("selectGame", selectGame);
		mv.addObject("selectPlayer", selectPlayer);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("part", part);
		mv.addObject("otype", otype);
		mv.setViewName("media/photoListE");
		return mv;
	}
	@RequestMapping(value = "/photoListHDetail", method = RequestMethod.GET)
	public ModelAndView photoListHDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord,
			@RequestParam(value = "round", required = false) String round,
			@RequestParam(value = "game", required = false) String game,
			@RequestParam(value = "player", required = false) String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "part", required = false) String part,
			@RequestParam(value = "otype", required = false) String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		Map<String, Object> photoDetail = service.getDetail(paramMap);
		if(photoDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			String game_date = photoDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> photoDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("photoDetailSchedule", photoDetailSchedule);
		}
		String detailPart = photoDetail.get("part").toString();
		if("photo".equals(detailPart)) {
			List<Map<String,Object>> photoChildList = service.photoChildList(paramMap);
			System.out.println(photoChildList.size());
			mv.addObject("photoChildList", photoChildList);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		//하단 최근영상
		paramMap.put("etc1", "H");
		paramMap.put("part", "photo");
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("photoDetail", photoDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("part", part);
		mv.addObject("otype", otype);
		mv.addObject("detailPart", detailPart);
		
		mv.setViewName("media/photoListH_detail");
		return mv;
	}
	@RequestMapping(value = "/movieHDetail", method = RequestMethod.GET)
	public ModelAndView movieEDetail(ModelAndView mv,HttpServletRequest request,String game_date,@RequestParam(value = "page", required = false) Integer page
			) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_date", game_date);
		paramMap.put("part", "movie");
		Map<String, Object> movieDetail = service.getDateDetail(paramMap);
		if(movieDetail == null) {
			mv.addObject("msg", "경기일에 영상이 없습니다.");
			mv.setViewName("redirect:/movieListH");
			return mv;
		}
		paramMap.put("num", movieDetail.get("num"));
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		if(movieDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			game_date = movieDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> movieDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("movieDetailSchedule", movieDetailSchedule);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		String detailPart = movieDetail.get("part").toString();
		//하단 최근영상
		paramMap.put("etc1", "H");
		paramMap.put("part", detailPart);
		
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("movieDetail", movieDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.setViewName("media/movieListH_detail");
		return mv;
	}
	@RequestMapping(value = "/photoHDetail", method = RequestMethod.GET)
	public ModelAndView photoHDetail(ModelAndView mv,HttpServletRequest request,String game_date,@RequestParam(value = "page", required = false) Integer page) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_date", game_date);
		paramMap.put("part", "photo");
		Map<String, Object> photoDetail = service.getDateDetail(paramMap);
		if(photoDetail == null) {
			mv.addObject("msg", "경기일에 사진이 없습니다.");
			mv.setViewName("redirect:/photoListH");
			return mv;
		}
		paramMap.put("num", photoDetail.get("num"));
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		if(photoDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			game_date = photoDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> photoDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("photoDetailSchedule", photoDetailSchedule);
		}
		String detailPart = photoDetail.get("part").toString();
		if("photo".equals(detailPart)) {
			List<Map<String,Object>> photoChildList = service.photoChildList(paramMap);
			System.out.println(photoChildList.size());
			mv.addObject("photoChildList", photoChildList);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		//하단 최근영상
		paramMap.put("etc1", "H");
		paramMap.put("part", "photo");
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("photoDetail", photoDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("detailPart", detailPart);
		
		mv.setViewName("media/photoListH_detail");
		return mv;
	}
	@RequestMapping(value = "/photoListEDetail", method = RequestMethod.GET)
	public ModelAndView photoListEDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord,
			@RequestParam(value = "round", required = false) String round,
			@RequestParam(value = "game", required = false) String game,
			@RequestParam(value = "player", required = false) String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "part", required = false) String part,
			@RequestParam(value = "otype", required = false) String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		Map<String, Object> photoDetail = service.getDetail(paramMap);
		if(photoDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			String game_date = photoDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> photoDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("photoDetailSchedule", photoDetailSchedule);
		}
		String detailPart = photoDetail.get("part").toString();
		if("photo".equals(detailPart)) {
			List<Map<String,Object>> photoChildList = service.photoChildList(paramMap);
			System.out.println(photoChildList.size());
			mv.addObject("photoChildList", photoChildList);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		//하단 최근영상
		paramMap.put("etc1", "E");
		paramMap.put("part", "photo");
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("photoDetail", photoDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("part", part);
		mv.addObject("otype", otype);
		mv.addObject("detailPart", detailPart);
		
		mv.setViewName("media/photoListE_detail");
		return mv;
	}
	@RequestMapping(value = "/movieListH", method = RequestMethod.GET)
	public ModelAndView movieListH(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "wtype", defaultValue = "all") String wtype,
			@RequestParam(value = "otype", defaultValue = "num") String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", "movie");
		paramMap.put("etc1", "H");
		paramMap.put("wtype", wtype);
		paramMap.put("otype", otype);
		
		//init
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		List<Map<String, Object>> gameList = service.gameList(paramMap);
		List<Map<String,Object>> selectGame = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("gameCd", "all");
		temp.put("gameNm", "경기 선택");
		selectGame.add(temp);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+ " vs " + m.get("away_team_name");
				}else {
					gameNm = dateformat + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				selectGame.add(temp);
			}
		}
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp2 = new HashMap<String, Object>();
		temp2.put("playerCd", "all");
		temp2.put("playerNm", "선수 선택");
		selectPlayer.add(temp2);
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(!"all".equals(round)) {
			Map<String, Object> roundMap = service.getRoundDate(paramMap);
			if(roundMap != null) {
				paramMap.put("first_game_date", roundMap.get("first_game_date"));
				paramMap.put("last_game_date", roundMap.get("last_game_date"));
			}
		}
		
		// 상위리스트 카운트
		int listCount = service.getMovieListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> movieList = service.movieList(paramMap);
		System.out.println("movieList.size()============"+movieList.size());
		if(movieList != null && movieList.size() >0) {
			for(Map m: movieList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		if((sdate == null ||"".equals(sdate))&& (edate == null || "".equals(edate)) && "".equals(keyWord) && "all".equals(round) && "all".equals(game) && "all".equals(player)) {
			Map<String,Object> topMovie = service.topMovie(paramMap);
			if(topMovie.get("game_date")!= null) {
				Map<String, Object> tempMap = new HashMap<String, Object>();
				String game_date = topMovie.get("game_date").toString();
				tempMap.put("game_date", game_date);
				Map<String,Object> topMovieSchedule = service.gameSchedule(tempMap);
				mv.addObject("topMovieSchedule", topMovieSchedule);
			}
			mv.addObject("topMovie", topMovie);
		}
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("movieList", movieList);
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("selectGame", selectGame);
		mv.addObject("selectPlayer", selectPlayer);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("wtype", wtype);
		mv.addObject("otype", otype);
		mv.setViewName("media/movieListH");
		return mv;
	}
	@RequestMapping(value = "/movieListE", method = RequestMethod.GET)
	public ModelAndView movieListE(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "wtype", defaultValue = "all") String wtype,
			@RequestParam(value = "otype", defaultValue = "num") String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", "movie");
		paramMap.put("etc1", "E");
		paramMap.put("wtype", wtype);
		paramMap.put("otype", otype);
		
		//init
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		List<Map<String, Object>> gameList = service.gameList(paramMap);
		List<Map<String,Object>> selectGame = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("gameCd", "all");
		temp.put("gameNm", "경기 선택");
		selectGame.add(temp);
		if(gameList != null && gameList.size() >0) {
			for(Map m: gameList) {
				String gameCd = m.get("game_date").toString();
				String gameNm ="";
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				temp = new HashMap<String, Object>();
				if("60".equals(m.get("home_team"))) {
					gameNm = dateformat+ " vs " + m.get("away_team_name");
				}else {
					gameNm = dateformat + " vs " + m.get("home_team_name");
				}
				temp.put("gameCd", gameCd);
				temp.put("gameNm", gameNm);
				selectGame.add(temp);
			}
		}
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp2 = new HashMap<String, Object>();
		temp2.put("playerCd", "all");
		temp2.put("playerNm", "선수 선택");
		selectPlayer.add(temp2);
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(!"all".equals(round)) {
			Map<String, Object> roundMap = service.getRoundDate(paramMap);
			if(roundMap != null) {
				paramMap.put("first_game_date", roundMap.get("first_game_date"));
				paramMap.put("last_game_date", roundMap.get("last_game_date"));
			}
		}
		
		// 상위리스트 카운트
		int listCount = service.getMovieListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> movieList = service.movieList(paramMap);
		if(movieList != null && movieList.size() >0) {
			for(Map m: movieList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		if((sdate == null ||"".equals(sdate))&& (edate == null || "".equals(edate)) && "".equals(keyWord) && "all".equals(round) && "all".equals(game) && "all".equals(player)) {
			Map<String,Object> topMovie = service.topMovie(paramMap);
			if(topMovie.get("game_date")!= null) {
				Map<String, Object> tempMap = new HashMap<String, Object>();
				String game_date = topMovie.get("game_date").toString();
				tempMap.put("game_date", game_date);
				Map<String,Object> topMovieSchedule = service.gameSchedule(tempMap);
				mv.addObject("topMovieSchedule", topMovieSchedule);
			}
			mv.addObject("topMovie", topMovie);
		}
		PageInfo pi2 = Pagination.getPageInfo(currentPage, listCount, boardLimit , 10);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("movieList", movieList);
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("selectGame", selectGame);
		mv.addObject("selectPlayer", selectPlayer);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("wtype", wtype);
		mv.addObject("otype", otype);
		mv.setViewName("media/movieListE");
		return mv;
	}
	@RequestMapping(value = "/movieListEDetail", method = RequestMethod.GET)
	public ModelAndView movieListEDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord,
			@RequestParam(value = "round", required = false) String round,
			@RequestParam(value = "game", required = false) String game,
			@RequestParam(value = "player", required = false) String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "wtype", required = false) String wtype,
			@RequestParam(value = "otype", required = false) String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		Map<String, Object> movieDetail = service.getDetail(paramMap);
		if(movieDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			String game_date = movieDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> movieDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("movieDetailSchedule", movieDetailSchedule);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		String detailPart = movieDetail.get("part").toString();
		//하단 최근영상
		paramMap.put("etc1", "E");
		paramMap.put("part", detailPart);
		
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("movieDetail", movieDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("wtype", wtype);
		mv.addObject("otype", otype);
		
		mv.setViewName("media/movieListE_detail");
		return mv;
	}
	@RequestMapping(value = "/movieListHDetail", method = RequestMethod.GET)
	public ModelAndView movieListHDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord,
			@RequestParam(value = "round", required = false) String round,
			@RequestParam(value = "game", required = false) String game,
			@RequestParam(value = "player", required = false) String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "wtype", required = false) String wtype,
			@RequestParam(value = "otype", required = false) String otype) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		Map<String, Object> movieDetail = service.getDetail(paramMap);
		if(movieDetail.get("game_date")!= null) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			String game_date = movieDetail.get("game_date").toString();
			tempMap.put("game_date", game_date);
			Map<String,Object> movieDetailSchedule = service.gameSchedule(tempMap);
			mv.addObject("movieDetailSchedule", movieDetailSchedule);
		}
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		String detailPart = movieDetail.get("part").toString();
		//하단 최근영상
		paramMap.put("etc1", "H");
		paramMap.put("part", detailPart);
		List<Map<String,Object>> footMovieList = service.footMovieList(paramMap);
		
		mv.addObject("movieDetail", movieDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("footMovieList", footMovieList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		mv.addObject("round", round);
		mv.addObject("game", game);
		mv.addObject("player", player);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("wtype", wtype);
		mv.addObject("otype", otype);
		
		mv.setViewName("media/movieListH_detail");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/contentWrite", method = RequestMethod.GET)
	public String contentWrite(String num,String content,HttpSession session,HttpServletRequest request,String part)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("content", content);
		paramMap.put("part", part);
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		String id = loginUserMap.get("id").toString();
		paramMap.put("id", id);
		String name = loginUserMap.get("name").toString();
		paramMap.put("name", name);
		String ip = ipUtil.getClientIP(request);
		paramMap.put("ip", ip);
		
		int result=service.contentWrite(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/contentDelete", method = RequestMethod.GET)
	public String contentDelete(String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.contentDelete(paramMap);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/contentPage", method = RequestMethod.GET)
	public ModelAndView contentPage(ModelAndView mv,int page,String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = page;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		paramMap.put("num", num);
		// 상위리스트 카운트
		int listCount = service.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.tailList(paramMap); 
		
		mv.addObject("tailList", tailList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("media/movieListH_detailAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/detailYn", method = RequestMethod.GET)
	public Map<String,Object> detailYn(String game_date,String part)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_date", game_date);
		paramMap.put("part", part);
		Map<String, Object> detailMap = service.getDetail2(paramMap);
		if(detailMap == null) {
			detailMap = new HashMap<String, Object>();
			detailMap.put("detailYn", "N");
		}else {
			detailMap.put("detailYn", "Y");
		}
		return detailMap;
	}
}
