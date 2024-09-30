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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class FanzoneController {
	@Autowired
	private CommonService commonService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
	private FanzoneService service;
	@Autowired
	private NewsService newsService;
	private static final Logger logger = LoggerFactory.getLogger(FanzoneController.class);
	private static final String SECRET_KEY = "6Le1xioqAAAAAB_6w1FzKDydmVukW_rE4jcM3K7Z";
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public ModelAndView freeList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "title", defaultValue = "N") String title,
			@RequestParam(value = "content", defaultValue = "N") String content,
			@RequestParam(value = "writer", defaultValue = "N") String writer,
			@RequestParam(value = "tail", defaultValue = "N") String tail,
			@RequestParam(value = "tailWriter", defaultValue = "N") String tailWriter,
			@RequestParam(value = "sdate", defaultValue = "") String sdate,
			@RequestParam(value = "edate", defaultValue = "") String edate) throws Exception {
//		if("".equals(sdate)&&"".equals(edate)) {
//			// 오늘 날짜 가져오기
//	        LocalDate today = LocalDate.now();
//	        // 1년 전 날짜 계산
//	        LocalDate oneYearAgo = today.minusYears(1);
//	        // 원하는 형식으로 포맷터 생성
//	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//	        // 날짜를 형식에 맞게 변환
//	        String formattedToday = today.format(formatter);
//	        String formattedOneYearAgo = oneYearAgo.format(formatter);
//	        sdate = formattedOneYearAgo;
//	        edate = formattedToday;
//		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 15;
		paramMap.put("keyWord", keyWord);
		paramMap.put("keyWord2", keyWord.replaceAll(" ", ""));
		paramMap.put("title", title);
		paramMap.put("content", content);
		paramMap.put("writer", writer);
		paramMap.put("tail", tail);
		paramMap.put("tailWriter", tailWriter);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		
		List<Map<String, Object>> topFreeList = service.topFreeList(paramMap);
		mv.addObject("topFreeList", topFreeList);
		
		// 상위리스트 카운트
		int listCount = service.getFreeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> freeList = service.freeList(paramMap);
		
		mv.addObject("freeList", freeList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.addObject("title", title);
		mv.addObject("content", content);
		mv.addObject("writer", writer);
		mv.addObject("tail", tail);
		mv.addObject("tailWriter", tailWriter);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		mv.setViewName("fanzone/freeList");
		return mv;
	}
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public ModelAndView newsList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 10;
		paramMap.put("keyWord", keyWord);
		
		List<Map<String, Object>> topNoticeList = service.topNoticeList(paramMap);
		if(topNoticeList != null && topNoticeList.size() >0) {
			for(Map m: topNoticeList) {
				String content = m.get("content").toString();
				m.put("content2", Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
			}
		}
		mv.addObject("topNoticeList", topNoticeList);
		
		// 상위리스트 카운트
		int listCount = service.getNoticeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> noticeList = service.noticeList(paramMap);
		if(noticeList != null && noticeList.size() >0) {
			for(Map m: noticeList) {
				String content = m.get("content").toString();
				m.put("content2", Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
			}
		}
		mv.addObject("noticeList", noticeList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("keyWord", keyWord);
		mv.setViewName("fanzone/noticeList");
		return mv;
	}
	@RequestMapping(value = "/freeListDetail", method = RequestMethod.GET)
	public ModelAndView freeListDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage") Integer listpage,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord,
			@RequestParam(value = "title", defaultValue = "N") String title,
			@RequestParam(value = "content", defaultValue = "N") String content,
			@RequestParam(value = "writer", defaultValue = "N") String writer,
			@RequestParam(value = "tail", defaultValue = "N") String tail,
			@RequestParam(value = "tailWriter", defaultValue = "N") String tailWriter,
			@RequestParam(value = "sdate", defaultValue = "") String sdate,
			@RequestParam(value = "edate", defaultValue = "") String edate) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		service.visitedUpdate(paramMap);
		
		Map<String, Object> freeDetail = service.getFreeDetail(paramMap);
		// 상위리스트 카운트
		int listCount = service.getFreeTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.freeTailList(paramMap); 
		
		
		
//		if("".equals(sdate)&&"".equals(edate)) {
//			// 오늘 날짜 가져오기
//	        LocalDate today = LocalDate.now();
//	        // 1년 전 날짜 계산
//	        LocalDate oneYearAgo = today.minusYears(1);
//	        // 원하는 형식으로 포맷터 생성
//	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//	        // 날짜를 형식에 맞게 변환
//	        String formattedToday = today.format(formatter);
//	        String formattedOneYearAgo = oneYearAgo.format(formatter);
//	        sdate = formattedOneYearAgo;
//	        edate = formattedToday;
//		}
		paramMap.put("keyWord", keyWord);
		paramMap.put("keyWord2", keyWord.replaceAll(" ", ""));
		paramMap.put("title", title);
		paramMap.put("content", content);
		paramMap.put("writer", writer);
		paramMap.put("tail", tail);
		paramMap.put("tailWriter", tailWriter);
		paramMap.put("sdate", sdate);
		paramMap.put("edate", edate);
		int boardLimit2 = 15;
		
		List<Map<String, Object>> topFreeList = service.topFreeList(paramMap);
		mv.addObject("topFreeList", topFreeList);
		
		// 상위리스트 카운트
		int listCount2 = service.getFreeListCount(paramMap);
		PageInfo pi2 = Pagination.getPageInfo(listpage, listCount2, boardLimit2);
		paramMap.put("limit", pi2.getBoardLimit());
		paramMap.put("currentPage", listpage);
		List<Map<String, Object>> freeList = service.freeList(paramMap);
		
		mv.addObject("freeList", freeList);
		mv.addObject("startPage2", pi2.getStartPage());
		mv.addObject("endPage2", pi2.getEndPage());
		mv.addObject("currentPage2", listpage);
		mv.addObject("maxPage2", pi2.getMaxPage());
		
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.addObject("freeDetail", freeDetail);
		mv.addObject("tailList", tailList);
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		mv.addObject("title", title);
		mv.addObject("content", content);
		mv.addObject("writer", writer);
		mv.addObject("tail", tail);
		mv.addObject("tailWriter", tailWriter);
		mv.addObject("sdate", sdate);
		mv.addObject("edate", edate);
		
		mv.setViewName("fanzone/freeList_detail");
		return mv;
	}
	@RequestMapping(value = "/freeWriteForm", method = RequestMethod.GET)
	public ModelAndView freeWriteForm(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value = "num", required = false) String num) throws Exception {
		if(num != null && !"".equals(num)) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("num", num);
			Map<String, Object> freeDetail = service.getFreeDetail(paramMap);
			String content2 = commonService.HtmlUnescape(freeDetail.get("content").toString());
			freeDetail.put("content2", content2);
			mv.addObject("freeDetail", freeDetail);
		}
		mv.setViewName("fanzone/freeList_write_form");
		return mv;
	}
	@RequestMapping(value = "/freeWrite", method = RequestMethod.POST)
    public ModelAndView verifyPost(ModelAndView mv,
    		@RequestParam("recaptchaResponse") String recaptchaResponse,
                                   HttpServletRequest request) {
        try {
        	String url = "https://www.google.com/recaptcha/api/siteverify";
            String params = "secret=" + SECRET_KEY + "&response=" + recaptchaResponse;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);
            con.getOutputStream().write(params.getBytes("UTF-8"));

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Check if reCAPTCHA verification was successful
            boolean success = response.toString().contains("\"success\": true");

            if (success) {
            	Map<String, Object> paramMap = new HashMap<String, Object>();
            	String num = request.getParameter("num");
        		String subject = request.getParameter("subject");
        		String content = request.getParameter("content");
        		String id = request.getParameter("id");
        		String writer = request.getParameter("writer");
        		String chk_m = request.getParameter("chk_m");
        		String ip = ipUtil.getClientIP(request);
        		paramMap.put("num", num);
        		paramMap.put("subject", subject);
        		paramMap.put("content", content);
        		paramMap.put("id", id);
        		paramMap.put("writer", writer);
        		paramMap.put("ip", ip);
        		paramMap.put("chk_m", chk_m);
        		int result = service.mergeFree(paramMap);
        		if (result > 0) {
        			mv.setViewName("redirect:/freeList");
        		} else {
        			System.out.println("머지오류");
        			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
        			mv.setViewName("redirect:/freeWriteForm");
        		}
            } else {
                mv.addObject("msg", "캡차인증 실패했습니다. 다시 시도해주세요.");
                mv.setViewName("redirect:/freeWriteForm");
            }
        } catch (Exception e) {
        	System.out.println(e);
        	mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
            mv.setViewName("redirect:/freeWriteForm");
        }
        return mv;
    }
	@RequestMapping(value = "/noticeListDetail", method = RequestMethod.GET)
	public ModelAndView noticeListDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("part", "notice");
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		newsService.visitedUpdate(paramMap);
		
		Map<String, Object> noticeDetail = newsService.getDetail(paramMap);
		// 상위리스트 카운트
		int listCount = newsService.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = newsService.tailList(paramMap); 
		
		Map<String, Object> prevDetail = newsService.prevDetail(paramMap);
		Map<String, Object> nextDetail = newsService.nextDetail(paramMap);
		
		mv.addObject("noticeDetail", noticeDetail);
		mv.addObject("prevDetail", prevDetail);
		mv.addObject("nextDetail", nextDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		
		mv.setViewName("fanzone/noticeList_detail");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/contentWriteFree", method = RequestMethod.GET)
	public String contentWrite(String num,String content,HttpSession session,HttpServletRequest request)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("content", content);
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
	@RequestMapping(value = "/contentDeleteFree", method = RequestMethod.GET)
	public String contentDelete(String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.contentDelete(paramMap);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/contentPageFree", method = RequestMethod.GET)
	public ModelAndView contentPage(ModelAndView mv,int page,String num)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = page;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		paramMap.put("num", num);
		// 상위리스트 카운트
		int listCount = service.getFreeTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = service.freeTailList(paramMap); 
		
		mv.addObject("tailList", tailList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("media/movieListH_detailAjax");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
	public String freeDelete(int num,ModelAndView mv)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		int result=service.freeDelete(paramMap);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/wallpaperList", method = RequestMethod.GET)
	public ModelAndView wallpaperList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page
			) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		
		// 상위리스트 카운트
		int listCount = service.getWallpaperListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String, Object>> wallpaperList = service.wallpaperList(paramMap);

		mv.addObject("wallpaperList", wallpaperList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		mv.setViewName("fanzone/wallpaperList");
		return mv;
	}
	@RequestMapping(value = "/eventList", method = RequestMethod.GET)
	public ModelAndView eventList(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "keyWord", defaultValue = "") String keyWord) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 12;
		paramMap.put("keyWord", keyWord);
		
		// 상위리스트 카운트
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
		mv.addObject("keyWord", keyWord);
		mv.setViewName("fanzone/eventList");
		return mv;
	}
	@RequestMapping(value = "/eventListDetail", method = RequestMethod.GET)
	public ModelAndView eventListDetail(ModelAndView mv,HttpServletRequest request,String num,@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "listpage", required = false) Integer listpage,
			@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("part", "event");
		// 현재 페이지
		int currentPage = (page != null) ? page : 1;
		// 한페이지당 보여줄 row
		int boardLimit = 5;
		newsService.visitedUpdate(paramMap);
		
		Map<String, Object> eventDetail = newsService.getDetail(paramMap);
		String sdate = eventDetail.get("sdate").toString();
		String edate = eventDetail.get("edate").toString();
		eventDetail.put("sdate_format", sdate.substring(0, 10).replaceAll("-", "."));
		eventDetail.put("edate_format", edate.substring(0, 10).replaceAll("-", "."));
		// 상위리스트 카운트
		int listCount = newsService.getTailListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		paramMap.put("limit", pi.getBoardLimit());
		paramMap.put("currentPage", currentPage);
		List<Map<String,Object>> tailList = newsService.tailList(paramMap); 
		
		Map<String, Object> prevDetail = newsService.prevDetail(paramMap);
		Map<String, Object> nextDetail = newsService.nextDetail(paramMap);
		if(prevDetail != null) {
			prevDetail.put("sdate_format", prevDetail.get("sdate") != null ?(prevDetail.get("sdate").toString().substring(0, 10)).replaceAll("-", "."):"");
			prevDetail.put("edate_format", prevDetail.get("edate") != null ?(prevDetail.get("edate").toString().substring(0, 10)).replaceAll("-", "."):"");
		}
		if(nextDetail != null) {
			nextDetail.put("sdate_format", nextDetail.get("sdate") != null ?(nextDetail.get("sdate").toString().substring(0, 10)).replaceAll("-", "."):"");
			nextDetail.put("edate_format", nextDetail.get("edate") != null ?(nextDetail.get("edate").toString().substring(0, 10)).replaceAll("-", "."):"");
		}
		mv.addObject("eventDetail", eventDetail);
		mv.addObject("prevDetail", prevDetail);
		mv.addObject("nextDetail", nextDetail);
		mv.addObject("tailList", tailList);
		mv.addObject("startPage", pi.getStartPage());
		mv.addObject("endPage", pi.getEndPage());
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", pi.getMaxPage());
		
		mv.addObject("listpage", listpage);
		mv.addObject("keyWord", keyWord);
		
		mv.setViewName("fanzone/eventList_detail");
		return mv;
	}
}
