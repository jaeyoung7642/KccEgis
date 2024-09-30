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
	<meta property="og:title" content="선수 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>선수 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/player.css"> <!-- 디렉토리 player only -->
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
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
						<li>선수</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">PLAYER</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="coachList" class="swiper-slide snb_link"><span>코칭스탭</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="playerList" class="swiper-slide snb_link current"><span>선수</span></a>
								<!-- <a href="cheer" class="swiper-slide snb_link"><span>응원단</span></a> -->
								<a href="#" class="swiper-slide snb_link" onclick="alertPop('시즌 업데이트 준비중입니다.')"><span>응원단</span></a>
								<a href="cheer_song" class="swiper-slide snb_link"><span>응원가</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="playerList" class="swiper-slide snb_link <c:if test="${pos_code == 'all' }"> current</c:if>"><span>전체</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerList?pos_code=g" class="swiper-slide snb_link <c:if test="${pos_code == 'g' }"> current</c:if>"><span>가드</span></a>
						<a href="playerList?pos_code=f" class="swiper-slide snb_link <c:if test="${pos_code == 'f' }"> current</c:if>"><span>포워드</span></a>
						<a href="playerList?pos_code=c" class="swiper-slide snb_link <c:if test="${pos_code == 'c' }"> current</c:if>"><span>센터</span></a>
						<a href="playerList?pos_code=s" class="swiper-slide snb_link <c:if test="${pos_code == 's' }"> current</c:if>"><span>군복무</span></a>
					</div>
				</nav>
			</div>

			<!-- 선수 리스트 -->
			<section class="section player_content">
				<div class="ly_inner md">
					<ul class="player_box_list">
						<c:forEach items="${playerList}" var="playerList">
						<!-- player item -->
						<li class="player_item once" data-anim="fadeUp">
							<c:choose>
			                    <c:when test="${pos_code == 's' }">
			                        <a href="#" class="box thumb_hover hov_type2">
			                    </c:when>
			                    <c:otherwise>
			                        <a href="playerInfo?pl_no=${playerList.pl_no}" class="box thumb_hover hov_type2">
			                    </c:otherwise>
			                </c:choose>
								<div class="el_photo photo">
									<p class="el_pos">${playerList.pl_pos_code_ename}</p>
									<img data-src="/resources/common/images/upload/player/${playerList.pl_webmain}" class="lazy-image">
								</div>
								<div class="info">
									<p class="el_num">${playerList.pl_back}</p>
									<p class="el_name">
										<span class="kor">${playerList.pl_name}</span>
										<span class="eng type2">${playerList.pl_ename}</span>
									</p>
								</div> 
								<c:if test="${pos_code != 's' }">
								<!-- overlay (PC only) -->
								<div class="overlay p_hide">
									<div class="cont">
										<div class="tables">
											<table>
												<caption>당해 시즌 기록 정보</caption>
												<colgroup>
													<col width="25.26%">
													<col width="22.68%">
													<col width="27.83%">
													<col>
												</colgroup>
												<thead>
													<tr>
														<th scope="col">24-25</th>
														<th scope="col">POINT</th>
														<th scope="col">REBOUND</th>
														<th scope="col">ASSIST</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">누적</th>
														<td>${playerList.sum_score}</td>
														<td>${playerList.sum_r_tot}</td>
														<td>${playerList.sum_a_s}</td>
													</tr>
													<tr>
														<th scope="row">평균</th>
														<td>${playerList.avg_score}</td>
														<td>${playerList.avg_r_tot}</td>
														<td>${playerList.avg_a_s}</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="btns">
											<span class="el_btn ccl add white"></span>
										</div>
									</div>
								</div>
								<!-- //overlay -->
								</c:if>
							</a>
						</li>
						<!-- //player item -->
						</c:forEach>
						<c:if test="${empty playerList}">
						<li class="player_item once no_data white hmd" data-anim="fadeUp">
							<p>등록된 선수가 없습니다.</p>
						</li>
						</c:if>
					</ul>		
				</div>
			</section>
			<!-- //선수 리스트 -->


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