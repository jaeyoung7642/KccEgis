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
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="경기일정/결과 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
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
	<script>
	function movie_detail(str){
		$.ajax({
			type : 'get',
			url : 'detailYn',
			data : {
				"game_date" : str,
				"part" : "movie"
			},
			success : function(result) {
				if(result.detailYn == 'N'){
					alertPop('등록된 영상이 없습니다.');
				}else{
					location.href = "movieListHDetail?num="+result.num;
				}
			},
			error : function() {
				alert('서버에 문제가 있습니다.');
			}
		});
	} 
	function photo_detail(str){
		$.ajax({
			type : 'get',
			url : 'detailYn',
			data : {
				"game_date" : str,
				"part" : "photo"
			},
			success : function(result) {
				if(result.detailYn == 'N'){
					alertPop('등록된 사진이 없습니다.');
				}else{
					location.href = "photoListHDetail?num="+result.num;
				}
			},
			error : function() {
				alert('서버에 문제가 있습니다.');
			}
		});
	} 
	</script>
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
								<a href="scheduleList" class="swiper-slide snb_link current"><span>경기일정/결과</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
								<!-- <a href="#" class="swiper-slide snb_link" onclick="alertPop('시즌 업데이트 준비중입니다.')"><span>티켓팅</span></a> -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 최신 경기일정 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="game_card_list">
						
						<!-- slide --> 
						<div class="item bl_card p_hide">
						<c:if test="${empty prevTeamSchedule}">
						<div class="el_img no_game">
							<picture>
								<img src="/resources/common/images/game/sub_game.png" alt="">
							</picture>
						</div>
						</c:if>
						<c:if test="${not empty prevTeamSchedule}">
							<div class="header">
								<p class="day">${prevTeamSchedule.game_date_format}(${prevTeamSchedule.week_day }) ${prevTeamSchedule.game_start_format }</p>
								<c:if test="${prevTeamSchedule.home_team == '60' }">
								<sapn class="line"></sapn>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								</c:if>
								<c:if test="${prevTeamSchedule.away_team == '60' }">
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
								</c:if>
							</div>
							<div class="content">
								<div class="team lt">
									<div class="el_logo">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.home_team}.svg" alt="">
										<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.home_team}.svg" alt="">
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.away_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${prevTeamSchedule.home_team_name }</p>
									<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
									<p class="blind">${prevTeamSchedule.home_team_name }</p>
									</c:if>
									<c:if test="${prevTeamSchedule.away_team == '60' }">
									<p class="blind">${prevTeamSchedule.away_team_name }</p>
									</c:if> --%>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.away_team}.svg" alt="">
										<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.away_team}.svg" alt="">
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.home_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${prevTeamSchedule.away_team_name }</p>
									<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
									<p class="blind">${prevTeamSchedule.away_team_name }</p>
									</c:if>
									<c:if test="${prevTeamSchedule.away_team == '60' }">
									<p class="blind">${prevTeamSchedule.home_team_name }</p>
									</c:if> --%>
								</div>
								<div class="state score">
									<a href="#" class="bl_score type1">
										<span class="num lt <c:if test="${prevTeamSchedule.home_score > prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.home_score}</span>
										<span class="vs">:</span>
										<span class="num rt <c:if test="${prevTeamSchedule.home_score < prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.away_score}</span>
										<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
										<span class="num lt <c:if test="${prevTeamSchedule.home_score > prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.home_score}</span>
										<span class="vs">:</span>
										<span class="num rt <c:if test="${prevTeamSchedule.home_score < prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.away_score}</span>
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<span class="num lt <c:if test="${prevTeamSchedule.home_score < prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.away_score}</span>
										<span class="vs">:</span>
										<span class="num rt <c:if test="${prevTeamSchedule.home_score > prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.home_score}</span>
										</c:if> --%>
									</a>
								</div>
							</div>
							<div class="footer btn_area">
								<a href="scheduleResult?season_code=${prevTeamSchedule.season_code}&game_code=${prevTeamSchedule.game_code}&game_no=${prevTeamSchedule.game_no}" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
								<a href="#" class="el_btn btn1" onclick="movie_detail(${prevTeamSchedule.game_date})"><span class="el_ico ico_video"></span> 영상</a>
								<a href="#" class="el_btn btn1" onclick="photo_detail(${prevTeamSchedule.game_date})"><span class="el_ico ico_photo"></span> 사진</a>
							</div>
							</c:if>
						</div>
						<!-- //slide -->
						<c:if test="${teamScheduleListSize == 2 }">
						<!-- slide --> 
						<div class="item bl_card lg">
							<div class="header">
								<p class="day">${currentMap.game_date_format}(${currentMap.week_day }) ${currentMap.game_start_format }</p>
								<c:if test="${currentMap.home_team == '60' }">
								<sapn class="line"></sapn>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								</c:if>
								<c:if test="${currentMap.away_team == '60' }">
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
								</c:if>
								<div class="where">
								<p class="place">${currentMap.stadium_name_2}</p>
								<c:if test="${currentMap.home_team == '60' }">
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
								<p class="chanel">${currentMap.tv_play}</p>
								</div>
							</div>
							<div class="content">
								<div class="team lt <c:if test="${currentMap.home_team == '60'}">xm_hide</c:if>">
									<div class="el_logo md m80">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										<%-- <c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									<%-- <c:if test="${currentMap.home_team == '60' }">
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
									</c:if> --%>
								</div>
								<div class="team rt <c:if test="${currentMap.away_team == '60' }">xm_hide</c:if>">
									<div class="el_logo md m80">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										<%-- <c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
										<p class="txt xm_show">${currentMap.away_team_name }</p>
									<%-- <c:if test="${currentMap.home_team == '60' }">
									<p class="blind">${currentMap.away_team_name }</p>
									<p class="txt">${currentMap.away_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.away_team_name }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<p class="blind">${currentMap.home_team_name }</p>
									<p class="txt">${currentMap.home_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.home_team_name }</p>
									</c:if> --%>
								</div>
								<div class="state record">
									<ul class="record_list">
										<c:if test="${currentMap.home_team == '60' }">
											<li class="present"><span class="tit">현재 시즌</span> <span>${currentMap.home_team_win }승</span> <span>${currentMap.home_team_loss }패</span></li>
											<li><span class="tit">지난 시즌</span> <span>${currentMap.home_team_win_before }승</span> <span>${currentMap.home_team_loss_before }패</span></li>
											<li><span class="tit">역대 전적</span> <span>${currentMap.home_team_win_total }승</span> <span>${currentMap.home_team_loss_total }패</span></li>
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
											<li class="present"><span class="tit">현재 시즌</span> <span>${currentMap.away_team_win }승</span> <span>${currentMap.away_team_loss }패</span></li>
											<li><span class="tit">지난 시즌</span> <span>${currentMap.away_team_win_before }승</span> <span>${currentMap.away_team_loss_before }패</span></li>
											<li><span class="tit">역대 전적</span> <span>${currentMap.away_team_win_total }승</span> <span>${currentMap.away_team_loss_total }패</span></li>
										</c:if>
									</ul>
									<c:if test="${currentMap.home_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.away_team}#TEAMRECORD" class="el_btn btn1 pmd line gap4 xm_hide"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.home_team}#TEAMRECORD" class="el_btn btn1 pmd line gap4 xm_hide"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
									</c:if>
								</div>
							</div>
							<div class="footer btn_area xm_show">
								<c:if test="${currentMap.home_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.away_team}#TEAMRECORD" class="el_btn btn1 pmd"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
									<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink"><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
								<c:if test="${currentMap.away_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.home_team}#TEAMRECORD" class="el_btn btn1 pmd"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
								</c:if>
							</div>
						</div>
						<!-- //slide -->
						
						<!-- slide --> 
						<div class="item bl_card p_hide">
							<div class="header">
								<p class="day">${nextMap.game_date_format}(${nextMap.week_day }) ${nextMap.game_start_format }</p>
								<c:if test="${nextMap.home_team == '60' }">
								<sapn class="line"></sapn>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								</c:if>
								<c:if test="${nextMap.away_team == '60' }">
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
								</c:if>
								<p class="chanel">${nextMap.tv_play}</p>
							</div>
							<div class="content">
								<div class="team lt">
									<div class="el_logo">
										<img src="/resources/common/images/game/logo_${nextMap.home_team}.svg" alt="">
										<%-- <c:if test="${nextMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${nextMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${nextMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${nextMap.away_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${nextMap.home_team_name }</p>
									<%-- <c:if test="${nextMap.home_team == '60' }">
										<p class="blind">${nextMap.home_team_name }</p>
									</c:if>
									<c:if test="${nextMap.away_team == '60' }">
										<p class="blind">${nextMap.away_team_name }</p>
									</c:if> --%>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<img src="/resources/common/images/game/logo_${nextMap.away_team}.svg" alt="">
										<%-- <c:if test="${nextMap.home_team == '60' }">
											<img src="/resources/common/images/game/logo_${nextMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${nextMap.away_team == '60' }">
											<img src="/resources/common/images/game/logo_${nextMap.home_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${nextMap.away_team_name }</p>
									<%-- <c:if test="${nextMap.home_team == '60' }">
									<p class="blind">${nextMap.away_team_name }</p>
									</c:if>
									<c:if test="${nextMap.away_team == '60' }">
									<p class="blind">${nextMap.home_team_name }</p>
									</c:if> --%>
								</div>
								<div class="state score">
									<span>VS</span>
								</div>
							</div>
							<div class="footer btn_area">
								<c:if test="${nextMap.home_team == '60' }">
								<a href="teamRecord?team_code=${nextMap.away_team}#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink "><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
								<c:if test="${nextMap.away_team == '60' }">
								<a href="teamRecord?team_code=${nextMap.home_team}#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
								</c:if>
							</div>
						</div>
						<!-- //slide -->
						</c:if>
						<c:if test="${teamScheduleListSize == 1 }">
						<!-- slide --> 
						<div class="item bl_card lg">
							<div class="header">
								<p class="day">${currentMap.game_date_format}(${currentMap.week_day }) ${currentMap.game_start_format }</p>
								<c:if test="${currentMap.home_team == '60' }">
								<sapn class="line"></sapn>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								</c:if>
								<c:if test="${currentMap.away_team == '60' }">
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
								</c:if>
								<p class="place">${currentMap.stadium_name_2}</p>
								<c:if test="${currentMap.home_team == '60' }">
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
							</div>
							<div class="content">
								<div class="team lt xm_hide">
									<div class="el_logo md m80">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										<%-- <c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									<%-- <c:if test="${currentMap.home_team == '60' }">
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
									</c:if> --%>
								</div>
								<div class="team rt">
									<div class="el_logo md m80">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										<%-- <c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if> --%>
									</div>
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
										<p class="txt xm_show">${currentMap.away_team_name }</p>
									<%-- <c:if test="${currentMap.home_team == '60' }">
									<p class="blind">${currentMap.away_team_name }</p>
									<p class="txt">${currentMap.away_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.away_team_name }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<p class="blind">${currentMap.home_team_name }</p>
									<p class="txt">${currentMap.home_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.home_team_name }</p>
									</c:if> --%>
								</div>
								<div class="state record">
									<ul class="record_list">
										<c:if test="${currentMap.home_team == '60' }">
											<li class="present"><span class="tit">현재 시즌</span> <span>${currentMap.home_team_win }승</span> <span>${currentMap.home_team_loss }패</span></li>
											<li><span class="tit">지난 시즌</span> <span>${currentMap.home_team_win_before }승</span> <span>${currentMap.home_team_loss_before }패</span></li>
											<li><span class="tit">역대 전적</span> <span>${currentMap.home_team_win_total }승</span> <span>${currentMap.home_team_loss_total }패</span></li>
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
											<li class="present"><span class="tit">현재 시즌</span> <span>${currentMap.away_team_win }승</span> <span>${currentMap.away_team_loss }패</span></li>
											<li><span class="tit">지난 시즌</span> <span>${currentMap.away_team_win_before }승</span> <span>${currentMap.away_team_loss_before }패</span></li>
											<li><span class="tit">역대 전적</span> <span>${currentMap.away_team_win_total }승</span> <span>${currentMap.away_team_loss_total }패</span></li>
										</c:if>
									</ul>
									<c:if test="${currentMap.home_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.away_team}#TEAMRECORD" class="el_btn btn1 pmd line gap4 xm_hide"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.home_team}#TEAMRECORD" class="el_btn btn1 pmd line gap4 xm_hide"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
									</c:if>
								</div>
							</div>
							<div class="footer btn_area xm_show">
								<c:if test="${currentMap.home_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.away_team}#TEAMRECORD" class="el_btn btn1 pmd"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
								</c:if>
								<c:if test="${currentMap.away_team == '60' }">
									<a href="teamRecord?team_code=${currentMap.home_team}#TEAMRECORD" class="el_btn btn1 pmd"><span class="el_ico ico_record"></span> 팀&팀 기록비교</a>
								</c:if>
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink"><span class="el_ico ico_ticket"></span> 티켓예매</a>
							</div>
						</div>
						<!-- //slide -->
						
						<!-- slide --> 
						<div class="item bl_card p_hide">
							<div class="el_img no_game">
								<picture>
									<img src="/resources/common/images/game/season_out.jpg" alt="">
								</picture>
							</div>
						</div>
						<!-- //slide -->
						</c:if>
						<c:if test="${teamScheduleListSize == 0 }">
						<div class="item bl_card lg">
							<p>대체이미지</p>
						</div>
						<div class="item bl_card p_hide">
							<p>대체이미지</p>
						</div>
						</c:if>
					</div>
				</div>
			</section>
			<!-- //최신 경기일정 -->
			
			<!-- 경기일정 리스트 -->
			<section class="section mt50">
				<div class="ly_inner md">

					<!-- 검색 -->
					<div class="search_box">
						<form action="scheduleCalendar" class="search_box_form">
							<div class="row">
								<div class="col grow">
									<select class="frm_select max240" aria-label="년도 선택" name="selectYear">
										 <%
								            // 현재 년도 가져오기
								            java.util.Calendar cal = java.util.Calendar.getInstance();
								            int currentYear = cal.get(java.util.Calendar.YEAR);
								            // 시작 연도 설정 (2001년)
								            int startYear = 2001;
								            String selectYear = request.getAttribute("selectYear").toString();
								            // 셀렉트 박스에 옵션 추가
								            for (int year = currentYear + 1; year >= startYear; year--) {
								            boolean isSelected = (year == Integer.parseInt(selectYear));
								        %>
								                <option value="<%= year %>" <%= isSelected ? "selected" : "" %>><%= year %>년</option>
								        <%
								            }
								        %>
									</select>
									<select class="frm_select max240" aria-label="월 선택" name="selectMonth">
									 	<option value="1" <c:if test="${selectMonth eq 1}">selected</c:if>>1월</option>
										<option value="2" <c:if test="${selectMonth eq 2}">selected</c:if>>2월</option>
										<option value="3" <c:if test="${selectMonth eq 3}">selected</c:if>>3월</option>
										<option value="4" <c:if test="${selectMonth eq 4}">selected</c:if>>4월</option>
										<option value="5" <c:if test="${selectMonth eq 5}">selected</c:if>>5월</option>
										<option value="6" <c:if test="${selectMonth eq 6}">selected</c:if>>6월</option>
										<option value="7" <c:if test="${selectMonth eq 7}">selected</c:if>>7월</option>
										<option value="8" <c:if test="${selectMonth eq 8}">selected</c:if>>8월</option>
										<option value="9" <c:if test="${selectMonth eq 9}">selected</c:if>>9월</option>
										<option value="10" <c:if test="${selectMonth eq 10}">selected</c:if>>10월</option>
										<option value="11" <c:if test="${selectMonth eq 11}">selected</c:if>>11월</option>
										<option value="12" <c:if test="${selectMonth eq 12}">selected</c:if>>12월</option>
									</select>
									<button class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 타입선택 -->
					<div class="board_types p_hide">
						<a href="scheduleList" class="el_btn type list"><span class="blind">리스트형</span></a>
						<a href="scheduleCalendar" class="el_btn type calendar on"><span class="blind">달력형</span></a>
					</div>
					<!-- //타입선택 -->

					<!-- 게임 스케줄 (목록형) -->
					<article class="game_schedule">
						<!-- header --> 
						<div class="header">
							<div class="col date">
								<p class="txt">
									<span class="year">${selectYear }.</span>
									<span class="month">${selectMonth }</span>
								</p>
								<c:if test="${minYear ne selectYear}">
									<c:if test="${selectMonth==1}">
										<a href="scheduleCalendar?selectYear=${preYaer}&selectMonth=12" class="el_btn arr lt"><span class="blind">이전 달</span></a>
									</c:if>
									<c:if test="${selectMonth>1}">
										<a href="scheduleCalendar?selectYear=${selectYear}&selectMonth=${preMonth}" class="el_btn arr lt"><span class="blind">이전 달</span></a>
									</c:if>
								</c:if>
								<c:if test="${minYear eq selectYear}">
									<c:if test="${selectMonth>1}">
										<a href="scheduleCalendar?selectYear=${selectYear}&selectMonth=${preMonth}" class="el_btn arr lt"><span class="blind">이전 달</span></a>
									</c:if>
								</c:if>
								<c:if test="${maxYear ne selectYear}">
									<c:if test="${selectMonth==12}">
									<a href="scheduleCalendar?selectYear=${nextYear}&selectMonth=1" class="el_btn arr rt"><span class="blind">다음 달</span></a>
									</c:if>
									<c:if test="${selectMonth<12}">
									<a href="scheduleCalendar?selectYear=${selectYear}&selectMonth=${nextMonth}" class="el_btn arr rt"><span class="blind">다음 달</span></a>
									</c:if>
								</c:if>
								<c:if test="${maxYear eq selectYear}">
									<c:if test="${selectMonth<12}">
									<a href="scheduleCalendar?selectYear=${selectYear}&selectMonth=${nextMonth}" class="el_btn arr rt"><span class="blind">다음 달</span></a>
									</c:if>
								</c:if>
							</div>
							<div class="col plyers">
								<span class="el_ico lg ccl ico_birthday"></span>
								<p class="tit">이달의 생일 선수</p>
								<p class="name">
									<c:forEach items="${playerBirthList}" var="playerBirthList" varStatus="status">
									<a href="playerInfo?pl_no=${playerBirthList.pl_no}" class="txt_link">${playerBirthList.pl_name }</a>
									<c:if test="${not status.last}">
										<span class="dash">/</span>
									</c:if>
									</c:forEach>
								</p>
							</div>
						</div>
						<%
						int startDay = Integer.parseInt(request.getAttribute("startDay").toString());
						int endDay = Integer.parseInt(request.getAttribute("endDay").toString());
						int endDayOfWeek = Integer.parseInt(request.getAttribute("endDayOfWeek").toString());
				        %>
						<!-- //header -->
						<div class="content">
							<table class="game_calendar">
								<caption>경기일정 검색 결과</caption>
								<thead class="blind">
									<tr>
										<th scope="col">일</th>
										<th scope="col">월</th>
										<th scope="col">화</th>
										<th scope="col">수</th>
										<th scope="col">목</th>
										<th scope="col">금</th>
										<th scope="col">토</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<% 
										for (int i = 1; i < startDay; i++) {
									%>
										    <td></td>
									<%	
										}
									%>
									<c:forEach items="${calendar}" var="calendar" varStatus="status">
									<td>
											<div class="top">
												<span class="day">${calendar.day}</span>
											<c:if test="${calendar.size()>2}">	
												<c:if test="${calendar.home_team == '60' }">
												<span class="el_ccl home"><span class="blind">홈경기</span></span>
												</c:if>
												<c:if test="${calendar.away_team == '60' }">
												<span class="el_ccl away"><span class="blind">원정경기</span></span>
												</c:if>
											</c:if>
											</div>
								<c:if test="${calendar.size()>2}">
											<div class="cont">
												<div class="el_logo">
													<c:if test="${calendar.home_team == '60' }">
														<img src="/resources/common/images/game/team_logo/${calendar.season_code}/logo_${calendar.away_team}.png" alt="">
													</c:if>
													<c:if test="${calendar.away_team == '60' }">
														<img src="/resources/common/images/game/team_logo/${calendar.season_code}/logo_${calendar.home_team}.png" alt="">
													</c:if>
												</div>
												<c:choose>
												<c:when test="${calendar.home_score > 0 && calendar.away_score > 0}">
												<div class="score">
													<a href="#" class="bl_score type2">
														<c:if test="${calendar.home_team == '60' }">
														<span class="num lt <c:if test="${calendar.home_score > calendar.away_score}">win</c:if>">${calendar.home_score}</span>
														<c:if test="${calendar.home_score > calendar.away_score}">
														<span class="el_ccl win"><span class="blind">패</span></span>
														</c:if>
														<c:if test="${calendar.home_score < calendar.away_score}">
														<span class="el_ccl lose"><span class="blind">패</span></span>
														</c:if>
														<span class="num rt <c:if test="${calendar.home_score < calendar.away_score}">win</c:if>">${calendar.away_score}</span>
														</c:if>
														<c:if test="${calendar.away_team == '60' }">
														<span class="num lt <c:if test="${calendar.home_score < calendar.away_score}">win</c:if>">${calendar.away_score}</span>
														<c:if test="${calendar.home_score < calendar.away_score}">
														<span class="el_ccl win"><span class="blind">패</span></span>
														</c:if>
														<c:if test="${calendar.home_score > calendar.away_score}">
														<span class="el_ccl lose"><span class="blind">패</span></span>
														</c:if>
														<span class="num rt <c:if test="${calendar.home_score > calendar.away_score}">win</c:if>">${calendar.home_score}</span>
														</c:if>
													</a>
												</div>
											</div>
											<div class="btns btn_area wrap">
												<a href="scheduleResult?season_code=${calendar.season_code}&game_code=${calendar.game_code}&game_no=${calendar.game_no}" class="el_btn btn1 psm"><span class="el_ico ico_vs"></span> 결과</a> 
												<a href="#" class="el_btn btn1 psm" onclick="movie_detail(${calendar.game_date})"><span class="el_ico ico_video"></span> 영상</a>
												<a href="#" class="el_btn btn1 psm" onclick="photo_detail(${calendar.game_date})"><span class="el_ico ico_photo"></span> 사진</a>
											</div>
											</c:when>
			  								<c:otherwise>
			  									<div class="place">
													${calendar.stadium_name_2}
												</div>
											</div>
											<div class="btns btn_area wrap">
												<c:if test="${calendar.home_team == '60' }">
								  					<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
													<a href="teamRecord?team_code=${calendar.away_team }#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
												</c:if>
												<c:if test="${calendar.away_team == '60' }">
													<a href="teamRecord?team_code=${calendar.home_team }#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
												</c:if>
											</div>
			  								</c:otherwise>
			  								</c:choose>
							</c:if>
											<c:if test="${calendar.day_of_week eq '7' }">
													</tr>
												<c:if test="${calendar.day < endDay }">
													<tr>
												</c:if>
											</c:if>
										</td>	    
									</c:forEach>
									<%
									for (int i = endDayOfWeek; i < java.util.Calendar.SATURDAY; i++) {
									%>
										<td>
										</td>
									<%	
										}
									%>
									</tr>
								</tbody>
							</table>
						</div>
					</article>
					<!-- //게임 스케줄 (목록형) -->
				</div>
			</section>
			<!-- //경기일정 리스트 -->

			<script>
				$(function() {
					// 모바일 사이즈 시 페이지 이동
					const match = window.matchMedia('(max-width: 1024px)');

					const pageChange = (e) => {
						if (e.currentTarget.matches) {
							window.location.href = "scheduleList";
						}
					}

					$(match).on('change', pageChange).change();
				});

			</script>

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