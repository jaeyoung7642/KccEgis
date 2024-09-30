<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>시즌 기록실 : KCC이지스 프로농구단</title>
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
	let roundIdx = null;
	let roundSort = null;
	$(document).on('click', '.roundSort,.refresh', function() {
		if($(this).hasClass('refresh')){
			 $.ajax({
		   			type:'Get',
		   			data : {
		   				"round_gu" : "avg",
						"str" : "game_round",
						"sort" : "ASC"
		   			},
		   			url: 'selectRoundGu',
		   			success:function(result){
		   				$('#roundRecord').html(result);
		   	         	swipeEvent();
		   	         },
		   	         error:function(){
		   	            alert('서버에 문제가 있습니다.');
		   	         }
		   		});//ajax
		}else{
			let idx = $(this).data('pickcol');
		     $(this).parent().siblings().find('a').removeClass("active"); 
		     $(this).toggleClass("active"); 
		    var str = $(this).text();
		 // sort
			if (roundIdx === idx) {
				roundSort = roundSort === 'DESC' ? 'ASC' : 'DESC';
			} else {
				roundSort = 'DESC';	
			}	    
		    roundIdx = idx;
		    console.log(str);
		    console.log(roundSort);
		    var game_code = $("#game_code").val();
		    var season_code = $("#season_code").val();
		    var category = $("#category").val();
		    $.ajax({
	   			type:'Get',
	   			data : {
	   					"game_code" : game_code,
	   					"season_code" : season_code,
	   					"category" : category,
						"str" : str,
						"sort" : roundSort
						},
	   			url: 'selectSeasonSrot',
	   			success:function(result){
	   				$('#playerSortArea').html(result);
	   	         	swipeEvent();
		   	          $('.roundSort').each(function() {
	                 if ($(this).text().trim() === str.trim()) {
	                	 selectCol($(this), roundIdx);
		             	}; 
		   	          });
	   	         },
	   	         error:function(){
	   	            alert('서버에 문제가 있습니다.');
	   	         }
	   		});//ajax
		}
	});
	function selectPlayer(str){
		$.ajax({
   			type:'Get',
   			data : 'player_no=' + str,
   			url: 'selectPlayer',
   			success:function(result){
   	            $('#playerArea').html(result);
   	         	$("#player_no").val($("#playerSelect").val());
   	         	$("#game_round").val($("#selectRound2").val());
   	         	swipeEvent();
   	         	chartScrollMotion();
   	         	customSelect();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	function selectRound(str){
		var player_no = $("#playerSelect").val();
		$.ajax({
   			type:'Get',
   			data : {
   					"player_no" : player_no,
					"game_round" : str
					},
   			url: 'selectRound',
   			success:function(result){
   	            $('#roundArea').html(result);
   	         	$("#player_no").val($("#playerSelect").val());
	         	$("#game_round").val($("#selectRound2").val());
   	         	swipeEvent();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
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
						<li>시즌 기록실</li>
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
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link current"><span>시즌 기록실</span></a>
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
						<a href="teamRecord" class="swiper-slide snb_link"><span>팀 기록</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRecord" class="swiper-slide snb_link current"><span>선수 기록 </span></a>
					</div>
				</nav>
			</div>

			<!-- 개인별 시즌 기록 -->
			<div id="playerArea">
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header g_header">
						<h4 class="el_heading lv1">개인별 시즌 기록</h4> 
					</div>

					<div class="p_record_content">
						<!-- 주요 부문별 선수 순위  -->
						<article class="ranking">
							<div class="profile p_profile type1">
								<c:if test="${playerMap.pl_pos_code =='g'}">							
									<div class="pos">GUARD</div>
								</c:if>
								<c:if test="${playerMap.pl_pos_code =='c'}">							
									<div class="pos">CENTER</div>
								</c:if>
								<c:if test="${playerMap.pl_pos_code =='f'}">							
									<div class="pos">FORWARD</div>
								</c:if>
								<!-- <div class="pos long">FORWARD</div> --> <!-- 'FORWARD'일 경우 .long 클래스 추가 -->
								<div class="inner">
									<div class="photo">
										<img src="/resources/common/images/upload/player/${playerMap.pl_webmain }" alt="">
									</div>
								</div>
							</div>
							<div class="player">
								<span class="num">No.${playerMap.pl_back}</span>
								<span class="name">${playerMap.pl_name}</span>
							</div>
							<div class="btns">
								<a href="playerInfo?pl_no=${playerMap.pl_no }" class="el_btn md blue full gap4">
									선수 프로필 <span class="el_ico sm more_w"></span>
								</a> <!-- 선수 프로필 페이지로 이동 -->
							</div>
							<div class="tables">
								<div class="tbl_rank">
									<table>
										<caption>주요 부문별 선수 순위</caption>
										<colgroup>
											<col width="53%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th>득점</th>
												<td>${playerRank.pointRk}위</td>
											</tr>
											<tr>
												<th>리바운드</th>
												<td>${playerRank.reboundRk}위</td>
											</tr>
											<tr>
												<th>어시스트</th>
												<td>${playerRank.assistRk}위</td>
											</tr>
											<tr>
												<th>스틸</th>
												<td>${playerRank.stealRk}위</td>
											</tr>
											<tr>
												<th>블록</th>
												<td>${playerRank.blockRk}위</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="forms">
								<select class="frm_select sm" aria-label="다른 선수 선택" onchange="selectPlayer(this.value)" id="playerSelect">
									<c:forEach items="${playerList}" var="playerList" varStatus="status" >
										<option value="${playerList.playerCode}" <c:if test="${playerList.playerCode eq player_no}">selected</c:if>>${playerList.playerCodeNm}</option>
									</c:forEach>
								</select>
							</div>
						</article>
						<!-- //주요 부문별 선수 순위  -->

						<!-- 지난 시즌 주요 부문 기록 비교  -->
						<article class="record">
							<div class="staple_record season">
								<!-- header -->  
								<div class="header">
									<div class="row">
										<span class="col lt">23-24</span> <!-- 지난시즌 -->
										<span class="col"></span>
										<span class="col rt">24-25</span> <!-- 이번시즌 -->
									</div>
								</div> 
								<!-- //header -->
								<div class="content type1" data-scollOn="once">
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.pts}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.pts }</p>
										</div>
										<div class="col ct">
											<span class="part">득점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.pts}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.pts }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.r_tot}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.r_tot }</p>
										</div>
										<div class="col ct">
											<span class="part">리바운드</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.r_tot}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.r_tot }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.a_s}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.a_s }</p>
										</div>
										<div class="col ct">
											<span class="part">어시스트</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.a_s}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.a_s }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.s_t}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.s_t }</p>
										</div>
										<div class="col ct">
											<span class="part">스틸</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.s_t}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.s_t }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.b_s}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.b_s }</p>
										</div>
										<div class="col ct">
											<span class="part">블록</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.b_s}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.b_s }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.fg}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.fg }</p>
										</div>
										<div class="col ct">
											<span class="part">2점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.fg}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.fg }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.threep}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.threep }</p>
										</div>
										<div class="col ct">
											<span class="part">3점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.threep}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.threep }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.ft}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.ft }</p>
										</div>
										<div class="col ct">
											<span class="part">자유투</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.ft}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.ft }</p>
										</div>
									</div>
									<!-- //row -->
								</div>
							</div>
						</article>
						<!-- //지난 시즌 주요 부문 기록 비교  -->

						<!-- 당해년도 주요 부문 성공율 그래프 출력  -->
						<article class="chart">
							<div class="el_cart_radar chart-radar" data-scollOn="once" data-chart="[${currentSeason.fgp }, ${currentSeason.threepp }, ${currentSeason.ygp }, ${currentSeason.ftp }]"></div> <!-- 데이터 반시계 방향 -->
						</article>
						<!-- //당해년도 주요 부문 성공율 그래프 출력  -->

						<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->
					</div>
				</div>
			</section>
			<!-- //개인별 시즌 기록 -->

			<!-- 경기별 기록 비교 -->
			<section class="section mt30">
				<div class="ly_inner md">
					<article class="grid_header_type1">
						<div class="page_header g_header">
							<h5 class="el_heading lv2">경기별 기록 비교</h5> 
							<form action="" class="forms">
								<div class="frm_group">
									<select class="frm_select max240 m155" aria-label="라운드 선택" onchange="selectRound(this.value)" id="selectRound2">
										<option value="1" <c:if test="${game_round eq '1'}">selected</c:if>>1라운드</option>
										<option value="2" <c:if test="${game_round eq '2'}">selected</c:if>>2라운드</option>
										<option value="3" <c:if test="${game_round eq '3'}">selected</c:if>>3라운드</option>
										<option value="4" <c:if test="${game_round eq '4'}">selected</c:if>>4라운드</option>
										<option value="5" <c:if test="${game_round eq '5'}">selected</c:if>>5라운드</option>
										<option value="6" <c:if test="${game_round eq '6'}">selected</c:if>>6라운드</option>
									</select>
								</div>
							</form>
						</div>

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type2 tblSwipe g_content" id="roundArea">
							<div class="fixed">
								<table summary="라운드 정보 제공">
									<caption>경기별 기록 비교 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기일자</th>
										</tr> 
									</thead>
									<tbody>
									<c:forEach items="${roundPlayerList}" var="roundPlayerList" varStatus="status">
										<tr>
											<td>
												<a href="scheduleResult?season_code=${roundPlayerList.season_code }&game_code=${roundPlayerList.game_code}&game_no=${roundPlayerList.game_no }" class="el_btn goto">${roundPlayerList.game_date}</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="대진팀, 경기결과, min, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버, 파울 정보 제공공" style="--pmin: 1100px; --mmin: 970px;">
										<caption>경기별 기록 비교 스크롤영역</caption>
										<colgroup>
											<col>
											<col width="9.05%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">대진팀</th>
												<th scope="col">경기결과</th>
												<th scope="col">min</th>
												<th scope="col">득점</th>
												<th scope="col">2점슛</th>
												<th scope="col">3점슛</th>
												<th scope="col">자유투</th>
												<th scope="col">리바운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
												<th scope="col">턴오버</th>
												<th scope="col">파울</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${roundPlayerList}" var="roundPlayerList" varStatus="status">
											<tr>
												<td>
												<c:if test="${roundPlayerList.away_team == '16'}">원주 DB</c:if>
												<c:if test="${roundPlayerList.away_team == '50'}">창원 LG</c:if>
												<c:if test="${roundPlayerList.away_team == '06'}">수원 KT</c:if>
												<c:if test="${roundPlayerList.away_team == '55'}">서울 SK</c:if>
												<c:if test="${roundPlayerList.away_team == '10'}">울산 현대모비스</c:if>
												<c:if test="${roundPlayerList.away_team == '64'}">대구 한국가스공사</c:if>
												<c:if test="${roundPlayerList.away_team == '66'}">고양 소노</c:if>
												<c:if test="${roundPlayerList.away_team == '70'}">안양 정관장</c:if>
												<c:if test="${roundPlayerList.away_team == '35'}">서울 삼성</c:if>
												</td>
												<td>
												${roundPlayerList.win} ${roundPlayerList.team_score}-${roundPlayerList.vsteam_score}
												</td>
												<td>${roundPlayerList.play_min}’${roundPlayerList.play_sec}’’</td>
												<td>${roundPlayerList.score}</td>
												<td>${roundPlayerList.fg}</td>
												<td>${roundPlayerList.threep}</td>
												<td>${roundPlayerList.ft}</td>
												<td>${roundPlayerList.r_tot}</td>
												<td>${roundPlayerList.a_s}</td>
												<td>${roundPlayerList.s_t}</td>
												<td>${roundPlayerList.b_s}</td>
												<td>${roundPlayerList.t_o}</td>
												<td>${roundPlayerList.foul_tot}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${roundPlayerList.size()<=0}">
							<div class="no_post">데이터가 없습니다.</div>
							</c:if>
						</div>
						<!-- //비교 테이블 -->
					</article>
				</div>
			</section>
			</div>
			<!-- //경기별 기록 비교 -->

			<!-- 선수별 시즌 기록(평균) -->
			<section class="section mt50">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">선수별 시즌 기록</h4>
						
						<div class="btns rt">
							<button type="button" class="el_btn btn_txt openModal" data-target="#termsInfoPopup">
								<span class="el_ico info"></span> 용어정리
							</button>
						</div> 
					</div>

					<!-- 검색 -->
					<div class="search_box">
						<form action="playerRecord" class="search_box_form">
							<div class="row">
								<div class="col grow">
								<input type="hidden" value="${player_no}" name="player_no" id="player_no">
								<input type="hidden" value="${game_round}" name="game_round" id="game_round">
									<select class="frm_select max240" aria-label="리그 선택" name="game_code" id="game_code">
										<option value="01" <c:if test="${game_code eq 01}">selected</c:if>>정규리그</option>
										<option value="03" <c:if test="${game_code eq 03}">selected</c:if>>플레이오프</option>
									</select>
									<select class="frm_select max240" aria-label="시즌 선택" name="season_code" id="season_code">
										<c:forEach items="${selectSeasonList}" var="selectSeasonList" varStatus="status">
											<option value="${selectSeasonList.seasonCode}" <c:if test="${selectSeasonList.seasonCode eq season_code}">selected</c:if>>${selectSeasonList.seasonCodeNm}</option>
										</c:forEach>
									</select>
									<select class="frm_select max240" aria-label="평균/누적 선택" name="category" id="category">
										<option value="avg" <c:if test="${category eq 'avg'}">selected</c:if>>평균</option>
										<option value="total" <c:if test="${category eq 'total'}">selected</c:if>>누적</option>
									</select>
									<button  class="el_btn frm_btn black">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe" id="playerSortArea">
						<div class="fixed">
							<table summary="번호, 선수명 정보 제공">
								<caption>시즌별 기록 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${seasonSearchList}" var="seasonSearchList" varStatus="status">
									<tr>
											<td>${seasonSearchList.pl_back}</td>
											<td>${seasonSearchList.pl_name }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, AST, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1780px; --mmin: 1460px;" class="sort_group">
									<caption>시즌별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="13">AST</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="14">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="15">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="16">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="17">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="18">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="19">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${seasonSearchList}" var="seasonSearchList" varStatus="status">
										<tr>
											<td>${seasonSearchList.pts }</td>
											<td>${seasonSearchList.fg }</td>
											<td>${seasonSearchList.fg_a }</td>
											<td>${seasonSearchList.fgp }</td>
											<td>${seasonSearchList.threep }</td>
											<td>${seasonSearchList.threep_a }</td>
											<td>${seasonSearchList.threepp }</td>
											<td>${seasonSearchList.pp }</td>
											<td>${seasonSearchList.pp_a }</td>
											<td>${seasonSearchList.ppp }</td>
											<td>${seasonSearchList.o_r }</td>
											<td>${seasonSearchList.d_r }</td>
											<td>${seasonSearchList.r_tot }</td>
											<td>${seasonSearchList.a_s }</td>
											<td>${seasonSearchList.ft }</td>
											<td>${seasonSearchList.ft_a }</td>
											<td>${seasonSearchList.ftp }</td>
											<td>${seasonSearchList.t_o }</td>
											<td>${seasonSearchList.b_s }</td>
											<td>${seasonSearchList.foul_tot }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty seasonSearchList}">
							<div class="no_post">첫 경기 이후 데이터가 출력됩니다.</div>
						</c:if>
					</div>
					<!-- 기록 테이블 -->
				</div>
			</section>
			<!-- //선수별 시즌 기록(평균) -->
			<!-- 용어정리 팝업 -->
			<div id="termsInfoPopup" tabindex="-1" class="modal type2 spc_md termsInfoPopup" data-focus="tmodal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_header no_line">
							<h4 class="heading md">용어정리</h4>
						</div>

						<div class="modal_body" data-lenis-prevent>

							<div class="content">
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
										</colgroup>
										<thead>
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>PTS</td>
												<td>총 득점</td>
											</tr>
											<tr>
												<td>2P</td>
												<td>2점슛</td>
											</tr>
											<tr>
												<td>2PA</td>
												<td>2점슛 시도</td>
											</tr>
											<tr>
												<td>2P%</td>
												<td>2점슛 성공률</td>
											</tr>
											<tr>
												<td>3P</td>
												<td>3점슛</td>
											</tr>
											<tr>
												<td>3PA</td>
												<td>3점슛 시도</td>
											</tr>
											<tr>
												<td>3P%</td>
												<td>3점슛 성공률</td>
											</tr>
											<tr>
												<td>PP</td>
												<td>페인트존 득점 성공</td>
											</tr>
											<tr>
												<td>PPA</td>
												<td>페인트존 득점 시도</td>
											</tr>
											<tr>
												<td>PP%</td>
												<td>페이트존 득점 성공률</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
											<col>
										</colgroup>
										<thead class="xm_hide">
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>OFF REB</td>
												<td>공격 리바운드</td>
											</tr>
											<tr>
												<td>DEF REB</td>
												<td>수비 리바운드</td>
											</tr>
											<tr>
												<td>TOT</td>
												<td>공/수 리바운드 총합</td>
											</tr>
											<tr>
												<td>FT</td>
												<td>자유투</td>
											</tr>
											<tr>
												<td>FTA</td>
												<td>자유투 시도</td>
											</tr>
											<tr>
												<td>FT%</td>
												<td>자유투 성공률</td>
											</tr>
											<tr>
												<td>TO</td>
												<td>턴오버</td>
											</tr>
											<tr>
												<td>BS</td>
												<td>블록</td>
											</tr>
											<tr>
												<td>PF</td>
												<td>개인파울</td>
											</tr>
											<tr class="xm_hide">
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
							</div>

						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="tmodal"></button>
					</div>
				</div>
			</div>
			<!-- 용어정리 팝업 -->
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