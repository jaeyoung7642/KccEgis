package com.esoom.kcc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.esoom.kcc.common.AesUtil;
import com.esoom.kcc.common.IpUtil;
import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.common.ShaUtil;
import com.esoom.kcc.service.AdminService;
import com.esoom.kcc.service.CommonService;

@Controller
@RequestMapping("/esoomkccegis")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService service;
	@Autowired
	private CommonService commonService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;

	/*
	 * @Autowired private AdminService service;
	 */
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "/adminHeader", method = RequestMethod.GET)
	public ModelAndView header(ModelAndView mv) {
		mv.setViewName("admin/common/adminHeader");
		return mv;
	}
	@RequestMapping(value = "/adminLoginForm", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv,HttpServletRequest request) {
		String id = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("remember")) {
					id = cookie.getValue();
				}
			}
		}
		request.setAttribute("remember", id);
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public ModelAndView adminLogin(ModelAndView mv, HttpSession session, @RequestParam(value = "id") String id,
			@RequestParam(value = "password") String pwd,String remember,HttpServletResponse response) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(remember == null) {
			remember = "";
		}
		System.out.println("remeber : "+remember);
		paramMap.put("id", id);
		// 입력한 아이디로 사용자 정보 조회
		Map<String, Object> userInfo = service.getAdmin(paramMap);
		System.out.println("userInfo"+userInfo);
		if (userInfo != null) {
			if (remember.equals("on")) {
	            Cookie cookie = new Cookie("remember", userInfo.get("id").toString());
	            response.addCookie(cookie);
	        } else {
	            Cookie cookie = new Cookie("remember", "");
	            response.addCookie(cookie);
	        }
			// 비밀번호 암호화된 정보와 입력한 비밀번호 비교
//			if (bcryptPasswordEncoder.matches(pwd, userInfo.get("member_pwd").toString())) { // 로그인 성공
			if (pwd.equals(userInfo.get("pwd"))) { // 로그인 성공
				if("70".equals(userInfo.get("chk_grade"))) {
					System.out.println("7");
					session.setMaxInactiveInterval(30 * 60);
					session.setAttribute("user", userInfo);
					mv.setViewName("redirect:/esoomkccegis/fFreeList");
				}else {
					System.out.println("2");
					session.setMaxInactiveInterval(30 * 60);
					session.setAttribute("user", userInfo);
					mv.setViewName("redirect:/esoomkccegis/gScheduleList");
				}
			} else {// 비밀번호가 틀렸을 경우
				System.out.println("3");
				mv.addObject("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
				mv.setViewName("admin/adminLogin");
			}
		} else { // 아이디가 없을 경우
			System.out.println("4");
			mv.addObject("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
			mv.setViewName("admin/adminLogin");
		}
		return mv;
	}
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("redirect:/esoomkccegis/adminLoginForm");
		return mv;
	}
	@RequestMapping(value = "/gScheduleList", method = RequestMethod.GET)
	public ModelAndView gScheduleList(ModelAndView mv,HttpServletRequest request ,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "season", defaultValue = "01") String season,@RequestParam(value = "yyyymm", defaultValue = "202410") String yyyymm,
			@RequestParam(value = "round", defaultValue = "0") String round,@RequestParam(value = "state", defaultValue = "1") String state
			,@RequestParam(value = "ha", defaultValue = "1") String ha) throws Exception{
		// 쿼리로 담아갈 데이터맵
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season",season);
		paramMap.put("yyyymm",yyyymm);
		paramMap.put("round",round);
		paramMap.put("state",state);
		paramMap.put("ha",ha);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;

		// 한페이지당 보여줄 row
		int boardLimit = 10;
		
		// 검색 키워드
//		paramMap.put("select", select);
		
		// 상위리스트 카운트
		int listCount = service.getRequestcListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> gScheduleList = service.gScheduleList(pi, paramMap);
		if(gScheduleList != null) {
			for(Map m : gScheduleList) {
				String game_date = m.get("game_date").toString();
				String dateformat = game_date.substring(0, 4) + "." + game_date.substring(4, 6) + "." + game_date.substring(6, 8);
				m.put("game_date", dateformat);
				String game_start = m.get("game_start").toString();
				String timeformat = game_start.substring(0, 2) + ":" + game_start.substring(2,4);
				m.put("game_start", timeformat);
			}
		}
		mv.addObject("gScheduleList", gScheduleList);
		mv.addObject("season", season);
		mv.addObject("yyyymm", yyyymm);
		mv.addObject("round", round);
		mv.addObject("state", state);
		mv.addObject("ha", ha);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("admin/game/gScheduleList");
		return mv;
	}
	@RequestMapping(value = "/gScheduleDetail", method = RequestMethod.GET)
	public ModelAndView requestcDetail(ModelAndView mv,
			@RequestParam(value = "season_code", required = false) String season_code,
			@RequestParam(value = "game_code", required = false) String game_code,
			@RequestParam(value = "game_no", required = false) String game_no) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code != null ? season_code : "43");
		paramMap.put("game_code", game_code != null ?game_code:"01");
		paramMap.put("game_no", game_no);
		//장소셋팅
		List<Map<String, Object>> stadiumList = service.stadiumList(paramMap);
		//팀셋팅
		List<Map<String, Object>> teamList = service.teamList(paramMap);
		if(game_no!= null) {
			Map<String, Object> gScheduleDetail = service.gScheduleDetail(paramMap);
			String game_date = gScheduleDetail.get("game_date").toString();
			String dateformat = game_date.substring(0, 4) + "-" + game_date.substring(4, 6) + "-" + game_date.substring(6, 8);
			gScheduleDetail.put("game_date", dateformat);
			String game_start = gScheduleDetail.get("game_start").toString();
			String timeformat = game_start.substring(0, 2) + ":" + game_start.substring(2,4);
			gScheduleDetail.put("game_start", timeformat);
			resultMap.putAll(gScheduleDetail);
			String home_team = gScheduleDetail.get("home_team").toString();
			String away_team = gScheduleDetail.get("away_team").toString();
			String stadium_code = gScheduleDetail.get("stadium_code").toString();
			if(stadiumList != null && stadiumList.size()>0) {
				for(Map m : stadiumList) {
					if(stadium_code.equals(m.get("stadium_code"))) {
						m.put("selected", "selected");
					}
				}
			}
			if(teamList != null && teamList.size()>0) {
				for(Map m : teamList) {
					if(home_team.equals(m.get("team_code"))) {
						resultMap.put("home_team_nm", m.get("team_name_1"));
					}
					if(away_team.equals(m.get("team_code"))) {
						resultMap.put("away_team_nm", m.get("team_name_1"));
					}
				}
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
			List<Map<String, Object>> kccTeamList = service.playerDailyList(kccParam);
			List<Map<String, Object>> otherTeamList = service.playerDailyList(otherParam);
			mv.addObject("kccTeamList", kccTeamList);
			mv.addObject("otherTeamList", otherTeamList);
		}
		//쿼터셋팅
		List<Map<String, Object>> quarterList = service.quarterList(paramMap);
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

		mv.addObject("result", resultMap);
		mv.addObject("season_code", season_code);
		mv.addObject("game_code", game_code);
		mv.addObject("game_no", game_no);
		mv.addObject("stadiumList", stadiumList);
		mv.addObject("teamList", teamList);
		mv.setViewName("admin/game/gScheduleDetail");
		return mv;
	}
	@RequestMapping(value = "/gDailyRank", method = RequestMethod.GET)
	public ModelAndView gDailyRank(ModelAndView mv,HttpServletRequest request) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", "43");
		paramMap.put("game_code", "01");
		List<Map<String, Object>> DailyRankList = service.DailyRankList(paramMap);
		if(DailyRankList != null) {
			for(Map m : DailyRankList) {
				System.out.println(m.toString());
			}
		}
		mv.addObject("DailyRankList", DailyRankList);
		mv.setViewName("admin/game/gDailyRank");
		return mv;
	}
	@RequestMapping(value = "/pCoachProfileList", method = RequestMethod.GET)
	public ModelAndView pCoachProfileList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		// 상위리스트 카운트
		List posCode = new ArrayList();
		posCode.add("a");
		posCode.add("b");
		paramMap.put("posCode", posCode);
		int listCount = service.getCoachProfileListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> pCoachProfileList = service.coachProfileList(pi,paramMap);
		mv.addObject("pCoachProfileList", pCoachProfileList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("admin/player/pCoachProfileList");
		return mv;
	}
	@RequestMapping(value = "/pPlayerProfileList", method = RequestMethod.GET)
	public ModelAndView pPlayerProfileList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "show_yn", defaultValue = "Y") String show_yn,
			@RequestParam(value = "select", defaultValue = "all") String select) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		paramMap.put("keyWord", keyWord);
		paramMap.put("select", select);
		paramMap.put("show_yn", show_yn);
		// 상위리스트 카운트
		List posCode = new ArrayList();
		posCode.add("s");
		posCode.add("c");
		posCode.add("f");
		posCode.add("g");
		paramMap.put("posCode", posCode);
		int listCount = service.getCoachProfileListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> pPlayerProfileList = service.playerProfileList(pi, paramMap);
		mv.addObject("pPlayerProfileList", pPlayerProfileList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("show_yn", show_yn);
		mv.addObject("select", select);
		mv.setViewName("admin/player/pPlayerProfileList");
		return mv;
	}
	@RequestMapping(value = "/pSupportstaffProfileList", method = RequestMethod.GET)
	public ModelAndView pSupportstaffProfileList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		// 상위리스트 카운트
		List posCode = new ArrayList();
		posCode.add("m");
		posCode.add("t");
		posCode.add("j");
		posCode.add("i");
		paramMap.put("posCode", posCode);
		int listCount = service.getCoachProfileListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> pSupportstaffProfileList = service.pSupportstaffProfileList(pi,paramMap);
		mv.addObject("pSupportstaffProfileList", pSupportstaffProfileList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("admin/player/pSupportstaffProfileList");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/changeShow", method = RequestMethod.GET)
	public String changeShow(int plNo,ModelAndView mv,String show)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if("Y".equals(show)) {
			show = "N";
		}else {
			show = "Y";
		}
		paramMap.put("pl_no", plNo);
		paramMap.put("show", show);
		int result=service.changeShow(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/updateState", method = RequestMethod.GET)
	public String updateState(int num,ModelAndView mv)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.updateState(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/useYnCount", method = RequestMethod.GET)
	public int useYnCount(ModelAndView mv,String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.getUseynCount(paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/mainGoodsCount", method = RequestMethod.GET)
	public int mainGoodsCount(ModelAndView mv,String num,String category)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("category", category);
		int result=service.mainGoodsCount(paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/mainChkCount", method = RequestMethod.GET)
	public int mainChkCount(ModelAndView mv,String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.mainChkCount(paramMap);
		return result;
	}
	@RequestMapping(value = "/pCoachProfileWrite", method = RequestMethod.GET)
	public ModelAndView pCoachProfileWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num,
			@RequestParam(value = "msg", required = false) String msg) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> pCoachProfile = service.pCoachProfile(paramMap);
			resultMap.putAll(pCoachProfile);
			System.out.println(resultMap.toString());
		}
		System.out.println("msg================="+msg);
		if(msg != null && !"".equals(msg)) {
			mv.addObject("msg", msg);
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/player/pCoachProfileWrite");
		return mv;
	}
	@RequestMapping(value = "/pSupportstaffProfileWrite", method = RequestMethod.GET)
	public ModelAndView pSupportstaffProfileWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num,
			@RequestParam(value = "msg", required = false) String msg) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> pCoachProfile = service.pCoachProfile(paramMap);
			resultMap.putAll(pCoachProfile);
			System.out.println(resultMap.toString());
		}
		System.out.println("msg================="+msg);
		if(msg != null && !"".equals(msg)) {
			mv.addObject("msg", msg);
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/player/pSupportstaffProfileWrite");
		return mv;
	}
	@RequestMapping(value = "/pPlayerProfileWrite", method = RequestMethod.GET)
	public ModelAndView pPlayerProfileWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num,
			@RequestParam(value = "msg", required = false) String msg) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> pCoachProfile = service.pCoachProfile(paramMap);
			resultMap.putAll(pCoachProfile);
			System.out.println(resultMap.toString());
		}
		System.out.println("msg================="+msg);
		if(msg != null && !"".equals(msg)) {
			mv.addObject("msg", msg);
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/player/pPlayerProfileWrite");
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergePlayer", method = RequestMethod.POST)
	public ModelAndView mergePlayer(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "pl_webmain",required=false) MultipartFile pl_webmain,
			@RequestParam(value = "pl_webdetail",required=false) MultipartFile pl_webdetail,
			@RequestParam(value = "pl_actioncut_1",required=false) MultipartFile pl_actioncut_1,
			@RequestParam(value = "pl_actioncut_2",required=false) MultipartFile pl_actioncut_2,
			@RequestParam(value = "pl_actioncut_3",required=false) MultipartFile pl_actioncut_3)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		 String filePathTail = "player";
		 String num = request.getParameter("num");
	   	 String pl_no = request.getParameter("pl_no");
		 String pl_name = request.getParameter("pl_name");
		 String pl_pos_code = request.getParameter("pl_pos_code");
		 String pl_postion = "";
		 switch (pl_pos_code) {
			case "a":
				pl_postion = "감독";
				break;
			case "b":
				pl_postion = "코치";
				break;
			case "c":
				pl_postion = "센터";
				break;
			case "f":
				pl_postion = "포워드";
				break;
			case "g":
				pl_postion = "가드";
				break;
			case "s":
				pl_postion = "군입대";
				break;
			case "m":
				pl_postion = "매니저";
				break;
			case "t":
				pl_postion = "트레이너";
				break;
			case "j":
				pl_postion = "전력분석";
			case "i":
				pl_postion = "통역";
				break;
		}
		 String pl_ename = request.getParameter("pl_ename");
		 String pl_birthday = request.getParameter("pl_birthday");
		 String pl_height = request.getParameter("pl_height");
		 String pl_weight = request.getParameter("pl_weight");
		 String pl_show = request.getParameter("pl_show");
		 String pl_school = request.getParameter("pl_school");
		 String pl_order = request.getParameter("pl_order");
		 String pl_career = (request.getParameter("pl_career") != null ? request.getParameter("pl_career"): "");
		 String pl_prize = (request.getParameter("pl_prize") != null ? request.getParameter("pl_prize"): "");
		 String pl_back = request.getParameter("pl_back");
		 String pl_foot = request.getParameter("pl_foot");
		 String pl_rank = request.getParameter("pl_rank");
		 String pl_sns_code = request.getParameter("pl_sns_code");
		 String pl_sns_url =request.getParameter("pl_sns_url");
		 
		 
		 paramMap.put("num", num);
		 paramMap.put("pl_no", pl_no);
		 paramMap.put("pl_name", pl_name);
		 paramMap.put("pl_pos_code", pl_pos_code);
		 paramMap.put("pl_postion", pl_postion);
		 paramMap.put("pl_ename", pl_ename);
		 paramMap.put("pl_birthday", pl_birthday);
		 paramMap.put("pl_height", pl_height);
		 paramMap.put("pl_weight", pl_weight);
		 paramMap.put("pl_show", pl_show);
		 paramMap.put("pl_check", "Y");
		 paramMap.put("pl_school", pl_school);
		 paramMap.put("pl_order", pl_order);
		 paramMap.put("pl_career", pl_career);
		 paramMap.put("pl_back", pl_back);
		 paramMap.put("pl_prize", pl_prize);
		 paramMap.put("pl_foot", pl_foot);
		 paramMap.put("pl_rank", pl_rank);
		 paramMap.put("pl_sns_code", pl_sns_code);
		 paramMap.put("pl_sns_url", pl_sns_url);
		 
		 Map<String, Object> plNoCheckMap = service.pProfileCheck(paramMap);
		 if(plNoCheckMap != null) {
//			 RedirectView redirectView = new RedirectView(); // redirect url 설정
//			 redirectView.setUrl("pCoachProfileWrite?num="+num);
//			 redirectView.setExposeModelAttributes(false);
//			 mv.setView(redirectView);
			 if("a".equals(pl_pos_code)||"b".equals(pl_pos_code)) {//감독,코치
					mv.setViewName("redirect:/esoomkccegis/pCoachProfileWrite?num="+num);
				}else if("c".equals(pl_pos_code)||"f".equals(pl_pos_code)||"g".equals(pl_pos_code)||"s".equals(pl_pos_code)) {//선수
					mv.setViewName("redirect:/esoomkccegis/pPlayerProfileWrite?num="+num);
				}else {//지원스탭
					mv.setViewName("redirect:/esoomkccegis/pSupportstaffpfileWrite?num="+num);
				}
			 mv.addObject("msg", "중복된 코드입니다.코드를 변경해주세요.");
			 return mv;
		 }
		 //파일 저장
		 	if (pl_webmain != null) {
				if(!pl_webmain.isEmpty()) {
					String fileResult = commonService.filesave(pl_webmain,filePathTail);
					if(!"false".equals(fileResult)) {
						paramMap.put("pl_webmain", fileResult);
					}
				}else {
					paramMap.put("pl_webmain", request.getParameter("pl_webmain_bf"));
				}
			}
			if (pl_webdetail != null) {
				if(!pl_webdetail.isEmpty()) {
					String fileResult = commonService.filesave(pl_webdetail,filePathTail);
					if(!"false".equals(fileResult)) {
						paramMap.put("pl_webdetail", fileResult);
					}
				}else {
					paramMap.put("pl_webdetail", request.getParameter("pl_webdetail_bf"));
				}
			}
			if (pl_actioncut_1 != null) {
				if(!pl_actioncut_1.isEmpty()) {
					String fileResult = commonService.filesave(pl_actioncut_1,filePathTail);
					if(!"false".equals(fileResult)) {
						paramMap.put("pl_actioncut_1", fileResult);
					}
				}else {
					paramMap.put("pl_actioncut_1", request.getParameter("pl_actioncut_1_bf"));
				}
			}
			if (pl_actioncut_2 != null) {
				if(!pl_actioncut_2.isEmpty()) {
					String fileResult = commonService.filesave(pl_actioncut_2,filePathTail);
					if(!"false".equals(fileResult)) {
						paramMap.put("pl_actioncut_2", fileResult);
					}
				}else {
					paramMap.put("pl_actioncut_2", request.getParameter("pl_actioncut_2_bf"));
				}
			}
			if (pl_actioncut_3 != null) {
				if(!pl_actioncut_3.isEmpty()) {
					String fileResult = commonService.filesave(pl_actioncut_3,filePathTail);
					if(!"false".equals(fileResult)) {
						paramMap.put("pl_actioncut_3", fileResult);
					}
				}else {
					paramMap.put("pl_actioncut_3", request.getParameter("pl_actioncut_3_bf"));
				}
			}
		 int result = service.playerMerge(paramMap);
			if (result > 0) {
				
				if("a".equals(pl_pos_code)||"b".equals(pl_pos_code)) {//감독,코치
					mv.setViewName("redirect:/esoomkccegis/pCoachProfileList");
				}else if("c".equals(pl_pos_code)||"f".equals(pl_pos_code)||"g".equals(pl_pos_code)||"s".equals(pl_pos_code)) {//선수
					mv.setViewName("redirect:/esoomkccegis/pPlayerProfileList");
				}else {//지원스탭
					mv.setViewName("redirect:/esoomkccegis/pSupportstaffProfileList");
				}
			} else {
				mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
				if("a".equals(pl_pos_code)||"b".equals(pl_pos_code)) {
					mv.setViewName("admin/player/pCoachProfileList");
				}else if("c".equals(pl_pos_code)||"f".equals(pl_pos_code)||"g".equals(pl_pos_code)||"s".equals(pl_pos_code)) {
					mv.setViewName("admin/player/pPlayerProfileList");
				}else {
					mv.setViewName("admin/player/pCoachProfileList");
				}
			}

		return mv;
	}
	@RequestMapping(value = "/mNewsList", method = RequestMethod.GET)
	public ModelAndView mNewsList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "type", defaultValue = "card") String type) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("part", "news");
		// 토탈리스트 카운트
		int totalListCount = service.getTotalNewsListCount(paramMap);
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
		mv.addObject("totalListCount", totalListCount);
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
		mv.addObject("type", type);
		if("card".equals(type)) {
			mv.setViewName("admin/media/mNewsCardList");
		}else {
			mv.setViewName("admin/media/mNewsList");
		}
		return mv;
	}
	@RequestMapping(value = "/mNewsWrite", method = RequestMethod.GET)
	public ModelAndView mNewsWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_round","1");
		paramMap.put("game_code","01");
		//init
		List<Map<String, Object>> gameList = service.gameListPop(paramMap);
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				Map<String, Object> temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mediaMap = service.mediaMap(paramMap);
			if(mediaMap != null) {
				if(mediaMap.get("tags_nm")!= null) {
					String tags_nm = mediaMap.get("tags_nm").toString();
					mediaMap.put("tags_nm",tags_nm.replaceAll("@", ","));
				}
			}
			resultMap.putAll(mediaMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.addObject("gameList", gameList);
		mv.addObject("selectPlayer", selectPlayer);
		mv.setViewName("admin/media/mNewsWrite");
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeMedia", method = RequestMethod.POST)
	public ModelAndView mergeMedia(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "img1",required=false) MultipartFile img1,
			@RequestParam(value = "img2",required=false) MultipartFile img2)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		 String num = request.getParameter("num");
	   	 String subject = request.getParameter("subject");
		 String content = (request.getParameter("content") != null ? request.getParameter("content"): "");
		 String summary = request.getParameter("summary");
		 String visited = request.getParameter("visited");
		 String flag = request.getParameter("flag");
		 String part = request.getParameter("part");
		 String wtype = request.getParameter("wtype");
		 String linkurl = request.getParameter("linkurl");
		 String etc1 = request.getParameter("etc1");
		 String game_date = (request.getParameter("game_date") != null ? request.getParameter("game_date").replace("-", "") : "");
		 String game_date_nm = request.getParameter("game_date_nm");
		 String keyword_tag = request.getParameter("keyword_tag");
		 String tags = request.getParameter("tags")!=null?request.getParameter("tags").replaceAll(",", "@"):"";
		 String tags_nm = request.getParameter("tags_nm")!=null?request.getParameter("tags_nm").replaceAll(",", "@"):"";
		 String sDay = request.getParameter("sDay")!=null && !"".equals(request.getParameter("sDay"))?request.getParameter("sDay"):"1900-01-01";
			String sTime = request.getParameter("sTime")!=null && !"".equals(request.getParameter("sTime"))?request.getParameter("sTime"):"00";
			String sMinute = request.getParameter("sMinute")!=null && !"".equals(request.getParameter("sMinute"))?request.getParameter("sMinute"):"00";
			String eDay = request.getParameter("eDay")!=null && !"".equals(request.getParameter("eDay"))?request.getParameter("eDay"):"2079-06-06";
			String eTime = request.getParameter("eTime")!=null && !"".equals(request.getParameter("eTime"))?request.getParameter("eTime"):"00";
			String eMinute = request.getParameter("eMinute")!=null && !"".equals(request.getParameter("eMinute"))?request.getParameter("eMinute"):"00";
		
		 String sdate= sDay+" "+sTime+":"+sMinute;
		 String edate= eDay+" "+eTime+":"+eMinute;
		 paramMap.put("num", num);
		 paramMap.put("subject", subject);
		 paramMap.put("content", content);
		 paramMap.put("summary", summary);
		 paramMap.put("visited", visited);
		 paramMap.put("flag", flag);
		 paramMap.put("part", part);
		 paramMap.put("wtype", wtype);
		 paramMap.put("linkurl", linkurl);
		 paramMap.put("etc1", etc1);
		 paramMap.put("game_date", game_date);
		 paramMap.put("game_date_nm", game_date_nm);
		 paramMap.put("keyword_tag", keyword_tag);
		 paramMap.put("tags", tags);
		 paramMap.put("tags_nm", tags_nm);
		 paramMap.put("sdate", sdate);
		 paramMap.put("edate", edate);

		 //파일 저장
		 	if (img1 != null) {
				if(!img1.isEmpty()) {
					System.out.println("파일저장");
					String fileResult = commonService.filesave(img1,part);
					if(!"false".equals(fileResult)) {
						paramMap.put("img1", fileResult);
					}
				}else {
					paramMap.put("img1", request.getParameter("img1_bf"));
				}
			}
		 	if (img2 != null) {
		 		if(!img2.isEmpty()) {
		 			System.out.println("파일저장");
		 			String fileResult = commonService.filesave(img2,part);
		 			if(!"false".equals(fileResult)) {
		 				paramMap.put("img2", fileResult);
		 			}
		 		}else {
		 			paramMap.put("img2", request.getParameter("img2_bf"));
		 		}
		 	}
		 int result = service.mediaMerge(paramMap);
			if (result > 0) {
				if("news".equals(part)) {//뉴스
					mv.setViewName("redirect:/esoomkccegis/mNewsList");
				}else if("movie".equals(part)) {//영상
					mv.setViewName("redirect:/esoomkccegis/mMovieList");
				}else if("notice".equals(part)) {//공지사항
					mv.setViewName("redirect:/esoomkccegis/fNoticeList");
				}else if("event".equals(part)) {//이벤트
					mv.setViewName("redirect:/esoomkccegis/fEventList");
				}
			} else {
				mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
				if("news".equals(part)) {//뉴스
					mv.setViewName("admin/media/mNewsList");
				}else if("movie".equals(part)) {//영상
					mv.setViewName("admin/media/mMovieList");
				}else if("notice".equals(part)) {//공지사항
					mv.setViewName("admin/fanzone/fNoticeList");
				}else if("event".equals(part)) {//이벤트
					mv.setViewName("admin/fanzone/fEventList");
				}
			}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeMediaPhoto", method = RequestMethod.POST)
	public ModelAndView mergeMediaPhoto(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "img1",required=false) MultipartFile img1,
			@RequestParam(value = "img2",required=false) MultipartFile img2,
			@RequestParam(value="files", required=false) List<MultipartFile> files)throws Exception {
		String filePathTail = "gallery";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String subject = request.getParameter("subject");
		String content = (request.getParameter("content") != null ? request.getParameter("content"): "");
		String summary = request.getParameter("summary");
		String visited = request.getParameter("visited");
		String flag = request.getParameter("flag");
		String part = request.getParameter("part");
		String wtype = request.getParameter("wtype");
		String linkurl = request.getParameter("linkurl");
		String etc1 = request.getParameter("etc1");
		String game_date = (request.getParameter("game_date") != null ? request.getParameter("game_date").replace("-", "") : "");
		String game_date_nm = request.getParameter("game_date_nm");
		String sDay = request.getParameter("sDay")!=null && !"".equals(request.getParameter("sDay"))?request.getParameter("sDay"):"1900-01-01";
		String sTime = request.getParameter("sTime")!=null && !"".equals(request.getParameter("sTime"))?request.getParameter("sTime"):"00";
		String sMinute = request.getParameter("sMinute")!=null && !"".equals(request.getParameter("sMinute"))?request.getParameter("sMinute"):"00";
		String eDay = request.getParameter("eDay")!=null && !"".equals(request.getParameter("eDay"))?request.getParameter("eDay"):"2079-06-06";
		String eTime = request.getParameter("eTime")!=null && !"".equals(request.getParameter("eTime"))?request.getParameter("eTime"):"00";
		String eMinute = request.getParameter("eMinute")!=null && !"".equals(request.getParameter("eMinute"))?request.getParameter("eMinute"):"00";
		
		String sdate= sDay+" "+sTime+":"+sMinute;
		String edate= eDay+" "+eTime+":"+eMinute;
		paramMap.put("num", num);
		paramMap.put("subject", subject);
		paramMap.put("content", content);
		paramMap.put("summary", summary);
		paramMap.put("visited", visited);
		paramMap.put("flag", flag);
		paramMap.put("part", part);
		paramMap.put("wtype", wtype);
		paramMap.put("linkurl", linkurl);
		paramMap.put("etc1", etc1);
		paramMap.put("game_date", game_date);
		paramMap.put("game_date_nm", game_date_nm);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		
		//파일 저장
		if (img1 != null) {
			if(!img1.isEmpty()) {
				String fileResult = commonService.filesave(img1,filePathTail);
				if(!"false".equals(fileResult)) {
					paramMap.put("img1", fileResult);
				}
			}else {
				paramMap.put("img1", request.getParameter("img1_bf"));
			}
		}
		//파일 저장
		if (img2 != null) {
			if(!img2.isEmpty()) {
				String fileResult = commonService.filesave(img2,filePathTail);
				if(!"false".equals(fileResult)) {
					paramMap.put("img2", fileResult);
				}
			}else {
				paramMap.put("img2", request.getParameter("img2_bf"));
			}
		}
		int result = service.mediaMerge(paramMap);
		
		if (result > 0) {
			String info_num = "";
			if(num == null || "".equals(num)) {
				Map<String,Object> lastMediaMap = service.lastMediaMap(paramMap);
				info_num = lastMediaMap.get("num").toString();
			}else {
				info_num = num;
			}
			String[] photofile_bf_arr = request.getParameterValues("photofile_bf");
			String[] tags_nm_arr = request.getParameterValues("tags_nm");
			for(int i=0;i<tags_nm_arr.length;i++) {
			}
			String[] tags_arr = request.getParameterValues("tags");
			String[] photo_num_arr = request.getParameterValues("photo_num");
			int photoSaveCnt = 0;
			int size = files.size();
			if(size>0) {
				for(int i=0;i<size;i++) {
					Map<String,Object> paramMap2 = new HashMap<String, Object>();
					paramMap2.put("tags_nm", tags_nm_arr[i].replaceAll(",", "@"));
					paramMap2.put("tags", tags_arr[i].replaceAll(",", "@"));
					paramMap2.put("num", photo_num_arr[i].equals("")?null:photo_num_arr[i]);
					if (files.get(i) != null) {
						if(!files.get(i).isEmpty()) {
							String fileResult = commonService.filesave(files.get(i),filePathTail);
							paramMap2.put("info_num", info_num);
							if(!"false".equals(fileResult)) {
								paramMap2.put("photofile", fileResult);
							}
						}else {
							if(photofile_bf_arr!=null) {
								paramMap2.put("photofile", photofile_bf_arr[i]);
							}else {
								paramMap2.put("info_num", info_num);
								paramMap2.put("photofile", "");
							}
						}
					}
					photoSaveCnt += service.mediaPhotoMerge(paramMap2);
				}
				if(photoSaveCnt<size) {
					mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
					mv.setViewName("admin/fanzone/mPhotoList");
				}else {
					mv.setViewName("redirect:/esoomkccegis/mPhotoList");
				}
			}else {
				mv.setViewName("redirect:/esoomkccegis/mPhotoList");
			}
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/fanzone/mPhotoList");
		}
		return mv;
	}
	@RequestMapping(value = "/mMovieList", method = RequestMethod.GET)
	public ModelAndView mMovieList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "etc1", defaultValue = "all") String etc1) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("etc1", etc1);
		paramMap.put("part", "movie");
		//토탈리스트 카운트
		int totalListCount = service.getTotalNoticeListCount(paramMap);
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
					gameNm = dateformat + " vs " + m.get("away_team_name");
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
		List<Map<String, Object>> movieList = service.MovieList(paramMap);
		if(movieList != null && movieList.size() >0) {
			for(Map m: movieList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		mv.addObject("totalListCount", totalListCount);
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
		mv.addObject("etc1", etc1);
		mv.setViewName("admin/media/mMovieList");
		return mv;
	}
	@RequestMapping(value = "/mMovieWrite", method = RequestMethod.GET)
	public ModelAndView mMovieWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//init
		paramMap.put("game_round","1");
		paramMap.put("game_code","01");
		//init
		List<Map<String, Object>> gameList = service.gameListPop(paramMap);
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				Map<String, Object> temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mediaMap = service.mediaMap(paramMap);
			if(mediaMap != null) {
				if(mediaMap.get("tags_nm")!= null) {
					String tags_nm = mediaMap.get("tags_nm").toString();
					mediaMap.put("tags_nm",tags_nm.replaceAll("@", ","));
				}
			}
			resultMap.putAll(mediaMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.addObject("gameList", gameList);
		mv.addObject("selectPlayer", selectPlayer);
		mv.setViewName("admin/media/mMovieWrite");
		return mv;
	}
	@RequestMapping(value = "/mGalleryList", method = RequestMethod.GET)
	public ModelAndView mGalleryList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "etc1", defaultValue = "all") String etc1) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("etc1", etc1);
		paramMap.put("part", "gallery");
		//토탈리스트 카운트
		int totalListCount = service.getTotalNoticeListCount(paramMap);
		// 상위리스트 카운트
		int listCount = service.getPhotoListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> photoList = service.photoList(paramMap);
		mv.addObject("totalListCount", totalListCount);
		mv.addObject("photoList", photoList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("etc1", etc1);
		mv.setViewName("admin/media/mGalleryList");
		return mv;
	}
	@RequestMapping(value = "/mPhotoList", method = RequestMethod.GET)
	public ModelAndView mPhotoList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "round", defaultValue = "all") String round,
			@RequestParam(value = "game", defaultValue = "all") String game,
			@RequestParam(value = "player", defaultValue = "all") String player,
			@RequestParam(value = "sdate", required = false) String sdate,
			@RequestParam(value = "edate", required = false) String edate,
			@RequestParam(value = "etc1", defaultValue = "all") String etc1) throws Exception{
		System.out.println("photoList");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		paramMap.put("round", round);
		paramMap.put("game", game);
		paramMap.put("player", player);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		paramMap.put("etc1", etc1);
		paramMap.put("part", "photo");
		//토탈리스트 카운트
		int totalListCount = service.getTotalNoticeListCount(paramMap);
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
					gameNm = dateformat + " vs " + m.get("away_team_name");
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
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> photoList = service.photoList(pi, paramMap);
		if(photoList != null && photoList.size() >0) {
			for(Map m: photoList) {
				String wdate = m.get("wdate").toString();
				String dateformat = wdate.substring(0, 10);
				m.put("wdateformat", dateformat);
			}
		}
		
		mv.addObject("totalListCount", totalListCount);
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
		mv.addObject("etc1", etc1);
		mv.setViewName("admin/media/mPhotoList");
		return mv;
	}
	@RequestMapping(value = "/mPhotoWrite", method = RequestMethod.GET)
	public ModelAndView mPhotoWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_round","1");
		paramMap.put("game_code","01");
		//init
		List<Map<String, Object>> gameList = service.gameListPop(paramMap);
		List<Map<String, Object>> playerList = service.playerList(paramMap);
		List<Map<String,Object>> selectPlayer = new ArrayList<Map<String,Object>>();
		if(playerList != null && playerList.size() >0) {
			for(Map m: playerList) {
				String playerCd = m.get("pl_no").toString();
				String playerNm =m.get("pl_name").toString();
				Map<String, Object> temp2 = new HashMap<String, Object>();
				temp2.put("playerCd", playerCd);
				temp2.put("playerNm", playerNm);
				selectPlayer.add(temp2);
			}
		}
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mediaMap = service.mediaMap(paramMap);
			resultMap.putAll(mediaMap);
			System.out.println(resultMap);
			List<Map<String, Object>> photoList = service.newsPhotoList(paramMap);
			for(Map m:photoList) {
				m.put("tags_nm",m.get("tagname") != null?m.get("tagname").toString().replaceAll("@", ","):"");
			}
			resultMap.put("photoList", photoList);
		}
		mv.addObject("result", resultMap);
		mv.addObject("gameList", gameList);
		mv.addObject("selectPlayer", selectPlayer);
		mv.setViewName("admin/media/mPhotoWrite");
		return mv;
	}
	@RequestMapping(value = "/mGalleryDetail", method = RequestMethod.GET)
	public ModelAndView mGalleryDetail(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		
		Map<String, Object> mediaMap = service.mediaMap(paramMap);
		resultMap.putAll(mediaMap);
		mv.addObject("result", resultMap);
		mv.setViewName("admin/media/mGalleryDetail");
		return mv;
	}
	@RequestMapping(value = "/fNoticeList", method = RequestMethod.GET)
	public ModelAndView fNoticeList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "flag", defaultValue = "N") String flag) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		paramMap.put("keyWord", keyWord);
		paramMap.put("flag", flag);
		paramMap.put("part", "notice");
		int totalListCount = service.getTotalNoticeListCount(paramMap);
		
		int listCount = service.getNoticeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> noticeList = service.noticeList(pi, paramMap);
		if("N".equals(flag)) {
			List<Map<String, Object>> topNoticeList = service.topNoticeList(paramMap);
			mv.addObject("topNoticeList", topNoticeList);
		}
		mv.addObject("noticeList", noticeList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("totalListCount", totalListCount);
		mv.addObject("flag", flag);
		mv.setViewName("admin/fanzone/fNoticeList");
		return mv;
	}
	@RequestMapping(value = "/eProposalList", method = RequestMethod.GET)
	public ModelAndView proposalList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		paramMap.put("keyWord", keyWord);
		int totalListCount = service.getTotalProposalListCount(paramMap);
		
		int listCount = service.getProposalListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> proposalList = service.proposalList(paramMap);
		mv.addObject("proposalList", proposalList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/etc/eProposalList");
		return mv;
	}
	@RequestMapping(value = "/fWallpaperList", method = RequestMethod.GET)
	public ModelAndView fWallpaperList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		int totalListCount = service.getTotalWallpaperCount(paramMap);
		
		int listCount = service.getWallpaperCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> wallpaperList = service.wallpaperList(paramMap);
		mv.addObject("wallpaperList", wallpaperList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/fanzone/fWallpaperList");
		return mv;
	}
	@RequestMapping(value = "/fWallpaperWrite", method = RequestMethod.GET)
	public ModelAndView fWallpaperWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> wallpaperMap = service.wallpaperMap(paramMap);
			resultMap.putAll(wallpaperMap);
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/fanzone/fWallpaperWrite");
		return mv;
	}
	@RequestMapping(value = "/fNoticeWrite", method = RequestMethod.GET)
	public ModelAndView fNoticeWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mediaMap = service.mediaMap(paramMap);
			resultMap.putAll(mediaMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/fanzone/fNoticeWrite");
		return mv;
	}
	@RequestMapping(value = "/eProposalDetail", method = RequestMethod.GET)
	public ModelAndView eProposalDetail(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> proposalDetail = service.proposalDetail(paramMap);
			resultMap.putAll(proposalDetail);
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/etc/eProposalDetail");
		return mv;
	}
	@RequestMapping(value = "/fFreeWrite", method = RequestMethod.GET)
	public ModelAndView fFreeWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num,HttpSession session) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			//수정
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> freeMap = service.freeMap(paramMap);
			resultMap.putAll(freeMap);
		}else {
			//등록
			Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("user");
			resultMap.put("id",userInfo.get("id"));
			if("adm".equals(userInfo.get("id"))) {
				resultMap.put("writer","KCC농구단");
			}else {
				resultMap.put("writer",userInfo.get("name"));
			}
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/fanzone/fFreeWrite");
		return mv;
	}
	@RequestMapping(value = "/fFreeDetail", method = RequestMethod.GET)
	public ModelAndView fFreeDetail(ModelAndView mv,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage") Integer listpage,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "chk_del", defaultValue = "N") String chk_del,
			@RequestParam(value = "title", defaultValue = "N") String title,
			@RequestParam(value = "content", defaultValue = "N") String content,
			@RequestParam(value = "writer", defaultValue = "N") String writer,
			@RequestParam(value = "tail", defaultValue = "N") String tail,
			@RequestParam(value = "tailWriter", defaultValue = "N") String tailWriter,
			@RequestParam(value = "sdate", defaultValue = "") String sdate,
			@RequestParam(value = "edate", defaultValue = "") String edate,
			@RequestParam(value = "num") String num) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		
		Map<String, Object> freeMap = service.freeMap(paramMap);
		resultMap.putAll(freeMap);
		int listCount = service.getFreeTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> freeTailList = service.freeTailList(paramMap);
		resultMap.put("freeTailList", freeTailList);
		
		paramMap.put("chk_del", chk_del);
		paramMap.put("keyWord", keyWord);
		paramMap.put("title", title);
		paramMap.put("content", content);
		paramMap.put("writer", writer);
		paramMap.put("tail", tail);
		paramMap.put("tailWriter", tailWriter);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		
		int listCount2 = service.getFreeListCount(paramMap);
		PageInfo pi2 = Pagination.getPageInfo(listpage, listCount2, boardLimit);
		paramMap.put("limit", pi2.getBoardLimit());
		paramMap.put("currentPage", listpage);
		System.out.println(paramMap.toString());
		List<Map<String, Object>> freeList = service.freeList(paramMap);
		List<Map<String, Object>> topFreeList = service.topFreeList(paramMap);
		mv.addObject("freeList", freeList);
		mv.addObject("topFreeList", topFreeList);
		
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("currentPage2", listpage);
		mv.addObject("maxPage2", pi2.getMaxPage());
		mv.addObject("chk_del", chk_del);
		mv.addObject("keyWord", keyWord);
		mv.addObject("title", title);
		mv.addObject("content", content);
		mv.addObject("writer", writer);
		mv.addObject("tail", tail);
		mv.addObject("tailWriter", tailWriter);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		
		
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("result", resultMap);
		mv.setViewName("admin/fanzone/fFreeDetail");
		return mv;
	}
	@RequestMapping(value = "/fFreeList", method = RequestMethod.GET)
	public ModelAndView fFreeList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "chk_del", defaultValue = "N") String chk_del,
			@RequestParam(value = "title", defaultValue = "N") String title,
			@RequestParam(value = "content", defaultValue = "N") String content,
			@RequestParam(value = "writer", defaultValue = "N") String writer,
			@RequestParam(value = "tail", defaultValue = "N") String tail,
			@RequestParam(value = "tailWriter", defaultValue = "N") String tailWriter,
			@RequestParam(value = "sdate", defaultValue = "") String sdate,
			@RequestParam(value = "edate", defaultValue = "") String edate) throws Exception{
		if("".equals(sdate)&&"".equals(edate)) {
			// 오늘 날짜 가져오기
	        LocalDate today = LocalDate.now();
	        // 1년 전 날짜 계산
	        LocalDate oneYearAgo = today.minusYears(1);
	        // 원하는 형식으로 포맷터 생성
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        // 날짜를 형식에 맞게 변환
	        String formattedToday = today.format(formatter);
	        String formattedOneYearAgo = oneYearAgo.format(formatter);
	        sdate = formattedOneYearAgo;
	        edate = formattedToday;
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		paramMap.put("chk_del", chk_del);
		paramMap.put("keyWord", keyWord);
		paramMap.put("title", title);
		paramMap.put("content", content);
		paramMap.put("writer", writer);
		paramMap.put("tail", tail);
		paramMap.put("tailWriter", tailWriter);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		
		int totalListCount = service.getTotalFreeListCount(paramMap);
		int listCount = service.getFreeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		System.out.println(paramMap.toString());
		List<Map<String, Object>> freeList = service.freeList(paramMap);
		List<Map<String, Object>> topFreeList = service.topFreeList(paramMap);
		mv.addObject("freeList", freeList);
		mv.addObject("topFreeList", topFreeList);
		
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("chk_del", chk_del);
		mv.addObject("keyWord", keyWord);
		mv.addObject("title", title);
		mv.addObject("content", content);
		mv.addObject("writer", writer);
		mv.addObject("tail", tail);
		mv.addObject("tailWriter", tailWriter);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/fanzone/fFreeList");
		return mv;
	}
	@RequestMapping(value = "/cKccAdList", method = RequestMethod.GET)
	public ModelAndView cKccAdList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "select", defaultValue = "all") String select) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 8;
		paramMap.put("keyWord", keyWord);
		paramMap.put("select", select);
		
		int listCount = service.getKccAdListCount(paramMap);
		int totalListCount = service.getTotalKccAdListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> cKccAdList = service.cKccAdList(paramMap);

		mv.addObject("totalListCount", totalListCount);
		mv.addObject("cKccAdList", cKccAdList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("select", select);
		mv.setViewName("admin/club/cKccAdList");
		return mv;
	}
	@RequestMapping(value = "/cKccAdWrite", method = RequestMethod.GET)
	public ModelAndView cKccAdWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> kccAdMap = service.kccAdMap(paramMap);
			resultMap.putAll(kccAdMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/club/cKccAdWrite");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/changeChkDel", method = RequestMethod.GET)
	public String changeChkDel(int num,ModelAndView mv,String chkDel)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if("Y".equals(chkDel)) {
			chkDel = "N";
		}else {
			chkDel = "Y";
		}
		paramMap.put("num", num);
		paramMap.put("chkDel", chkDel);
		int result=service.changeChkDel(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/changeYn", method = RequestMethod.GET)
	public String changeYn(int num,ModelAndView mv,String main_chk)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if("Y".equals(main_chk)) {
			main_chk = "N";
		}else {
			main_chk = "Y";
		}
		paramMap.put("num", num);
		paramMap.put("main_chk", main_chk);
		int result=service.changeYn(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/changeUseYn", method = RequestMethod.GET)
	public String changeUseYn(int num,ModelAndView mv,String use_yn)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if("Y".equals(use_yn)) {
			use_yn = "N";
		}else {
			use_yn = "Y";
		}
		paramMap.put("num", num);
		paramMap.put("main_chk", use_yn);
		int result=service.changeUseYn(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/orderSave", method = RequestMethod.GET)
	public String orderSave(@RequestParam(value="num[]") int[] num,ModelAndView mv,@RequestParam(value="order[]")int[] order)throws Exception {
		int resultCnt = 0;
		String result ="true";
		for(int i=0;i<num.length;i++) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num[i]);
			paramMap.put("order", order[i]);
			int cnt=service.orderSave(paramMap);
			if(cnt>0) {
				resultCnt++; 
			}
		}
		if(resultCnt<num.length) {
			result = "false";
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/bannerOrderSave", method = RequestMethod.GET)
	public String bannerOrderSave(@RequestParam(value="num[]") int[] num,ModelAndView mv,@RequestParam(value="order[]")int[] order)throws Exception {
		int resultCnt = 0;
		String result ="true";
		for(int i=0;i<num.length;i++) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num[i]);
			paramMap.put("order", order[i]);
			int cnt=service.bannerOrderSave(paramMap);
			if(cnt>0) {
				resultCnt++; 
			}
		}
		if(resultCnt<num.length) {
			result = "false";
		}
		return result;
	}
	@RequestMapping(value = "/ePopupWrite", method = RequestMethod.GET)
	public ModelAndView ePopupWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> popupMap = service.popupMap(paramMap);
			resultMap.putAll(popupMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/etc/ePopupWrite");
		return mv;
	}
	@RequestMapping(value = "/eMainSlideWrite", method = RequestMethod.GET)
	public ModelAndView eMainSlideWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mainSlideMap = service.mainSlideMap(paramMap);
			resultMap.putAll(mainSlideMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/etc/eMainSlideWrite");
		return mv;
	}
	@RequestMapping(value = "/mMemberWrite", method = RequestMethod.GET)
	public ModelAndView mMemberWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> memberMap = service.memberMap(paramMap);
			if(memberMap != null) {
				String jumin_dec = aesUtil.decryptAes2(memberMap.get("jumin").toString()); 
				String email_dec = aesUtil.decryptAes2(memberMap.get("email").toString()); 
				String addr_dec = aesUtil.decryptAes2(memberMap.get("addr").toString()); 
				String daddr_dec = aesUtil.decryptAes2(memberMap.get("daddr").toString()); 
				String htel_dec = aesUtil.decryptAes2(memberMap.get("tel").toString()); 
				memberMap.put("jumin_dec", jumin_dec);
				memberMap.put("email_dec", email_dec);
				memberMap.put("addr_dec", addr_dec);
				memberMap.put("daddr_dec", daddr_dec);
				memberMap.put("htel_dec", htel_dec);
			}
			resultMap.putAll(memberMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/member/mMemberWrite");
		return mv;
	}
	@RequestMapping(value = "/mSearchWrite", method = RequestMethod.GET)
	public ModelAndView mSearchWrite(ModelAndView mv) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String, Object>> searchKeywordList = service.searchKeywordList(paramMap);
		int listCount = searchKeywordList.size();
		mv.addObject("searchKeywordList", searchKeywordList);
		mv.addObject("listCount", listCount);
		mv.setViewName("admin/media/mSearchWrite");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/insertSearchKeyword", method = RequestMethod.GET)
	public String insertSearchKeyword(ModelAndView mv,String searchKeyword)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchKeyword", searchKeyword);
		int result=service.insertSearchKeyword(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/insertFreeTail", method = RequestMethod.POST)
	public String insertFreeTail(ModelAndView mv,String content,int num,HttpSession session,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("info_num", num);
		paramMap.put("content", content);
		Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("user");
		paramMap.put("id",userInfo.get("id"));
		if("adm".equals(userInfo.get("id"))) {
			paramMap.put("writer","KCC농구단");
		}else {
			paramMap.put("writer",userInfo.get("name"));
		}
		String ip = ipUtil.getClientIP(request);
		paramMap.put("ip", ip);
		int result=service.insertFreeTail(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/insertEventTail", method = RequestMethod.POST)
	public String insertEventTail(ModelAndView mv,String content,int num,String part,HttpSession session,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("info_num", num);
		paramMap.put("content", content);
		paramMap.put("part", part);
		Map<String,Object> userInfo = (Map<String, Object>) session.getAttribute("user");
		paramMap.put("id",userInfo.get("id"));
		if("adm".equals(userInfo.get("id"))) {
			paramMap.put("writer","KCC농구단");
		}else {
			paramMap.put("writer",userInfo.get("name"));
		}
		String ip = ipUtil.getClientIP(request);
		paramMap.put("ip", ip);
		int result=service.insertEventTail(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteWallpaper", method = RequestMethod.GET)
	public String deleteWallpaper(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteWallpaper(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteSearchKeyword", method = RequestMethod.GET)
	public String deleteSearchKeyword(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteSearchKeyword(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteTail", method = RequestMethod.GET)
	public String deleteTail(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteTail(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFreeTail", method = RequestMethod.GET)
	public String deleteFreeTail(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteFreeTail(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteFree", method = RequestMethod.GET)
	public String deleteFree(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteFree(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteMainSlide", method = RequestMethod.GET)
	public String deleteMainSlide(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteMainSlide(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteMainGoods", method = RequestMethod.GET)
	public String deleteMainGoods(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteMainGoods(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteMember(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deletePlayer", method = RequestMethod.GET)
	public String deletePlayer(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deletePlayer(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteNews", method = RequestMethod.GET)
	public String deleteNews(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteNews(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteKccAd", method = RequestMethod.GET)
	public String deleteKccAd(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deleteKccAd(paramMap);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deletePopup", method = RequestMethod.GET)
	public String deletePopup(ModelAndView mv,int num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.deletePopup(paramMap);
		return String.valueOf(result);
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeSearchKeyword", method = RequestMethod.POST)
	public ModelAndView mergeSearchKeyword(ModelAndView mv,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String, Object>> searchKeywordList = new ArrayList<Map<String,Object>>();
		 String[] orders = request.getParameterValues("orders");
		 String[] keywords = request.getParameterValues("keywords");
		 service.deleteSearchKeyword(paramMap);
		 for(int i=0;i<9;i++) {
			 if(!"".equals(keywords[i])) {
				 Map<String, Object> tempMap = new HashMap<String, Object>();
				 tempMap.put("search_keyword", keywords[i]);
				 tempMap.put("view_order", orders[i]);
				 searchKeywordList.add(tempMap);
			 }
		 }
		 paramMap.put("list", searchKeywordList);
		 int result = service.insertSearchKeyword(paramMap);
		 if (result > 0) {
				mv.setViewName("redirect:/esoomkccegis/mSearchWrite");
			} else {
				mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
				mv.setViewName("admin/media/mSearchWrite");
			}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeKccAd", method = RequestMethod.POST)
	public ModelAndView mergeKccAd(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "thumbnail",required=false) MultipartFile thumbnail,
			@RequestParam(value = "downfile",required=false) MultipartFile downfile)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String adgroup = request.getParameter("adgroup");
		String addr = request.getParameter("addr");
		String mvideo = request.getParameter("mvideo");
		
		paramMap.put("num", num);
		paramMap.put("title", title);
		paramMap.put("adgroup", adgroup);
		paramMap.put("addr", addr);
		paramMap.put("mvideo", mvideo);
		String filePathTail = "kccad";
		
		//파일 저장
		if (thumbnail != null) {
			if(!thumbnail.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(thumbnail,filePathTail);
				if(fileResult != null) {
					paramMap.put("thumbnail", fileResult.get("fileName"));
					paramMap.put("thumbnail_original", fileResult.get("fileNameOrg"));
				}
			}else {
				paramMap.put("thumbnail", request.getParameter("thumbnail_bf"));
				paramMap.put("thumbnail_original", request.getParameter("thumbnail_original_bf"));
			}
		}
		//파일 저장
		if (downfile != null) {
			if(!downfile.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(downfile,filePathTail);
				if(fileResult != null) {
					paramMap.put("downfile", fileResult.get("fileName"));
					paramMap.put("downfile_original", fileResult.get("fileNameOrg"));
				}
			}else {
				paramMap.put("downfile", request.getParameter("downfile_bf"));
				paramMap.put("downfile_original", request.getParameter("downfile_original_bf"));
			}
		}
		int result = service.mergeKccAd(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/cKccAdList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/media/cKccAdList");
		}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeWallpaper", method = RequestMethod.POST)
	public ModelAndView mergeWallpaper(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "img1",required=false) MultipartFile img1,
			@RequestParam(value = "img2",required=false) MultipartFile img2)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String subject = request.getParameter("subject");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		month = Integer.parseInt(month) < 10 ? "0"+Integer.parseInt(month) : month;
		
		
		paramMap.put("num", num);
		paramMap.put("subject", subject);
		paramMap.put("year", year);
		paramMap.put("month", month);
		paramMap.put("year_month", year+month);
		
		//파일 저장
		if (img1 != null) {
			if(!img1.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(img1,"wallpaper");
				if(fileResult != null) {
					paramMap.put("img1", fileResult.get("fileName"));
					paramMap.put("img1_org", fileResult.get("fileNameOrg"));
				}
			}else {
				paramMap.put("img1", request.getParameter("img1_bf"));
				paramMap.put("img1_org", request.getParameter("img1_org_bf"));
			}
		}
		//파일 저장
		if (img2 != null) {
			if(!img2.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(img2,"wallpaper");
				if(fileResult != null) {
					paramMap.put("img2", fileResult.get("fileName"));
					paramMap.put("img2_org", fileResult.get("fileNameOrg"));
				}
			}else {
				paramMap.put("img2", request.getParameter("img2_bf"));
				paramMap.put("img2_org", request.getParameter("img2_org_bf"));
			}
		}
		int result = service.mergeWallpaper(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/fWallpaperList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/fanzone/fWallpaperList");
		}
		return mv;
	}
	@RequestMapping(value = "/mergeFree", method = RequestMethod.POST)
	public ModelAndView mergeFree(ModelAndView mv,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String writer = request.getParameter("writer");
		String flag = request.getParameter("flag");
		String ip = ipUtil.getClientIP(request);
		paramMap.put("num", num);
		paramMap.put("subject", subject);
		paramMap.put("content", content);
		paramMap.put("flag", flag);
		paramMap.put("id", id);
		paramMap.put("writer", writer);
		paramMap.put("ip", ip);
		
		int result = service.mergeFree(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/fFreeList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/fanzone/fFreeList");
		}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergePopup", method = RequestMethod.POST)
	public ModelAndView mergePopup(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "pop_img",required=false) MultipartFile pop_img,
			@RequestParam(value = "pop_img2",required=false) MultipartFile pop_img2)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String subject = request.getParameter("subject");
		String map_chk = request.getParameter("map_chk");
		String map_target = request.getParameter("map_target");
		String map_url = request.getParameter("map_url");
		String order = request.getParameter("order");
		String main_chk = request.getParameter("main_chk");
		String sDay = request.getParameter("sDay")!=null && !"".equals(request.getParameter("sDay"))?request.getParameter("sDay"):"1900-01-01";
		String sTime = request.getParameter("sTime")!=null && !"".equals(request.getParameter("sTime"))?request.getParameter("sTime"):"00";
		String sMinute = request.getParameter("sMinute")!=null && !"".equals(request.getParameter("sMinute"))?request.getParameter("sMinute"):"00";
		String eDay = request.getParameter("eDay")!=null && !"".equals(request.getParameter("eDay"))?request.getParameter("eDay"):"2079-06-06";
		String eTime = request.getParameter("eTime")!=null && !"".equals(request.getParameter("eTime"))?request.getParameter("eTime"):"00";
		String eMinute = request.getParameter("eMinute")!=null && !"".equals(request.getParameter("eMinute"))?request.getParameter("eMinute"):"00";
		String filePathTail = "popup";
		String sdate= sDay+" "+sTime+":"+sMinute;
		String edate= eDay+" "+eTime+":"+eMinute;
		System.out.println(sdate);
		System.out.println(edate);
		paramMap.put("num", num);
		paramMap.put("subject", subject);
		paramMap.put("map_chk", map_chk);
		paramMap.put("map_target", map_target);
		paramMap.put("map_url", map_url);
		paramMap.put("order", order);
		paramMap.put("main_chk", main_chk);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		
		//파일 저장
		if (pop_img != null) {
			if(!pop_img.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(pop_img,filePathTail);
				if(fileResult != null) {
					paramMap.put("pop_img", fileResult.get("fileName"));
				}
			}else {
				paramMap.put("pop_img", request.getParameter("pop_img_bf"));
			}
		}
		if (pop_img2 != null) {
			if(!pop_img2.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(pop_img2,filePathTail);
				if(fileResult != null) {
					paramMap.put("pop_img2", fileResult.get("fileName"));
				}
			}else {
				paramMap.put("pop_img2", request.getParameter("pop_img2_bf"));
			}
		}
		int result = service.mergePopup(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/ePopupList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/ePopupList");
		}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeMainSlide", method = RequestMethod.POST)
	public ModelAndView mergeMainSlide(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "img1",required=false) MultipartFile img1,
			@RequestParam(value = "img2",required=false) MultipartFile img2)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String links = request.getParameter("links");
		String use_yn = request.getParameter("use_yn");
		String banner_order = request.getParameter("banner_order");
		String filePathTail = "main_banner";
		
		paramMap.put("num", num);
		paramMap.put("title", title);
		paramMap.put("links", links);
		paramMap.put("use_yn", use_yn);
		paramMap.put("banner_order", use_yn.equals("Y")?banner_order:null);
		
		//파일 저장
		if (img1 != null) {
			if(!img1.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(img1,filePathTail);
				if(fileResult != null) {
					paramMap.put("img1", fileResult.get("fileName"));
				}
			}else {
				paramMap.put("img1", request.getParameter("img1_bf"));
			}
		}
		//파일 저장
		if (img2 != null) {
			if(!img2.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(img2,filePathTail);
				if(fileResult != null) {
					paramMap.put("img2", fileResult.get("fileName"));
				}
			}else {
				paramMap.put("img2", request.getParameter("img2_bf"));
			}
		}
		int result = service.mergeMainSlide(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/eMainSlideList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/eMainSlideList");
		}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/mergeMainGoods", method = RequestMethod.POST)
	public ModelAndView mergeMainGoods(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "goods_img",required=false) MultipartFile goods_img)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String num = request.getParameter("num");
		String goods_nm = request.getParameter("goods_nm");
		String goods_link = request.getParameter("goods_link");
		String goods_price = request.getParameter("goods_price");
		String show_yn = request.getParameter("show_yn");
		String view_order = request.getParameter("view_order");
		String category = request.getParameter("category");
		String filePathTail = "main_goods";
		paramMap.put("num", num);
		paramMap.put("goods_nm", goods_nm);
		paramMap.put("goods_link", goods_link);
		paramMap.put("goods_price", goods_price);
		paramMap.put("show_yn", show_yn);
		paramMap.put("category", category);
		paramMap.put("view_order", show_yn.equals("Y")?view_order:null);
		
		//파일 저장
		if (goods_img != null) {
			if(!goods_img.isEmpty()) {
				Map<String,Object> fileResult = commonService.fileUpload(goods_img,filePathTail);
				if(fileResult != null) {
					paramMap.put("goods_img", fileResult.get("fileName"));
				}
			}else {
				paramMap.put("goods_img", request.getParameter("goods_img_bf"));
			}
		}
		int result = service.mergeMainGoods(paramMap);
		if (result > 0) {
			mv.setViewName("redirect:/esoomkccegis/eMainGoodsList");
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/eMainGoodsList");
		}
		return mv;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/updateTeamSchedule", method = RequestMethod.POST)
	public ModelAndView updateTeamSchedule(ModelAndView mv,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String season_code = request.getParameter("season_code");
		String game_code = request.getParameter("game_code");
		String game_no = request.getParameter("game_no");
		
		String game_date = request.getParameter("game_date")!=null?request.getParameter("game_date"):"";
		String game_start = request.getParameter("game_start")!=null?request.getParameter("game_start"):"";
		String stadium_code = request.getParameter("stadium_code");
		String tv_play = request.getParameter("tv_play")!=null?request.getParameter("tv_play"):"";
		String hteam = request.getParameter("hteam");
		String ateam = request.getParameter("ateam");
		String[] hScore = new String[5];
		String[] aScore = new String[5];
		hScore[0] = request.getParameter("hQ1")!=null?request.getParameter("hQ1"):"0";
		hScore[1] = request.getParameter("hQ2")!=null?request.getParameter("hQ2"):"0";
		hScore[2] = request.getParameter("hQ3")!=null?request.getParameter("hQ3"):"0";
		hScore[3] = request.getParameter("hQ4")!=null?request.getParameter("hQ4"):"0";
		hScore[4] = request.getParameter("hEQ")!=null?request.getParameter("hEQ"):"0";
		aScore[0] = request.getParameter("aQ1")!=null?request.getParameter("aQ1"):"0";
		aScore[1] = request.getParameter("aQ2")!=null?request.getParameter("aQ2"):"0";
		aScore[2] = request.getParameter("aQ3")!=null?request.getParameter("aQ3"):"0";
		aScore[3] = request.getParameter("aQ4")!=null?request.getParameter("aQ4"):"0";
		aScore[4] = request.getParameter("aEQ")!=null?request.getParameter("aEQ"):"0";
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("game_no", game_no);
		paramMap.put("game_date", game_date.replaceAll("-", ""));
		paramMap.put("game_start", game_start.replaceAll(":", ""));
		paramMap.put("stadium_code", stadium_code);
		paramMap.put("tv_play", tv_play);
		paramMap.put("hteam", hteam);
		paramMap.put("ateam", ateam);
		List<Map<String,Object>> scoreList = new ArrayList<Map<String,Object>>();
		int tothscore = 0;
		int totascore = 0;
		for(int i=0;i<hScore.length;i++) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("team_code", hteam);
			tempMap.put("season_code", season_code);
			tempMap.put("game_code", game_code);
			tempMap.put("game_no", game_no);
			tempMap.put("score", hScore[i]);
			tempMap.put("home_away", "1");
			tempMap.put("away_team", ateam);
			if(i==4) {
				tempMap.put("quarter", "X1");
			}else {
				tempMap.put("quarter", "Q"+(i+1));
			}
			scoreList.add(tempMap);
			tothscore += Integer.parseInt(hScore[i]);
		}
		for(int i=0;i<aScore.length;i++) {
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("team_code", ateam);
			tempMap.put("season_code", season_code);
			tempMap.put("game_code", game_code);
			tempMap.put("game_no", game_no);
			tempMap.put("score", aScore[i]);
			tempMap.put("home_away", "2");
			tempMap.put("away_team", hteam);
			if(i==4) {
				tempMap.put("quarter", "X1");
				System.out.println("quarter==============="+tempMap.get("quarter"));
				System.out.println("score==================="+tempMap.get("score"));
			}else {
				tempMap.put("quarter", "Q"+(i+1));
			}
			scoreList.add(tempMap);
			totascore += Integer.parseInt(aScore[i]);
		}
		paramMap.put("list", scoreList);
		List<Map<String,Object>> totScoreList = new ArrayList<Map<String,Object>>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("team_code", hteam);
		tempMap.put("season_code", season_code);
		tempMap.put("game_code", game_code);
		tempMap.put("game_no", game_no);
		tempMap.put("score", tothscore);
		tempMap.put("home_away", "1");
		tempMap.put("away_team", ateam);
		totScoreList.add(tempMap);
		tempMap = new HashMap<String, Object>();
		tempMap.put("team_code", ateam);
		tempMap.put("season_code", season_code);
		tempMap.put("game_code", game_code);
		tempMap.put("game_no", game_no);
		tempMap.put("score", totascore);
		tempMap.put("home_away", "2");
		tempMap.put("away_team", hteam);
		totScoreList.add(tempMap);
		paramMap.put("totlist", totScoreList);
		int result = service.updateTeamSchedule(paramMap);
		if( result < 0) {
			//스케줄실패
			System.out.println("스케줄");
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/gScheduleList");
		}
		int result2 = service.updateTeamScheduleOnair(paramMap);
		if( result2 <0) {
			//티비온에어실패
			System.out.println("티비");
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/gScheduleList");
		}
		int result3 = service.updateTeamQuaterList(paramMap);
		if( result3 <0) {
			//쿼터리스트실패
			System.out.println("쿼터");
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/gScheduleList");
		}
		int result4 = service.updateTeamDailyList(paramMap);
		if( result4 <0) {
			//쿼터리스트실패
			System.out.println("쿼터");
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("admin/etc/gScheduleList");
		}
		mv.setViewName("redirect:/esoomkccegis/gScheduleList");
		return mv;
	}
	@RequestMapping(value = "/ePopupList", method = RequestMethod.GET)
	public ModelAndView ePopupList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		//검색기능없음 total = listcount
		int totalListCount = service.getPopupListCount(paramMap);
		int listCount = service.getPopupListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> popupList = service.popupList(paramMap);
		mv.addObject("popupList", popupList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/etc/ePopupList");
		return mv;
	}
	@RequestMapping(value = "/eMainSlideList", method = RequestMethod.GET)
	public ModelAndView eMainSlideList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		//검색기능없음 total = listcount
		int totalListCount = service.getMainsildeListCount(paramMap);
		int listCount = service.getMainsildeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> mainsildeList = service.mainsildeList(paramMap);
		mv.addObject("mainsildeList", mainsildeList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/etc/eMainSlideList");
		return mv;
	}
	@RequestMapping(value = "/mMemberList", method = RequestMethod.GET)
	public ModelAndView mMemberList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "select", defaultValue = "") String select,
			@RequestParam(value = "chk_state", defaultValue = "all") String chk_state) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 15;
		paramMap.put("keyWord", keyWord);
		paramMap.put("select", select);
		paramMap.put("chk_state", chk_state);
		//토탈리스트 카운트
		int totalListCount = service.getTotalMemberListCount(paramMap);
		int listCount = service.getMemberListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> memberList = service.memberList(paramMap);
		mv.addObject("totalListCount", totalListCount);
		mv.addObject("memberList", memberList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("select", select);
		mv.addObject("chk_state", chk_state);
		mv.setViewName("admin/member/mMemberList");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public Map<String, Object> changePwd(@RequestParam(value = "pwd") String pwd,
			@RequestParam(value = "num") String num) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String afterPwd = shaUtil.encrypt(pwd);
		paramMap.put("num", num);
		paramMap.put("pwd", afterPwd);
		int changePwd = service.changePwd(paramMap);
		if(changePwd>0) {
			result.put("result", true);
		}else {
			result.put("result", false);
		}
		return result;
	}
	@RequestMapping(value = "/fEventList", method = RequestMethod.GET)
	public ModelAndView fEventList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "state", defaultValue = "all") String state,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		//검색기능없음 total = listcount
		paramMap.put("part", "event");
		//토탈리스트 카운트
		int totalListCount = service.getTotalNoticeListCount(paramMap);
		paramMap.put("state", state);
		paramMap.put("keyWord", keyWord);
		int listCount = service.getEventListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> eventList = service.eventList(paramMap);
		mv.addObject("eventList", eventList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("totalListCount", totalListCount);
		mv.addObject("state", state);
		mv.addObject("keyWord", keyWord);
		mv.setViewName("admin/fanzone/fEventList");
		return mv;
	}
	@RequestMapping(value = "/fEventWrite", method = RequestMethod.GET)
	public ModelAndView fEventWrite(ModelAndView mv,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mediaMap = service.mediaMap(paramMap);
			resultMap.putAll(mediaMap);
			System.out.println(resultMap.toString());
			int listCount = service.getEventTailListCount(paramMap);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			paramMap.put("limit", pi.getBoardLimit());
			paramMap.put("currentPage", currentPage);
			List<Map<String, Object>> eventTailList = service.eventTailList(paramMap);
			resultMap.put("eventTailList", eventTailList);
			mv.addObject("startPage", pi.getStartPage());
			mv.addObject("endPage", pi.getEndPage());
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", pi.getMaxPage());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/fanzone/fEventWrite");
		return mv;
	}
	@RequestMapping(value = "/eMainGoodsList", method = RequestMethod.GET)
	public ModelAndView eMainGoodsList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "category", defaultValue = "C") String category) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		paramMap.put("category", category);
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		int totalListCount = service.getTotalMainGoodsListCount(paramMap);
		int listCount = service.getMainGoodsListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> mainGoodsList = service.mainGoodsList(paramMap);
		mv.addObject("mainGoodsList", mainGoodsList);
		mv.addObject("category", category);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("totalListCount", totalListCount);
		mv.setViewName("admin/etc/eMainGoodsList");
		return mv;
	}
	@RequestMapping(value = "/eMainGoodsWrite", method = RequestMethod.GET)
	public ModelAndView eMainGoodsWrite(ModelAndView mv,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(num != null && !"".equals(num)) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			
			Map<String, Object> mainGoodsMap = service.mainGoodsMap(paramMap);
			resultMap.putAll(mainGoodsMap);
			System.out.println(resultMap.toString());
		}
		mv.addObject("result", resultMap);
		mv.setViewName("admin/etc/eMainGoodsWrite");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/gameList", method = RequestMethod.POST)
	public List<Map<String, Object>> gameList(@RequestParam(value = "game_round") String game_round,
			@RequestParam(value = "type") String type) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("game_round", game_round);
		paramMap.put("game_code", type);
		List<Map<String, Object>> result = service.gameListPop(paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/writerData", method = RequestMethod.POST)
	public Map<String, Object> writerData(@RequestParam(value = "writerId") String writerId) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", writerId);
		Map<String, Object> result = service.memberMap(paramMap);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/detailData", method = RequestMethod.POST)
	public Map<String, Object> detailData(@RequestParam(value = "num") String num) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		Map<String, Object> result = service.freeMap(paramMap);
		if(result != null && result.size() >0) {
			String content = result.get("content").toString();
			result.put("content2", Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
		}
		return result;
	}
}
