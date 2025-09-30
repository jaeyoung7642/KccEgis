package com.esoom.kcc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.esoom.kcc.service.AdminService;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@RestController
public class ApiController {
	@Autowired
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
	//경기일정
	@RequestMapping(value = "/teamScheduleApi", method = RequestMethod.GET)
	public String teamScheduleApi(String season_code) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/schedule.php"); /*URL*/
        URL url = new URL(urlBuilder.toString());
        Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.getOutputStream().write(postDataBytes);
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
        }
        StringBuilder sb2 = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb2.append(line);
        }
        String jsonStr = sb2.toString();
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
        // 여기서 각 JSON 객체를 처리할 수 있음
        if(jsonArray.size()>0) {
        	service.deleteTeamSchedule(paramMap);
        	for (Object obj : jsonArray) {
        		JSONObject jsonObj = (JSONObject) obj;
        		paramMap.put("game_code", jsonObj.get("game_code"));
				paramMap.put("game_no", jsonObj.get("game_no"));
				paramMap.put("game_date", jsonObj.get("game_date"));
				paramMap.put("week_seq", jsonObj.get("week_seq"));
				paramMap.put("week_day", jsonObj.get("week_day"));
				paramMap.put("game_start", jsonObj.get("game_start"));
				paramMap.put("home_away", jsonObj.get("home_away"));
				paramMap.put("home_team", jsonObj.get("home_team"));
				paramMap.put("away_team", jsonObj.get("away_team"));
				paramMap.put("stadium_code", jsonObj.get("stadium_code"));
				paramMap.put("tv_play", jsonObj.get("tv_play"));
				paramMap.put("radio_play", jsonObj.get("radio_play"));
				paramMap.put("game_hoi", jsonObj.get("game_hoi"));
				paramMap.put("game_chasu", jsonObj.get("game_chasu"));
				paramMap.put("game_round", jsonObj.get("game_round"));
				paramMap.put("remark", jsonObj.get("remark"));
        		Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
        		paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
        		System.out.println("insertTeamSchedule==================="+paramMap.toString());
        		cnt += service.insertTeamSchedule(paramMap);
        	}
        	if(cnt<jsonArray.size()) {
        		result ="false";
        	}
        }else {
        	result ="false";
        }
        rd.close();
        conn.disconnect();
		return result;
	}
	//팀순위
	@RequestMapping(value = "/teamDailyRankApi", method = RequestMethod.GET)
	public String teamDailyRankApi() throws IOException, ParseException ,Exception{
		String result = "true";
		String season_code = "47";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/rank.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
//			service.deleteTeamDailyRank(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("game_code", jsonObj.get("game_code"));
        		paramMap.put("game_date", jsonObj.get("game_date"));
        		paramMap.put("team_code", jsonObj.get("team_code"));
        		paramMap.put("play_min", jsonObj.get("play_min"));
        		paramMap.put("play_sec", jsonObj.get("play_sec"));
        		paramMap.put("fg", jsonObj.get("fg"));
        		paramMap.put("fg_a", jsonObj.get("fg_a"));
        		paramMap.put("ft", jsonObj.get("ft"));
        		paramMap.put("ft_a", jsonObj.get("ft_a"));
        		paramMap.put("threep", jsonObj.get("threep"));
        		paramMap.put("threep_a", jsonObj.get("threep_a"));
        		paramMap.put("dk", jsonObj.get("dk"));
        		paramMap.put("dk_a", jsonObj.get("dk_a"));
        		paramMap.put("pp", jsonObj.get("pp"));
        		paramMap.put("pp_a", jsonObj.get("pp_a"));
        		paramMap.put("o_r", jsonObj.get("o_r"));
        		paramMap.put("d_r", jsonObj.get("d_r"));
        		paramMap.put("t_r", jsonObj.get("t_r"));
        		paramMap.put("a_s", jsonObj.get("a_s"));
        		paramMap.put("s_t", jsonObj.get("s_t"));
        		paramMap.put("b_s", jsonObj.get("b_s"));
        		paramMap.put("gd", jsonObj.get("gd"));
        		paramMap.put("tto", jsonObj.get("tto"));
        		paramMap.put("t_o", jsonObj.get("t_o"));
        		paramMap.put("wft", jsonObj.get("wft"));
        		paramMap.put("woft", jsonObj.get("woft"));
        		paramMap.put("idf", jsonObj.get("idf"));
        		paramMap.put("tf", jsonObj.get("tf"));
        		paramMap.put("bf", jsonObj.get("bf"));
        		paramMap.put("ef", jsonObj.get("ef"));
        		paramMap.put("foul_tot", jsonObj.get("foul_tot"));
        		paramMap.put("tfb", jsonObj.get("tfb"));
        		paramMap.put("fb", jsonObj.get("fb"));
        		paramMap.put("p_score", jsonObj.get("p_score"));
        		paramMap.put("score", jsonObj.get("score"));
        		paramMap.put("foulout", jsonObj.get("foulout"));
        		paramMap.put("rank", jsonObj.get("rank"));
        		paramMap.put("t_win", jsonObj.get("t_win"));
        		paramMap.put("t_loss", jsonObj.get("t_loss"));
        		paramMap.put("t_draw", jsonObj.get("t_draw"));
        		paramMap.put("game_count", jsonObj.get("game_count"));
        		paramMap.put("win", jsonObj.get("win"));
        		paramMap.put("loss", jsonObj.get("loss"));
        		paramMap.put("draw", jsonObj.get("draw"));
        		paramMap.put("inout", jsonObj.get("inout"));
        		paramMap.put("inout1", jsonObj.get("inout1"));
        		paramMap.put("win_rate", jsonObj.get("win_rate"));
        		paramMap.put("game_flag", jsonObj.get("game_flag"));
        		paramMap.put("conti_win", jsonObj.get("conti_win"));
        		paramMap.put("conti_loss", jsonObj.get("conti_loss"));
        		paramMap.put("conti_date", jsonObj.get("conti_date"));
        		paramMap.put("win_diff", jsonObj.get("win_diff"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				paramMap.put("wl_three", jsonObj.get("wl_three"));
//				cnt += service.insertTeamDailyRank(paramMap);
				cnt += service.mergeTeamDailyRank(paramMap);
			}
			System.out.println(cnt);
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}
	//쿼터리스트
	@RequestMapping(value = "/teamQuarterListApi", method = RequestMethod.GET)
	public String teamQuarterListApi(String season_code,String game_code,String game_no) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gameResult.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("game_no", game_no);
		paramMap.put("mode", "quarter");
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		System.out.println(sb2.toString());
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
			service.deleteTeamQuarterList(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("team_code", jsonObj.get("team_code"));
				paramMap.put("home_away", jsonObj.get("home_away"));
				paramMap.put("quarter_gu", jsonObj.get("quarter_gu"));
				paramMap.put("away_team", jsonObj.get("away_team"));
				paramMap.put("play_min", jsonObj.get("play_min"));
				paramMap.put("play_sec", jsonObj.get("play_sec"));
				paramMap.put("fg", jsonObj.get("fg"));
				paramMap.put("fg_a", jsonObj.get("fg_a"));
				paramMap.put("ft", jsonObj.get("ft"));
				paramMap.put("ft_a", jsonObj.get("ft_a"));
				paramMap.put("threep", jsonObj.get("threep"));
				paramMap.put("threep_a", jsonObj.get("threep_a"));
				paramMap.put("dk", jsonObj.get("dk"));
				paramMap.put("dk_a", jsonObj.get("dk_a"));
				paramMap.put("pp", jsonObj.get("pp"));
				paramMap.put("pp_a", jsonObj.get("pp_a"));
				paramMap.put("o_r", jsonObj.get("o_r"));
				paramMap.put("d_r", jsonObj.get("d_r"));
				paramMap.put("t_r", jsonObj.get("t_r"));
				paramMap.put("a_s", jsonObj.get("a_s"));
				paramMap.put("s_t", jsonObj.get("s_t"));
				paramMap.put("b_s", jsonObj.get("b_s"));
				paramMap.put("gd", jsonObj.get("gd"));
				paramMap.put("tto", jsonObj.get("tto"));
				paramMap.put("t_o", jsonObj.get("t_o"));
				paramMap.put("wft", jsonObj.get("wft"));
				paramMap.put("woft", jsonObj.get("woft"));
				paramMap.put("idf", jsonObj.get("idf"));
				paramMap.put("tf", jsonObj.get("tf"));
				paramMap.put("bf", jsonObj.get("bf"));
				paramMap.put("ef", jsonObj.get("ef"));
				paramMap.put("foul_tot", jsonObj.get("foul_tot"));
				paramMap.put("tfb", jsonObj.get("tfb"));
				paramMap.put("fb", jsonObj.get("fb"));
				paramMap.put("p_score", jsonObj.get("p_score"));
				paramMap.put("score", jsonObj.get("score"));
				paramMap.put("foulout", jsonObj.get("foulout"));
				paramMap.put("inout", jsonObj.get("inout"));
				paramMap.put("inout1", jsonObj.get("inout1"));
				paramMap.put("r_count", jsonObj.get("r_count"));
				paramMap.put("s_count", jsonObj.get("s_count"));
				paramMap.put("pd_score", jsonObj.get("pd_score"));
				paramMap.put("md_score", jsonObj.get("md_score"));
				paramMap.put("opertime", jsonObj.get("opertime"));
				paramMap.put("fo", jsonObj.get("fo"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				cnt += service.insertTeamQuarterList(paramMap);
			}
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}
	//경기일자별 리스트
	@RequestMapping(value = "/teamDailyListApi", method = RequestMethod.GET)
	public String teamDailyListApi(String season_code,String game_code,String game_no) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gameResult.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("game_no", game_no);
		paramMap.put("mode", "daily");
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		System.out.println(sb2.toString());
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
			service.deleteTeamDailyList(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("team_code", jsonObj.get("team_code"));
				paramMap.put("home_away", jsonObj.get("home_away"));
				paramMap.put("away_team", jsonObj.get("away_team"));
				paramMap.put("play_min", jsonObj.get("play_min"));
				paramMap.put("play_sec", jsonObj.get("play_sec"));
				paramMap.put("fg", jsonObj.get("fg"));
				paramMap.put("fg_a", jsonObj.get("fg_a"));
				paramMap.put("ft", jsonObj.get("ft"));
				paramMap.put("ft_a", jsonObj.get("ft_a"));
				paramMap.put("threep", jsonObj.get("threep"));
				paramMap.put("threep_a", jsonObj.get("threep_a"));
				paramMap.put("dk", jsonObj.get("dk"));
				paramMap.put("dk_a", jsonObj.get("dk_a"));
				paramMap.put("pp", jsonObj.get("pp"));
				paramMap.put("pp_a", jsonObj.get("pp_a"));
				paramMap.put("o_r", jsonObj.get("o_r"));
				paramMap.put("d_r", jsonObj.get("d_r"));
				paramMap.put("t_r", jsonObj.get("t_r"));
				paramMap.put("a_s", jsonObj.get("a_s"));
				paramMap.put("s_t", jsonObj.get("s_t"));
				paramMap.put("b_s", jsonObj.get("b_s"));
				paramMap.put("gd", jsonObj.get("gd"));
				paramMap.put("tto", jsonObj.get("tto"));
				paramMap.put("t_o", jsonObj.get("t_o"));
				paramMap.put("wft", jsonObj.get("wft"));
				paramMap.put("woft", jsonObj.get("woft"));
				paramMap.put("idf", jsonObj.get("idf"));
				paramMap.put("tf", jsonObj.get("tf"));
				paramMap.put("bf", jsonObj.get("bf"));
				paramMap.put("ef", jsonObj.get("ef"));
				paramMap.put("foul_tot", jsonObj.get("foul_tot"));
				paramMap.put("tfb", jsonObj.get("tfb"));
				paramMap.put("fb", jsonObj.get("fb"));
				paramMap.put("p_score", jsonObj.get("p_score"));
				paramMap.put("score", jsonObj.get("score"));
				paramMap.put("foulout", jsonObj.get("foulout"));
				paramMap.put("win", jsonObj.get("win"));
				paramMap.put("loss", jsonObj.get("loss"));
				paramMap.put("draw", jsonObj.get("draw"));
				paramMap.put("inout", jsonObj.get("inout"));
				paramMap.put("inout1", jsonObj.get("inout1"));
				paramMap.put("r_count", jsonObj.get("r_count"));
				paramMap.put("s_count", jsonObj.get("s_count"));
				paramMap.put("pd_score", jsonObj.get("pd_score"));
				paramMap.put("md_score", jsonObj.get("md_score"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				Map<String,Object> updatetime =  (Map<String, Object>)jsonObj.get("updatetime");
				paramMap.put("updatetime", updatetime.get("date").toString().substring(0,23));
				cnt += service.insertTeamDailyList(paramMap);
			}
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}
	//문자중계
		@RequestMapping(value = "/smsApi", method = RequestMethod.GET)
		public String smsApi(String season_code,String game_code,String game_no) throws IOException, ParseException ,Exception{
			System.out.println("smsApi");
			String result = "true";
			int cnt = 0;
			StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gamehistory.php"); /*URL*/
			URL url = new URL(urlBuilder.toString());
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("season_code", season_code);
			paramMap.put("game_code", game_code);
			paramMap.put("game_no", game_no);
			StringBuilder sb = new StringBuilder();
			for(Map.Entry<String, Object> m : paramMap.entrySet()) {
				if(sb.length() != 0) sb.append("&");
				sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
				sb.append("=");
				sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
			}
			byte[] postDataBytes = sb.toString().getBytes("UTF-8");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
			conn.getOutputStream().write(postDataBytes);
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
			}
			StringBuilder sb2 = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb2.append(line);
			}
			System.out.println(sb2.toString());
			String jsonStr = sb2.toString();
			JSONParser parser = new JSONParser();
			JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
			// 여기서 각 JSON 객체를 처리할 수 있음
			if(jsonArray.size()>0) {
				service.deleteSmsRelay(paramMap);
				for (Object obj : jsonArray) {
					JSONObject jsonObj = (JSONObject) obj;
					paramMap.put("gamehistory_se", jsonObj.get("gamehistory_se"));
					paramMap.put("seq_no", jsonObj.get("seq_no"));
					paramMap.put("quarter_gu", jsonObj.get("quarter_gu"));
					paramMap.put("seq", jsonObj.get("seq"));
					paramMap.put("sync_seq", jsonObj.get("sync_seq"));
					paramMap.put("team_code", jsonObj.get("team_code"));
					paramMap.put("away_team", jsonObj.get("away_team"));
					paramMap.put("player_no", jsonObj.get("player_no"));
					paramMap.put("play_min", jsonObj.get("play_min"));
					paramMap.put("play_sec", jsonObj.get("play_sec"));
					paramMap.put("action_gu", jsonObj.get("action_gu"));
					paramMap.put("foul_code", jsonObj.get("foul_code"));
					paramMap.put("play_cnt", jsonObj.get("play_cnt"));
					paramMap.put("change_gu", jsonObj.get("change_gu"));
					paramMap.put("change_d_code", jsonObj.get("change_d_code"));
					paramMap.put("remark", jsonObj.get("remark"));
					paramMap.put("player_no_opponent", jsonObj.get("player_no_opponent"));
					paramMap.put("EVENT_NO", jsonObj.get("EVENT_NO"));
					paramMap.put("GH_SEQ_SE", jsonObj.get("GH_SEQ_SE"));
					Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
					paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
					cnt += service.insertSmsRelay(paramMap); 
				}
				if(cnt<jsonArray.size()) {
					result ="false";
				}
			}else {
				result ="false";
			}
			rd.close();
			conn.disconnect();
			return result;
		}
	//선수일자별 리스트
	@RequestMapping(value = "/playerDailyListApi", method = RequestMethod.GET)
	public String playerDailyListApi(String season_code,String game_code,String game_no) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gameResult.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("game_no", game_no);
		paramMap.put("mode", "player");
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		System.out.println(sb2.toString());
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
			service.deletePlayerDailyList(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("team_code", jsonObj.get("team_code"));
				paramMap.put("home_away", jsonObj.get("home_away"));
				paramMap.put("back_num", jsonObj.get("back_num"));
				paramMap.put("player_no", jsonObj.get("player_no"));
				paramMap.put("pos", jsonObj.get("pos"));
				paramMap.put("away_team", jsonObj.get("away_team"));
				paramMap.put("start_flag", jsonObj.get("start_flag"));
				paramMap.put("play_min", jsonObj.get("play_min"));
				paramMap.put("play_sec", jsonObj.get("play_sec"));
				paramMap.put("fg", jsonObj.get("fg"));
				paramMap.put("fg_a", jsonObj.get("fg_a"));
				paramMap.put("ft", jsonObj.get("ft"));
				paramMap.put("ft_a", jsonObj.get("ft_a"));
				paramMap.put("threep", jsonObj.get("threep"));
				paramMap.put("threep_a", jsonObj.get("threep_a"));
				paramMap.put("dk", jsonObj.get("dk"));
				paramMap.put("dk_a", jsonObj.get("dk_a"));
				paramMap.put("pp", jsonObj.get("pp"));
				paramMap.put("pp_a", jsonObj.get("pp_a"));
				paramMap.put("o_r", jsonObj.get("o_r"));
				paramMap.put("d_r", jsonObj.get("d_r"));
				paramMap.put("a_s", jsonObj.get("a_s"));
				paramMap.put("s_t", jsonObj.get("s_t"));
				paramMap.put("b_s", jsonObj.get("b_s"));
				paramMap.put("gd", jsonObj.get("gd"));
				paramMap.put("t_o", jsonObj.get("t_o"));
				paramMap.put("wft", jsonObj.get("wft"));
				paramMap.put("woft", jsonObj.get("woft"));
				paramMap.put("idf", jsonObj.get("idf"));
				paramMap.put("tf", jsonObj.get("tf"));
				paramMap.put("ef", jsonObj.get("ef"));
				paramMap.put("foul_tot", jsonObj.get("foul_tot"));
				paramMap.put("fb", jsonObj.get("fb"));
				paramMap.put("p_score", jsonObj.get("p_score"));
				paramMap.put("score", jsonObj.get("score"));
				paramMap.put("inout", jsonObj.get("inout"));
				paramMap.put("inout1", jsonObj.get("inout1"));
				paramMap.put("fo", jsonObj.get("fo"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				Map<String,Object> updatetime =  (Map<String, Object>)jsonObj.get("updatetime");
				paramMap.put("updatetime", updatetime.get("date").toString().substring(0,23));
				cnt += service.insertPlayerDailyList(paramMap);
			}
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}
	//선수 합산
	@RequestMapping(value = "/playerSumApi", method = RequestMethod.GET)
	public String playerSumApi(String season_code,String game_code) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gameRecord.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("mode", "player");
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		System.out.println(sb2.toString());
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
			service.deletePlayerSum(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("quarter_gu", jsonObj.get("quarter_gu"));
				paramMap.put("player_no", jsonObj.get("player_no"));
				paramMap.put("game_count", jsonObj.get("game_count"));
				paramMap.put("start_count", jsonObj.get("start_count"));
				paramMap.put("play_min", jsonObj.get("play_min"));
				paramMap.put("play_sec", jsonObj.get("play_sec"));
				paramMap.put("fg", jsonObj.get("fg"));
				paramMap.put("fg_a", jsonObj.get("fg_a"));
				paramMap.put("ft", jsonObj.get("ft"));
				paramMap.put("ft_a", jsonObj.get("ft_a"));
				paramMap.put("threep", jsonObj.get("threep"));
				paramMap.put("threep_a", jsonObj.get("threep_a"));
				paramMap.put("dk", jsonObj.get("dk"));
				paramMap.put("dk_a", jsonObj.get("dk_a"));
				paramMap.put("pp", jsonObj.get("pp"));
				paramMap.put("pp_a", jsonObj.get("pp_a"));
				paramMap.put("o_r", jsonObj.get("o_r"));
				paramMap.put("d_r", jsonObj.get("d_r"));
				paramMap.put("a_s", jsonObj.get("a_s"));
				paramMap.put("s_t", jsonObj.get("s_t"));
				paramMap.put("b_s", jsonObj.get("b_s"));
				paramMap.put("gd", jsonObj.get("gd"));
				paramMap.put("t_o", jsonObj.get("t_o"));
				paramMap.put("wft", jsonObj.get("wft"));
				paramMap.put("woft", jsonObj.get("woft"));
				paramMap.put("idf", jsonObj.get("idf"));
				paramMap.put("tf", jsonObj.get("tf"));
				paramMap.put("ef", jsonObj.get("ef"));
				paramMap.put("foul_tot", jsonObj.get("foul_tot"));
				paramMap.put("fb", jsonObj.get("fb"));
				paramMap.put("p_score", jsonObj.get("p_score"));
				paramMap.put("score", jsonObj.get("score"));
				paramMap.put("foulout", jsonObj.get("foulout"));
				paramMap.put("inout", jsonObj.get("inout"));
				paramMap.put("inout1", jsonObj.get("inout1"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				cnt += service.insertPlayerSum(paramMap);
			}
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}
	//팀 합산
	@RequestMapping(value = "/teamSumApi", method = RequestMethod.GET)
	public String teamSumApi(String season_code,String game_code) throws IOException, ParseException ,Exception{
		String result = "true";
		int cnt = 0;
		StringBuilder urlBuilder = new StringBuilder("http://kblapi.esoom.co.kr/api/gameRecord.php"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("season_code", season_code);
		paramMap.put("game_code", game_code);
		paramMap.put("mode", "team");
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, Object> m : paramMap.entrySet()) {
			if(sb.length() != 0) sb.append("&");
			sb.append(URLEncoder.encode(m.getKey(),"UTF-8"));
			sb.append("=");
			sb.append(URLEncoder.encode(String.valueOf(m.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = sb.toString().getBytes("UTF-8");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.getOutputStream().write(postDataBytes);
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb2 = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb2.append(line);
		}
		System.out.println(sb2.toString());
		String jsonStr = sb2.toString();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(jsonStr);
		// 여기서 각 JSON 객체를 처리할 수 있음
		if(jsonArray.size()>0) {
			service.deleteTeamSum(paramMap);
			for (Object obj : jsonArray) {
				JSONObject jsonObj = (JSONObject) obj;
				paramMap.put("team_code", jsonObj.get("team_code"));
				paramMap.put("quarter_gu", jsonObj.get("quarter_gu"));
				paramMap.put("game_count", jsonObj.get("game_count"));
				paramMap.put("play_min", jsonObj.get("play_min"));
				paramMap.put("play_sec", jsonObj.get("play_sec"));
				paramMap.put("fg", jsonObj.get("fg"));
				paramMap.put("fg_a", jsonObj.get("fg_a"));
				paramMap.put("ft", jsonObj.get("ft"));
				paramMap.put("ft_a", jsonObj.get("ft_a"));
				paramMap.put("threep", jsonObj.get("threep"));
				paramMap.put("threep_a", jsonObj.get("threep_a"));
				paramMap.put("dk", jsonObj.get("dk"));
				paramMap.put("dk_a", jsonObj.get("dk_a"));
				paramMap.put("pp", jsonObj.get("pp"));
				paramMap.put("pp_a", jsonObj.get("pp_a"));
				paramMap.put("o_r", jsonObj.get("o_r"));
				paramMap.put("d_r", jsonObj.get("d_r"));
				paramMap.put("t_r", jsonObj.get("t_r"));
				paramMap.put("a_s", jsonObj.get("a_s"));
				paramMap.put("s_t", jsonObj.get("s_t"));
				paramMap.put("b_s", jsonObj.get("b_s"));
				paramMap.put("gd", jsonObj.get("gd"));
				paramMap.put("tto", jsonObj.get("tto"));
				paramMap.put("t_o", jsonObj.get("t_o"));
				paramMap.put("wft", jsonObj.get("wft"));
				paramMap.put("woft", jsonObj.get("woft"));
				paramMap.put("idf", jsonObj.get("idf"));
				paramMap.put("tf", jsonObj.get("tf"));
				paramMap.put("bf", jsonObj.get("bf"));
				paramMap.put("ef", jsonObj.get("ef"));
				paramMap.put("foul_tot", jsonObj.get("foul_tot"));
				paramMap.put("tfb", jsonObj.get("tfb"));
				paramMap.put("fb", jsonObj.get("fb"));
				paramMap.put("p_score", jsonObj.get("p_score"));
				paramMap.put("score", jsonObj.get("score"));
				paramMap.put("foulout", jsonObj.get("foulout"));
				paramMap.put("rank", jsonObj.get("rank"));
				paramMap.put("win", jsonObj.get("win"));
				paramMap.put("loss", jsonObj.get("loss"));
				paramMap.put("draw", jsonObj.get("draw"));
				paramMap.put("inout", jsonObj.get("inout"));
				paramMap.put("inout1", jsonObj.get("inout1"));
				Map<String,Object> inputtime =  (Map<String, Object>)jsonObj.get("inputtime");
				paramMap.put("inputtime", inputtime.get("date").toString().substring(0,23));
				cnt += service.insertTeamSum(paramMap);
			}
			if(cnt<jsonArray.size()) {
				result ="false";
			}
		}else {
			result ="false";
		}
		rd.close();
		conn.disconnect();
		return result;
	}

}
