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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.esoom.kcc.common.AesUtil;
import com.esoom.kcc.common.IpUtil;
import com.esoom.kcc.common.PageInfo;
import com.esoom.kcc.common.Pagination;
import com.esoom.kcc.common.ShaUtil;
import com.esoom.kcc.service.AdminService;
import com.esoom.kcc.service.CommonService;
import com.esoom.kcc.service.FanzoneService;
import com.esoom.kcc.service.MailService;
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
public class MemberController {
	@Autowired
	private CommonService commonService;
	@Autowired
	private MemberService service;
	@Autowired
    private AesUtil aesUtil;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
	private PlayerService playerService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private FanzoneService fanzoneService;
	@Autowired
	private MailService mailService;
	@Autowired
	private AdminService adminService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	 //http 통신을 위한 함수
    public static String testHttpRequest(String targetURL, String parameters , String Auth, String productID) {
        HttpURLConnection connection = null;
        
        try {
            URL url = new URL(targetURL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST"); 
            connection.setRequestProperty("Content-Type","application/json");
            connection.setRequestProperty("Authorization","bearer "+Auth);
            connection.setRequestProperty("productID", productID);
            connection.setDoOutput(true);
            
            DataOutputStream wr = new DataOutputStream (connection.getOutputStream());
            
            wr.writeBytes(parameters);
            wr.close();
            InputStream is = connection.getInputStream();
            
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, "utf-8"));
            
            StringBuilder response = new StringBuilder(); 
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
                response.append('\r');
            }
            rd.close();
            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (connection != null) {
            connection.disconnect();
            }
        }
    }
  //대칭키 생성을 위한 함수
    public static String encryptSHA256(String result)throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(result.getBytes());
        byte[] arrHashValue = md.digest();
        String resultVal = Base64.getEncoder().encodeToString(arrHashValue);

        return resultVal;
    }
        
    //암호화를 위한 함수
    public static String encryptAES(String reqData, String key, String iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
            InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
        SecretKey secureKey = new SecretKeySpec(key.getBytes(), "AES");
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(iv.getBytes()));
        byte[] encrypted = c.doFinal(reqData.trim().getBytes());
        String reqDataEnc =Base64.getEncoder().encodeToString(encrypted);
        
        return reqDataEnc;
    }
    
    //무결성값 생성을 위한 함수
    public static byte[] hmac256(byte[] secretKey,byte[] message) 
            throws NoSuchAlgorithmException, InvalidKeyException{
        byte[] hmac256 = null;
        Mac mac = Mac.getInstance("HmacSHA256");
        SecretKeySpec sks = new SecretKeySpec(secretKey, "HmacSHA256");
        mac.init(sks);
        hmac256 = mac.doFinal(message);
        
        return hmac256;     
      }
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public ModelAndView loginForm(ModelAndView mv,HttpServletRequest request) {
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
		mv.setViewName("member/loginForm");
		return mv;
	}
	@RequestMapping(value = "/joinForm1", method = RequestMethod.GET)
	public ModelAndView joinForm1(ModelAndView mv,HttpServletRequest request) {
		mv.setViewName("member/joinForm1");
		return mv;
	}
	@RequestMapping(value = "/joinForm2", method = RequestMethod.GET)
	public ModelAndView joinForm2(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
		String tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/oauth/oauth/token";
		String uParam="grant_type=client_credentials&scope=default";
		
		String clientID="605a8ef0-4a9a-459a-95af-212b06a8b275";
		String secretKey="426bc5973f865c56d601474883f53655";
		
		String Auth = Base64.getEncoder().encodeToString((clientID+":"+secretKey).getBytes());
		String responseData = testHttpRequest(tURL, uParam,Auth);
		String access_token="";
		
		try{
		    JSONParser jsonParse = new JSONParser();
		    JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
		    JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
		    
		    access_token= dataBody.get("access_token").toString();
		            
		}catch (ParseException e){
		    e.printStackTrace();
		}

		String client_id = "605a8ef0-4a9a-459a-95af-212b06a8b275";
		String productID = "2101979031";
	    
	    //운영용
		String returnURL = "https://kcctemp.esoom.co.kr/niceResult";
		//개발용
//		String returnURL = "http://kccdev.esoom.co.kr:8080/niceResult";

//		String returnURL = "http://123.143.147.76:8081/niceResult";
	    //URL의 경우 프로토콜(http/https)부터 사용바랍니다. 다를 경우 CORS 오류가 발생 할 수 있습니다.
	    //예) http://localhost/checkplus_success.jsp
	    
	    SimpleDateFormat TestDate = new SimpleDateFormat("yyyyMMddhhmmss");
	        
	    String req_dtim = TestDate.format(new Date());    
	    String req_no="REQ"+req_dtim+Double.toString(Math.random()).substring(2,6);
	    //요청고유번호(req_no)의 경우 업체 정책에 따라 거래 고유번호 설정 후 사용하면 됩니다.
	    //제공된 값은 예시입니다.
	    
	    Date currentDate = new Date();
	    long current_timestamp = currentDate.getTime() /1000;
	    
	     Auth = Base64.getEncoder().encodeToString((access_token+":"+current_timestamp+":"+client_id).getBytes());
	    
	     tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/api/v1.0/common/crypto/token";
	    
	     uParam="{\"dataHeader\":{\"CNTY_CD\":\"kr\"},"
	            + "\"dataBody\":{\"req_dtim\":\""+req_dtim+"\","
	            +"\"req_no\":\""+req_no+"\","
	            +"\"enc_mode\":\"1\""
	            + "}}";
	    
	     responseData = testHttpRequest(tURL, uParam, Auth, productID);
	    
	    
	    String token_version_id = "";
	    String sitecode = "";
	    String token_val = "";    
	    
	    try{
	        JSONParser jsonParse = new JSONParser();
	        JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
	                
	        JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
	        
	        token_version_id = dataBody.get("token_version_id").toString();
	        sitecode = dataBody.get("site_code").toString();
	        token_val = dataBody.get("token_val").toString();
	                
	    }catch (ParseException e){
	        e.printStackTrace();
	    }
	    
	    String result = req_dtim.trim()+req_no.trim()+token_val.trim();

	    String resultVal = encryptSHA256(result);
	    
	    String key =resultVal.substring(0,16);
	    String iv =resultVal.substring(resultVal.length()-16);
	    String hmac_key =resultVal.substring(0,32);
	    
	    String plain ="{"
	    +"\"requestno\":\""+req_no+"\","
	    +"\"returnurl\":\""+returnURL+"\","
	    +"\"sitecode\":\""+sitecode+"\","
	    +"\"methodtype\":\"get\""
	    +"}";
	    
	    String enc_data = encryptAES(plain, key, iv);

	    byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
	    String integrity = Base64.getEncoder().encodeToString(hmacSha256);
	    
	    // 인증 완료 후 success페이지에서 사용을 위한 key값은 DB,세션등 업체 정책에 맞춰 관리 후 사용하면 됩니다.
	    // 예시에서 사용하는 방법은 세션이며, 세션을 사용할 경우 반드시 인증 완료 후 세션이 유실되지 않고 유지되도록 확인 바랍니다. 
	    // key, iv, hmac_key 값들은 token_version_id에 따라 동일하게 생성되는 고유값입니다.
	    // success페이지에서 token_version_id가 일치하는지 확인 바랍니다.
	    session.setAttribute("req_no", req_no);
	    session.setAttribute("key" , key);
	    session.setAttribute("iv" , iv);
	    session.setAttribute("hmac_key" , hmac_key);
	    session.setAttribute("token_version_id", token_version_id);
	    String check3 = request.getParameter("check3");
	    session.setAttribute("check3", check3);
	    mv.addObject("enc_data",enc_data);
		mv.addObject("token_version_id",token_version_id);
		mv.addObject("integrity_value",integrity);
		mv.setViewName("member/joinForm2");
		return mv;
	}
	@RequestMapping(value = "/joinForm3", method = RequestMethod.GET)
	public ModelAndView joinForm3(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
		String name= (String)session.getAttribute("name");
		String gender= (String)session.getAttribute("gender");
		String birthdate= (String)session.getAttribute("birthdate");
		String di= (String)session.getAttribute("di");
		String mobileno= (String)session.getAttribute("mobileno");
		String adYn= (String)session.getAttribute("check3");
		String yyyy = birthdate.substring(0,4);
		String mm = birthdate.substring(4, 6);
		String dd = birthdate.substring(6, 8);
		String fistNum = mobileno.substring(0, 3); // '010'
        String middleNum = mobileno.substring(3, 7); // '0000'
        String lastNum = mobileno.substring(7, 11);  // '0000'
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<Map<String,Object>> playerList = playerService.playerList(paramMap);
        for(Map m:playerList) {
        	String code = m.get("pl_pos_code").toString();
        	if("c".equals(code)) {
        		m.put("pl_pos_nm", "센터");
        	}
        	if("f".equals(code)) {
        		m.put("pl_pos_nm", "포워드");
        	}
        	if("g".equals(code)) {
        		m.put("pl_pos_nm", "가드");
        	}
        }
		mv.addObject("playerList", playerList);
		mv.addObject("name", name);
		mv.addObject("gender", gender);
		mv.addObject("birthdate", birthdate);
		mv.addObject("di", di);
		mv.addObject("mobileno", mobileno);
		mv.addObject("yyyy", yyyy);
		mv.addObject("mm", mm);
		mv.addObject("dd", dd);
		mv.addObject("fistNum", fistNum);
		mv.addObject("middleNum", middleNum);
		mv.addObject("lastNum", lastNum);
		mv.addObject("adYn", adYn);
		mv.setViewName("member/joinForm3");
		return mv;
	}
	@RequestMapping(value = "/niceResult", method = RequestMethod.GET)
	public ModelAndView niceResult(ModelAndView mv,HttpServletRequest request,HttpSession session,
			@RequestParam(value = "enc_data") String enc_data,
			@RequestParam(value = "token_version_id") String token_version_id,
			@RequestParam(value = "integrity_value") String integrity_value) throws Exception {
		String req_no = (String)session.getAttribute("req_no");
	    String key = (String)session.getAttribute("key");
	    String iv = (String)session.getAttribute("iv");
	    String hmac_key = (String)session.getAttribute("hmac_key");
	    String s_token_version_id = (String)session.getAttribute("token_version_id");
	    String enctime ="";
	    String requestno ="";
	    String responseno ="";
	    String authtype ="";
	    String name ="";
	    String birthdate = "";
	    String gender ="";
	    String nationalinfo="";
	    String ci ="";
	    String di ="";
	    String mobileno ="";
	    String mobileco ="";

	    String sMessage ="";
	            
	     byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
	    String integrity = Base64.getEncoder().encodeToString(hmacSha256);
	    
	    
	    if (!integrity.equals(integrity_value)){
	        sMessage = "무결성 값이 다릅니다. 데이터가 변경된 것이 아닌지 확인 바랍니다.";
	    }else{
	        String dec_data = getAesDecDataPKCS5(key.getBytes(), iv.getBytes(), enc_data);
	        
	        JSONParser jsonParse = new JSONParser();
	        JSONObject plain_data = (JSONObject) jsonParse.parse(dec_data);
	        
	        if (!req_no.equals(plain_data.get("requestno").toString())){
	            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
	        }else{
	            sMessage = "복호화 성공";
	            
	            enctime =plain_data.get("enctime").toString();
	            requestno =plain_data.get("requestno").toString();
	            responseno =plain_data.get("responseno").toString();
	            authtype =plain_data.get("authtype").toString();
	            name = URLDecoder.decode(plain_data.get("utf8_name").toString(), "UTF-8");
	            birthdate = plain_data.get("birthdate").toString();
	            gender =plain_data.get("gender").toString();
	            nationalinfo=plain_data.get("nationalinfo").toString();
	            ci =plain_data.get("ci").toString();
	            di =plain_data.get("di").toString();
	            mobileno =plain_data.get("mobileno").toString();
	            mobileco =plain_data.get("mobileco").toString();
	            session.setAttribute("name", name);
	            session.setAttribute("di", di);
	            session.setAttribute("gender", gender);
	            session.setAttribute("birthdate", birthdate);
	            session.setAttribute("mobileno", mobileno);
	        }
	    } 
		mv.setViewName("member/niceResult");
		return mv;
	}
	@RequestMapping(value = "/niceResult2", method = RequestMethod.GET)
	public ModelAndView niceResult2(ModelAndView mv,HttpServletRequest request,HttpSession session,
			@RequestParam(value = "enc_data") String enc_data,
			@RequestParam(value = "token_version_id") String token_version_id,
			@RequestParam(value = "integrity_value") String integrity_value) throws Exception {
		String req_no = (String)session.getAttribute("req_no");
		String key = (String)session.getAttribute("key");
		String iv = (String)session.getAttribute("iv");
		String hmac_key = (String)session.getAttribute("hmac_key");
		String s_token_version_id = (String)session.getAttribute("token_version_id");
		String enctime ="";
		String requestno ="";
		String responseno ="";
		String authtype ="";
		String name ="";
		String birthdate = "";
		String gender ="";
		String nationalinfo="";
		String ci ="";
		String di ="";
		String mobileno ="";
		String mobileco ="";
		
		String sMessage ="";
		
		byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
		String integrity = Base64.getEncoder().encodeToString(hmacSha256);
		
		
		if (!integrity.equals(integrity_value)){
			sMessage = "무결성 값이 다릅니다. 데이터가 변경된 것이 아닌지 확인 바랍니다.";
		}else{
			String dec_data = getAesDecDataPKCS5(key.getBytes(), iv.getBytes(), enc_data);
			
			JSONParser jsonParse = new JSONParser();
			JSONObject plain_data = (JSONObject) jsonParse.parse(dec_data);
			
			if (!req_no.equals(plain_data.get("requestno").toString())){
				sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
			}else{
				sMessage = "복호화 성공";
				
				enctime =plain_data.get("enctime").toString();
				requestno =plain_data.get("requestno").toString();
				responseno =plain_data.get("responseno").toString();
				authtype =plain_data.get("authtype").toString();
				name = URLDecoder.decode(plain_data.get("utf8_name").toString(), "UTF-8");
				birthdate = plain_data.get("birthdate").toString();
				gender =plain_data.get("gender").toString();
				nationalinfo=plain_data.get("nationalinfo").toString();
				ci =plain_data.get("ci").toString();
				di =plain_data.get("di").toString();
				mobileno =plain_data.get("mobileno").toString();
				mobileco =plain_data.get("mobileco").toString();
				session.setAttribute("name", name);
				session.setAttribute("di", di);
				session.setAttribute("gender", gender);
				session.setAttribute("birthdate", birthdate);
				session.setAttribute("mobileno", mobileno);
				mv.addObject("name", name);
				mv.addObject("di", di);
				mv.addObject("gender", gender);
				mv.addObject("birthdate", birthdate);
				mv.addObject("mobileno", mobileno);
			}
		} 
		mv.setViewName("member/niceResult2");
		return mv;
	}
    public static String testHttpRequest(String targetURL, String parameters , String Auth) {
        HttpURLConnection connection = null;
        
            try {
                URL url = new URL(targetURL);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST"); 
                connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
                connection.setRequestProperty("Authorization","Basic "+Auth);
                connection.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream (connection.getOutputStream());
                     
                wr.writeBytes(parameters);
                wr.close();
                
                InputStream is = connection.getInputStream();
                
                BufferedReader rd = new BufferedReader(new InputStreamReader(is, "utf-8"));
                StringBuilder response = new StringBuilder(); 
                String line;
                while ((line = rd.readLine()) != null) {
                    response.append(line);
                    response.append('\r');
                }
                rd.close();
                return response.toString();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
        }
  //복호화를 위한 함수
    public static String getAesDecDataPKCS5(byte[] key, byte[] iv, String base64Enc) throws Exception {
        SecretKey secureKey = new SecretKeySpec(key, "AES");
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(iv));
        byte[] cipherEnc = Base64.getDecoder().decode(base64Enc);
                
        String Dec = new String(c.doFinal(cipherEnc), "utf-8");
                
        return Dec;
    }
    @ResponseBody
	@RequestMapping(value = "/duplicateId", method = RequestMethod.GET)
	public String duplicateId(String member_id)throws Exception {
    	String result ="true"; 
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("member_id", member_id);
		int cnt = service.duplicateMember(paramMap);
		System.out.println("cnt=========="+cnt);
		if(cnt >0) {
			result = "false";
		}
		return result;
	}
    @ResponseBody
    @RequestMapping(value = "/duplicateEmail", method = RequestMethod.GET)
    public String duplicateEmail(String email,@RequestParam(value = "num", required = false) String num)throws Exception {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	if(num != null && !"".equals(num)) {
    		paramMap.put("num", num);
    	}
    	String result ="true"; 
    	email = aesUtil.encryptAes2(email);
    	paramMap.put("email", email);
    	int cnt = service.duplicateMember(paramMap);
    	System.out.println("cnt=========="+cnt);
    	if(cnt >0) {
    		result = "false";
    	}
    	return result;
    }
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public ModelAndView join(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	String name = request.getParameter("name");
    	String member_id = request.getParameter("member_id");
    	String member_pwd = request.getParameter("member_pwd");
    	String fistNum = request.getParameter("fistNum");
    	String middleNum = request.getParameter("middleNum");
    	String lastNum = request.getParameter("lastNum");
    	String yyyy = request.getParameter("yyyy");
    	String mm = request.getParameter("mm");
    	String dd = request.getParameter("dd");
    	String sex = request.getParameter("sex");
    	String email_id = request.getParameter("email_id");
    	String email_domain = request.getParameter("email_domain");
    	String chk_email = request.getParameter("chk_email");
    	String chk_sms = request.getParameter("chk_sms");
    	String zipcode = request.getParameter("zipcode");
    	String addr = request.getParameter("addr");
    	String daddr = request.getParameter("daddr");
    	String player_no = request.getParameter("player_no");
    	String di = (String)session.getAttribute("di");
    	String ip = ipUtil.getClientIP(request);
    	
    	paramMap.put("name",name);
    	paramMap.put("member_id",member_id);
    	String pwd = shaUtil.encrypt(member_pwd);
    	paramMap.put("pwd",pwd);
    	String tel = fistNum+"-"+middleNum+"-"+lastNum;
    	tel = aesUtil.encryptAes2(tel);
    	paramMap.put("tel", tel);
    	String jumin = yyyy+"-"+mm+"-"+dd;
    	jumin = aesUtil.encryptAes2(jumin);
    	paramMap.put("jumin", jumin);
    	paramMap.put("sex", sex);
    	String email = email_id+"@"+email_domain;
    	email = aesUtil.encryptAes2(email);
    	paramMap.put("email", email);
    	if (chk_email == null) {
    		paramMap.put("chk_email", "N");
    	}else {
    		paramMap.put("chk_email", "Y");
    	}
    	
    	if (chk_sms == null) {
    		paramMap.put("chk_sms", "N");
    	}else {
    		paramMap.put("chk_sms", "Y");
    	}
    	zipcode = aesUtil.encryptAes2(zipcode);
    	paramMap.put("zipcode", zipcode);
    	addr = aesUtil.encryptAes2(addr);
    	paramMap.put("addr", addr);
    	daddr = aesUtil.encryptAes2(daddr);
    	paramMap.put("daddr", daddr);
    	paramMap.put("player_no", player_no);
    	paramMap.put("di", di);
    	paramMap.put("ip", ip);
    	Map<String,Object> duplicateDi = service.duplicateDi(paramMap);
    	int result = 0;
    	if(duplicateDi != null) {
    		mv.addObject("msg", "가입 이력이 있는 회원입니다");
    		mv.setViewName("redirect:/joinForm2");
    		return mv;
    	}else {
    		result = service.insertMember(paramMap);
    	}
    	if (result > 0) {
    		Map<String, Object> loginUserMap = service.getMember(paramMap);
    		if (loginUserMap != null && loginUserMap.toString() != "") {
    			session.setAttribute("loginUserMap", loginUserMap);
    		}
    		mv.setViewName("redirect:/joinForm4");
    	}else {
    		mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("redirect:/joinForm3");
    	}
    	return mv;
    }
    @RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
    public ModelAndView memberUpdate(ModelAndView mv,HttpServletRequest request,HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	String num = request.getParameter("num");
    	String name = request.getParameter("name");
    	String member_id = request.getParameter("member_id");
    	String member_pwd = request.getParameter("member_pwd");
    	String fistNum = request.getParameter("fistNum");
    	String middleNum = request.getParameter("middleNum");
    	String lastNum = request.getParameter("lastNum");
    	String yyyy = request.getParameter("yyyy");
    	String mm = request.getParameter("mm");
    	String dd = request.getParameter("dd");
    	String sex = request.getParameter("sex");
    	String email_id = request.getParameter("email_id");
    	String email_domain = request.getParameter("email_domain");
    	String chk_email = request.getParameter("chk_email");
    	String chk_sms = request.getParameter("chk_sms");
    	String zipcode = request.getParameter("zipcode");
    	String addr = request.getParameter("addr");
    	String daddr = request.getParameter("daddr");
    	String player_no = request.getParameter("player_no");
    	String di = request.getParameter("di");
    	
    	paramMap.put("num",num);
    	paramMap.put("name",name);
    	paramMap.put("member_id",member_id);
    	Map<String,Object> user = service.getMember(paramMap);
    	String pwd = shaUtil.encrypt(member_pwd);
    	if (!pwd.equals(user.get("sha_pwd"))) {
    		mv.addObject("msg","비밀번호가 일치하지 않습니다.");
			mv.setViewName("redirect:/memberUpdateForm");
			return mv;
		} 
    	String tel = fistNum+"-"+middleNum+"-"+lastNum;
    	tel = aesUtil.encryptAes2(tel);
    	paramMap.put("tel", tel);
    	String jumin = yyyy+"-"+mm+"-"+dd;
    	jumin = aesUtil.encryptAes2(jumin);
    	paramMap.put("jumin", jumin);
    	paramMap.put("sex", sex);
    	String email = email_id+"@"+email_domain;
    	email = aesUtil.encryptAes2(email);
    	paramMap.put("email", email);
    	if (chk_email == null) {
    		paramMap.put("chk_email", "N");
    	}else {
    		paramMap.put("chk_email", "Y");
    	}
    	
    	if (chk_sms == null) {
    		paramMap.put("chk_sms", "N");
    	}else {
    		paramMap.put("chk_sms", "Y");
    	}
    	zipcode = aesUtil.encryptAes2(zipcode);
    	paramMap.put("zipcode", zipcode);
    	addr = aesUtil.encryptAes2(addr);
    	paramMap.put("addr", addr);
    	daddr = aesUtil.encryptAes2(daddr);
    	paramMap.put("daddr", daddr);
    	paramMap.put("player_no", player_no);
    	
    	int result = 0;
    	if(!"".equals(di)) {
    		if(user.get("di") != null) {
    			if(di.equals(user.get("di"))) {
    				paramMap.put("di", di);
    				result = service.updateMember(paramMap);
    			}else {
    				mv.addObject("msg","본인 인증 정보가 일치하지 않습니다.");
    				mv.setViewName("redirect:/memberUpdateForm");
    				return mv;
    			}
    		}else {
    			paramMap.put("di", di);
    			result = service.updateMember(paramMap);
    		}
    	}else {
    		if(user.get("di") != null) {
    			di = user.get("di").toString();
    			paramMap.put("di", di);
    			result = service.updateMember(paramMap);
    		}else {
    			mv.addObject("msg","본인 인증을 진행해주세요.");
				mv.setViewName("redirect:/memberUpdateForm");
				return mv;
    		}
    	}
    	
    	if (result > 0) {
    		mv.addObject("msg","회원정보가 변경되었습니다.");
    		mv.setViewName("redirect:/mypage");
    	}else {
    		mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
    		mv.setViewName("redirect:/memberUpdateForm");
    	}
    	return mv;
    }
    @RequestMapping(value = "/pwdUpdate", method = RequestMethod.GET)
    public ModelAndView pwdUpdate(ModelAndView mv,HttpServletRequest request,HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	String num = request.getParameter("num");
    	String member_pwd3 = request.getParameter("member_pwd3");
    	String member_pwd = request.getParameter("member_pwd");
    	
    	paramMap.put("num",num);
    	Map<String,Object> user = service.getMember(paramMap);
    	String pwd = shaUtil.encrypt(member_pwd3);
    	if (!pwd.equals(user.get("sha_pwd"))) {
    		mv.addObject("msg","비밀번호가 일치하지 않습니다.");
    		mv.setViewName("redirect:/changePwdForm?num="+num);
    		return mv;
    	} 
    	int result = 0;
    	String pwd2 = shaUtil.encrypt(member_pwd);
    	paramMap.put("pwd", pwd2);
    	result = adminService.changePwd(paramMap);
    	if (result > 0) {
    		mv.addObject("msg","비밀번호가 변경되었습니다.");
    		mv.setViewName("redirect:/mypage");
    	}else {
    		mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
    		mv.setViewName("redirect:/changePwdForm?num="+num);
    	}
    	return mv;
    }
    @RequestMapping(value = "/changePwdForm", method = RequestMethod.GET)
	public ModelAndView changePwdForm(ModelAndView mv,HttpServletRequest request,HttpSession session,
			@RequestParam(value = "num") String num) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("num", num);
    	Map<String,Object> userMap = service.getMember(paramMap);
    	result.putAll(userMap);
    	mv.addObject("resultMap", result);
		mv.setViewName("member/changePwdForm");
		return mv;
	}
    @RequestMapping(value = "/joinForm4", method = RequestMethod.GET)
    public ModelAndView joinForm4(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
    	mv.setViewName("member/joinForm4");
    	return mv;
    }
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map<String,Object> login(ModelAndView mv, HttpSession session, @RequestParam(value = "id") String id,
			@RequestParam(value = "pwd") String pwd,String remember,HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> paramMap = new HashMap<String, Object>();
		if(remember == null) {
			remember = "";
		}
		paramMap.put("member_id", id);
		// 입력한 아이디로 사용자 정보 조회
		Map<String, Object> userInfo = service.getMember(paramMap);
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
			pwd = shaUtil.encrypt(pwd);
			if (pwd.equals(userInfo.get("sha_pwd"))) { // 로그인 성공
				paramMap.put("num", userInfo.get("num"));
				int cnt = service.loginUpdate(paramMap);
				if(cnt>0) {
					session.setAttribute("loginUserMap", userInfo);
					result.put("loginMsg", "");
				}else {
					result.put("loginMsg", "로그인중 오류가 발생했습니다. 관리자에게 문의하세요.");
				}
			} else {// 비밀번호가 틀렸을 경우
				System.out.println("3");
				result.put("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
			}
		} else { // 아이디가 없을 경우
			System.out.println("4");
			result.put("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
		}
		return result;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		String member_id = loginUserMap.get("id").toString();
		paramMap.put("member_id", member_id);
		Map<String,Object> userMap = service.getMember(paramMap);
		String player_no ="";
		if(userMap.get("player_no")!= null && !"".equals(userMap.get("player_no"))) {
			player_no = userMap.get("player_no").toString();
		}
		if(!"".equals(player_no)) {
			paramMap.put("pl_no", player_no);
			paramMap.put("player_no", player_no);
			Map<String,Object> playerMap = playerService.getPlayer(paramMap);
			if(playerMap != null) {
				String pl_pos_code = playerMap.get("pl_pos_code").toString();
				String pl_pos_nm ="";
				if(pl_pos_code.equals("c")) {
					pl_pos_nm = "CENTER";
				}
				if(pl_pos_code.equals("f")) {
					pl_pos_nm = "FORWARD";
				}
				if(pl_pos_code.equals("g")) {
					pl_pos_nm = "GUARD";
				}
				playerMap.put("pl_pos_nm", pl_pos_nm);
			}
			mv.addObject("playerMap", playerMap);
			
			Map<String,Object> playerSumMap = playerService.getPlayerSum(paramMap);
			mv.addObject("playerSumMap", playerSumMap);
			List<Map<String,Object>> playerMediaList = newsService.getPlayerMediaList(paramMap);
			mv.addObject("playerMediaList", playerMediaList);
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			paramMap2.put("id", member_id);
			paramMap2.put("player_no", player_no);
			Map<String, Object> likePlayerMap = playerService.getLikePlayerImg(paramMap2);
			mv.addObject("likePlayerMap", likePlayerMap);
		}
		List<Map<String,Object>> playerList = playerService.playerList(paramMap);
        for(Map m:playerList) {
        	String code = m.get("pl_pos_code").toString();
        	if("c".equals(code)) {
        		m.put("pl_pos_nm", "센터");
        	}
        	if("f".equals(code)) {
        		m.put("pl_pos_nm", "포워드");
        	}
        	if("g".equals(code)) {
        		m.put("pl_pos_nm", "가드");
        	}
        }
		mv.addObject("playerList", playerList);
		
		List<Map<String,Object>> movieList = newsService.mypageMovieList(paramMap);
		mv.addObject("movieList", movieList);
		
		List<Map<String,Object>> noticeList = newsService.mypageNoticeList(paramMap);
		if(noticeList != null && noticeList.size() >0) {
			for(Map m: noticeList) {
				String content = m.get("content").toString();
				m.put("content2", Jsoup.clean(content, Safelist.none()).replaceAll("&nbsp;", ""));
			}
		}
		mv.addObject("noticeList", noticeList);
		
		List<Map<String,Object>> freeList = fanzoneService.mypageFreeList(paramMap);
		mv.addObject("freeList", freeList);
		
		mv.setViewName("member/mypage");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/updatePlayerNo", method = RequestMethod.GET)
	public String updatePlayerNo(String player_no,ModelAndView mv,HttpSession session)throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		String num = loginUserMap.get("num").toString();
		paramMap.put("player_no", player_no);
		paramMap.put("num", num);
		int result=service.updatePlayerNo(paramMap);
		return String.valueOf(result);
	}
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
		String tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/oauth/oauth/token";
		String uParam="grant_type=client_credentials&scope=default";
		
		String clientID="605a8ef0-4a9a-459a-95af-212b06a8b275";
		String secretKey="426bc5973f865c56d601474883f53655";
		
		String Auth = Base64.getEncoder().encodeToString((clientID+":"+secretKey).getBytes());
		String responseData = testHttpRequest(tURL, uParam,Auth);
		String access_token="";
		
		try{
		    JSONParser jsonParse = new JSONParser();
		    JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
		    JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
		    
		    access_token= dataBody.get("access_token").toString();
		            
		}catch (ParseException e){
		    e.printStackTrace();
		}

		String client_id = "605a8ef0-4a9a-459a-95af-212b06a8b275";
		String productID = "2101979031";
	    
	    //운영용
		String returnURL = "https://kcctemp.esoom.co.kr/niceResult2";
		//개발용
//		String returnURL = "http://kccdev.esoom.co.kr:8080/niceResult2";

//		String returnURL = "http://123.143.147.76:8081/niceResult2";
	    //URL의 경우 프로토콜(http/https)부터 사용바랍니다. 다를 경우 CORS 오류가 발생 할 수 있습니다.
	    //예) http://localhost/checkplus_success.jsp
	    
	    SimpleDateFormat TestDate = new SimpleDateFormat("yyyyMMddhhmmss");
	        
	    String req_dtim = TestDate.format(new Date());    
	    String req_no="REQ"+req_dtim+Double.toString(Math.random()).substring(2,6);
	    //요청고유번호(req_no)의 경우 업체 정책에 따라 거래 고유번호 설정 후 사용하면 됩니다.
	    //제공된 값은 예시입니다.
	    
	    Date currentDate = new Date();
	    long current_timestamp = currentDate.getTime() /1000;
	    
	     Auth = Base64.getEncoder().encodeToString((access_token+":"+current_timestamp+":"+client_id).getBytes());
	    
	     tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/api/v1.0/common/crypto/token";
	    
	     uParam="{\"dataHeader\":{\"CNTY_CD\":\"kr\"},"
	            + "\"dataBody\":{\"req_dtim\":\""+req_dtim+"\","
	            +"\"req_no\":\""+req_no+"\","
	            +"\"enc_mode\":\"1\""
	            + "}}";
	    
	     responseData = testHttpRequest(tURL, uParam, Auth, productID);
	    
	    
	    String token_version_id = "";
	    String sitecode = "";
	    String token_val = "";    
	    
	    try{
	        JSONParser jsonParse = new JSONParser();
	        JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
	                
	        JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
	        
	        token_version_id = dataBody.get("token_version_id").toString();
	        sitecode = dataBody.get("site_code").toString();
	        token_val = dataBody.get("token_val").toString();
	                
	    }catch (ParseException e){
	        e.printStackTrace();
	    }
	    
	    String result = req_dtim.trim()+req_no.trim()+token_val.trim();

	    String resultVal = encryptSHA256(result);
	    
	    String key =resultVal.substring(0,16);
	    String iv =resultVal.substring(resultVal.length()-16);
	    String hmac_key =resultVal.substring(0,32);
	    
	    String plain ="{"
	    +"\"requestno\":\""+req_no+"\","
	    +"\"returnurl\":\""+returnURL+"\","
	    +"\"sitecode\":\""+sitecode+"\","
	    +"\"methodtype\":\"get\""
	    +"}";
	    
	    String enc_data = encryptAES(plain, key, iv);

	    byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
	    String integrity = Base64.getEncoder().encodeToString(hmacSha256);
	    
	    // 인증 완료 후 success페이지에서 사용을 위한 key값은 DB,세션등 업체 정책에 맞춰 관리 후 사용하면 됩니다.
	    // 예시에서 사용하는 방법은 세션이며, 세션을 사용할 경우 반드시 인증 완료 후 세션이 유실되지 않고 유지되도록 확인 바랍니다. 
	    // key, iv, hmac_key 값들은 token_version_id에 따라 동일하게 생성되는 고유값입니다.
	    // success페이지에서 token_version_id가 일치하는지 확인 바랍니다.
	    session.setAttribute("req_no", req_no);
	    session.setAttribute("key" , key);
	    session.setAttribute("iv" , iv);
	    session.setAttribute("hmac_key" , hmac_key);
	    session.setAttribute("token_version_id", token_version_id);
	    String check3 = request.getParameter("check3");
	    session.setAttribute("check3", check3);
	    mv.addObject("enc_data",enc_data);
		mv.addObject("token_version_id",token_version_id);
		mv.addObject("integrity_value",integrity);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String,Object> loginUserMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		String member_id = loginUserMap.get("id").toString();
		resultMap.put("member_id", member_id);
		paramMap.put("member_id", member_id);
		Map<String,Object> userMap = service.getMember(paramMap);
		resultMap.put("num", userMap.get("num"));
		if(userMap.get("name") != null) {
			String name = userMap.get("name").toString();
			resultMap.put("name", name);
		}
		if(userMap.get("tel") != null) {
			String tel = aesUtil.decryptAes2(userMap.get("tel").toString());
			String fistNum = tel.split("-")[0];
			String middleNum = tel.split("-")[1];
			String lastNum = tel.split("-")[2];
			resultMap.put("fistNum", fistNum);
			resultMap.put("middleNum", middleNum);
			resultMap.put("lastNum", lastNum);
		}
		if(userMap.get("jumin") != null) {
			String jumin = aesUtil.decryptAes2(userMap.get("jumin").toString());
			System.out.println(jumin);
			String yyyy = jumin.split("-")[0];
			String mm = jumin.split("-")[1];
			String dd = jumin.split("-")[2];
			resultMap.put("yyyy", yyyy);
			resultMap.put("dd", dd);
			resultMap.put("mm", mm);
		}
		if(userMap.get("sex") != null) {
			String sex = userMap.get("sex").toString();
			resultMap.put("sex", sex);
		}
		if(userMap.get("email") != null) {
			String email = aesUtil.decryptAes2(userMap.get("email").toString());
			String email_id = email.split("@")[0];
			String email_domain = email.split("@")[1];
			resultMap.put("email_id", email_id);
			resultMap.put("email_domain", email_domain);
		}
		if(userMap.get("chk_email") != null) {
			String chk_email = userMap.get("chk_email").toString();
			resultMap.put("chk_email", chk_email);
		}
		if(userMap.get("chk_sms") != null) {
			String chk_sms = userMap.get("chk_sms").toString();
			resultMap.put("chk_sms", chk_sms);
		}
		if(userMap.get("zipcode") != null) {
			String zipcode = aesUtil.decryptAes2(userMap.get("zipcode").toString());
			resultMap.put("zipcode", zipcode);
		}
		if(userMap.get("addr") != null) {
			String addr = aesUtil.decryptAes2(userMap.get("addr").toString());
			resultMap.put("addr", addr);
		}
		if(userMap.get("daddr") != null) {
			String daddr = aesUtil.decryptAes2(userMap.get("daddr").toString());
			resultMap.put("daddr", daddr);
		}
		if(userMap.get("player_no") != null) {
			String player_no = userMap.get("player_no").toString();
			paramMap.put("pl_no", player_no);
			Map<String,Object> playerMap = playerService.getPlayer(paramMap);
			String player_info = "NO."+playerMap.get("pl_back")+" "+ playerMap.get("pl_postion")+" " + playerMap.get("pl_name");
			resultMap.put("player_no", player_no);
			resultMap.put("player_info", player_info);
		}
		List<Map<String,Object>> playerList = playerService.playerList(paramMap);
        for(Map m:playerList) {
        	String code = m.get("pl_pos_code").toString();
        	if("c".equals(code)) {
        		m.put("pl_pos_nm", "센터");
        	}
        	if("f".equals(code)) {
        		m.put("pl_pos_nm", "포워드");
        	}
        	if("g".equals(code)) {
        		m.put("pl_pos_nm", "가드");
        	}
        }
		
		mv.addObject("playerList",playerList);
		mv.addObject("resultMap",resultMap);
		mv.setViewName("member/memberUpdateForm");
		return mv;
	}
	@RequestMapping(value = "/memberDeleteForm", method = RequestMethod.GET)
	public ModelAndView memberDeleteForm(ModelAndView mv,HttpServletRequest request,HttpSession session,String num) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		Map<String,Object> user = service.getMember(paramMap);
		mv.addObject("user", user);
		mv.setViewName("member/memberDeleteForm");
		return mv;
	}
	@ResponseBody
    @RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public Map<String,Object> deleteMember(ModelAndView mv, HttpSession session, @RequestParam(value = "member_id") String id,
			@RequestParam(value = "member_pwd") String pwd,HttpServletResponse response,@RequestParam(value = "delete_reason") String delete_reason) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("delete_reason", delete_reason);
		paramMap.put("member_id", id);
		// 입력한 아이디로 사용자 정보 조회
		Map<String, Object> userInfo = service.getMember(paramMap);
		System.out.println("userInfo"+userInfo);
		if (userInfo != null) {
			// 비밀번호 암호화된 정보와 입력한 비밀번호 비교
			pwd = shaUtil.encrypt(pwd);
			if (pwd.equals(userInfo.get("sha_pwd"))) { // 비밀번호 일치 탈퇴성공
				paramMap.put("num", userInfo.get("num"));
				int cnt = service.deleteMember(paramMap);
				if(cnt >0) {
					result.put("deleteMsg", "");
				}else {
					result.put("deleteMsg", "탈퇴 오류입니다.관리자에게 문의하세요.");
				}
			} else {// 비밀번호가 틀렸을 경우
				System.out.println("3");
				result.put("deleteMsg", "아이디 및 비밀번호를 확인해주세요.");
			}
		} else { // 아이디가 없을 경우
			System.out.println("4");
			result.put("deleteMsg", "아이디 및 비밀번호를 확인해주세요.");
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public Map<String,Object> findId(ModelAndView mv, HttpSession session, @RequestParam(value = "member_name") String name,
			@RequestParam(value = "email_id") String email_id,
			@RequestParam(value = "email_domain") String email_domain,
			@RequestParam(value = "yyyy") String yyyy,
			@RequestParam(value = "mm") String mm,
			@RequestParam(value = "dd") String dd,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", name);
		String jumin = yyyy+"-"+mm+"-"+dd;
    	jumin = aesUtil.encryptAes2(jumin);
    	paramMap.put("jumin", jumin);
    	String email = email_id+"@"+email_domain;
    	email = aesUtil.encryptAes2(email);
    	paramMap.put("email", email);
    	System.out.println(email);
		// 입력한 아이디로 사용자 정보 조회
		Map<String, Object> userInfo = service.findId(paramMap);
		if(userInfo != null) {
			result.put("id", userInfo.get("id2"));
			result.put("msg", "");
		}else {
			result.put("msg", "일치하는 계정이 없습니다.");
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public Map<String,Object> findPwd(ModelAndView mv, HttpSession session,
			@RequestParam(value = "member_id") String id,
			@RequestParam(value = "member_name") String name,
			@RequestParam(value = "email_id") String email_id,
			@RequestParam(value = "email_domain") String email_domain,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("member_id", id);
		
		String email = email_id+"@"+email_domain;
    	email = aesUtil.encryptAes2(email);
    	System.out.println(email);
    	paramMap.put("email", email);
    	paramMap.put("name", name);
		String body = "";
		// 입력한 아이디로 사용자 정보 조회
		Map<String, Object> userInfo = service.findPwd(paramMap);
		if(userInfo != null) {
			if(userInfo.get("name") != null) {
				 name = userInfo.get("name").toString();
			}
			if(userInfo.get("email") != null) {
				 email = aesUtil.decryptAes2(userInfo.get("email").toString());
			}
			String pwd = commonService.getRandomPassword(6);
			Map<String, Object> paramMap2 = new HashMap<String, Object>();
			paramMap2.put("num", userInfo.get("num"));
			paramMap2.put("pwd", shaUtil.encrypt(pwd));
			adminService.changePwd(paramMap2);
			
			body = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
				    + "<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='ko' lang='ko'>"
				    + "<head>"
				    + "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />"
				    + "<title>KCC EGIS!!</title>"
				    + "<style type='text/css'>"
				    + "body { font-size:12px; line-height:180%; color:#555; padding:0; margin:0} "
				    + "a:link, a:visited, a:active {color:#f39800; text-decoration:underline} "
				    + "a:hover {font-weight:bold; text-decoration:none} "
				    + "</style>"
				    + "</head>"
				    + "<body>"
				    + "<div style='border:1px solid #e1e1e1; border-top:10px solid #0084c5; width:700px; padding:0 0 40px 0; margin:0;'>"
				    + "<h1 style='margin:0; padding:40px 0 50px 0; width:700px; text-align:center; background-color:#edf2f8; background-image:url(http://kccdev.esoom.co.kr:8080/resources/common/images/common/mailing_bg_shadow.gif); background-repeat:no-repeat; background-position:left bottom'>"
				    + "<img src='http://kccdev.esoom.co.kr:8080/resources/common/images/common/mailing_logo.gif' alt='KCC EGIS' border='0' />"
				    + "</h1>"
				    + "<div style='margin:30px 0 50px 90px; width:540px; border:0; padding:0'>"
				    + "<p>안녕하세요. <span style='color:#000000'>"+name+"</span>님!<br /><br />회원님의 임시비밀번호는 아래와 같습니다.<br />임시비밀번호로 로그인을 하신 후에 회원정보 수정에서 원하시는 비밀번호로 수정해주세요.</p>"
				    + "<p style='text-align:center; font-weight:bold; color:#014099; padding:30px 0 0 0;'>임시비밀번호 :"+pwd+"</p>"
				    + "<p style='text-align:center; padding:50px 0 0 0;'>"
				    + "<a href='https://www.kccegis.com' target='_blank'><img src='http://kccdev.esoom.co.kr:8080/resources/common/images/common/btn_homepage_go.gif' alt='홈페이지바로가기' border='0' /></a>"
				    + "</p>"
				    + "</div>"
				    + "</div>"
				    + "</body>"
				    + "</html>";
			mailService.sendMail(email, "KCC EGIS 홈페이지 임시비밀번호를 안내해 드립니다.", body);
			result.put("msg", "");
		}else {
			result.put("msg", "일치하는 계정이 없습니다.");
		}
		return result;
	}
	@RequestMapping(value = "/deleteResult", method = RequestMethod.GET)
	public ModelAndView deleteResult(ModelAndView mv,HttpServletRequest request,HttpSession session,String num) throws Exception {
		session.invalidate();
		mv.setViewName("member/deleteResult");
		return mv;
	}
	@RequestMapping(value = "/findaccount", method = RequestMethod.GET)
	public ModelAndView findaccount(ModelAndView mv,HttpServletRequest request) {
		mv.setViewName("member/findaccount");
		return mv;
	}
	@RequestMapping(value = "/findaccountResult", method = RequestMethod.GET)
	public ModelAndView findaccountResult(ModelAndView mv,HttpServletRequest request,@RequestParam(value = "id") String id) {
		mv.addObject("id", id);
		mv.setViewName("member/findaccount_result");
		return mv;
	}
}
