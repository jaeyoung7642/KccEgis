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
import com.esoom.kcc.service.ClubService;
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
public class ClubController {
	@Autowired
	private CommonService commonService;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
	private ClubService service;
	@Autowired
	private TeamScheduleService teamScheduleService;
	@Autowired
	private NewsService newsService;
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	@RequestMapping(value = "/kccadList", method = RequestMethod.GET)
	public ModelAndView kccadList(ModelAndView mv,
			@RequestParam(value = "adgroup", defaultValue = "기업PR") String adgroup) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("adgroup", adgroup);
		List<Map<String, Object>> kccadList = service.kccadList(paramMap);
		
		mv.addObject("kccadList", kccadList);
		mv.addObject("adgroup", adgroup);
		mv.setViewName("club/kccadList");
		return mv;
	}
	@RequestMapping(value = "/chistory", method = RequestMethod.GET)
	public ModelAndView chistory(ModelAndView mv) throws Exception {
		
		mv.setViewName("club/c_history");
		return mv;
	}
	@RequestMapping(value = "/phistory", method = RequestMethod.GET)
	public ModelAndView phistory(ModelAndView mv) throws Exception {
		
		mv.setViewName("club/p_history");
		return mv;
	}
	@RequestMapping(value = "/front", method = RequestMethod.GET)
	public ModelAndView front(ModelAndView mv) throws Exception {
		
		mv.setViewName("club/front");
		return mv;
	}
	@RequestMapping(value = "/ci", method = RequestMethod.GET)
	public ModelAndView ci(ModelAndView mv) throws Exception {
		
		mv.setViewName("club/ci");
		return mv;
	}
	@RequestMapping(value = "/jrInfo", method = RequestMethod.GET)
	public ModelAndView jrInfo(ModelAndView mv) throws Exception {
		
		mv.setViewName("youth/jr_info");
		return mv;
	}
	@RequestMapping(value = "/jrTeacher", method = RequestMethod.GET)
	public ModelAndView jrTeacher(ModelAndView mv) throws Exception {
		
		mv.setViewName("youth/jr_teacher");
		return mv;
	}
	@RequestMapping(value = "/seasonReview", method = RequestMethod.GET)
	public ModelAndView seasonReview(ModelAndView mv,
			@RequestParam(value = "season_year", defaultValue = "3") String season_year,
			@RequestParam(value = "season_code", defaultValue = "45") String season_code) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String syear = "";
		String eyear = "";
		if("3".equals(season_year)) {
			syear = "2021";
			eyear = "2024";
		}
		if("2".equals(season_year)) {
			syear = "2011";
			eyear = "2020";
		}
		if("1".equals(season_year)) {
			syear = "2001";
			eyear = "2010";
		}
		paramMap.put("syear", syear);
		paramMap.put("eyear", eyear);
		List<Map<String,Object>> selectSeasonList = service.selectSeasonList(paramMap);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			m.putAll(tempMap);
		}
		paramMap.put("season_code", season_code);
		List<Map<String,Object>> playerRecordList = service.playerRecordList(paramMap);
		
		mv.addObject("playerRecordList", playerRecordList);
		mv.addObject("seasonList", selectSeasonList);
		mv.addObject("season_year", season_year);
		mv.addObject("season_code", season_code);
		mv.setViewName("club/review");
		return mv;
	}
	@RequestMapping(value = "/selectSeasonRecord", method = RequestMethod.GET)
	public ModelAndView selectSeasonRecord(ModelAndView mv,
			@RequestParam(value = "season_code", defaultValue = "47") String season_code) throws Exception {
		System.out.println(season_code);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("season_code", season_code);
		List<Map<String,Object>> playerRecordList = service.playerRecordList(paramMap);
		
		mv.addObject("playerRecordList", playerRecordList);
		mv.addObject("season_code", season_code);
		mv.setViewName("club/reviewAjax2");
		return mv;
	}
	@RequestMapping(value = "/selectSeasonReview", method = RequestMethod.GET)
	public ModelAndView selectSeasonReview(ModelAndView mv,@RequestParam(value = "season_year", defaultValue = "3") String season_year)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String syear = "";
		String eyear = "";
		if("3".equals(season_year)) {
			syear = "2021";
			eyear = "2024";
		}
		if("2".equals(season_year)) {
			syear = "2011";
			eyear = "2020";
		}
		if("1".equals(season_year)) {
			syear = "2001";
			eyear = "2010";
		}
		paramMap.put("syear", syear);
		paramMap.put("eyear", eyear);
		List<Map<String,Object>> selectSeasonList = service.selectSeasonList(paramMap);
		for(Map m: selectSeasonList) {
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap.put("seasonCode", m.get("season_code"));
			tempMap.put("seasonCodeNm", m.get("season_name_1")+"시즌");
			m.putAll(tempMap);
		}
		mv.addObject("seasonList", selectSeasonList);
		mv.setViewName("club/reviewAjax");
		return mv;
	}
	@RequestMapping(value = "/sponsor", method = RequestMethod.GET)
	public ModelAndView sponsor(ModelAndView mv) throws Exception {
		mv.setViewName("club/sponsor");
		return mv;
	}
	@RequestMapping(value = "/busan_gym", method = RequestMethod.GET)
	public ModelAndView busan_gym(ModelAndView mv) throws Exception {
		mv.setViewName("club/busan_gym");
		return mv;
	}
	@RequestMapping(value = "/yongin_gym", method = RequestMethod.GET)
	public ModelAndView yongin_gym(ModelAndView mv) throws Exception {
		mv.setViewName("club/yongin_gym");
		return mv;
	}
	@RequestMapping(value = "/all_gym", method = RequestMethod.GET)
	public ModelAndView all_gym(ModelAndView mv) throws Exception {
		mv.setViewName("club/all_gym");
		return mv;
	}
	@RequestMapping(value = "/c_history_2020", method = RequestMethod.GET)
	public ModelAndView c_history_2020(ModelAndView mv) throws Exception {
		mv.setViewName("club/history/c_history_2020");
		return mv;
	}
	@RequestMapping(value = "/c_history_2000", method = RequestMethod.GET)
	public ModelAndView c_history_2000(ModelAndView mv) throws Exception {
		mv.setViewName("club/history/c_history_2000");
		return mv;
	}
	@RequestMapping(value = "/c_history_2010", method = RequestMethod.GET)
	public ModelAndView c_history_2010(ModelAndView mv) throws Exception {
		mv.setViewName("club/history/c_history_2010");
		return mv;
	}
	@RequestMapping(value = "/season_45", method = RequestMethod.GET)
	public ModelAndView season_45(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_45");
		return mv;
	}
	@RequestMapping(value = "/season_43", method = RequestMethod.GET)
	public ModelAndView season_43(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_43");
		return mv;
	}
	@RequestMapping(value = "/season_41", method = RequestMethod.GET)
	public ModelAndView season_41(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_41");
		return mv;
	}
	@RequestMapping(value = "/season_39", method = RequestMethod.GET)
	public ModelAndView season_39(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_39");
		return mv;
	}
	@RequestMapping(value = "/season_37", method = RequestMethod.GET)
	public ModelAndView season_37(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_37");
		return mv;
	}
	@RequestMapping(value = "/season_35", method = RequestMethod.GET)
	public ModelAndView season_35(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_35");
		return mv;
	}
	@RequestMapping(value = "/season_33", method = RequestMethod.GET)
	public ModelAndView season_33(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_33");
		return mv;
	}
	@RequestMapping(value = "/season_31", method = RequestMethod.GET)
	public ModelAndView season_31(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_31");
		return mv;
	}
	@RequestMapping(value = "/season_29", method = RequestMethod.GET)
	public ModelAndView season_29(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_29");
		return mv;
	}
	@RequestMapping(value = "/season_27", method = RequestMethod.GET)
	public ModelAndView season_27(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_27");
		return mv;
	}
	@RequestMapping(value = "/season_25", method = RequestMethod.GET)
	public ModelAndView season_25(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_25");
		return mv;
	}
	@RequestMapping(value = "/season_23", method = RequestMethod.GET)
	public ModelAndView season_23(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_23");
		return mv;
	}
	@RequestMapping(value = "/season_21", method = RequestMethod.GET)
	public ModelAndView season_21(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_21");
		return mv;
	}
	@RequestMapping(value = "/season_19", method = RequestMethod.GET)
	public ModelAndView season_19(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_19");
		return mv;
	}
	@RequestMapping(value = "/season_17", method = RequestMethod.GET)
	public ModelAndView season_17(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_17");
		return mv;
	}
	@RequestMapping(value = "/season_15", method = RequestMethod.GET)
	public ModelAndView season_15(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_15");
		return mv;
	}
	@RequestMapping(value = "/season_13", method = RequestMethod.GET)
	public ModelAndView season_13(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_13");
		return mv;
	}
	@RequestMapping(value = "/season_12", method = RequestMethod.GET)
	public ModelAndView season_12(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_12");
		return mv;
	}
	@RequestMapping(value = "/season_11", method = RequestMethod.GET)
	public ModelAndView season_11(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_11");
		return mv;
	}
	@RequestMapping(value = "/season_10", method = RequestMethod.GET)
	public ModelAndView season_10(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_10");
		return mv;
	}
	@RequestMapping(value = "/season_9", method = RequestMethod.GET)
	public ModelAndView season_9(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_9");
		return mv;
	}
	@RequestMapping(value = "/season_8", method = RequestMethod.GET)
	public ModelAndView season_8(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_8");
		return mv;
	}
	@RequestMapping(value = "/season_7", method = RequestMethod.GET)
	public ModelAndView season_7(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_7");
		return mv;
	}
	@RequestMapping(value = "/season_6", method = RequestMethod.GET)
	public ModelAndView season_6(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/season_6");
		return mv;
	}
	@RequestMapping(value = "/photo_45", method = RequestMethod.GET)
	public ModelAndView photo_45(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_45");
		return mv;
	}
	@RequestMapping(value = "/photo_43", method = RequestMethod.GET)
	public ModelAndView photo_43(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_43");
		return mv;
	}
	@RequestMapping(value = "/photo_41", method = RequestMethod.GET)
	public ModelAndView photo_41(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_41");
		return mv;
	}
	@RequestMapping(value = "/photo_39", method = RequestMethod.GET)
	public ModelAndView photo_39(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_39");
		return mv;
	}
	@RequestMapping(value = "/photo_37", method = RequestMethod.GET)
	public ModelAndView photo_37(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_37");
		return mv;
	}
	@RequestMapping(value = "/photo_35", method = RequestMethod.GET)
	public ModelAndView photo_35(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_35");
		return mv;
	}
	@RequestMapping(value = "/photo_33", method = RequestMethod.GET)
	public ModelAndView photo_33(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_33");
		return mv;
	}
	@RequestMapping(value = "/photo_31", method = RequestMethod.GET)
	public ModelAndView photo_31(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_31");
		return mv;
	}
	@RequestMapping(value = "/photo_29", method = RequestMethod.GET)
	public ModelAndView photo_29(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_29");
		return mv;
	}
	@RequestMapping(value = "/photo_27", method = RequestMethod.GET)
	public ModelAndView photo_27(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_27");
		return mv;
	}
	@RequestMapping(value = "/photo_25", method = RequestMethod.GET)
	public ModelAndView photo_25(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_25");
		return mv;
	}
	@RequestMapping(value = "/photo_23", method = RequestMethod.GET)
	public ModelAndView photo_23(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_23");
		return mv;
	}
	@RequestMapping(value = "/photo_21", method = RequestMethod.GET)
	public ModelAndView photo_21(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_21");
		return mv;
	}
	@RequestMapping(value = "/photo_19", method = RequestMethod.GET)
	public ModelAndView photo_19(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_19");
		return mv;
	}
	@RequestMapping(value = "/photo_17", method = RequestMethod.GET)
	public ModelAndView photo_17(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_17");
		return mv;
	}
	@RequestMapping(value = "/photo_15", method = RequestMethod.GET)
	public ModelAndView photo_15(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_15");
		return mv;
	}
	@RequestMapping(value = "/photo_13", method = RequestMethod.GET)
	public ModelAndView photo_13(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_13");
		return mv;
	}
	@RequestMapping(value = "/photo_12", method = RequestMethod.GET)
	public ModelAndView photo_12(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_12");
		return mv;
	}
	@RequestMapping(value = "/photo_11", method = RequestMethod.GET)
	public ModelAndView photo_11(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_11");
		return mv;
	}
	@RequestMapping(value = "/photo_10", method = RequestMethod.GET)
	public ModelAndView photo_10(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_10");
		return mv;
	}
	@RequestMapping(value = "/photo_9", method = RequestMethod.GET)
	public ModelAndView photo_9(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_9");
		return mv;
	}
	@RequestMapping(value = "/photo_8", method = RequestMethod.GET)
	public ModelAndView photo_8(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_8");
		return mv;
	}
	@RequestMapping(value = "/photo_7", method = RequestMethod.GET)
	public ModelAndView photo_7(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_7");
		return mv;
	}
	@RequestMapping(value = "/photo_6", method = RequestMethod.GET)
	public ModelAndView photo_6(ModelAndView mv) throws Exception {
		mv.setViewName("club/review/photo_6");
		return mv;
	}
}
