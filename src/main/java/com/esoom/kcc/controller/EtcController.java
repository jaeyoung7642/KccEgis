package com.esoom.kcc.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.esoom.kcc.common.IpUtil;
import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.service.CommonService;
import com.esoom.kcc.service.EtcService;
import com.esoom.kcc.service.PlayerService;
import com.esoom.kcc.service.TeamRankService;
import com.esoom.kcc.service.TeamScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EtcController {
	@Autowired
	private EtcService service;
	private static final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public ModelAndView sponsor(ModelAndView mv) throws Exception {
		mv.setViewName("etc/terms");
		return mv;
	}
	@RequestMapping(value = "/proposal", method = RequestMethod.GET)
	public ModelAndView proposal(ModelAndView mv) throws Exception {
		mv.setViewName("etc/proposal");
		return mv;
	}
	@RequestMapping(value = "/proposal_insert", method = RequestMethod.GET)
    public ModelAndView proposal_insert(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	String writer = request.getParameter("writer");
    	String email = request.getParameter("email");
    	String subject = request.getParameter("subject");
    	String content = request.getParameter("content");
    	String ip = IpUtil.getClientIP(request);
    	String id = "";
    	Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
    	if(loginUserMap != null) {
    		id = loginUserMap.get("id").toString();
    	}else {
    		id = "guest";
    	}
    	paramMap.put("writer",writer);
    	paramMap.put("email",email);
    	paramMap.put("subject",subject);
    	paramMap.put("content",content);
    	paramMap.put("ip",ip);
    	paramMap.put("id",id);
    	int result = service.insertProposal(paramMap);
    	if (result > 0) {
    		mv.setViewName("redirect:/");
    	}else {
    		mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("redirect:/proposal");
    	}
    	return mv;
    }
	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public ModelAndView policy(ModelAndView mv) throws Exception {
		mv.setViewName("etc/policy");
		return mv;
	}
	@RequestMapping(value = "/policy_240722", method = RequestMethod.GET)
	public ModelAndView policy_240722(ModelAndView mv) throws Exception {
		mv.setViewName("common/policy_240722");
		return mv;
	}
	@RequestMapping(value = "/policy_240322", method = RequestMethod.GET)
	public ModelAndView policy_240322(ModelAndView mv) throws Exception {
		mv.setViewName("common/policy_240322");
		return mv;
	}
	@RequestMapping(value = "/policy_230915", method = RequestMethod.GET)
	public ModelAndView policy_230915(ModelAndView mv) throws Exception {
		mv.setViewName("common/policy_230915");
		return mv;
	}
	@RequestMapping(value = "/policy_200928", method = RequestMethod.GET)
	public ModelAndView policy_200928(ModelAndView mv) throws Exception {
		mv.setViewName("common/policy_200928");
		return mv;
	}
	@RequestMapping(value = "/policy_230728", method = RequestMethod.GET)
	public ModelAndView policy_230728(ModelAndView mv) throws Exception {
		mv.setViewName("common/policy_230728");
		return mv;
	}
}
