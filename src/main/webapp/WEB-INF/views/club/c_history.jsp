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
	<meta property="og:title" content="역사관 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>역사관 : KCC이지스 프로농구단</title>
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
						<li>역사관</li>
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
								<a href="chistory" class="swiper-slide snb_link current"><span>역사관</span></a> <!-- 해당페이지에 current 추가 -->
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
						<a href="chistory" class="swiper-slide snb_link current"><span>구단 히스토리</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="phistory" class="swiper-slide snb_link"><span>선수단 히스토리</span></a>
						<a href="seasonReview" class="swiper-slide snb_link"><span>시즌 리뷰</span></a> 
					</div>
				</nav>
			</div>

			<!-- 연혁-->
			<section class="section mt70">
				<article>
					<div class="ly_inner md">
						<div class="page_header line">
							<h4 class="el_heading lv1">연혁</h4> 
						</div>

						<div class="load_menu_slider type2 c_history_list" data-start="2">
							<div class="swiper-wrapper">
								<div class="swiper-slide item">
									<a href="#" class="box selectHistory" data-index="0" data-year="2000">
										<span class="year back">20</span>
										<span class="year front">00<span class="sm">’s</span></span>
										<div class="el_img">
											<img src="/resources/common/images/img/c_history/history_thumb_01.webp" alt="2000년대">
										</div>
									</a>
								</div>
								<div type="button"iv class="swiper-slide item">
									<a href="#" class="box selectHistory" data-index="1" data-year="2010">
										<span class="year back">20</span>
										<span class="year front">10<span class="sm">’s</span></span>
										<div class="el_img">
											<img src="/resources/common/images/img/c_history/history_thumb_02.webp" alt="2010년대">
										</div>
									</a>
								</div>
								<div class="swiper-slide item">
									<a href="#" class="box selectHistory active" data-index="2" data-year="2020">
										<span class="year back">20</span>
										<span class="year front">20<span class="sm">’s</span></span>
										<div class="el_img">
											<img src="/resources/common/images/img/c_history/history_thumb_03.webp" alt="2020년대">
										</div>
									</a>
								</div>
							</div>
							<div class="swiper-button-next type1 p_show"></div>
							<div class="swiper-button-prev type1 p_show"></div> 
						</div>
					</div>
				</article>
				
				<article class="mt30 c_history_detail">
					<div class="ly_inner md slide_clamp js-include" id="changeHistory" data-include="c_history_2020">
					</div>
				</article>

				<script>
					$(function() {
						const $selectHistory = $('.selectHistory');
						let selectedIdx = $('.selectHistory.active').data('index');

						$selectHistory.on('click', function() {
							let val = $(this).data('index');
							let year = $(this).data('year');

							if (selectedIdx !== val) {
								selectedIdx = val;

								$selectHistory.removeClass('active');
								$(this).addClass('active');
								$('.c_history_list').attr('data-start', val);
								changeHistory(year);
							}
						});
						
						function changeHistory(val) {
							$('#changeHistory').attr('data-include', 'c_history_'+val);
							includeHtml();
						}
					});

				</script>
			</section>
			<!-- 연혁 -->


			<!-- 역대 성적-->
			<section class="section mt100">
				<!-- 누적 성적 -->
				<article>
					<div class="ly_inner md">
						<div class="page_header">
							<h4 class="el_heading lv1">역대 성적</h4> 
						</div>
						<div class="results_box type1">
							<dl>
								<dt>KBL 누적 성적</dt>
								<dd>626승 604패
									<em class="sub md"><span class="dash">/</span> 승률 0.508</em>
								</dd>
							</dl>
							<dl>
								<dt>KBL 우승</dt>
								<dd>챔피언결정전 4회
									<em class="sub md"><span class="dash">/</span> 정규리그 2회 우승</em>
								</dd>
							</dl>
						</div>
					</div>
				</article>
				<!-- //누적 성적 -->

				<!-- 우승 사진 -->
				<article class="mt50-30">
					<div class="ly_inner md slide_clamp">
						<div class="slider type3 c_history_slider">
							<div class="swiper-wrapper">
								<!-- slide -->
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img media">
										<img data-src="/resources/common/images/img/c_history/season2324_img.jpg" alt="23-24시즌 챔프전 우승 사진" class="lazy-image">
									</figure>
									<div class="info">
										<span class="season">23-24시즌</span>
										<span class="tit">챔프전 우승</span>
									</div>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img media">
										<img data-src="/resources/common/images/img/c_history/season1011_img.jpg" alt="10-11시즌 챔프전 우승 사진" class="lazy-image">
									</figure>
									<div class="info">
										<span class="season">10-11시즌</span>
										<span class="tit">챔프전 우승</span>
									</div>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img media">
										<img data-src="/resources/common/images/img/c_history/season0809_img.jpg" alt="08-09시즌 챔프전 우승 사진" class="lazy-image">
									</figure>
									<div class="info">
										<span class="season">08-09시즌</span>
										<span class="tit">챔프전 우승</span>
									</div>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img media">
										<img data-src="/resources/common/images/img/c_history/season0304_img.jpg" alt="03-04 시즌 챔프전 우승 사진" class="lazy-image">
									</figure>
									<div class="info">
										<span class="season">03-04시즌</span>
										<span class="tit">챔프전 우승</span>
									</div>
								</div>
								<!-- //slide -->
							</div>
							<div class="swiper-button-next type2 p_hide"></div>
							<div class="swiper-button-prev type2 p_hide"></div>
						</div>
					</div>
				</article>
				<!-- 우승 사진 -->

				<!-- 성적 테이블 -->
				<article class="mt50-30">
					<div class="ly_inner md">
						<div class="tbl type2 td_md tblSwipe g_content">
							<div class="fixed">
								<table summary="시즌, 구단명 정보 제공" style="--pwth: min(20.833vw * 1.4, 400px);">
									<caption>역대 성적 기록 고정영역</caption>
									<colgroup>
										<col class="season2">
										<col class="p_hide">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">시즌
												<span class="p_show"> / 구단명</sp>
											</th>
											<th scope="col" class="p_hide">구단명</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="td_group">
													<span>
														<span class="el_ico star"></span> 2023-2024
													</span>
													<span class="p_show">부산KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">부산KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2022-2023</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2021-2022</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2020-2021</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2019-2020</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2018-2019</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2017-2018</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2016-2017</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2015-2016</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2014-2015</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2013-2014</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2012-2013</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2011-2012</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>
														<span class="el_ico star"></span> 2010-2011
													</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2009-2010</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>
														<span class="el_ico star"></span> 2008-2009
													</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2007-2008</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2006-2007</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2005-2006</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2004-2005</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>
														<span class="el_ico star"></span> 2003-2004
													</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr>
											<td>
												<div class="td_group">
													<span>2002-2003</span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr class="last">
											<td>
												<div class="td_group">
													<span>2001-2002 </span>
													<span class="p_show">전주KCC이지스</span>
												</div>
											</td>
											<td class="p_hide">전주KCC이지스</td>
										</tr>
										<tr class="total">
											<td colspan="2">KBL 통산 28시즌 </td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="순위, 승, 패, 승률, 플레이오프, 시즌리뷰 바로가기 제공" style="--mmin: 500px;">
										<caption>역대 성적 기록 스크롤영역</caption>
										<colgroup>
											<col width="15%">
											<col width="15%">
											<col width="15%">
											<col width="17%">
											<col width="21%">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">순위</th>
												<th scope="col">승</th>
												<th scope="col">패</th>
												<th scope="col">승률</th>
												<th scope="col">플레이오프</th>
												<th scope="col">시즌리뷰</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>5</td>
												<td>30</td>
												<td>24</td>
												<td>0.556</td>
												<td>챔프전 우승</td>
												<td>
													<a href="seasonReview?season_year=3&season_code=43" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>6</td>
												<td>24</td>
												<td>30</td>
												<td>0.444</td>
												<td>6강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=3&season_code=41" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>9</td>
												<td>21</td>
												<td>33</td>
												<td>0.389</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=3&season_code=39" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>36</td>
												<td>18</td>
												<td>0.667</td>
												<td>챔프전 준우승</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=37" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>23</td>
												<td>19</td>
												<td>0.548</td>
												<td>코로나19 시즌 조기 중단</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=35" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>28</td>
												<td>26</td>
												<td>0.519</td>
												<td>4강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=33" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>35</td>
												<td>19</td>
												<td>0.648</td>
												<td>4강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=31" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>10</td>
												<td>17</td>
												<td>37</td>
												<td>0.315</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=29" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>36</td>
												<td>18</td>
												<td>0.667</td>
												<td>챔프전 준우승</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=27" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>9</td>
												<td>12</td>
												<td>42</td>
												<td>0.222</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=25" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>7</td>
												<td>20</td>
												<td>34</td>
												<td>0.370</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=23" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>10</td>
												<td>13</td>
												<td>41</td>
												<td>0.241</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=21" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>31</td>
												<td>23</td>
												<td>0.574</td>
												<td>6강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=2&season_code=19" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>34</td>
												<td>20</td>
												<td>0.630</td>
												<td>챔프전 우승</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=17" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>35</td>
												<td>19</td>
												<td>0.648</td>
												<td>챔프전 준우승</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=15" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>31</td>
												<td>23</td>
												<td>0.574</td>
												<td>챔프전 우승</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=13" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>33</td>
												<td>21</td>
												<td>0.611</td>
												<td>4강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=12" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>10</td>
												<td>15</td>
												<td>39</td>
												<td>0.278</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=11" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>5</td>
												<td>29</td>
												<td>25</td>
												<td>0.537</td>
												<td>4강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=10" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>34</td>
												<td>20</td>
												<td>0.630</td>
												<td>챔프전 준우승</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=9" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>39</td>
												<td>15</td>
												<td>0.722</td>
												<td>챔프전 우승</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=8" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr>
												<td>9</td>
												<td>20</td>
												<td>34</td>
												<td>0.370</td>
												<td>미진출</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=7" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr class="last">
												<td>3</td>
												<td>30</td>
												<td>24</td>
												<td>0.556</td>
												<td>4강 PO 진출</td>
												<td>
													<a href="seasonReview?season_year=1&season_code=6" class="el_btn sm2 blue">바로가기</a> <!-- 해당시즌
													시즌리뷰 내용으로 이동 -->													
												</td>
											</tr>
											<tr class="total">
												<td>-</td>
												<td>626승</td>
												<td>604패</td>
												<td>0.508</td>
												<td colspan="2">챔프전 4회 우승 / 정규리그 2회 우승</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!-- // 성적 테이블 -->

			</section>
			<!-- //역대 성적-->


			<!-- 성적 테이블 -->
			<article class="section mt100">
				<div class="ly_inner md">
					<div class="page_header gap10b">
						<h4 class="el_heading lv1">역대 관중</h4> 
						<!-- 관중 통계 -->
						<dl class="crowds p_hide">
							<dt>누적 관중</dt>
							<dd>4,386,008명</dd>
							<dt>최대 관중</dt>
							<dd>04-05시즌 261,172 명</dd>
						</dl>
						<!-- //관중 통계 -->
					</div>

					<!-- 관중 통계 -->
					<article class="results_box type1 p_show">
						<dl>
							<dt>누적 관중</dt>
							<dd>4,386,008명</dd>
						</dl>
						<dl>
							<dt>최대 관중</dt>
							<dd>04-05시즌 261,172 명</dd>
						</dl>
					</article>
					<!-- //관중 통계 -->

					<article class="tbl type1 crowds_table" data-scollOn="once">
						<table>
							<caption>역대 성적 기록</caption>
							<colgroup>
								<col class="col1">
								<col class="col2">
								<col class="col3">
								<col class="col4">
							</colgroup>
							<thead class="blind">
								<tr>
									<th scope="col">시즌</th>
									<th scope="col" colspan="2">누적 관중</th>
									<th scope="col">순위</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">23-24시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="53" data-max="100" data-count="178,861"></span>
										</div>
									</td> 
									<td>178,861 명</td>
									<td>5 위</td>
								</tr> 
								<tr>
									<th scope="row">22-23시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="50" data-max="100" data-count="150,656"></span>
										</div>
									</td> 
									<td>150,656 명</td>
									<td>6 위</td>
								</tr> 
								<tr>
									<th scope="row">21-22시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="20" data-max="100" data-count="57,283"></span>
										</div>
									</td> 
									<td>57,283 명</td>
									<td>9 위</td>
								</tr> 
								<tr>
									<th scope="row">20-21시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="10" data-max="100" data-count="23,264"></span>
										</div>
									</td> 
									<td>23,264 명</td>
									<td>1 위</td>
								</tr> 
								<tr>
									<th scope="row">19-20시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="45" data-max="100" data-count="137,426"></span>
										</div>
									</td> 
									<td>137,426 명</td>
									<td>4 위</td>
								</tr> 
								<tr>
									<th scope="row">18-19시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="50" data-max="100" data-count="156,331"></span>
										</div>
									</td> 
									<td>156,331 명</td>
									<td>4 위</1td>
								</tr> 
								<tr>
									<th scope="row">17-18시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="50" data-max="100" data-count="152,085"></span>
										</div>
									</td> 
									<td>152,085 명</td>
									<td>3 위</td>
								</tr> 
								<tr>
									<th scope="row">16-17시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="50" data-max="100" data-count="156,109"></span>
										</div>
									</td> 
									<td>156,109 명</td>
									<td>10 위</td>
								</tr> 
								<tr>
									<th scope="row">15-16시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="60" data-max="100" data-count="212,010"></span>
										</div>
									</td> 
									<td>212,010 명</td>
									<td>1 위</td>
								</tr> 
								<tr>
									<th scope="row">14-15시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="55" data-max="100" data-count="197,491"></span>
										</div>
									</td> 
									<td>197,491 명</td>
									<td>9 위</td>
								</tr> 
								<tr>
									<th scope="row">13-14시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="80" data-max="100" data-count="239,766"></span>
										</div>
									</td> 
									<td>239,766 명</td>
									<td>7 위</td>
								</tr> 
								<tr>
									<th scope="row">12-13시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="55" data-max="100" data-count="196,074"></span>
										</div>
									</td> 
									<td>196,074 명</td>
									<td>10 위</td>
								</tr> 
								<tr>
									<th scope="row">11-12시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="90" data-max="100" data-count="249,229"></span>
										</div>
									</td> 
									<td>249,229 명</td>
									<td>4 위</td>
								</tr> 
								<tr>
									<th scope="row">10-11시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="75" data-max="100" data-count="228,980"></span>
										</div>
									</td> 
									<td>228,980 명</td>
									<td>3 위</td>
								</tr> 
								<tr>
									<th scope="row">09-10시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="65" data-max="100" data-count="218,954"></span>
										</div>
									</td> 
									<td>218,954 명</td>
									<td>3 위</td>
								</tr> 
								<tr>
									<th scope="row">08-09시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="80" data-max="100" data-count="230,302"></span>
										</div>
									</td> 
									<td>230,302 명</td>
									<td>3 위</td>
								</tr> 
								<tr>
									<th scope="row">07-08시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="80" data-max="100" data-count="233,093"></span>
										</div>
									</td> 
									<td>233,093 명</td>
									<td>2 위</td>
								</tr> 
								<tr>
									<th scope="row">06-07시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="60" data-max="100" data-count="200,622"></span>
										</div>
									</td> 
									<td>200,622 명</td>
									<td>10 위</td>
								</tr> 
								<tr>
									<th scope="row">05-06시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="80" data-max="100" data-count="239,517"></span>
										</div>
									</td> 
									<td>239,517 명</td>
									<td>5 위</td>
								</tr>
								<tr>
									<th scope="row">04-05시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="100" data-max="100" data-count="261,172"></span>
										</div>
									</td> 
									<td>261,172 명</td>
									<td>2 위</td>
								</tr> 
								<tr>
									<th scope="row">03-04시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="80" data-max="100" data-count="237,628"></span>
										</div>
									</td> 
									<td>237,628 명</td>
									<td>2 위</td>
								</tr> 
								<tr>
									<th scope="row">02-03시즌</th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="60" data-max="100" data-count="205,798"></span>
										</div>
									</td> 
									<td>205,798 명</td>
									<td>9 위</td>
								</tr> 
								<tr class="last">
									<th scope="row">01-02시즌 </th>
									<td class="td_chart td_line">
										<div class="el_graph type4 horiz rt">
											<span class="bar gray" data-value="70" data-max="100" data-count="223,357"></span>
										</div>
									</td> 
									<td>223,357 명</td>
									<td>3 위</td>
								</tr> 
								<tr class="total">
									<td colspan="2">총 합</td> 
									<td colspan="2">4,386,008 명</td>
								</tr> 
							</tbody>
						</table>
					</article>
				</div>
			</article>

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