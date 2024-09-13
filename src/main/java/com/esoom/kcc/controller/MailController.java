package com.esoom.kcc.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.esoom.kcc.service.MailService;

@Controller
@EnableAsync//비동기로 동작하게 하는 어노테이션
public class MailController {
		
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/sendMail.do", method= RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		mailService.sendMail("","KCC EGIS 홈페이지 임시비밀번호를 안내해 드립니다.","메일 내용");
		out.print("메일 전송 완료");
		
	}
	
}
