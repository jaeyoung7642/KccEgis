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
	<title>코칭스탭 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/player.css"> <!-- 디렉토리 player only -->
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
		<main id="container" class="ly_container player">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>PLAYER</li>
						<li>코칭스탭</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">PLAYER</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="coachList" class="swiper-slide snb_link current"><span>코칭스탭</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="playerList" class="swiper-slide snb_link"><span>선수</span></a>
								<!-- <a href="cheer" class="swiper-slide snb_link"><span>응원단</span></a> -->
								<a href="#" class="swiper-slide snb_link" onclick="alertPop('시즌 업데이트 준비중입니다.')"><span>응원단</span></a>
								<a href="cheer_song" class="swiper-slide snb_link"><span>응원가</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 코칭스탭 -->
			<section class="section">
				<div class="ly_inner md">

					<div class="page_header mb40">
						<h4 class="el_heading lv1">코칭스탭</h4>
					</div>

					<div class="coach_list">
					<c:forEach items="${coachList}" var="coachList">
					<c:if test="${coachList.pl_pos_code == 'a' }">
						<!-- coach item-->
						<article class="coach_item head_coach">
							<div class="photo">
								<div class="inner">
									<img src="/resources/common/images/upload/player/${coachList.pl_webmain}" alt="" >
								</div>
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<h5 class="el_role">HEAD COACH</h5>
									<p class="el_name">
										<span class="kor">${coachList.pl_name}</span>
										<span class="eng">${coachList.pl_ename}</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>${coachList.format_birthday}</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>${coachList.pl_height}cm <span class="dash">/</span> ${coachList.pl_weight}kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>${coachList.pl_school}</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											${coachList.pl_career}
										</ul>
									</div>
									<div class="col">
										<h6 class="tit">수상 경력</h6>
										<ul class="list" data-lenis-prevent>
											${coachList.pl_prize}
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						</c:if>
						<c:if test="${coachList.pl_pos_code =='b' }">
						<article class="coach_item coach">
							<div class="photo">
								<img src="/resources/common/images/upload/player/${coachList.pl_webmain}" alt="" >
							</div>
							<!-- info -->
							<div class="info">
								<div class="info_header">
									<p class="el_role">COACH</p>
									<p class="el_name">
										<span class="kor">${coachList.pl_name}</span>
										<span class="eng">${coachList.pl_ename}</span>
									</p>
								</div>
								<!-- profile -->
								<div class="profile_box">
									<dl>
										<dt>생년월일</dt>
										<dd>${coachList.format_birthday}</dd>
									</dl>
									<dl>
										<dt>신장/체중</dt>
										<dd>${coachList.pl_height}cm <span class="dash">/</span> ${coachList.pl_weight}kg</dd>
									</dl>
									<dl>
										<dt>출신학교</dt>
										<dd>${coachList.pl_school}</dd>
									</dl>
								</div>
								<!-- //profile -->
								<!-- career -->
								<div class="career_box">
									<div class="col">
										<h6 class="tit">주요 경력</h6>
										<ul class="list" data-lenis-prevent>
											${coachList.pl_career}
										</ul>
									</div>
								</div>
								<!-- //career -->
							</div>
							<!-- //info -->
						</article>
						</c:if>
						</c:forEach>
						<!-- //coach item-->
					</div>
				</div>
			</section>
			<!-- //코칭스탭 -->

			<!-- 지원스탭 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header mb40">
						<h4 class="el_heading lv1">지원스탭</h4>
					</div>

					<ul class="bl_grid_list staff_list cols4">
						<c:forEach items="${coachList}" var="coachList">
						<c:if test="${coachList.pl_pos_code == 'm' || coachList.pl_pos_code == 't' || coachList.pl_pos_code == 'j' || coachList.pl_pos_code == 'i'}">
						<li class="item">
							<div class="bl_card_md box">
								<div class="photo el_img">
									<img src="/resources/common/images/upload/player/${coachList.pl_webmain}" alt="" >
								</div>
								<div class="info">
									<c:if test="${coachList.pl_pos_code == 'm' }">
									<p class="el_role type2">매니저</p>
									</c:if>
									<c:if test="${coachList.pl_pos_code == 't' }">
									<p class="el_role type2">트레이너</p>
									</c:if>
									<c:if test="${coachList.pl_pos_code == 'j' }">
									<p class="el_role type2">전력분석</p>
									</c:if>
									<c:if test="${coachList.pl_pos_code == 'i' }">
									<p class="el_role type2">통역</p>
									</c:if>
									<p class="el_name">
										<span class="kor">${coachList.pl_name}</span>
									</p>
								</div>
							</div>
						</li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
			</section>
			<!-- //지원스탭 -->


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