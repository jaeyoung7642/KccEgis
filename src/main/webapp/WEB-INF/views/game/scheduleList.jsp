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
	<script>
	function monthInit(str){
		var tt = [];
		$.ajax({
			type : 'POST',
			url : 'selectSeason',
			data : 'season_code=' + str,
			success : function(result) {
				$("#season_month").find("option").remove().end().append(
						"<option value='all'>전체</option>");
				tt = result;
				$.each(tt, function(index, value) {
					$('#season_month').append(
							'<option value='+value.year+value.month+'>'
									+ value.month + '월</option>');
				});
				selectUpdate('#season_month');
				/* $('#season_month').niceSelect('update');
				$('#season_month').nextAll().find('.list').attr('data-lenis-prevent', true); */
			},
			error : function() {
				alert('서버에 문제가 있습니다.');
			}
		});
	}
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
					alertPop('아직 등록된 영상이 없습니다.');
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
					alertPop('아직 등록된 사진이 없습니다.');
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
								<a href="scheduleList" class="swiper-slide snb_link current"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
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
										<c:if test="${prevTeamSchedule.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.home_team}.svg" alt="">
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.away_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${prevTeamSchedule.home_team == '60' }">
									<p class="blind">${prevTeamSchedule.home_team_name }</p>
									</c:if>
									<c:if test="${prevTeamSchedule.away_team == '60' }">
									<p class="blind">${prevTeamSchedule.away_team_name }</p>
									</c:if>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<c:if test="${prevTeamSchedule.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.away_team}.svg" alt="">
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${prevTeamSchedule.home_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${prevTeamSchedule.home_team == '60' }">
									<p class="blind">${prevTeamSchedule.away_team_name }</p>
									</c:if>
									<c:if test="${prevTeamSchedule.away_team == '60' }">
									<p class="blind">${prevTeamSchedule.home_team_name }</p>
									</c:if>
								</div>
								<div class="state score">
									<a href="#" class="bl_score type1">
										<c:if test="${prevTeamSchedule.home_team == '60' }">
										<span class="num lt <c:if test="${prevTeamSchedule.home_score > prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.home_score}</span>
										<span class="vs">:</span>
										<span class="num rt <c:if test="${prevTeamSchedule.home_score < prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.away_score}</span>
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<span class="num lt <c:if test="${prevTeamSchedule.home_score < prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.away_score}</span>
										<span class="vs">:</span>
										<span class="num rt <c:if test="${prevTeamSchedule.home_score > prevTeamSchedule.away_score}">win</c:if>">${prevTeamSchedule.home_score}</span>
										</c:if>
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
								<p class="place">${currentMap.stadium_name_2}</p>
								<c:if test="${currentMap.home_team == '60' }">
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
							</div>
							<div class="content">
								<div class="team lt xm_hide">
									<div class="el_logo md m80">
										<c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${currentMap.home_team == '60' }">
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
									</c:if>
								</div>
								<div class="team rt">
									<div class="el_logo md m80">
										<c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${currentMap.home_team == '60' }">
									<p class="blind">${currentMap.away_team_name }</p>
									<p class="txt">${currentMap.away_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.away_team_name }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<p class="blind">${currentMap.home_team_name }</p>
									<p class="txt">${currentMap.home_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.home_team_name }</p>
									</c:if>
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
							<div class="header">
								<p class="day">${nextMap.game_date_format}(${nextMap.week_day }) ${nextMap.game_start_format }</p>
								<c:if test="${nextMap.home_team == '60' }">
								<sapn class="line"></sapn>
								<span class="el_ccl home"><span class="blind">홈경기</span></span>
								</c:if>
								<c:if test="${nextMap.away_team == '60' }">
								<span class="el_ccl away"><span class="blind">원정경기</span></span>
								</c:if>
								<c:if test="${nextMap.home_team == '60' }">
								<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 pmd siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
								</c:if>
							</div>
							<div class="content">
								<div class="team lt">
									<div class="el_logo">
										<c:if test="${nextMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${nextMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${nextMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${nextMap.away_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${nextMap.home_team == '60' }">
										<p class="blind">${nextMap.home_team_name }</p>
									</c:if>
									<c:if test="${nextMap.away_team == '60' }">
										<p class="blind">${nextMap.away_team_name }</p>
									</c:if>
								</div>
								<div class="team rt">
									<div class="el_logo">
										<c:if test="${nextMap.home_team == '60' }">
											<img src="/resources/common/images/game/logo_${nextMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${nextMap.away_team == '60' }">
											<img src="/resources/common/images/game/logo_${nextMap.home_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${nextMap.home_team == '60' }">
									<p class="blind">${nextMap.away_team_name }</p>
									</c:if>
									<c:if test="${nextMap.away_team == '60' }">
									<p class="blind">${nextMap.home_team_name }</p>
									</c:if>
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
										<c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${currentMap.home_team == '60' }">
										<p class="blind">${currentMap.home_team_name }</p>
										<p class="txt">${currentMap.home_team_wl_three }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
										<p class="blind">${currentMap.away_team_name }</p>
										<p class="txt">${currentMap.away_team_wl_three }</p>
									</c:if>
								</div>
								<div class="team rt">
									<div class="el_logo md m80">
										<c:if test="${currentMap.home_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.away_team}.svg" alt="">
										</c:if>
										<c:if test="${currentMap.away_team == '60' }">
										<img src="/resources/common/images/game/logo_${currentMap.home_team}.svg" alt="">
										</c:if>
									</div>
									<c:if test="${currentMap.home_team == '60' }">
									<p class="blind">${currentMap.away_team_name }</p>
									<p class="txt">${currentMap.away_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.away_team_name }</p>
									</c:if>
									<c:if test="${currentMap.away_team == '60' }">
									<p class="blind">${currentMap.home_team_name }</p>
									<p class="txt">${currentMap.home_team_wl_three }</p>
									<p class="txt xm_show">${currentMap.home_team_name }</p>
									</c:if>
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
							<p>대체이미지</p>
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
						<form action="scheduleList" class="search_box_form">
							<div class="row">
								<div class="col shrink w492">
									<select class="frm_select" aria-label="리그 선택" name="game_code">
										<option value="01" <c:if test="${game_code eq 01}">selected</c:if>>정규리그</option>
										<option value="03" <c:if test="${game_code eq 03}">selected</c:if>>플레이오프</option>
									</select>
									<select class="frm_select rt" aria-label="시즌 선택" name="season_code" onchange="monthInit(this.value)">
										<c:forEach items="${selectSeasonList}" var="selectSeasonList" varStatus="status">
											<option value="${selectSeasonList.seasonCode}" <c:if test="${selectSeasonList.seasonCode eq season_code}">selected</c:if>>${selectSeasonList.seasonCodeNm}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col shrink check_group w472">
									<div class="group">
										<label class="frm_radio type1">
											<input type="radio" name="g_search" class="group_check" <c:if test="${round eq 0}">checked</c:if>>
										</label>
										<select class="frm_select group_input" aria-label="월 선택" id="season_month" name="season_month">
											<option value="all" <c:if test="${season_month eq 'all'}">selected</c:if>>전체</option>
											<c:forEach items="${selectDateList}" var="selectDateList" varStatus="status">
												<option value="${selectDateList.year}${selectDateList.month}" <c:if test="${season_month eq selectDateList.yearMonth}">selected</c:if>>${selectDateList.month}월</option>
											</c:forEach>
										</select>
									</div>
									<div class="group">
										<label class="frm_radio type1">
											<input type="radio" name="g_search" class="group_check" <c:if test="${round != 0}">checked</c:if>>
										</label>
										<select class="frm_select group_input rt pw200" aria-label="라운드 선택" name="round">
											<option value="1" <c:if test="${round eq 1}">selected</c:if>>1라운드</option>
											<option value="2" <c:if test="${round eq 2}">selected</c:if>>2라운드</option>
											<option value="3" <c:if test="${round eq 3}">selected</c:if>>3라운드</option>
											<option value="4" <c:if test="${round eq 4}">selected</c:if>>4라운드</option>
											<option value="5" <c:if test="${round eq 5}">selected</c:if>>5라운드</option>
											<option value="6" <c:if test="${round eq 6}">selected</c:if>>6라운드</option>
										</select>
									</div>
								</div>

								<div class="col grow">
									<select class="frm_select" aria-label="홈/어웨이 선택" name="ha">
										<option value="1" <c:if test="${ha eq 1}">selected</c:if>>전체</option>
										<option value="2" <c:if test="${ha eq 2}">selected</c:if>>홈 경기</option>
										<option value="3" <c:if test="${ha eq 3}">selected</c:if>>어웨이 경기</option>
									</select>
									<button  class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 타입선택 -->
					<div class="board_types p_hide">
						<a href="scheduleList" class="el_btn type list on"><span class="blind">리스트형</span></a>
						<a href="scheduleCalendar" class="el_btn type calendar"><span class="blind">달력형</span></a>
					</div>
					<!-- //타입선택 -->

					<!-- 게임 스케줄 (목록형) -->
					<article class="game_schedule">
					<c:set var="previousMonth" value="" />
					<c:forEach items="${scheduleList}" var="scheduleList" varStatus="status">
					<c:set var="currentMonth" value="${scheduleList.game_date_mm}" />
					<c:choose>
					  <c:when test="${status.first}">
					     <!-- header --> 
						<div class="header">
							<div class="col date">
								<p class="txt">
									<span class="year">${scheduleList.game_date_yy}.</span>
									<span class="month">${scheduleList.game_date_mm}</span>
								</p>
							</div>
							<c:set var="previousMonth" value="${currentMonth}" />
							<div class="col plyers">
								<span class="el_ico lg ccl ico_birthday"></span>
								<p class="tit">이달의 생일 선수</p>
								<p class="name">
									<c:set var="previousBrith" value="" />									
									<c:forEach items="${playerBirthList}" var="playerBirthList" varStatus="status2">
									<c:if test="${not empty previousMonth && previousMonth eq playerBirthList.pl_birthday_mm}">
									<c:if test="${not empty previousBrith}">
										<span class="dash">/</span>
									</c:if>
									<a href="playerInfo?pl_no=${playerBirthList.pl_no}" class="txt_link">${playerBirthList.pl_name }</a>
									<c:set var="previousBrith" value="${playerBirthList.pl_name }"/>	
								    </c:if>
									</c:forEach>
								</p>
							</div>
						</div>
						<!-- //header -->
					  </c:when>
					<c:otherwise>
					   <c:if test="${not empty previousMonth && previousMonth ne currentMonth}">
						<!-- header --> 
						<div class="header">
							<div class="col date">
								<p class="txt">
									<span class="year">${scheduleList.game_date_yy}.</span>
									<span class="month">${scheduleList.game_date_mm}</span>
								</p>
							</div>
							<c:set var="previousMonth" value="${currentMonth}" />
							<div class="col plyers">
								<span class="el_ico lg ccl ico_birthday"></span>
								<p class="tit">이달의 생일 선수</p>
								<p class="name">
									<c:set var="previousBrith" value="" />
									<c:forEach items="${playerBirthList}" var="playerBirthList" varStatus="status3">
									<c:if test="${not empty previousMonth && previousMonth eq playerBirthList.pl_birthday_mm}">
									<c:if test="${not empty previousBrith}">
										<span class="dash">/</span>
									</c:if>
									<a href="playerInfo?pl_no=${playerBirthList.pl_no}" class="txt_link">${playerBirthList.pl_name }</a>
									<c:set var="previousBrith" value="${playerBirthList.pl_name }"/>	
								    </c:if>
									</c:forEach>
								</p>
							</div>
						</div>
						<!-- //header -->
				    </c:if>
					</c:otherwise>
					</c:choose>
						<div class="content game_schedule_list">
							<!-- row -->
							<div class="row">
								<div class="col datetime">
									<div class="date">
										<p>${scheduleList.game_date_format}</p>
										<c:if test="${scheduleList.home_team == '60' }">
										<span class="el_ccl home"><span class="blind">홈경기</span></span>
										</c:if>
										<c:if test="${scheduleList.away_team == '60' }">
										<span class="el_ccl away"><span class="blind">원정경기</span></span>
										</c:if>
									</div>
									<p class="time">
										<span>${scheduleList.week_day}요일</span>
										<span>${scheduleList.game_start_format}</span>
										<span>${scheduleList.stadium_name_2}</span>
									</p>
								</div>
								<div class="col match">
									<div class="match_inner">
										<div class="team lt xm_hide">
											<div class="el_logo">
												<c:if test="${scheduleList.home_team == '60' }">
												<img src="/resources/common/images/game/team_logo/${season_code}/logo_${scheduleList.home_team}.png" alt="">
												</c:if>
												<c:if test="${scheduleList.away_team == '60' }">
												<img src="/resources/common/images/game/team_logo/${season_code}/logo_${scheduleList.away_team}.png" alt="">
												</c:if>
											</div>
											<c:if test="${scheduleList.home_team == '60' }">
											<p class="name">${scheduleList.home_team_name}</p>
											</c:if>
											<c:if test="${scheduleList.away_team == '60' }">
											<p class="name">${scheduleList.away_team_name}</p>
											</c:if>
										</div> 
										<div class="team rt">
											<div class="el_logo m50">
												<c:if test="${scheduleList.home_team == '60' }">
												<img src="/resources/common/images/game/team_logo/${season_code}/logo_${scheduleList.away_team}.png" alt="">
												</c:if>
												<c:if test="${scheduleList.away_team == '60' }">
												<img src="/resources/common/images/game/team_logo/${season_code}/logo_${scheduleList.home_team}.png" alt="">
												</c:if>
											</div>
											<c:if test="${scheduleList.home_team == '60' }">
											<p class="name">${scheduleList.away_team_name}</p>
											</c:if>
											<c:if test="${scheduleList.away_team == '60' }">
											<p class="name">${scheduleList.home_team_name}</p>
											</c:if>
										</div>
										<c:choose>
			  							<c:when test="${scheduleList.home_score > 0 && scheduleList.away_score > 0}">
										<div class="state score">
											<a href="scheduleResult?season_code=${scheduleList.season_code}&game_code=${scheduleList.game_code}&game_no=${scheduleList.game_no}" class="bl_score type2">
					  								<c:if test="${scheduleList.home_team == '60' }">
													<span class="num lt <c:if test="${scheduleList.home_score > scheduleList.away_score}">win</c:if>">${scheduleList.home_score}</span>
													<c:if test="${scheduleList.home_score > scheduleList.away_score}">
													<span class="el_ccl win"><span class="blind">패</span></span>
													</c:if>
													<c:if test="${scheduleList.home_score < scheduleList.away_score}">
													<span class="el_ccl lose"><span class="blind">패</span></span>
													</c:if>
													<span class="num rt <c:if test="${scheduleList.home_score < scheduleList.away_score}">win</c:if>">${scheduleList.away_score}</span>
													</c:if>
													<c:if test="${scheduleList.away_team == '60' }">
													<span class="num lt <c:if test="${scheduleList.home_score < scheduleList.away_score}">win</c:if>">${scheduleList.away_score}</span>
													<c:if test="${scheduleList.home_score < scheduleList.away_score}">
													<span class="el_ccl win"><span class="blind">패</span></span>
													</c:if>
													<c:if test="${scheduleList.home_score > scheduleList.away_score}">
													<span class="el_ccl lose"><span class="blind">패</span></span>
													</c:if>
													<span class="num rt <c:if test="${scheduleList.home_score > scheduleList.away_score}">win</c:if>">${scheduleList.home_score}</span>
													</c:if>
											</a>
										</div>
			  							</c:when>
			  							<c:otherwise>
			  							<div class="state broad">
			  							<%-- <c:if test="${scheduleList.tv_play == '' || scheduleList.tv_play == null }">
			  								중계방송<br> 
											미정
			  							</c:if> 
			  								${scheduleList.tv_play } --%>
			  							tvN SPORTS, TVING	
										</div>
			  							</c:otherwise>
			  							</c:choose>
									</div>
								</div>
								<div class="col btns">
									<div class="btn_area wrap">
									<c:choose>
					  				<c:when test="${scheduleList.home_score > 0 && scheduleList.away_score > 0}">
										<a href="scheduleResult?season_code=${scheduleList.season_code}&game_code=${scheduleList.game_code}&game_no=${scheduleList.game_no}" class="el_btn btn1"><span class="el_ico ico_vs"></span> 결과</a> 
										<c:if test="${season_code =='45' }">
										<a href="#" class="el_btn btn1" onclick="movie_detail(${scheduleList.game_date})"><span class="el_ico ico_video"></span> 영상</a>
										<a href="#" class="el_btn btn1" onclick="photo_detail(${scheduleList.game_date})"><span class="el_ico ico_photo"></span> 사진</a>
										</c:if>
										<c:if test="${season_code !='45' }">
										<a href="#" class="el_btn btn1 openModal" data-target="#movieListPop"><span class="el_ico ico_video"></span> 영상</a>
										<a href="#" class="el_btn btn1 openModal" data-target="#photoListPop"><span class="el_ico ico_photo"></span> 사진</a>
										</c:if>
					  				</c:when>
					  				<c:otherwise>
									<c:if test="${scheduleList.home_team == '60' }">
										<a href="teamRecord?team_code=${scheduleList.away_team }#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
					  					<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 siteLink xm_hide"><span class="el_ico ico_ticket"></span> 티켓예매</a>
									</c:if>
									<c:if test="${scheduleList.away_team == '60' }">
										<a href="teamRecord?team_code=${scheduleList.home_team }#TEAMRECORD" class="el_btn btn1"><span class="el_ico ico_record"></span> 기록비교</a>
									</c:if>
					  				</c:otherwise>
					  				</c:choose>
									</div>
								</div>
							</div>
							<!-- //row -->
						</div>
						</c:forEach>
						<c:if test="${empty scheduleList}">
							<div class="no_post">검색된 결과가 없습니다.</div>
						</c:if>
					</article>
					<!-- //게임 스케줄 (목록형) -->

					<c:if test="${not empty scheduleList}">
					<!-- pagination -->
					<div class="pagination">
						<!-- 맨처음 -->
						<c:if test="${maxPage eq 0}">
						<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						<c:if test="${maxPage > 0}">
						<a href="scheduleList?page=1&season_code=${season_code}&season_month=${season_month}&game_code=${game_code}&round=${round}&ha=${ha}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage gt 1 }">
	                       	<a href="scheduleList?page=${startPage-1}&season_code=${season_code}&season_month=${season_month}&game_code=${game_code}&round=${round}&ha=${ha}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
	                    </c:if>
						<c:if test="${startPage eq 1 }">
							<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
	                    </c:if>
	                    
	                    <!-- 페이지 번호 -->
	                    <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
	                   	<c:if test="${p eq currentPage }">
	                    	<a href="#" class="page_link current">${p}</a>
	                    </c:if>
	                      <c:if test="${p ne currentPage }">
	                      	<c:url var="scheduleList" value="scheduleList?&season_code=${season_code}&season_month=${season_month}&game_code=${game_code}&round=${round}&ha=${ha}">
		 					<c:param name="page" value="${p}" />
		 					</c:url>
		 					<a href="${scheduleList}" class="page_link">${p}</a>
	                      </c:if>
	                    </c:forEach>
	                    
	                    <!-- 다음 블럭으로 이동 -->
	                    <c:if test="${endPage ne maxPage && maxPage > 1}">
						<a href="scheduleList?page=${endPage+1}&season_code=${season_code}&season_month=${season_month}&game_code=${game_code}&round=${round}&ha=${ha}" class="page_link ico next"><span class="blind">다음</span></a>
	                    </c:if>
	                    <c:if test="${endPage ge maxPage}">
						<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
	                    </c:if>
	                    
	                    <!-- 맨끝 -->
	                    <c:if test="${maxPage eq 0}">
	                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
	                    </c:if>
	                    <c:if test="${maxPage > 0}">
						<a href="scheduleList?page=${maxPage}&season_code=${season_code}&season_month=${season_month}&game_code=${game_code}&round=${round}&ha=${ha}" class="page_link ico last"><span class="blind">마지막</span></a>
						</c:if>
					</div>
					<!-- // pagination -->
					</c:if>
				</div>
			</section>
			<!-- //경기일정 리스트 -->

			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->
		<!-- 알럿 -->
			<div id="movieListPop" tabindex="-1" class="alert alertPopup modal" data-focus="alert">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">24-25 이전 시즌 자료는 검색을 통해 확인할 수 있습니다.<br>해당 게시판으로 이동하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<a href="#" class="el_btn frm_btn gray2 closeModal">취소</a>
								<a href="movieListH" class="el_btn frm_btn blue">확인</a>
							</div>
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="alert"></button>
					</div>
				</div>
			</div>
			<!--  알럿 -->	
		<!-- 알럿 -->
			<div id="photoListPop" tabindex="-1" class="alert alertPopup modal" data-focus="alert">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">24-25 이전 시즌 자료는 검색을 통해 확인할 수 있습니다.<br>해당 게시판으로 이동하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<a href="#" class="el_btn frm_btn gray2 closeModal">취소</a>
								<a href="photoListH" class="el_btn frm_btn blue">확인</a>
							</div>
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="alert"></button>
					</div>
				</div>
			</div>
			<!--  알럿 -->	
	</div>
</body>
</html>