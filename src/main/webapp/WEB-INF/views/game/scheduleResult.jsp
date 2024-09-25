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
	<title>경기일정/결과 : KCC이지스 프로농구단</title>
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
						<li>경기일정/결과</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList" class="swiper-slide snb_link current"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<!-- 세트별 스코어 안내 -->
			<section class="section">
				<div class="ly_inner md">
					<h4 class="blind">세트별 스코어 안내</h4>

					<article class="game_result">
						<div class="btns">
							<a href="scheduleList" class="el_btn btn1 plg blue"><span class="el_ico ico_calendar"></span> 경기일정</a> 
						</div>

						<div class="bl_card card">
							<!-- header -->  
							<div class="header">
								<div class="col state">
									<c:if test="${result.home_team == '60' }">
									<span class="el_ccl home"><span class="blind">홈경기</span></span>
									</c:if>
									<c:if test="${result.away_team == '60' }">
									<span class="el_ccl away"><span class="blind">원정경기</span></span>
									</c:if>
									<p class="datetime">
										<span class="date">${result.game_date_yy}년 ${result.game_date_mm}월 ${result.game_date_dd}일 (${result.week_day})</span>
										<span class="time">${result.game_start_format} / ${result.stadium_name_2}</span>
									</p>
								</div>
							</div> 
							<!-- //header -->
							<div class="content match">
							<c:if test="${result.home_team == '60' }">
								<div class="teams lt">
									<div class="team">
										<div class="el_logo md m80">
											<img src="/resources/common/images/game/team_logo/${season_code}/logo_${result.home_team}.png" alt="">
										</div>
										<p class="name">${result.home_team_name}</p>
									</div>
									<div class="score <c:if test="${result.home_score > result.away_score}">win</c:if>">${result.home_score}</div>
								</div> 
							</c:if>
							<c:if test="${result.away_team == '60' }">
								<div class="teams lt">
									<div class="team">
										<div class="el_logo md m80">
											<img src="/resources/common/images/game/team_logo/${season_code}/logo_${result.away_team}.png" alt="">
										</div>
										<p class="name">${result.away_team_name}</p>
									</div>
									<div class="score <c:if test="${result.away_score > result.home_score}">win</c:if>">${result.away_score}</div>
								</div> 
							</c:if>
							<c:if test="${result.home_team == '60' }">
								<div class="teams rt">
									<div class="team">
										<div class="el_logo md m80">
											<img src="/resources/common/images/game/team_logo/${season_code}/logo_${result.away_team}.png" alt="">
										</div>
										<p class="name">${result.away_team_name}</p>
									</div>
									<div class="score <c:if test="${result.away_score > result.home_score}">win</c:if>">${result.away_score}</div>
								</div>
							</c:if>
							<c:if test="${result.away_team == '60' }">
								<div class="teams rt">
									<div class="team">
										<div class="el_logo md m80">
											<img src="/resources/common/images/game/team_logo/${season_code}/logo_${result.home_team}.png" alt="">
										</div>
										<p class="name">${result.home_team_name}</p>
									</div>
									<div class="score <c:if test="${result.home_score > result.away_score}">win</c:if>">${result.home_score}</div>
								</div>
							</c:if>
								<div class="record">
									<div class="tbl type1">
										<table>
											<caption>세트별 스코어 안내</caption>
											<colgroup>
												<col class="col1">
												<col class="col">
												<col class="col">
												<col class="col">
												<col class="col">
												<col class="col">
												<col class="col">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">팀명</th>
													<th scope="col">1Q</th>
													<th scope="col">2Q</th> 
													<th scope="col">3Q</th>
													<th scope="col">4Q</th>
													<th scope="col">연장</th>
													<th scope="col">합계</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${result.home_team == '60' }">
												<tr>
													<th scope="row">${result.home_team_name}</th>
													<td>${result.homeTeam.Q1 }</td>
													<td>${result.homeTeam.Q2 }</td>
													<td>${result.homeTeam.Q3 }</td>
													<td>${result.homeTeam.Q4 }</td>
													<td>${result.homeTeam.EQ }</td>
													<td>${result.homeTeam.home_total}</td>
												</tr>
												<tr>
													<th scope="row">${result.away_team_name}</th>
													<td>${result.awayTeam.Q1 }</td>
													<td>${result.awayTeam.Q2 }</td>
													<td>${result.awayTeam.Q3 }</td>
													<td>${result.awayTeam.Q4 }</td>
													<td>${result.awayTeam.EQ }</td>
													<td>${result.awayTeam.away_total}</td>
												</tr>
												</c:if>
												<c:if test="${result.away_team == '60' }">
												<tr>
													<th scope="row">${result.away_team_name}</th>
													<td>${result.awayTeam.Q1 }</td>
													<td>${result.awayTeam.Q2 }</td>
													<td>${result.awayTeam.Q3 }</td>
													<td>${result.awayTeam.Q4 }</td>
													<td>${result.awayTeam.EQ }</td>
													<td>${result.awayTeam.away_total}</td>
												</tr>
												<tr>
													<th scope="row">${result.home_team_name}</th>
													<td>${result.homeTeam.Q1 }</td>
													<td>${result.homeTeam.Q2 }</td>
													<td>${result.homeTeam.Q3 }</td>
													<td>${result.homeTeam.Q4 }</td>
													<td>${result.homeTeam.EQ }</td>
													<td>${result.homeTeam.home_total}</td>
												</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</article>
					<!-- //게임 스케줄 -->
				</div>
			</section>
			<!-- //세트별 스코어 안내 -->


			<!-- 경기 최고 기록 비교 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="bl_grid col2"> 
						<div class="bl_col">
							<div class="page_header">
								<h4 class="el_heading lv1">경기 최고 기록 비교</h4>
							</div>

							<article class="game_result">
								<div class="bl_card card">
									<div class="content mvp">
										<div class="el_ico"><img src="/resources/common/images/common/ico_mvp.svg" alt=""></div>
										<div class="el_img el_thumb type1">
											<c:if test="${result.mvp.pl_webdetail != null  && result.mvp.pl_webdetail != ''}">
												<img src="/resources/common/images/upload/player/${result.mvp.pl_webdetail }" alt="">
											</c:if>
											<c:if test="${result.mvp.pl_webdetail == null || result.mvp.pl_webdetail == ''}">
												<img src="/resources/common/images/game/nonplayer.png" alt="">
											</c:if>
										</div>
										<div class="cont">
											<span class="tit">MVP(공헌도)</span>
											<span class="name">${result.mvp.kname}</span>
											<span class="rec">(${result.mvp.mvp})</span>
										</div>
									</div>
								</div>
							</article>

							<article class="game_result best_record mt30">
								<!-- header -->  
								<div class="header type1">
									<div class="row">
										<c:if test="${result.home_team == '60' }">
										<span class="col lt">${result.home_team_name }</span>
										<span class="col gray">VS</span>
										<span class="col rt">${result.away_team_name }</span>
										</c:if>
										<c:if test="${result.away_team == '60' }">
										<span class="col lt">${result.away_team_name }</span>
										<span class="col gray">VS</span>
										<span class="col rt">${result.home_team_name }</span>
										</c:if>
									</div>
								</div> 
								<!-- //header -->
								<div class="content type1" data-scollOn="once">
									<c:forEach items="${topList}" var="topList" varStatus="status">
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="player">
												<div class="el_img el_thumb type1">
													<c:if test="${topList.kccTop.pl_webdetail != null  && topList.kccTop.pl_webdetail != ''}">
														<img src="/resources/common/images/upload/player/${topList.kccTop.pl_webdetail }" alt="">
													</c:if>
													<c:if test="${topList.kccTop.pl_webdetail == null || topList.kccTop.pl_webdetail == ''}">
														<img src="/resources/common/images/game/nonplayer.png" alt="">
													</c:if>
												</div>
												<p class="name">${topList.kccTop.kname }(${topList.kccTop.pos})</p>
											</div>
											<div class="score <c:if test="${topList.kccRatio eq '100'}">win</c:if>">${topList.kccData }</div>
										</div>
										<div class="col ct">
											<div class="el_graph type1 vert">
												<span class="bar black" data-value="${topList.kccRatio}"></span>
												<span class="bar gray" data-value="${topList.otherRatio}"></span>
											</div>
											<span class="part">${topList.part}</span>
										</div>
										<div class="col rt">
											<div class="team">
												<div class="el_logo">
													<img src="/resources/common/images/game/team_logo/${season_code}/logo_${topList.otherTop.team_code}.png" alt="">
												</div>
												<p class="name">${topList.otherTop.kname }(${topList.otherTop.pos})</p>
											</div>
											<div class="score <c:if test="${topList.otherRatio eq '100'}">win</c:if>">${topList.otherData }</div>
										</div>
									</div>
									<!-- //row -->
									</c:forEach>
								</div>
							</article>
						</div>


						<div class="bl_col">
							<div class="page_header">
								<h4 class="el_heading lv1">주요 기록 비교</h4>
							</div>

							<article class="game_result staple_record">
								<!-- header -->  
								<div class="header type1">
									<div class="row">
										<c:if test="${result.home_team == '60' }">
										<span class="col lt">${result.home_team_name }</span>
										<span class="col gray">VS</span>
										<span class="col rt">${result.away_team_name }</span>
										</c:if>
										<c:if test="${result.away_team == '60' }">
										<span class="col lt">${result.away_team_name }</span>
										<span class="col gray">VS</span>
										<span class="col rt">${result.home_team_name }</span>
										</c:if>
									</div>
								</div> 
								<!-- //header -->
								<div class="content type1" data-scollOn="once">
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.score}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.score >= result.otherTeam.score}">win</c:if>">${result.kccTeam.score}</p>
										</div>
										<div class="col ct">
											<span class="part">득점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.score}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.score >= result.kccTeam.score}">win</c:if>">${result.otherTeam.score}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.r_tot}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.r_tot >= result.otherTeam.r_tot}">win</c:if>">${result.kccTeam.r_tot}</p>
										</div>
										<div class="col ct">
											<span class="part">리바운드</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.r_tot}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.r_tot >= result.kccTeam.r_tot}">win</c:if>">${result.otherTeam.r_tot}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.a_s}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.a_s >= result.otherTeam.a_s}">win</c:if>">${result.kccTeam.a_s}</p>
										</div>
										<div class="col ct">
											<span class="part">어시스트</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.a_s}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.a_s >= result.kccTeam.a_s}">win</c:if>">${result.otherTeam.a_s}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.s_t}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.s_t >= result.otherTeam.s_t}">win</c:if>">${result.kccTeam.s_t}</p>
										</div>
										<div class="col ct">
											<span class="part">스틸</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.s_t}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.s_t >= result.kccTeam.s_t}">win</c:if>">${result.otherTeam.s_t}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.b_s}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.b_s >= result.otherTeam.b_s}">win</c:if>">${result.kccTeam.b_s}</p>
										</div>
										<div class="col ct">
											<span class="part">블록</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.b_s}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.b_s >= result.kccTeam.b_s}">win</c:if>">${result.otherTeam.b_s}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.fgp}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.fgp >= result.otherTeam.fgp}">win</c:if>">${result.kccTeam.fgp}</p>
										</div>
										<div class="col ct">
											<span class="part">2점슛(%)</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.fgp}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.fgp >= result.kccTeam.fgp}">win</c:if>">${result.otherTeam.fgp}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.threepp}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.threepp >= result.otherTeam.threepp}">win</c:if>">${result.kccTeam.threepp}</p>
										</div>
										<div class="col ct">
											<span class="part">3점슛(%)</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.threepp}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.threepp >= result.kccTeam.threepp}">win</c:if>">${result.otherTeam.threepp}</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type2 horiz lt">
												<span class="bar black" data-value="${result.kccTeam.ftp}"></span>
											</div>
											<p class="score <c:if test="${result.kccTeam.ftp >= result.otherTeam.ftp}">win</c:if>">${result.kccTeam.ftp}</p>
										</div>
										<div class="col ct">
											<span class="part">자유투(%)</span>
										</div>
										<div class="col rt">
											<div class="el_graph type2 horiz rt">
												<span class="bar gray" data-value="${result.otherTeam.ftp}"></span>
											</div>
											<p class="score <c:if test="${result.otherTeam.ftp >= result.kccTeam.ftp}">win</c:if>">${result.otherTeam.ftp}</p>
										</div>
									</div>
									<!-- //row -->
								</div>
							</article>
						</div>
					</div>
				</div>
			</section>
			<!-- //경기 최고 기록 비교 -->


			<!-- 선수별 상세 기록 비교 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">선수별 상세 기록 비교</h4>
					</div>

					<div class="tabs">
						<nav class="tab_list type1">
							<c:if test="${result.home_team == '60' }">
								<button type="button" class="tab_link active" role="tab" aria-controls="panel1" id="tab1">${result.home_team_name }</button>
								<button type="button" class="tab_link" role="tab" aria-controls="panel2" id="tab2">${result.away_team_name }</button>
							</c:if>
							<c:if test="${result.away_team == '60' }">
								<button type="button" class="tab_link active" role="tab" aria-controls="panel1" id="tab1">${result.away_team_name }</button>
								<button type="button" class="tab_link" role="tab" aria-controls="panel2" id="tab2">${result.home_team_name }</button>
							</c:if>
						</nav>

						<div class="tab_panels">
							<!-- 부산 KCC -->
							<article id="panel1" class="tab_panel" role="tabpanel">
								<div class="tbl type2 tblSwipe">
									<div class="fixed">
										<table summary="번호, 선수명 정보 제공">
											<caption>선수별 상세 기록 고정영역</caption>
											<colgroup>
												<col class="num">
												<col class="name"">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">선수명</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${kccTeamList}" var="kccTeamList" varStatus="status">
												<tr>
													<td>${kccTeamList.back_num }</td>
													<td>${kccTeamList.kname }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="swipearea">
										<div class="inner">
											<table summary="출전시간, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버 정보 제공" style="--mmin: 585px;">
												<caption>선수별 상세 기록 스크롤영역</caption>
												<colgroup>
													<col width="11.1%">
													<col width="9.06%">
													<col width="9.82%">
													<col width="9.82%">
													<col width="9.82%">
													<col width="11.1%">
													<col width="11.1%">
													<col width="9.06%">
													<col width="9.06%">
													<col>
												</colgroup>
												<thead>
													<tr>
														<th scope="col">출전시간</th>
														<th scope="col">득점</th>
														<th scope="col">2점슛</th>
														<th scope="col">3점슛</th>
														<th scope="col">자유투</th>
														<th scope="col">리바운드</th>
														<th scope="col">어시스트</th>
														<th scope="col">스틸</th>
														<th scope="col">블록</th>
														<th scope="col">턴오버</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${kccTeamList}" var="kccTeamList" varStatus="status">
														<tr>
															<td>${kccTeamList.play_min}:${kccTeamList.play_sec}</td>
															<td>${kccTeamList.score}</td>
															<td>${kccTeamList.fg}</td>
															<td>${kccTeamList.threep}</td>
															<td>${kccTeamList.ft}</td>
															<td>${kccTeamList.r_tot}</td>
															<td>${kccTeamList.a_s}</td>
															<td>${kccTeamList.s_t}</td>
															<td>${kccTeamList.b_s}</td>
															<td>${kccTeamList.t_o}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</article>
							<!-- //부산 KCC -->

							<!-- 상대팀 -->
							<article id="panel2" class="tab_panel" role="tabpanel">
								<div class="tbl type2 tblSwipe">
									<div class="fixed">
										<table summary="번호, 선수명 정보 제공">
											<caption>선수별 상세 기록 고정영역</caption>
											<colgroup>
												<col class="num">
												<col class="name"">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">선수명</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${otherTeamList}" var="otherTeamList" varStatus="status">
												<tr>
													<td>${otherTeamList.back_num }</td>
													<td>${otherTeamList.kname }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="swipearea">
										<div class="inner">
											<table summary="출전시간, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버 정보 제공" style="--mmin: 585px;">
												<caption>선수별 상세 기록 스크롤영역</caption>
												<colgroup>
													<col width="11.1%">
													<col width="9.06%">
													<col width="9.82%">
													<col width="9.82%">
													<col width="9.82%">
													<col width="11.1%">
													<col width="11.1%">
													<col width="9.06%">
													<col width="9.06%">
													<col>
												</colgroup>
												<thead>
													<tr>
														<th scope="col">출전시간</th>
														<th scope="col">득점</th>
														<th scope="col">2점슛</th>
														<th scope="col">3점슛</th>
														<th scope="col">자유투</th>
														<th scope="col">리바운드</th>
														<th scope="col">어시스트</th>
														<th scope="col">스틸</th>
														<th scope="col">블록</th>
														<th scope="col">턴오버</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${otherTeamList}" var="otherTeamList" varStatus="status">
														<tr>
															<td>${otherTeamList.play_min}:${otherTeamList.play_sec}</td>
															<td>${otherTeamList.score}</td>
															<td>${otherTeamList.fg}</td>
															<td>${otherTeamList.threep}</td>
															<td>${otherTeamList.ft}</td>
															<td>${otherTeamList.r_tot}</td>
															<td>${otherTeamList.a_s}</td>
															<td>${otherTeamList.s_t}</td>
															<td>${otherTeamList.b_s}</td>
															<td>${otherTeamList.t_o}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</article>
							<!-- //상대팀 -->
						</div>
					</div>
				</div>
			</section>


			<%-- <!-- 우리팀 및 상대팀 기록 비교 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<h4 class="blind">부산 KCC 및 상대팀 기록 비교</h4>
					<div class="bl_grid col3 line row2 bg_white">
						<article class="bl_col p_hide game_result">
							<!-- header -->  
							<div class="header type1">
								<div class="row">
									<span class="col">부산 KCC</span>
								</div>
							</div> 
							<!-- //header -->
							<div class="tbl type2 scrollY maxh770" data-lenis-prevent>
								<table>
									<caption>부산 KCC 기록</caption>
									<colgroup>
										<col width="70">
										<col width="123">
										<col width="60">
										<col width="60">
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">배번</th>
											<th scope="col">선수</th>
											<th scope="col">파울</th>
											<th scope="col">득점</th>
											<th scope="col">리바운드</th>
											<th scope="col">어시스트</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>2</td>
											<td>최준용<br> [GD]</td>
											<td>4</td>
											<td>0</td>
											<td>1</td>
											<td>3</td>
										</tr>
										<tr>
											<td>3</td>
											<td>켈빈 에피스톨라<br> [GD]</td>
											<td>3</td>
											<td>0</td>
											<td>1</td>
											<td>4</td>
										</tr>
										<tr>
											<td>20</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>55</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>7</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>10</td>
											<td>최준용<br> [GD]</td>
											<td>0</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>19</td>
											<td>최준용<br> [GD]</td>
											<td>0</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>24</td>
											<td>최준용<br> [GD]</td>
											<td>1</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>25</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>1</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>2</td>
											<td>최준용<br> [GD]</td>
											<td>4</td>
											<td>0</td>
											<td>1</td>
											<td>3</td>
										</tr>
										<tr>
											<td>3</td>
											<td>켈빈 에피스톨라<br> [GD]</td>
											<td>3</td>
											<td>0</td>
											<td>1</td>
											<td>4</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>

						<article class="bl_col game_result">
							<!-- header -->  
							<div class="header type1">
								<div class="row">
									<span class="col">KBL 문자중계</span>
								</div>
							</div> 
							<!-- //header -->
							<div class="tabs tbl type2 td_md scrollY maxh770" data-lenis-prevent>
								<nav class="tab_list type2">
									<button type="button" class="tab_link md active" role="tab" aria-controls="panelB1" id="tabB1">1쿼터</button>
									<button type="button" class="tab_link md" role="tab" aria-controls="panelB2" id="tabB2">2쿼터</button>
									<button type="button" class="tab_link md" role="tab" aria-controls="panelB3" id="tabB3">3쿼터</button>
									<button type="button" class="tab_link md" role="tab" aria-controls="panelB4" id="tabB4">4쿼터</button>
									<button type="button" class="tab_link md" role="tab" aria-controls="panelB5" id="tabB5">연장</button>
								</nav>

								<div class="tab_panels">
									<!-- 1쿼터 -->
									<div id="panelB1" class="tab_panel" role="tabpanel">
										<table class="tbl_broad">
											<caption>1쿼터 기록</caption>
											<thead class="blind">
												<tr>
													<th scope="col">부산 KCC</th>
													<th scope="col">진행시간</th>
													<th scope="col">수원 KT</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">1쿼터 최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td colspan="3">게임종료</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //1쿼터 -->
									<!-- 2쿼터 -->
									<div id="panelB2" class="tab_panel" role="tabpanel">
										<table class="tbl_broad">
											<caption>2쿼터 기록</caption>
											<thead class="blind">
												<tr>
													<th scope="col">부산 KCC</th>
													<th scope="col">진행시간</th>
													<th scope="col">수원 KT</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">2쿼터 최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td colspan="3">게임종료</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //2쿼터 -->
									<!-- 3쿼터 -->
									<div id="panelB3" class="tab_panel" role="tabpanel">
										<table class="tbl_broad">
											<caption>3쿼터 기록</caption>
											<thead class="blind">
												<tr>
													<th scope="col">부산 KCC</th>
													<th scope="col">진행시간</th>
													<th scope="col">수원 KT</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">3쿼터 최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td colspan="3">게임종료</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //3쿼터 -->
									<!-- 4쿼터 -->
									<div id="panelB4" class="tab_panel" role="tabpanel">
										<table class="tbl_broad">
											<caption>4쿼터 기록</caption>
											<thead class="blind">
												<tr>
													<th scope="col">부산 KCC</th>
													<th scope="col">진행시간</th>
													<th scope="col">수원 KT</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">4쿼터 최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td colspan="3">게임종료</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //4쿼터 -->
									<!-- 연장 -->
									<div id="panelB5" class="tab_panel" role="tabpanel">
										<table class="tbl_broad">
											<caption>연장 기록</caption>
											<thead class="blind">
												<tr>
													<th scope="col">부산 KCC</th>
													<th scope="col">진행시간</th>
													<th scope="col">수원 KT</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">연장 최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">제프 위디 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt"></td>
													<td class="tm">00:00</td>
													<td class="rt">최승욱 교체(OUT) 최승욱 교체(OUT)</td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td class="lt">곽정훈 교체(OUT) 곽정훈 교체(OUT)</td>
													<td class="tm">00:00</td>
													<td class="rt"></td>
												</tr>
												<tr>
													<td colspan="3">게임종료</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //연장 -->
								</div>
							</div>
						</article>
						
						<article class="bl_col p_hide game_result">
							<!-- header -->  
							<div class="header type1">
								<div class="row">
									<span class="col">수원 KT</span>
								</div>
							</div> 
							<!-- //header -->
							<div class="tbl type2 scrollY maxh770" data-lenis-prevent>
								<table>
									<caption>수원 KT 기록</caption>
									<colgroup>
										<col width="70">
										<col width="123">
										<col width="60">
										<col width="60">
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">배번</th>
											<th scope="col">선수</th>
											<th scope="col">파울</th>
											<th scope="col">득점</th>
											<th scope="col">리바운드</th>
											<th scope="col">어시스트</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>2</td>
											<td>최준용<br> [GD]</td>
											<td>4</td>
											<td>0</td>
											<td>1</td>
											<td>3</td>
										</tr>
										<tr>
											<td>3</td>
											<td>켈빈 에피스톨라<br> [GD]</td>
											<td>3</td>
											<td>0</td>
											<td>1</td>
											<td>4</td>
										</tr>
										<tr>
											<td>20</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>55</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>7</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>10</td>
											<td>최준용<br> [GD]</td>
											<td>0</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>19</td>
											<td>최준용<br> [GD]</td>
											<td>0</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>24</td>
											<td>최준용<br> [GD]</td>
											<td>1</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>25</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>1</td>
											<td>최준용<br> [GD]</td>
											<td>2</td>
											<td>0</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td>2</td>
											<td>최준용<br> [GD]</td>
											<td>4</td>
											<td>0</td>
											<td>1</td>
											<td>3</td>
										</tr>
										<tr>
											<td>3</td>
											<td>켈빈 에피스톨라<br> [GD]</td>
											<td>3</td>
											<td>0</td>
											<td>1</td>
											<td>4</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
					</div>
				</div>
			</section>
			<!-- //우리팀 및 상대팀 기록 비교 --> --%>

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