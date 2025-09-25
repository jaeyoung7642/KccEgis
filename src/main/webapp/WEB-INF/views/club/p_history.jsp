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
						<a href="chistory" class="swiper-slide snb_link"><span>구단 히스토리</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="phistory" class="swiper-slide snb_link current"><span>선수단 히스토리</span></a>
						<a href="seasonReview" class="swiper-slide snb_link"><span>시즌 리뷰</span></a> 
					</div>
				</nav>
			</div>

			<!-- 역대 감독-->
			<section class="section mt70">
				<div class="ly_inner md">
					<div class="page_header line">
						<h4 class="el_heading lv1">역대 감독</h4> 
					</div>

					<div class="load_menu_slider type2 p_histroy_list coach">
						<div class="swiper-wrapper">
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_6th.webp" alt="이상민 감독 사진">
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 6대</span>
											<span>이상민</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="7">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_5th.webp" alt="전창진 감독 사진">
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 5대</span>
											<span>전창진</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="5">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_4th.webp" alt="스테이시 오그먼 감독 사진">
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 4대</span>
											<span>스테이시 오그먼</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="4">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_3rd.webp" alt="추승균 감독 사진" >
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 3대</span>
											<span>추승균</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="3">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_2nd.webp" alt="허 재 감독 사진" >
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 2대</span>
											<span>허 재</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="2">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<div class="img_area">
										<div class="el_img">
											<img src="/resources/common/images/img/p_history/headcoach_1st.webp" alt="신선우 감독 사진" >
										</div>
									</div>
									<div class="info_area">
										<p class="info">
											<span class="count">제 1대</span>
											<span>신선우</span>
											<span class="role">감독</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal coachPopup" data-target="#coachPopup" data-id="1">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- slide -->
						</div>
						<div class="swiper-button-next type1 p_show"></div>
						<div class="swiper-button-prev type1 p_show"></div> 
					</div>
				</div>

				<script>
					function updateCoach({ name, career }) {
						const $coachCareer = $('#coachCareer tbody');

						$("#coachName").html(name+ ' <em>감독</em>');

						const careerData = [
							["재임기간", career.term],
							["경기 수", career.matches],
							["통산성적", career.record]
						];

						$coachCareer.empty();

						careerData.forEach(([title, value]) => {
							const $row = $('<tr><th scope="row">'+title+'</th><td>'+value+'</td></tr>');
							$coachCareer.append($row);
						});
					}

					async function coachPopup(dataId) {
						const dataArray = await fetchData('/resources/common/assets/data/headcoach.json'); // 이 파일 수정
						const data = dataArray.find(el => el.id === String(dataId));

						if (data) {
							updateCoach(data);
						}
					};
					
					$(function() {
						const $openBtn = $('.coachPopup');

						$openBtn.on('click', function() {
							const dataId = $(this).data('id');
							coachPopup(dataId);
						});
					});
				</script>

			</section>
			<!-- 역대 감독 -->


			<!-- 역대 주장 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header line">
						<h4 class="el_heading lv1">역대 주장</h4> 
					</div>
				</div>

				<div class="ly_inner md slide_clamp mask_md">
					<div class="slider type3 p_histroy_list captain">
						<div class="swiper-wrapper">
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_10th.webp" alt="최준용 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">10대</span>
											<span class="count">FORWARD</span>
											<span>최준용</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="10">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_9th.webp" alt="정찬영 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">9대</span>
											<span class="count">GUARD</span>
											<span>정창영</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="9">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_8th.webp" alt="이정현 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">8대</span>
											<span class="count">GUARD</span>
											<span>이정현</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="8">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_7th.webp" alt="하승진 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">7대</span>
											<span class="count">CENTER</span>
											<span>하승진</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="7">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_6th.webp" alt="신명호 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">6대</span>
											<span class="count">GUARD</span>
											<span>신명호</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="6">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_5th.webp" alt="임재현 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">5대</span>
											<span class="count">GUARD</span>
											<span>임재현</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="5">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_4th.webp" alt="추승균 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">4대</span>
											<span class="count">GUARD</span>
											<span>추승균</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="4">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_3rd.webp" alt="이상민 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">3대</span>
											<span class="count">GUARD</span>
											<span>이상민</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="3">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_2nd.webp" alt="조성원 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">2대</span>
											<span class="count">GUARD</span>
											<span>조성원</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="2">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
							<!-- slide -->
							<div class="swiper-slide">
								<div class="box">
									<figure class="el_thumb rds3 el_img">
										<img data-src="/resources/common/images/img/p_history/captain_1st.webp" alt="정재근 선수 사진" class="lazy-image">
									</figure>
									<div class="info_area">
										<p class="info">
											<span class="count">1대</span>
											<span class="count">FORWARD</span>
											<span>정재근</span>
										</p>
										<button type="button" class="el_btn sm2 blue openModal captainPopup" data-target="#captainPopup" data-id="1">통산 성적 보기</button>
									</div>
								</div>
							</div>
							<!-- //slide -->
						</div>
						<div class="swiper-button-next type2 m_type1"></div>
						<div class="swiper-button-prev type2 m_type1"></div>
					</div>
				</div>
			</section>

			<!-- 역대 주장 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header line">
						<h4 class="el_heading lv1">영구 결번</h4> 
					</div>

					<div class="retired_list">
						<!-- item -->
						<div class="item item1">
							<div class="row row1">
								<div class="photo">
									<div class="el_photo">
										<img src="/resources/common/images/img/p_history/retired_number_4.webp" alt="추승균 선수 사진">
									</div>
								</div>
								<div class="info">
									<span class="pos">FORWARD</span>
									<span class="num">4</span>
									<span class="name">추승균</span>
								</div>
							</div>
							<div class="row row2">
								<div class="tbl type2">
									<table>
										<caption>추승균 선수 경기 기록</caption>
										<colgroup>
											<col width="18.84%">
											<col width="25.05%">
											<col width="19.272%">
											<col width="18.84%">
											<col> 
										</colgroup>
										<thead>
											<tr>
												<th scope="col">경기</th>
												<th scope="col">출전시간</th>
												<th scope="col">득점</th>
												<th scope="col">2점</th>
												<th scope="col">3점</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>738</td>
												<td>24,073’49’’</td>
												<td>10,019</td>
												<td>3,021</td>
												<td>782</td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<th scope="col">자유투</th>
												<th scope="col">리바운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1,631</td>
												<td>1,715</td>
												<td>2,066</td>
												<td>552</td>
												<td>85</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //item -->
						<!-- item -->
						<div class="item item2">
							<div class="row row1">
								<div class="photo">
									<div class="el_photo">
										<img src="/resources/common/images/img/p_history/retired_number_11.webp" alt="이상민 선수 사진">
									</div>
								</div>
								<div class="info">
									<span class="pos">GUARD</span>
									<span class="num">11</span>
									<span class="name">이상민</span>
								</div>
							</div>
							<div class="row row2">
								<div class="tbl type2">
									<table>
										<caption>이상민 선수 경기 기록</caption>
										<colgroup>
											<col width="18.84%">
											<col width="25.05%">
											<col width="19.272%">
											<col width="18.84%">
											<col> 
										</colgroup>
										<thead>
											<tr>
												<th scope="col">경기</th>
												<th scope="col">출전시간</th>
												<th scope="col">득점</th>
												<th scope="col">2점</th>
												<th scope="col">3점</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>53</td>
												<td>15,891’1’’</td>
												<td>5,675</td>
												<td>1,201</td>
												<td>766</td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<th scope="col">자유투</th>
												<th scope="col">리바운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>975</td>
												<td>1,952</td>
												<td>3,583</td>
												<td>881</td>
												<td>180</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //item -->
					</div>
				</div>

				<script>
					function updateCaptain({ name, pos, career, record }) {
						const $captainCareer = $('#captainCareer');
						const $captainRecord = $('#captainRecord');

						$("#captainName").html(name+ ' <em>'+pos+'</em>');

						$captainCareer.empty();

						career.forEach(val => {
							const $li = $('<li>'+val+'</li>');
							$captainCareer.append($li);
						});

						$captainRecord.find('thead, tbody').empty();

						record.forEach(obj => {
							const $thead = $('<thead><tr></tr></thead>');
							const $tbody = $('<tbody><tr></tr></tbody>');
						
							Object.entries(obj).forEach(([key, value]) => {
									const $th = $('<th scope="col">'+key+'</th>');
									const $td = $('<td>'+value+'</td>');

									$thead.find('tr').append($th);
									$tbody.find('tr').append($td);
							});

							$captainRecord.append($thead).append($tbody);
						});
					}

					async function captainPopup(dataId) {
						const dataArray = await fetchData('/resources/common/assets/data/captain.json'); // 이 파일 수정
						const data = dataArray.find(el => el.id === String(dataId));
						
						if (data) {
							updateCaptain(data);
						}
					};
					
					$(function() {
						const $openBtn = $('.captainPopup');

						$openBtn.on('click', function() {
							const dataId = $(this).data('id');
							captainPopup(dataId);
						});
					});
				</script>
			</section>


			<!-- 역대 감독 통산 성적 팝업 -->
			<div id="coachPopup" tabindex="-1" class="modal careerPopup" data-focus="modal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<div class="header">
								<h4 class="heading" id="coachName"><!-- 감독 이름 --></h4>
							</div>

							<div class="career_tbl" id="coachCareer">
								<table>
									<caption>감독 정보</caption>
									<colgroup>
										<col width="81">
										<col>
									</colgroup>
									<tbody>
										<!-- 감독 정보 영역 -->
									</tbody>
								</table>
							</div>

						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="modal"></button>
					</div>
				</div>
			</div>
			<!-- 역대 감독 통산 성적 팝업 -->

			<!--  역대 주장 통산 성적 팝업 -->
			<div id="captainPopup" tabindex="-1" class="modal careerPopup" data-focus="modal2">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<div class="header">
								<h4 class="heading" id="captainName"><!-- 주장 이름 --></h4>
							</div>

							<div class="career_list"> 
								<div class="row">
									<h5 class="tit">경력사항</h5>
									<ul class="cont" id="captainCareer" data-lenis-prevent>
										<!-- 경력사항 영역 -->
									</ul>
								</div>
								<div class="row">
									<h5 class="tit">통산성적</h5>
									<div class="tbl type2">
										<table id="captainRecord">
											<caption>통산성적 기록</caption>
											<colgroup>
												<col width="33.333%">
												<col width="33.333%">
												<col>
											</colgroup>
										</table>
									</div>
								</div>
							</div>

						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="modal2"></button>
					</div>
				</div>
			</div>
			<!-- 역대 주장 통산 성적 팝업 -->



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