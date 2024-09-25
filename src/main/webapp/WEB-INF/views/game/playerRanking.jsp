<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>팀/선수 순위 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/game.css"> <!-- 디렉토리  game only -->
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
		<main id="container" class="ly_container game">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>GAME</li>
						<li>팀/선수 순위</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList" class="swiper-slide snb_link"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link current"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="teamRank" class="swiper-slide snb_link"><span>팀 순위</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRank" class="swiper-slide snb_link current"><span>선수 순위</span></a>
					</div>
				</nav>
			</div>

			<!-- 부분별 선수 순위 -->
			<section class="section overflow_hidden">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">24-25 SEASON</h4>
					</div> 
					<c:if test="${empty pointRankList}">
					<div class="slider p_ranking_content no_bg" data-view="[5,5]" data-space="[20,20]"> <!-- 데이터가 없을때  no_bg 클래스 추가 -->
						<div class="swiper-wrapper p_ranking_list">
							<div class="swiper-slide item no_data white hmd">
								<p>첫 경기 이후 데이터가 출력됩니다.</p>
							</div>
						</div>
					</div>						
					</c:if>
					<c:if test="${not empty pointRankList}">
					<div class="p_ranking_content">
						<div class="swiper-wrapper p_ranking_list">
							<!-- POINT -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">POINT</h5>
								<div class="accordion">
								<c:forEach items="${pointRankList}" var="pointRankList" varStatus="status">	
									<div class="accordion_item">
									<c:choose>
										  <c:when test="${status.first}">
										     <button type="button" class="accordion_btn on">
										  </c:when>
										<c:otherwise>
										   <button type="button" class="accordion_btn">
										</c:otherwise>
										</c:choose>
											<p class="rank">${pointRankList.rn}</p>
											<p class="player">
												<span class="num">${pointRankList.pl_back }</span>
												<span class="pos">${pointRankList.pl_postion}</span>
												<span class="name">${pointRankList.pl_name }</span>
											</p> 
											<p class="score">${pointRankList.avg }</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="/resources/common/images/upload/player/${pointRankList.pl_webmain }" class="photo">
												<div class="box_top">
													<c:if test="${pointRankList.rn == '1'}">
													<span class="el_badge gold " data-raink="${pointRankList.rn}"></span><br>
													</c:if>
													<c:if test="${pointRankList.rn == '2'}">
													<span class="el_badge silver " data-raink="${pointRankList.rn}"></span><br>
													</c:if>
													<c:if test="${pointRankList.rn == '3'}">
													<span class="el_badge bronze " data-raink="${pointRankList.rn}"></span><br>
													</c:if>
													<p class="sm"><span>${pointRankList.pl_back }</span> <span>${pointRankList.pl_postion}</span></p>
													<p>${pointRankList.pl_name }</p>
												</div>
												<div class="box_btm">
													<p class="score">${pointRankList.avg }</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>${pointRankList.pl_back }</span> <span>${pointRankList.pl_postion}</span></p>
														<p>${pointRankList.pl_name }</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="playerInfo?pl_no=${pointRankList.player_no }" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="playerRecord?player_no=${pointRankList.player_no }" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>${pointRankList.reboundRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">어시스트</th>
																		<td>${pointRankList.assistRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>${pointRankList.stealRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>${pointRankList.blockRk }위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- //POINT -->
							<!-- REBOUND -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">REBOUND</h5>
								<div class="accordion">
									<c:forEach items="${reboundRankList}" var="reboundRankList" varStatus="status">	
									<div class="accordion_item">
									<c:choose>
										  <c:when test="${status.first}">
										     <button type="button" class="accordion_btn on">
										  </c:when>
										<c:otherwise>
										   <button type="button" class="accordion_btn">
										</c:otherwise>
										</c:choose>
											<p class="rank">${reboundRankList.rn}</p>
											<p class="player">
												<span class="num">${reboundRankList.pl_back }</span>
												<span class="pos">${reboundRankList.pl_postion}</span>
												<span class="name">${reboundRankList.pl_name }</span>
											</p> 
											<p class="score">${reboundRankList.avg }</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="/resources/common/images/upload/player/${reboundRankList.pl_webmain }" class="photo">
												<div class="box_top">
													<c:if test="${reboundRankList.rn == '1'}">
													<span class="el_badge gold " data-raink="${reboundRankList.rn}"></span><br>
													</c:if>
													<c:if test="${reboundRankList.rn == '2'}">
													<span class="el_badge silver " data-raink="${reboundRankList.rn}"></span><br>
													</c:if>
													<c:if test="${reboundRankList.rn == '3'}">
													<span class="el_badge bronze " data-raink="${reboundRankList.rn}"></span><br>
													</c:if>
													<p class="sm"><span>${reboundRankList.pl_back }</span> <span>${reboundRankList.pl_postion}</span></p>
													<p>${reboundRankList.pl_name }</p>
												</div>
												<div class="box_btm">
													<p class="score">${reboundRankList.avg }</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>${reboundRankList.pl_back }</span> <span>${reboundRankList.pl_postion}</span></p>
														<p>${reboundRankList.pl_name }</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="playerInfo?pl_no=${reboundRankList.player_no }" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="playerRecord?player_no=${reboundRankList.player_no }" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>${reboundRankList.pointRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">어시스트</th>
																		<td>${reboundRankList.assistRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>${reboundRankList.stealRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>${reboundRankList.blockRk }위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- //REBOUND -->
							<!-- ASSIST -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">ASSIST</h5>
								<div class="accordion">
									<c:forEach items="${assistRankList}" var="assistRankList" varStatus="status">	
									<div class="accordion_item">
									<c:choose>
										  <c:when test="${status.first}">
										     <button type="button" class="accordion_btn on">
										  </c:when>
										<c:otherwise>
										   <button type="button" class="accordion_btn">
										</c:otherwise>
										</c:choose>
											<p class="rank">${assistRankList.rn}</p>
											<p class="player">
												<span class="num">${assistRankList.pl_back }</span>
												<span class="pos">${assistRankList.pl_postion}</span>
												<span class="name">${assistRankList.pl_name }</span>
											</p> 
											<p class="score">${assistRankList.avg }</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="/resources/common/images/upload/player/${assistRankList.pl_webmain }" class="photo">
												<div class="box_top">
													<c:if test="${assistRankList.rn == '1'}">
													<span class="el_badge gold " data-raink="${assistRankList.rn}"></span><br>
													</c:if>
													<c:if test="${assistRankList.rn == '2'}">
													<span class="el_badge silver " data-raink="${assistRankList.rn}"></span><br>
													</c:if>
													<c:if test="${assistRankList.rn == '3'}">
													<span class="el_badge bronze " data-raink="${assistRankList.rn}"></span><br>
													</c:if>
													<p class="sm"><span>${assistRankList.pl_back }</span> <span>${assistRankList.pl_postion}</span></p>
													<p>${assistRankList.pl_name }</p>
												</div>
												<div class="box_btm">
													<p class="score">${assistRankList.avg }</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>${assistRankList.pl_back }</span> <span>${assistRankList.pl_postion}</span></p>
														<p>${assistRankList.pl_name }</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="playerInfo?pl_no=${assistRankList.player_no }" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="playerRecord?player_no=${assistRankList.player_no }" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>${assistRankList.pointRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>${assistRankList.reboundRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>${assistRankList.stealRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>${assistRankList.blockRk }위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- //ASSIST -->
							<!-- STEAL -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">STEAL</h5>
								<div class="accordion">
									<c:forEach items="${stealRankList}" var="stealRankList" varStatus="status">	
									<div class="accordion_item">
									<c:choose>
										  <c:when test="${status.first}">
										     <button type="button" class="accordion_btn on">
										  </c:when>
										<c:otherwise>
										   <button type="button" class="accordion_btn">
										</c:otherwise>
										</c:choose>
											<p class="rank">${stealRankList.rn}</p>
											<p class="player">
												<span class="num">${stealRankList.pl_back }</span>
												<span class="pos">${stealRankList.pl_postion}</span>
												<span class="name">${stealRankList.pl_name }</span>
											</p> 
											<p class="score">${stealRankList.avg }</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="/resources/common/images/upload/player/${stealRankList.pl_webmain }" class="photo">
												<div class="box_top">
													<c:if test="${stealRankList.rn == '1'}">
													<span class="el_badge gold " data-raink="${stealRankList.rn}"></span><br>
													</c:if>
													<c:if test="${stealRankList.rn == '2'}">
													<span class="el_badge silver " data-raink="${stealRankList.rn}"></span><br>
													</c:if>
													<c:if test="${stealRankList.rn == '3'}">
													<span class="el_badge bronze " data-raink="${stealRankList.rn}"></span><br>
													</c:if>
													<p class="sm"><span>${stealRankList.pl_back }</span> <span>${stealRankList.pl_postion}</span></p>
													<p>${stealRankList.pl_name }</p>
												</div>
												<div class="box_btm">
													<p class="score">${stealRankList.avg }</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>${stealRankList.pl_back }</span> <span>${stealRankList.pl_postion}</span></p>
														<p>${stealRankList.pl_name }</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="playerInfo?pl_no=${stealRankList.player_no }" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="playerRecord?player_no=${stealRankList.player_no }" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>${stealRankList.pointRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>${stealRankList.reboundRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">어시스트</th>
																		<td>${stealRankList.assistRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">블록</th>
																		<td>${stealRankList.blockRk }위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- //STEAL -->
							<!-- BLOCK -->
							<div class="swiper-slide item">
								<h5 class="ranking_tit">BLOCK</h5>
								<div class="accordion">
									<c:forEach items="${blockRankList}" var="blockRankList" varStatus="status">	
									<div class="accordion_item">
									<c:choose>
										  <c:when test="${status.first}">
										     <button type="button" class="accordion_btn on">
										  </c:when>
										<c:otherwise>
										   <button type="button" class="accordion_btn">
										</c:otherwise>
										</c:choose>
											<p class="rank">${blockRankList.rn}</p>
											<p class="player">
												<span class="num">${blockRankList.pl_back }</span>
												<span class="pos">${blockRankList.pl_postion}</span>
												<span class="name">${blockRankList.pl_name }</span>
											</p> 
											<p class="score">${blockRankList.avg }</p>
										</button>
										<div class="content accordion_cont thumb_hover hov_type2 open" style="display: block;">
											<a href="#" class="box">
												<img src="/resources/common/images/upload/player/${blockRankList.pl_webmain }" class="photo">
												<div class="box_top">
													<c:if test="${blockRankList.rn == '1'}">
													<span class="el_badge gold " data-raink="${blockRankList.rn}"></span><br>
													</c:if>
													<c:if test="${blockRankList.rn == '2'}">
													<span class="el_badge silver " data-raink="${blockRankList.rn}"></span><br>
													</c:if>
													<c:if test="${blockRankList.rn == '3'}">
													<span class="el_badge bronze " data-raink="${blockRankList.rn}"></span><br>
													</c:if>
													<p class="sm"><span>${blockRankList.pl_back }</span> <span>${blockRankList.pl_postion}</span></p>
													<p>${blockRankList.pl_name }</p>
												</div>
												<div class="box_btm">
													<p class="score">${blockRankList.avg }</p>
												</div>
											</a>
											<!-- overlay (PC only) -->
											<div class="overlay p_hide">
												<div class="cont">
													<div class="ov_top">
														<p class="sm"><span>${blockRankList.pl_back }</span> <span>${blockRankList.pl_postion}</span></p>
														<p>${blockRankList.pl_name }</p>
													</div>
													<div class="ov_cont">
														<div class="btns">
															<a href="playerInfo?pl_no=${blockRankList.player_no }" class="el_btn ccl ccl1">
																선수<br> 프로필 
																<span class="el_ico sm more_w"></span>
															</a>
															<a href="playerRecord?player_no=${blockRankList.player_no }" class="el_btn ccl ccl1">
																기록<br> 더보기
																<span class="el_ico sm more_w"></span>
															</a>
														</div>
														<div class="tables">
															<table>
																<caption>부분별 순위</caption>
																<colgroup>
																	<col width="56.91%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">득점</th>
																		<td>${blockRankList.pointRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">리바운드</th>
																		<td>${blockRankList.reboundRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">어시스트</th>
																		<td>${blockRankList.assistRk }위</td>
																	</tr>
																	<tr>
																		<th scope="row">스틸</th>
																		<td>${blockRankList.stealRk }위</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- //overlay -->
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- //BLOCK -->
							
						</div>
						
					</div>
					</c:if>
				</div>
			</section>
			<!-- //부분별 선수 순위 -->


			<!-- 자세한 부분별 선수 순위  -->
			<section class="section mt50">
				<div class="ly_inner md">
					<h4 class="blind">부분별 선수 순위</h4>

					<!-- 검색 -->
					<div class="search_box">
						<form action="playerRank" class="search_box_form">
							<div class="row">
								<div class="col grow">
									<select class="frm_select max240" aria-label="리그 선택" name="game_code">
										<option value="01" <c:if test="${game_code eq 01}">selected</c:if>>정규리그</option>
									</select>
									<select class="frm_select max240" aria-label="시즌 선택" name="season_code">
										<c:forEach items="${selectSeasonList}" var="selectSeasonList" varStatus="status">
											<option value="${selectSeasonList.seasonCode}" <c:if test="${selectSeasonList.seasonCode eq season_code}">selected</c:if>>${selectSeasonList.seasonCodeNm}</option>
										</c:forEach>
									</select>
									<select class="frm_select max240" aria-label="부분 선택" name="category">
										<option value="point" <c:if test="${category eq 'point'}">selected</c:if>>득점</option>
										<option value="rebound" <c:if test="${category eq 'rebound'}">selected</c:if>>리바운드</option>
										<option value="assist" <c:if test="${category eq 'assist'}">selected</c:if>>어시스트</option>
										<option value="steal" <c:if test="${category eq 'steal'}">selected</c:if>>스틸</option>
										<option value="block" <c:if test="${category eq 'block'}">selected</c:if>>블록</option>
									</select>
									<button  class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<div class="page_header">
						<c:if test="${category eq 'point'}">
							<h4 class="el_heading lv1">득점</h4>
						</c:if>
						<c:if test="${category eq 'rebound'}">
							<h4 class="el_heading lv1">리바운드</h4>
						</c:if>
						<c:if test="${category eq 'assist'}">
							<h4 class="el_heading lv1">어시스트</h4>
						</c:if>
						<c:if test="${category eq 'steal'}">
							<h4 class="el_heading lv1">스틸</h4>
						</c:if>
						<c:if test="${category eq 'block'}">
							<h4 class="el_heading lv1">블록</h4>
						</c:if>
					</div>
					<c:if test="${category eq 'point'}">
					<!-- 득점 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(16.771vw * 1.3, 322px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
									<tr>
										<td>${playerRankList.pl_back }</td>
										<td>${playerRankList.pl_name }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 2점합계, 3점합계, 자유투합계, 득점합계, 득점평균, 정보 제공">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col>
										<col width="17.43%">
										<col width="17.43%">
										<col width="17.72%">
										<col width="17.43%">
										<col width="17.43%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">2점합계</th>
											<th scope="col">3점합계</th>
											<th scope="col">자유투합계</th>
											<th scope="col">득점합계</th>
											<th scope="col">득점평균</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
										<tr>
											<td>${playerRankList.game_count }</td>
											<td>${playerRankList.fg }</td>
											<td>${playerRankList.threep }</td>
											<td>${playerRankList.ft }</td>
											<td>${playerRankList.score }</td>
											<td>${playerRankList.avg }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty playerRankList}">
							<div class="no_post">데이터가 없습니다.</div>
						</c:if>
					</div>
					<!-- //득점 -->
					</c:if>
					<c:if test="${category eq 'rebound'}">
					<!-- 리바운드 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(16.771vw * 1.3, 322px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
									<tr>
										<td>${playerRankList.pl_back }</td>
										<td>${playerRankList.pl_name }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 수비 리바운드, 공격 리바운드, 리바운드 합계, 리바운드평균, 정보 제공">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col>
										<col width="21.614%">
										<col width="21.614%">
										<col width="21.614%">
										<col width="21.614%">
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">수비 리바운드</th>
											<th scope="col">공격 리바운드</th>
											<th scope="col">리바운드 합계</th>
											<th scope="col">리바운드평균</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
										<tr>
											<td>${playerRankList.game_count }</td>
											<td>${playerRankList.d_r }</td>
											<td>${playerRankList.o_r }</td>
											<td>${playerRankList.r_tot }</td>
											<td>${playerRankList.avg }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty playerRankList}">
							<div class="no_post">데이터가 없습니다.</div>
						</c:if>
					</div>
					<!-- //리바운드 -->
					</c:if>
					<c:if test="${category eq 'assist'}">
					<!-- 어시스트 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
									<tr>
										<td>${playerRankList.pl_back }</td>
										<td>${playerRankList.pl_name }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 어시스트 합계, 어시스트 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">어시스트 합계</th>
											<th scope="col">어시스트 평균</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
										<tr>
											<td>${playerRankList.game_count }</td>
											<td>${playerRankList.a_s }</td>
											<td>${playerRankList.avg }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty playerRankList}">
							<div class="no_post">데이터가 없습니다.</div>
						</c:if>
					</div>
					<!-- //어시스트 -->
					</c:if>
					<c:if test="${category eq 'steal'}">
					<!-- 스틸 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
									<tr>
										<td>${playerRankList.pl_back }</td>
										<td>${playerRankList.pl_name }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 스틸 합계, 스틸 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">스틸 합계</th>
											<th scope="col">스틸 평균</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
										<tr>
											<td>${playerRankList.game_count }</td>
											<td>${playerRankList.s_t }</td>
											<td>${playerRankList.avg }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty playerRankList}">
							<div class="no_post">데이터가 없습니다.</div>
						</c:if>
					</div>
					<!-- //스틸 -->
					</c:if>
					<c:if test="${category eq 'block'}">
					<!-- 블록 -->
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공" style="--pwth: min(26.979vw * 1.3, 518px)">
								<caption>부분별 선수 순위 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name p_auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
									<tr>
										<td>${playerRankList.pl_back }</td>
										<td>${playerRankList.pl_name }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="경기수, 블록 합계, 블록 평균, 정보 제공" style="--mwth: 100%; --mmin: 255px;">
									<caption>부분별 선수 순위 스크롤영역</caption>
									<colgroup>
										<col width="33.3333%">
										<col width="33.3333%">
										<col>
									</colgroup> 
									<thead>
										<tr>
											<th scope="col">경기수</th>
											<th scope="col">블록 합계</th>
											<th scope="col">블록 평균</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
										<tr>
											<td>${playerRankList.game_count }</td>
											<td>${playerRankList.b_s }</td>
											<td>${playerRankList.avg }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty playerRankList}">
							<div class="no_post">데이터가 없습니다.</div>
						</c:if>
					</div>
					<!-- //블록 -->
					</c:if>


				</div>
			</section>
			<!-- //자세한 부분별 선수 순위  -->
	
			
			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
</body>
</html>