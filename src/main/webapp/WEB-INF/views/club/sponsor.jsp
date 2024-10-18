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
	<meta property="og:title" content="스폰서 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>스폰서 : KCC이지스 프로농구단</title>
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
		<main id="container" class="ly_container club bg_dark">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>CLUB</li>
						<li>스폰서</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">CLUB</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="front" class="swiper-slide snb_link"><span>구단소개</span></a> 
								<a href="chistory" class="swiper-slide snb_link"><span>역사관</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="sponsor" class="swiper-slide snb_link current"><span>스폰서</span></a>
								<a href="kccadList" class="swiper-slide snb_link"><span>KCC 광고</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 검색 -->
			<section class="section mt70">
				<div class="ly_inner md inner">
					<article>
						<div class="page_header line mb20">
							<h4 class="el_heading lv1">MAIN <em>SPONSOR</em></h4> 
						</div>

						<ul class="sponsor_list bl_grid_list cols4b">
							<li class="item">
								<a href="KLENZE" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="KLENZE(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_01.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="KCCGLASS" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="KCC글라스(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_02.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="HOMECC" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="HOMECC(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_03_1.png" alt=""></a>
							</li>
							<li class="item">
								<a href="KCCWORLD" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="KCC건설(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_04.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="SWITZEN" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="KCC스위첸(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_05.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="KCCSILICONE" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="KCC실리콘(새창열림)"><img src="/resources/common/images/img/sponsor/sponsor_06.svg" alt=""></a>
							</li>
						</ul>
					</article>

					<article class="mt100">
						<div class="page_header line mb20">
							<h4 class="el_heading lv1">BUSINESS <em>SPONSOR</em></h4> 
						</div>

						<ul class="sponsor_list bl_grid_list cols4b">
							<li class="item">
								<a href="BMK" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="BNK금융그룹(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_01_1.png" alt=""></a>
							</li>
							<li class="item">
								<a href="WILSON" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="윌슨(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_05.png" alt=""></a>
							</li>
							<li class="item">
								<a href="HITE" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="하이트진로(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_02.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="ADVENTURER" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="승부사온라인(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_03.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="PANSTAR" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="팬스타크루즈(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_04.svg" alt=""></a>
							</li>
							<li class="item">
								<a href="호식이두마리치킨" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="호식이두마리치킨(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_06.png" alt=""></a>
							</li>
							<li class="item">
								<a href="MOMOS" class="el_img siteLink" target="_blank" rel="noreferrer" aria-label="모모스커피(새창열림)"><img src="/resources/common/images/img/sponsor/biz_sponsor_07.png" alt=""></a>
							</li>
						</ul>
					</article>
				</div>
			</section>
			<!-- 검색 -->


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