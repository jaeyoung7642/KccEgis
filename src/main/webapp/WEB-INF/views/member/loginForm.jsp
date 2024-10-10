<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="로그인 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>로그인 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/member.css"> <!-- 디렉토리  member only -->
	<script src="/resources/common/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/common/assets/js/jquery.scrollDetector.min.js" defer></script>
	<script src="/resources/common/assets/js/lenis.min.js" defer></script>
	<script src="/resources/common/assets/js/swiper-bundle.min.js" defer></script>
	<script src="/resources/common/assets/js/jquery.kinetic.min.js" defer></script>
	<script src="/resources/common/assets/js/common.js" defer></script> 
	<script src="/resources/common/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/sub.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/link.js" defer></script>
	<script src="/resources/common/assets/js/script.js" defer></script> <!-- 개발용 -->
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
<script>
function login(){
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var remember = $("#remember").val();
	if(member_id != '' && member_pwd !=''){
		$.ajax({
				type:'post',
				data : {
					"id" : member_id,
					"pwd" : member_pwd,
					"remember" : remember
				},
				url: 'login',
				success:function(result){
					if(result.loginMsg != ''){
						alertPop(result.loginMsg);
					}else{
						$('#loginBtn').click();
					}
		         },
		         error:function(){
		            alert("서버에 문제가 있습니다.");
		         }
			});//ajax
	}else{
		alertPop('아이디와 비밀번호를 입력해주세요.');
	}
}
function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

window.onload = function() {
    // URL에서 'msg' 파라미터 읽기
    var msg = getQueryParam('msg') || '';

    // URL 디코딩
    msg = decodeURIComponent(msg).trim();

    // 콘솔에서 값 확인
    console.log('msg:', msg);

    // 메시지가 있을 경우 알림 표시
    if (msg !== '') {
    	alertPop(msg);
    }
}
</script>
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<p class="blind">콘텐츠 바로가기</p>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->

		<!-- container -->
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- title -->
					<h3 class="page_title">로그인</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner sm">
					<article class="bl_card login_card m_full">
						<div class="member_inner">

							<div class="member_header">
								<p class="mb_msg">홈페이지 회원가입을 하시면<br class="xm_show"> 더 많은 서비스를 받으실 수 있습니다.</p>
							</div> 

							<form class="login_form">
								<input type="text" class="frm_input id" name="id" id="member_id" aria-label="아이디" placeholder="아이디 입력" required value="${remember}">
								<input type="password" class="frm_input pw" name="pwd" id="member_pwd" aria-label="비밀번호" placeholder="비밀번호 입력(영문+숫자+특수문자 조합 6~12자)" required>
								<button type="submit" class="el_btn btn_login" onclick="login()">로그인</button>
								<button type="button" class="el_btn btn_login openModal" id="loginBtn" data-target="#conformPopup" style="display: none;">로그인</button>
								<label class="frm_checkbox type1">
									<input type="checkbox" aria-label="자동로그인" name="remember" id="remember"  ${remember != "" ? 'checked' : ''}>
									<span>아이디 저장</span>
								</label>

								<!-- 에러 메시지 -->
								<p class="el_error" style="display: none;">잘못된 형식입니다.</p>
								
							</form>

							<div class="member_footer">
								<div class="login_info">
									<dl>
										<dt class="p_hide">아이디, 비밀번호를 잊으셨나요?</dt>
										<dd><a href="findaccount" class="el_btn sm gray">아이디/비밀번호 찾기</a></dd>
									</dl>
									<dl>
										<dt class="p_hide">KCC이지스 홈페이지 회원이 아니세요?</dt>
										<dd><a href="joinForm1" class="el_btn sm gray">회원가입</a></dd>
									</dl>
								</div>
							</div>
						</div>
					</article>
				</div>
			</section>

			<!-- 로그인 확인 알럿창 -->
			<div id="conformPopup" tabindex="-1" class="alert modal loginPopup" data-focus="modal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg">홈페이지에 로그인 되었습니다.</p>
							<div class="btn_area mt30">
								<button type="button" class="el_btn frm_btn blue closeModal" onclick="location.href='/';">확인</button>
							</div>
						</div>
						<div class="modal_footer btn_area mt30">
							<a href="scheduleList" class="el_btn btn1 alert"><span class="el_ico ico_calendar2_bk"></span> 경기일정 가기</a>
							<a href="mypage" class="el_btn btn1 alert" data-focus-next="modal"><span class="el_ico ico_mypage_bk"></span> 마이페이지 가기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 확인 알럿창 -->

			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->
	</div>
	<!-- Global site tag (gtag.js) - Google Analytics -->
		  <script src="https://www.googletagmanager.com/gtag/js?id=UA-180137319-1"></script>
		  <script>
		    window.dataLayer = window.dataLayer || [];
		    function gtag() { dataLayer.push(arguments); }
		    gtag('js', new Date());
		    gtag('config', 'UA-180137319-1');
		  </script>
</body>
</html>