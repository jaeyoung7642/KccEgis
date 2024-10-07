<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta property="og:type" content="website">
	<meta property="og:url" content="https://kccegis.com/">
	<meta property="og:title" content="부산KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/main.css"> <!-- main only -->
	<script src="/resources/common/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/common/assets/js/jquery.scrollDetector.min.js" defer></script>
	<script src="/resources/common/assets/js/lenis.min.js" defer></script>
	<script src="/resources/common/assets/js/swiper-bundle.min.js" defer></script>
	<script src="/resources/common/assets/js/jquery.kinetic.min.js" defer></script>
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/common.js" defer></script> 
	<script src="/resources/common/assets/js/main.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/link.js" defer></script>
	<script src="/resources/common/assets/js/script.js" defer></script> <!-- 개발용 -->
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
				alert("서버에 문제가 있습니다.");
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
				alert("서버에 문제가 있습니다.");
			}
		});
	} 
	</script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-main">
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
		<main id="container" class="ly_container">
			<h2 id="con" class="blind">본문</h2>

			<!-- visual (최대 3개) -->
			<section class="section sec_visual">
				<div class="swiper visual_slider">
					<div class="swiper-wrapper">
						<c:forEach items="${mainSlideList}" var="mainSlideList">
						<!-- slide -->
						<div class="swiper-slide">
							<a href="${mainSlideList.links}" class="item">
								<div class="el_img">
									<picture>
										<source srcset="/resources/common/images/upload/main_banner/${mainSlideList.img2 }" media="(max-width: 1024px)"> <!-- 모바일 이미지 -->
										<img src="/resources/common/images/upload/main_banner/${mainSlideList.img1 }" alt=""> <!-- pc 이미지 -->
									</picture>
								</div>
								<div class="content">
									<div class="ly_inner">
										<p class="tit mainSlideTit" data-anim>${mainSlideList.title}</p>
									</div>
									<div class="sec_line anim">
										<span class="line"></span>
									</div>
								</div>
							</a>
						</div>
						<!-- //slide -->
						</c:forEach>
					</div>

					<div class="swiper-pagination"></div>
				</div>

				<script>
					// 메인슬라이드 제목 데이터
					const bnnerData = new Array();
					$('.mainSlideTit').each(function (index, item) {
						mainSlideTit = $(item).text();
						bnnerData.push(mainSlideTit);
					    });
				</script>
			</section>
			<!-- //visual -->


			<!-- News  (최대 8개) -->
			<section class="section sec_news mt220">
				<div class="ly_inner lg">
					<div class="sec_header">
						<h3 class="el_heading">News</h3>
					</div>
					<div class="swiper slider news_slider group visible" data-view="[4,3]" data-space="[40,30]" data-pagetype="fraction">
						<div class="swiper-wrapper">
						<c:forEach items="${newsList}" var="newsList">
							<!-- slide -->
							<div class="swiper-slide">
								<a href="${newsList.linkurl }" target="_blank" rel="noreferrer" aria-label="(새창열림)"  class="el_thumb thumb_hover img_hover">
									<figure class="thumb el_img">
										<img src="/resources/common/images/upload/news/${newsList.img1 }" alt="">
									</figure>
									<span class="overlay">
										<div class="cont">
											<p class="tit">${newsList.subject }</p>
										</div>
										<div class="sec_line">
											<span class="line"></span>
										</div>
									</span>
								</a>
							</div>
							<!-- //slide -->
						</c:forEach>
						</div>

						<div class="swiper-controls type1">
							<div class="swiper-pagination"></div>
							<button type="button" class="swiper-button-prev"></button>
							<button type="button" class="swiper-button-next"></button>
						</div>
					</div>

					<a href="newsList" class="el_btn btn_more" aria-label="더보기"><span class="el_ico more w"></span></a>
				</div>
			</section>
			<!-- //News -->

			<!-- Game -->
			<section class="section sec_game mt220">
				<article class="team_ranking_area">
					<div class="ly_inner">
						<div class="team_ranking">
							<h3 class="tit">
								TEAM<br> RANKING
								<img src="/resources/common/images/common/ranikng_line.svg" alt="" class="line">
							</h3>
							<div class="emblem">
								<img src="/resources/common/images/common/logo.svg" alt="">
							</div>
							
							<div class="record">
								<c:if test="${empty teamRank}">
								<p class="ranking">NO.<span class="num">0</span></p>
								<ul class="record_list">
									<li>0승 0패</li>
									<li>승률 0.0</li>
									<li>승차 0.0</li>
								</ul>
								</c:if>
								<c:if test="${not empty teamRank}">
								<p class="ranking">NO.<span class="num">${teamRank.rank }</span></p>
								<ul class="record_list">
									<li>${teamRank.t_win}승 ${teamRank.t_loss}패</li>
									<li>승률 ${teamRank.win_rate }</li>
									<li>승차 ${teamRank.win_diff }</li>
								</ul>
								</c:if>
							</div>
							<a href="teamRank" class="el_btn btn_more" aria-label="더보기"><span class="el_ico more w"></span></a>
							
						</div>
					</div>
				</article>

				<article class="game_list_area">
					<div class="ly_inner">
						<h3 class="game_tit" data-anim-txt="charUp">
							<span class="txt">
								<span class="inner">
									<img src="/resources/common/images/img/main_game_title.png" alt="The Strongest KCC EGIS!">
								</span>
							</span>
						</h3>

						<div class="game_list swiper game_slider visible" data-anim>
							<div class="swiper-wrapper inner">
								<!-- slide -->
								<div class="swiper-slide item">
									<c:if test="${empty prevTeamSchedule}">
									<div class="el_img no_game">
										<picture>
											<source srcset="/resources/common/images/game/main_game_mo.png" media="(max-width: 1024px)">
											<img src="/resources/common/images/game/main_game_pc.jpg" alt="">
										</picture>
									</div>
									</c:if>
									<c:if test="${not empty prevTeamSchedule}">
									<div class="game_header">
										<p class="day"><em>${prevTeamSchedule.game_date_mm }</em>월 <em>${prevTeamSchedule.game_date_dd }</em>일(${prevTeamSchedule.week_day }) ${prevTeamSchedule.game_start_format }</p>
										<c:if test="${prevTeamSchedule.home_team == '60' }">
										<sapn class="line"></sapn>
										<span class="i home"><span class="blind">홈경기</span></span>
										</c:if>
										<c:if test="${prevTeamSchedule.away_team == '60' }">
										<sapn class="line"></sapn>
										<span class="i away"><span class="blind">원정경기</span></span>
										</c:if>
									</div>
									<div class="game_content">
										<p class="place">${prevTeamSchedule.stadium_name_2 }</p>
										<div class="teams">
											<div class="team lt">
												<div class="logo">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.home_team}.png" alt="">
													<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.home_team}.png" alt="">
													</c:if>
													<c:if test="${prevTeamSchedule.away_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.away_team}.png" alt="">
													</c:if> --%>
												</div>
													<p class="name">${prevTeamSchedule.home_team_name }</p>
												<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
												<p class="name">${prevTeamSchedule.home_team_name }</p>
												</c:if>
												<c:if test="${prevTeamSchedule.away_team == '60' }">
												<p class="name">${prevTeamSchedule.away_team_name }</p>
												</c:if> --%>
											</div>
											<div class="team rt">
												<div class="logo">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.away_team}.png" alt="">
													<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.away_team}.png" alt="">
													</c:if>
													<c:if test="${prevTeamSchedule.away_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${prevTeamSchedule.home_team}.png" alt="">
													</c:if> --%>
												</div>
													<p class="name">${prevTeamSchedule.away_team_name }</p>
												<%-- <c:if test="${prevTeamSchedule.home_team == '60' }">
												<p class="name">${prevTeamSchedule.away_team_name }</p>
												</c:if>
												<c:if test="${prevTeamSchedule.away_team == '60' }">
												<p class="name">${prevTeamSchedule.home_team_name }</p>
												</c:if> --%>
											</div>
											<div class="state">
												<p class="score">
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
												</p>
											</div>
										</div>
									</div>
									<div class="game_footer">
										<div class="btn_area wrap">
											<a href="scheduleResult?season_code=${prevTeamSchedule.season_code}&game_code=${prevTeamSchedule.game_code}&game_no=${prevTeamSchedule.game_no}" class="el_btn btn1 type2"><span class="el_ico ico_vs_w"></span> 결과</a> 
											<a href="#" class="el_btn btn1 type2" onclick="movie_detail(${prevTeamSchedule.game_date})"><span class="el_ico ico_video_w"></span> 영상</a>
											<a href="#" class="el_btn btn1 type2" onclick="photo_detail(${prevTeamSchedule.game_date})"><span class="el_ico ico_photo_w"></span> 사진</a>
										</div>
									</div>
									</c:if>
								</div>
								<!-- //slide -->
								<c:forEach items="${teamScheduleList}" var="teamScheduleList" varStatus="status">
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="game_header">
										<p class="day"><em>${teamScheduleList.game_date_mm }</em>월 <em>${teamScheduleList.game_date_dd }</em>일(${teamScheduleList.week_day }) ${teamScheduleList.game_start_format }</p>
										<c:if test="${teamScheduleList.home_team == '60' }">
										<sapn class="line"></sapn>
										<span class="i home"><span class="blind">홈경기</span></span>
										</c:if>
										<c:if test="${teamScheduleList.away_team == '60' }">
										<sapn class="line"></sapn>
										<span class="i away"><span class="blind">원정경기</span></span>
										</c:if>
									</div>
									<div class="game_content">
										<p class="place">${teamScheduleList.stadium_name_2 }</p>
										<div class="teams">
											<div class="team lt">
												<div class="logo">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.home_team}.png" alt="">
													<%-- <c:if test="${teamScheduleList.home_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.home_team}.png" alt="">
													</c:if>
													<c:if test="${teamScheduleList.away_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.away_team}.png" alt="">
													</c:if> --%>
												</div>
													<p class="name">${teamScheduleList.home_team_name }</p>
												<%-- <c:if test="${teamScheduleList.home_team == '60' }">
												<p class="name">${teamScheduleList.home_team_name }</p>
												</c:if>
												<c:if test="${teamScheduleList.away_team == '60' }">
												<p class="name">${teamScheduleList.away_team_name }</p>
												</c:if> --%>
											</div>
											<div class="team rt">
												<div class="logo">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.away_team}.png" alt="">
													<%-- <c:if test="${teamScheduleList.home_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.away_team}.png" alt="">
													</c:if>
													<c:if test="${teamScheduleList.away_team == '60' }">
													<img src="/resources/common/images/game/b_logo_${teamScheduleList.home_team}.png" alt="">
													</c:if> --%>
												</div>
													<p class="name">${teamScheduleList.away_team_name }</p>
												<%-- <c:if test="${teamScheduleList.home_team == '60' }">
												<p class="name">${teamScheduleList.away_team_name }</p>
												</c:if>
												<c:if test="${teamScheduleList.away_team == '60' }">
												<p class="name">${teamScheduleList.home_team_name }</p>
												</c:if> --%>
											</div>
											<div class="state">
												<div class="score">
													<span>VS</span>
												</div>
												<c:if test="${teamScheduleList.home_team == '60' }">
												<p class="time" id="countdown${status.index}"></p>
												</c:if>
												<c:if test="${teamScheduleList.away_team == '60' }">
												<p class="time" id="countdown${status.index}" style="display:none;"></p>
												</c:if>
												<p class="broad">tvN SPORTS, TVING</p>
												<input type="hidden" id="game_date_${status.index}" value="${teamScheduleList.game_date_all}">
											</div>
										</div>
									</div>
									<div class="game_footer">
										<c:if test="${teamScheduleList.home_team == '60' }">
										<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="el_btn btn1 type2 siteLink"><span class="el_ico ico_ticket_w"></span> 티켓예매</a>
										<a href="teamRecord?team_code=${teamScheduleList.away_team}#TEAMRECORD" class="el_btn btn1 type2"><span class="el_ico ico_record_w"></span>기록비교</a>
										</c:if>
										<c:if test="${teamScheduleList.away_team == '60' }">
										<a href="teamRecord?team_code=${teamScheduleList.home_team}#TEAMRECORD" class="el_btn btn1 type2"><span class="el_ico ico_record_w"></span>기록비교</a>
										</c:if>
									</div>
								</div>
								<!-- //slide -->
								</c:forEach>
								<c:if test="${fn:length(teamScheduleList)==1}">
									<p>대체이미지</p>
								</c:if>
								<c:if test="${fn:length(teamScheduleList)==0}">
									<p>대체이미지1</p>
									<p>대체이미지2</p>
								</c:if>
							</div>
						</div>
					</div>
				</article>
			</section>
			<!-- //Game -->

			<!-- Ranking -->
			<c:if test="${not empty playerRankList}">
			<section class="section sec_ranking mt220">
				<div class="ly_inner">
					<div class="sec_header">
						<h3 class="el_heading">RANKING</h3>
					</div>
					<div class="swipearea">
						<div class="inner">
							<div class="ranking_list">
								<div class="tit_area">
									<h4 class="tit">PLAYER<br> RANKING</h4>
									<img src="/resources/common/images/common/ico_ranking.svg" alt="" class="icon">
									<a href="playerRank" class="el_btn btn_more" aria-label="더보기"><span class="el_ico more w"></span></a>
								</div>
								<c:forEach items="${playerRankList}" var="playerRankList" varStatus="status">
								<!-- item -->
								<div class="item">
									<div class="header">
										<h5 class="cate">${playerRankList.cate}</h5>
									</div>
									<div class="content">
										<img src="/resources/common/images/upload/player/${playerRankList.pl_webmain}" alt="" class="player">
										<p class="div">${playerRankList.cate }</p>
										<p class="rec">${playerRankList.avg }</p>
									</div>
									<div class="footer">
										<span class="num">${playerRankList.pl_back }</span>  
										<span class="pos">${playerRankList.pl_postion }</span>
										<span class="name">${playerRankList.pl_name }</span>   
									</div>
								</div>
								<!-- //item -->
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //Ranking -->
			</c:if>

			<!-- Media -->
			<section class="section sec_media mt220">
				<div class="ly_inner lg">
					<div class="sec_header">
						<h3 class="el_heading">media</h3>
					</div>

					<div class="media_area">
						<div class="media_list youtube">
						<c:forEach items="${mediaUList}" var="mediaUList">
							<div class="item" data-anim>
								<c:choose>
				                	<c:when test="${mediaUList.etc1 =='H'}">
				                		<a href="movieListHDetail?num=${mediaUList.num}" class="box scroll_wrap">
				                	</c:when>
				                	<c:when test="${mediaUList.etc1 =='E'}">
				                		<a href="movieListEDetail?num=${mediaUList.num}" class="box scroll_wrap">
				                	</c:when>
				                	<c:otherwise>
				                		<a href="#" class="box scroll_wrap">
				                	</c:otherwise>
		                		</c:choose>
									<figure class="thumb el_img">
										<span class="inner">
											<img src="/resources/common/images/upload/movie/${mediaUList.img2}" alt="" data-scroll-img>
										</span>
									</figure>
								</a>
							</div>
						</c:forEach>
						</div>
						<div class="media_list photo">
							<c:forEach items="${photoList}" var="photoList">
							<div class="item" data-anim>
								<c:if test="${photoList.etc1 == 'H' }"> 
									<a href="photoListHDetail?num=${photoList.num}" class="box scroll_wrap">
								</c:if>
								<c:if test="${photoList.etc1 == 'E' }"> 
									<a href="photoListEDetail?num=${photoList.num}" class="box scroll_wrap">
								</c:if>
										<figure class="thumb el_img">
											<span class="inner">
												<img src="/resources/common/images/upload/gallery/${photoList.img2}" alt="" data-scroll-img>
											</span>
										</figure>
										<p class="tit">${photoList.subject }</p>
									</a>
							</div>
							</c:forEach>
						</div>

						<div class="media_list shorts">
							<c:forEach items="${mediaSList}" var="mediaSList">
							<div class="item" data-anim>
								<c:choose>
				                	<c:when test="${mediaSList.etc1 =='H'}">
				                		<a href="movieListHDetail?num=${mediaSList.num}" class="box scroll_wrap">
				                	</c:when>
				                	<c:when test="${mediaSList.etc1 =='E'}">
				                		<a href="movieListEDetail?num=${mediaSList.num}" class="box scroll_wrap">
				                	</c:when>
				                	<c:otherwise>
				                		<a href="#" class="box scroll_wrap">
				                	</c:otherwise>
		                		</c:choose>
									<figure class="thumb el_img">
										<span class="inner">
											<img src="/resources/common/images/upload/movie/${mediaSList.img2}" alt="" data-scroll-img>
										</span>
									</figure> 
								</a>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<!-- //Media -->

			<!-- Goods -->
			<section class="section sec_goods mt220">
				<div class="ly_inner lg">
					<div class="sec_header">
						<h3 class="el_heading">EGIS Goods</h3>
					</div>
					<div class="content">
						<!-- best (최대 3개) -->
						<div class="col best">
							<h4 class="tit">Best</h4>

							<div class="swiper slider bset_list loop auto">
								<div class="swiper-wrapper">
									<c:forEach items="${goodsBList}" var="goodsBList">
									<!-- slide -->
									<div class="swiper-slide">
										<a href="${goodsBList.goods_link}" target="_blank" rel="noreferrer" class="item" aria-label="(새창열림)">
											<figure class="thumb el_img">
												<img src="/resources/common/images/upload/main_goods/${goodsBList.goods_img }" alt="">
											</figure>
											<div class="info">
												<p class="name">${goodsBList.goods_nm }</p>
												<p class="price">${goodsBList.format_price }원</p>
											</div>
										</a>
									</div>
									<!-- //slide -->
									</c:forEach>
								</div>

								<div class="swiper-pagination type1"></div>
							</div>
						</div>
						<!-- //right -->

						<!-- goods (최대 4개) -->
						<div class="col goods">
							<div class="swiper slider goods_list visible" data-view="[5,5]" data-space="[20,20]">
								<div class="swiper-wrapper">
									<c:forEach items="${goodsCList}" var="goodsCList">
									<!-- slide -->
									<div class="swiper-slide">
										<a href="${goodsCList.goods_link}" target="_blank" rel="noreferrer" class="item img_hover" aria-label="(새창열림)">
											<figure class="thumb el_img">
												<img src="/resources/common/images/upload/main_goods/${goodsCList.goods_img }" alt="">
											</figure>
											<div class="info">
												<p class="name">${goodsCList.goods_nm }</p>
												<p class="price">${goodsCList.format_price }원</p>
											</div>
										</a>
									</div>
									<!-- //slide -->
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- //left -->
					</div>

					<a href="https://smartstore.naver.com/ravona/category/5d967cb738634c69bd00cd9458411d5c?cp=1" target="_blank" rel="noreferrer" class="el_btn btn_more" aria-label="상품 더보기(새창열림)"><span class="el_ico more w"></span></a>
				</div>
			</section>
			<!-- //Goods -->

			<!-- Banners -->
			<section class="section sec_banners mt220">
				<div class="col col_sns scroll_wrap">
					<a href="https://www.instagram.com/kcc_egis/" class="box sns" data-anim="fadeUp" target="_blank" rel="noreferrer">
						<span class="el_ico"><img src="/resources/common/images/common/ico_instagram.png" alt="인스타그램 로고"></span>
						<p class="tag">#<em>kcc_egis</em></p>
						<p class="txt_sm anim2">구단과 선수들의 생생한 소식</p>
					</a>
					<div class="anim_bg el_img" data-scroll-zoom><img src="/resources/common/images/img/main_banners_bg_01.jpg" alt=""></div>
				</div>
				<div class="col col_history scroll_wrap">
					<a href="chistory" class="box history" data-anim="fadeUp">
						<p class="txt_lg">KCC EGIS <em>HISTORIUM</em></p>
						<p class="txt_sm anim2">전통의 명문 구단 KCC이지스 역사관</p>
					</a>
					<div class="anim_bg el_img" data-scroll-zoom><img src="/resources/common/images/img/main_banners_bg_02_2.jpg" alt=""></div>
				</div>
				<div class="col col_sponsor">
					<div class="box sponsor">
						<ul class="sponsor_list" data-anim>
							<li><a href="KLENZE" class="siteLink" target="_blank" rel="noreferrer" aria-label="KLENZE(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_01.png" alt=""></a></li>
							<li><a href="KCCGLASS" class="siteLink" target="_blank" rel="noreferrer" aria-label="KCC글라스(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_02.png" alt=""></a></li>
							<li><a href="HOMECC" class="siteLink" target="_blank" rel="noreferrer" aria-label="HOMECC(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_03.png" alt=""></a></li>
							<li><a href="KCCWORLD" class="siteLink" target="_blank" rel="noreferrer" aria-label="KCC건설(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_04.png" alt=""></a></li>
							<li><a href="SWITZEN" class="siteLink" target="_blank" rel="noreferrer" aria-label="KCC스위첸(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_05.png" alt=""></a></li>
							<li><a href="KCCSILICONE" class="siteLink" target="_blank" rel="noreferrer" aria-label="KCC실리콘(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_06.png" alt=""></a></li>
							<li><a href="BMK" class="siteLink" target="_blank" rel="noreferrer" aria-label="BNK금융그룹(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_07.png" alt=""></a></li>
							<li><a href="WILSON" class="siteLink" target="_blank" rel="noreferrer" aria-label="윌슨(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_13.png" alt=""></a></li>
							<li><a href="HITE" class="siteLink" target="_blank" rel="noreferrer" aria-label="하이트진로(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_11.png" alt=""></a></li>
							<li><a href="ADVENTURER" class="siteLink" target="_blank" rel="noreferrer" aria-label="승부사온라인(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_09.png" alt=""></a></li>
							<li><a href="PANSTAR" class="siteLink" target="_blank" rel="noreferrer" aria-label="팬스타크루즈(새창열림)"><img src="/resources/common/images/sponsor/main_sponsor_12.png" alt=""></a></li>
						</ul>
					</div>
				</div>
				<div class="col col_brand scroll_wrap">
					<a href="https://www.kccworld.co.kr" target="_blank" rel="noreferrer" class="box brand" data-anim="fadeUp">
						<p class="txt_md">글로벌 응용소재화학기업<br>
						건축자재에서 첨단소재까지</p>
						<span class="logo anim2"><img src="/resources/common/images/common/logo_kcc.svg" alt="KCC로고"></span>
					</a>
					<div class="anim_bg el_img" data-scroll-zoom><img src="/resources/common/images/img/main_banners_bg_04.jpg" alt=""></div>
				</div>
			</section>
			<!-- //Banners -->


			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
	<!-- popup -->
	<div class="popup" id="popup_240830">
		<div class="ly_inner popup_inner">
			<div class="popup_content">
				<div class="popup_body">
					<div class="slider popup_slider auto loop">
						<div class="swiper-wrapper">
							<c:forEach items="${popupList}" var="popupList">
							<!-- slide -->
							<div class="swiper-slide">
								<c:if test="${popupList.map_chk == '0'}">
									<picture>
										<source srcset="/resources/common/images/upload/popup/${popupList.pop_img2 }" media="(max-width: 1024px)">
										<img src="/resources/common/images/upload/popup/${popupList.pop_img }" alt=""><!-- pc -->
									</picture>
								</c:if>
								<c:if test="${popupList.map_chk == '1'}">
									<c:if test="${popupList.map_target == '0'}">
										<a href="${popupList.map_url}"> <!-- 링크 있는 경우 -->
									</c:if>
									<c:if test="${popupList.map_target == '1'}">
										<a href="${popupList.map_url}" target="_blank" rel="noreferrer"> <!--외부-->
									</c:if>
											<picture>
												<source srcset="/resources/common/images/upload/popup/${popupList.pop_img2 }" media="(max-width: 1024px)">
												<img src="/resources/common/images/upload/popup/${popupList.pop_img }" alt=""><!-- pc -->
											</picture>
										</a>
								</c:if>
							</div>
							<!-- //slide -->
							</c:forEach>
						</div>
						<div class="swiper-pagination type1"></div>
					</div>
				</div>
				<div class="popup_btns">
					<button type="button" class="el_btn popupClose" data-cookie="true">오늘 하루 보지 않기</button>
					<button type="button" class="el_btn popupClose">닫기</button>
				</div>
			</div>
		</div>
		<div class="back popupClose"></div>
	</div>
	<!-- //popup -->


	<script>
		// popup
		function setCookie(name, value, days) {
			const expires = new Date();
      expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
			document.cookie = name + '=' + value + ';expires=' + expires.toUTCString();
		}

		function getCookie(name) {
        const keyValue = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    }

		function openPopup(popupId) {
			const popup = document.getElementById(popupId);
			$(popup).show();
    }

		function closePopup(e) {
			const $target = $(e.target);
			const $popup = $target.parents('.popup');
			const popupId = $popup.attr('id');
			const cookie = $target.data('cookie');

			$popup.hide();
			
			if (cookie) {
				setCookie(popupId, true, 1);
			}
    }

		$(document).on('click', '.popupClose', (e) => {
			closePopup(e);
		});
		
		$(function() {
			const popupIds = ['popup_240830'];
			for (let popupId of popupIds) {
				const popupOpened = getCookie(popupId);

				if (!popupOpened) {
					openPopup(popupId);
				}
			}
		});
		
	</script>
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
