<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<meta property="og:title" content="구단소개 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>구단소개 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/club.css"> <!-- 디렉토리  club only -->
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efc7a1d4a70457b7315171ffe99e9599&libraries=services"></script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
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
		<main id="container" class="ly_container club">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>CLUB</li>
						<li>구단소개</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">CLUB</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="front" class="swiper-slide snb_link current"><span>구단소개</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="chistory" class="swiper-slide snb_link"><span>역사관</span></a>
								<a href="sponsor" class="swiper-slide snb_link"><span>스폰서</span></a>
								<a href="kccadList" class="swiper-slide snb_link"><span>KCC 광고</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="front" class="swiper-slide snb_link"><span>구단 프런트</span></a> 
						<a href="ci" class="swiper-slide snb_link"><span>구단 CI</span></a>
						<a href="busan_gym" class="swiper-slide snb_link current"><span>구장안내</span></a> <!-- 해당페이지에 current 추가 -->
					</div>
				</nav>
			</div>

			<!-- 용인연습체육관 --> 
			<section class="section mt0 pt70">
				<div class="ly_inner md inner">
					<!-- snb 4depth -->
					<div class="snb_4dth_area">
						<nav class="snb_4dth">
							<a href="busan_gym" class="snb_link">부산사직체육관</a> 
							<a href="yongin_gym" class="snb_link current">용인연습체육관</a> 
							<a href="all_gym" class="snb_link">전국구장안내</a> 
						</nav> 
					</div>

					<div class="yongin_gym_content mt70-40">
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_01@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">체육관</h5>
								<p>연습경기 및 다양한 실전훈련을 소화해 내는 그야말로 우승의 꿈이 영그는 산실입니다.<br>
									선수들은 이곳에서 굵은 땀방울을 흘리며 우승의 목표를 향해 한 발 한 발 전진합니다.</p>
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_02@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">웨이트 트레이닝 룸</h5>
								<p>최신형 트레이닝 기기가 갖춰진 kcc이지스의 웨이트 트레이닝실입니다.<br>
									개개인의 체력을 다지고 전문가의 도움을 받아 자신의 취약점을 보안하는 곳으로 선수들이 
									애용하는 장소입니다.</p>
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_03@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">선수단버스</h5>
								<p>kcc이지스 선수단을 안전하게 이동시키는 구단버스입니다.<br>
									안락한 의자와 최신 멀티미디어 기기를 갖추고 있어 시즌 중 이동이 잦은 선수들에게 움직이는 사랑방입니다.</p>
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_04@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">숙소</h5>
								<p>선수들이 새로운 아침을 맞을 때마다 목표를 향해 달릴 준비를 하고,<br class="xp_hide">
									<span class="txt_wrap">연습이 끝난</span> 후 휴식을 취하며, 자신과 팀의 목표를 위해 마음을 가다듬는 장소입니다.</p>
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_05@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">휴게실</h5>
								<p>숙소 3층에 마련된 휴게실은 편안한 소파와 시청각 자료들이 비치되어 있어 선수들이 잠깐의 여유를 만끽할 수 있는 장소입니다. 또한 휴게실 옆 면에는 지금까지 수상한 트로피와 상패, 
									기념품이 전시되어 있습니다.</p>
							</div>
						</div>
						<!-- //row -->
						<!-- row -->
						<div class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/yongin_gym_img_06@1_5x.jpg" alt="">
							</div>
							<div class="info">
								<h5 class="tit">식당</h5>
								<p>선수들을 위한 최고의 음식이 나오는 식당입니다. 어머니의 정성을 느낄 수 있는 다양한 
									음식과 건강식들이 매 끼니 선수들의 허기진 배를 채워줍니다.</p>
							</div>
						</div>
						<!-- //row -->
					</div>
				</div>
			</section>
			<!-- //용인연습체육관 --> 


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