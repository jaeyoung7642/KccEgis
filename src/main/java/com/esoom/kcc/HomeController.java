package com.esoom.kcc;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.esoom.kcc.service.CommonService;
import com.esoom.kcc.service.EtcService;
import com.esoom.kcc.service.MainGoodsService;
import com.esoom.kcc.service.MainSlideService;
import com.esoom.kcc.service.NewsService;
import com.esoom.kcc.service.PlayerService;
import com.esoom.kcc.service.TeamRankService;
import com.esoom.kcc.service.TeamScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CommonService commonService;
	@Autowired
	private MainSlideService mainSlideService;
	@Autowired
	private MainGoodsService mainGoodsService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private TeamRankService teamRankService;
	@Autowired
	private TeamScheduleService teamScheduleService;
	@Autowired
	private PlayerService playerService;
	@Autowired
	private EtcService etcService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//메인슬라이드영역
		List<Map<String,Object>> mainSlideList = mainSlideService.mainSlideHome(paramMap);
		//뉴스영역
		List<Map<String,Object>> newsList = newsService.newsHome(paramMap);
		//팀순위영역
		Map<String,Object> teamRank = teamRankService.teamRankHome(paramMap);
		//경기일정 영역
		Map<String,Object> prevTeamSchedule = teamScheduleService.prevTeamScheduleHome(paramMap);
		List<Map<String,Object>> teamScheduleList = teamScheduleService.teamScheduleHome(paramMap);
//		List<Map<String,Object>> teamScheduleList2 = teamScheduleService.teamScheduleHome2(paramMap);
		//선수순위 영역
		List<Map<String,Object>> playerRankList = playerService.playerRankHome(paramMap);
		//미디어 영역
		List<Map<String,Object>> mediaUList = newsService.mediaUHome(paramMap);//유튜브2개
		List<Map<String,Object>> mediaSList = newsService.mediaSHome(paramMap);//숏츠2개
		List<Map<String,Object>> photoList = newsService.photoHome(paramMap);//사진5개
		//굿즈 영역
		List<Map<String,Object>> goodsBList = mainGoodsService.mainGoodsBHome(paramMap);//유튜브2개
		List<Map<String,Object>> goodsCList = mainGoodsService.mainGoodsCHome(paramMap);//유튜브2개
		//팝업 영역
		List<Map<String,Object>> popupList = etcService.mainPopup(paramMap);
		mv.addObject("mainSlideList",mainSlideList);
		mv.addObject("newsList",newsList);
		mv.addObject("teamRank",teamRank);
		mv.addObject("prevTeamSchedule",prevTeamSchedule);
		mv.addObject("teamScheduleList",teamScheduleList);
		mv.addObject("teamScheduleListSize",teamScheduleList.size());
		mv.addObject("playerRankList",playerRankList);
		mv.addObject("mediaUList",mediaUList);
		mv.addObject("mediaSList",mediaSList);
		mv.addObject("photoList",photoList);
		mv.addObject("goodsBList",goodsBList);
		mv.addObject("goodsCList",goodsCList);
		mv.addObject("popupList",popupList);
		mv.setViewName("home");
		return mv;
	}
	@RequestMapping(value = "/home2", method = RequestMethod.GET)
	public ModelAndView home2(ModelAndView mv) {
		mv.setViewName("test/home");
		return mv;
	}
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public ModelAndView header(ModelAndView mv) {
		mv.setViewName("common/header");
		return mv;
	}
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public ModelAndView footer(ModelAndView mv) {
		mv.setViewName("common/footer");
		return mv;
	}
}
