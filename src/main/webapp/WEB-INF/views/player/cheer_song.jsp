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
	<title>KCC EGIS</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />

	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/player.css"> 
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
	function loginForm(){
		if(confirm("로그인 후 다운로드 가능합니다. 로그인 하시겠습니까?")){
			location.href = "/loginForm";
		}
	}
	</script>
</head>
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
						<li>응원가</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">PLAYER</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="coachList" class="swiper-slide snb_link"><span>코칭스탭</span></a>  
								<a href="playerList" class="swiper-slide snb_link"><span>선수</span></a>
								<!-- <a href="cheer" class="swiper-slide snb_link"><span>응원단</span></a>  -->
								<a href="#" class="swiper-slide snb_link" onclick="alertPop('시즌 업데이트 준비중입니다.')"><span>응원단</span></a>
								<a href="cheer_song" class="swiper-slide snb_link current"><span>응원가</span></a> <!-- 해당페이지에 current 추가 -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${loginUserMap == null}">
			<!-- 구단 응원가 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header type2">
						<h4 class="el_heading type2">
							<span class="sub">KCC이지스</span>
							<span class="tit">구단 응원가</span>
						</h4>
					</div>

					<ul class="cheer_song_list type1 bl_grid_list cols5">
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="우리 하나되어"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="어기여차"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="영원한 친구"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="지야의 함성"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="샹젤리제"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="아파트"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="푸른전사"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="예술이야"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="부산갈매기"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="사랑가"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="별이 되어"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="We are the one"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="box" onclick="loginForm()">
								<span class="cicleGuide" data-text="오리 날다"></span>
							</a>
						</li>
					</ul>

					<!-- 다운로드 이미지 (공통) -->
					<svg width="232" height="232" viewBox="0 0 232 232" class="blind">
						<path fill="none" stroke="none" id="circlePath" d="M 34 116 A 82 82 0 0 1 198 116" />
					</svg>
				</div>
			</section>
			<!-- //구단 응원가-->

			<!-- 팀 응원가 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header type2">
						<h4 class="el_heading type2">
							<span class="sub">상황별</span>
							<span class="tit">팀 응원가</span>
						</h4>
					</div>

					<ul class="cheer_song_list type2 bl_grid_list cols5-2">
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 01</span>
									<span class="sub">Everytime</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 02</span>
									<span class="sub">가자구</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 03</span>
									<span class="sub">HandClap</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 04</span>
									<span class="sub">Celebrate</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 05</span>
									<span class="sub">어이 연호</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 06</span>
									<span class="sub">Like I Do</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 07</span>
									<span class="sub">공격리듬1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 08</span>
									<span class="sub">공격리듬2</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 09</span>
									<span class="sub">달려 베이비</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 10</span>
									<span class="sub">속공붐뱅</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 11</span>
									<span class="sub">아줌마</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 12</span>
									<span class="sub">얼굴 찌푸리지<br> 말아요</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 13</span>
									<span class="sub">어제밤 이야기</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 14</span>
									<span class="sub">부산 바캉스</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 15</span>
									<span class="sub">공격리듬3</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 16</span>
									<span class="sub">메인리듬<br> 부산KCC</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 17</span>
									<span class="sub">신드롬</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 18</span>
									<span class="sub">속공클럽1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 19</span>
									<span class="sub">자유투성공</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
					</ul>

					<ul class="cheer_song_list type2 bl_grid_list cols5-2">
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<p class="title">
									<span class="tit">KCC 시그널<br> ver.1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<p class="title">
									<span class="tit">KCC 시그널<br> ver.2</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<p class="title">
									<span class="tit">KCC 시그널  ver.3</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="#" class="bl_card box" onclick="loginForm()">
								<p class="title">
									<span class="tit">KCC 렛츠고</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
					</ul>
				</div>
			</section>
			<!-- //팀 응원가 -->


			<!-- 선수 응원가 -->
			<section class="section mt100 ">
				<div class="ly_inner md">
					<div class="page_header ">
						<h4 class="el_heading type2">
							<span class="tit">선수 응원가</span>
						</h4>
					</div>

					<ul class="cheer_song_list type3 bl_grid_list cols4">
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.1</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_01.png" alt="이호현 선수 사진">
								</div>
								<div class="info">
									<p class="name">이호현</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.2</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_02.png" alt="최준용 선수 사진">
								</div>
								<div class="info">
									<p class="name">최준용</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.3</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_03.png" alt="허웅 선수 사진">
								</div>
								<div class="info">
									<p class="name">허웅</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.5</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_04.png" alt="김동현 선수 사진">
								</div>
								<div class="info">
									<p class="name">김동현</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.6</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_05.png" alt="송동훈 선수 사진">
								</div>
								<div class="info">
									<p class="name">송동훈</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.7</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_06.png" alt="정창영 선수 사진">
								</div>
								<div class="info">
									<p class="name">정창영</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.9</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_07.png" alt="전태영 선수 사진">
								</div>
								<div class="info">
									<p class="name">전태영</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.10</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_08.png" alt="이주영 선수 사진">
								</div>
								<div class="info">
									<p class="name">이주영</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.17</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_09.png" alt="전준범 선수 사진">
								</div>
								<div class="info">
									<p class="name">전준범</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.19</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_10.png" alt="이근휘 선수 사진">
								</div>
								<div class="info">
									<p class="name">이근휘</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.21</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_11.png" alt="여준형 선수 사진">
								</div>
								<div class="info">
									<p class="name">여준형</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.23</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_12.png" alt="정배권 선수 사진">
								</div>
								<div class="info">
									<p class="name">정배권</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.25</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_13.png" alt="에피스톨라 선수 사진">
								</div>
								<div class="info">
									<p class="name">에피스톨라</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.33</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_14.png" alt="이승현 선수 사진">
								</div>
								<div class="info">
									<p class="name">이승현</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.55</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_15_1.png" alt="송교창 선수 사진">
								</div>
								<div class="info">
									<p class="name">송교창</p>
									<div class="btn_area">
										<a href="#" class="el_btn" onclick="loginForm()">
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>

				</div>
			</section>
			<!-- //선수 응원가 -->
			</c:if>
			<c:if test="${loginUserMap != null}">
			<!-- 구단 응원가 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header type2">
						<h4 class="el_heading type2">
							<span class="sub">KCC이지스</span>
							<span class="tit">구단 응원가</span>
						</h4>
					</div>

					<ul class="cheer_song_list type1 bl_grid_list cols5">
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_1.wav" class="box" download>
								<span class="cicleGuide" data-text="우리 하나되어"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_2.mp3" class="box" download>
								<span class="cicleGuide" data-text="어기여차"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_3.mp3" class="box" download>
								<span class="cicleGuide" data-text="영원한 친구"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_4.mp3" class="box" download>
								<span class="cicleGuide" data-text="지야의 함성"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_5.mp3" class="box" download>
								<span class="cicleGuide" data-text="샹젤리제"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_13.mp3" class="box" download>
								<span class="cicleGuide" data-text="아파트"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_6.mp3" class="box" download>
								<span class="cicleGuide" data-text="푸른전사"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_7.mp3" class="box" download>
								<span class="cicleGuide" data-text="예술이야"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_12.wav" class="box" download>
								<span class="cicleGuide" data-text="부산갈매기"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_8.mp3" class="box" download>
								<span class="cicleGuide" data-text="사랑가"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_9.wav" class="box" download>
								<span class="cicleGuide" data-text="별이 되어"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_10.mp3" class="box" download>
								<span class="cicleGuide" data-text="We are the one"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2324_cheer_11.mp3" class="box" download>
								<span class="cicleGuide" data-text="오리 날다"></span>
							</a>
						</li>
					</ul>

					<!-- 다운로드 이미지 (공통) -->
					<svg width="232" height="232" viewBox="0 0 232 232" class="blind">
						<path fill="none" stroke="none" id="circlePath" d="M 34 116 A 82 82 0 0 1 198 116" />
					</svg>
				</div>
			</section>
			<!-- //구단 응원가-->

			<!-- 팀 응원가 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header type2">
						<h4 class="el_heading type2">
							<span class="sub">상황별</span>
							<span class="tit">팀 응원가</span>
						</h4>
					</div>

					<ul class="cheer_song_list type2 bl_grid_list cols5-2">
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a01.WAV" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 01</span>
									<span class="sub">Everytime</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a02.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 02</span>
									<span class="sub">가자구</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a03.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 03</span>
									<span class="sub">HandClap</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a04.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 04</span>
									<span class="sub">Celebrate</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a05.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 05</span>
									<span class="sub">어이 연호</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a06.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 06</span>
									<span class="sub">Like I Do</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a07.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 07</span>
									<span class="sub">공격리듬1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a08.WAV" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 08</span>
									<span class="sub">공격리듬2</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a09.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 09</span>
									<span class="sub">달려 베이비</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a10.WAV" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 10</span>
									<span class="sub">속공붐뱅</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a11.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 11</span>
									<span class="sub">아줌마</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a12.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 12</span>
									<span class="sub">얼굴 찌푸리지<br> 말아요</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a13.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 13</span>
									<span class="sub">어제밤 이야기</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a14.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 14</span>
									<span class="sub">부산 바캉스</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a15.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 15</span>
									<span class="sub">공격리듬3</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a16.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 16</span>
									<span class="sub">메인리듬<br> 부산KCC</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a17.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 17</span>
									<span class="sub">신드롬</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a18.WAV" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 18</span>
									<span class="sub">속공클럽1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_a19.wav" class="bl_card box" download>
								<span class="icon icon1 el_ico"></span>
								<p class="title">
									<span class="tit">공격음악 19</span>
									<span class="sub">자유투성공</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
					</ul>

					<ul class="cheer_song_list type2 bl_grid_list cols5-2">
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_signal_01.wav" class="bl_card box" download>
								<p class="title">
									<span class="tit">KCC 시그널<br> ver.1</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_signal_02.wav" class="bl_card box" download>
								<p class="title">
									<span class="tit">KCC 시그널<br> ver.2</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_signal_03.wav" class="bl_card box" download>
								<p class="title">
									<span class="tit">KCC 시그널  ver.3</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
						<li class="item">
							<a href="/resources/common/download/cheer_song/2023_signal_04.wav" class="bl_card box" download>
								<p class="title">
									<span class="tit">KCC 렛츠고</span>
								</p>
								<span class="icon icon2 el_ico donwload"></span>
							</a>
						</li>
					</ul>
				</div>
			</section>
			<!-- //팀 응원가 -->


			<!-- 선수 응원가 -->
			<section class="section mt100 ">
				<div class="ly_inner md">
					<div class="page_header ">
						<h4 class="el_heading type2">
							<span class="tit">선수 응원가</span>
						</h4>
					</div>

			<ul class="cheer_song_list type3 bl_grid_list cols4">
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.1</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_01.png" alt="이호현 선수 사진">
								</div>
								<div class="info">
									<p class="name">이호현</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song01.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.2</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_02.png" alt="최준용 선수 사진">
								</div>
								<div class="info">
									<p class="name">최준용</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song02.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
										<a href="/resources/common/download/cheer_song/theme2324_song02_1.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.3</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_03.png" alt="허웅 선수 사진">
								</div>
								<div class="info">
									<p class="name">허웅</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song03_1.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
										<a href="/resources/common/download/cheer_song/theme2324_song03_2.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.5</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_04.png" alt="김동현 선수 사진">
								</div>
								<div class="info">
									<p class="name">김동현</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song05.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.6</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_05.png" alt="송동훈 선수 사진">
								</div>
								<div class="info">
									<p class="name">송동훈</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song06.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.7</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_06.png" alt="정창영 선수 사진">
								</div>
								<div class="info">
									<p class="name">정창영</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song07.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.9</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_07.png" alt="전태영 선수 사진">
								</div>
								<div class="info">
									<p class="name">전태영</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song09.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.10</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_08.png" alt="이주영 선수 사진">
								</div>
								<div class="info">
									<p class="name">이주영</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song10.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.17</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_09.png" alt="전준범 선수 사진">
								</div>
								<div class="info">
									<p class="name">전준범</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song17.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.19</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_10.png" alt="이근휘 선수 사진">
								</div>
								<div class="info">
									<p class="name">이근휘</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song19.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.21</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_11.png" alt="여준형 선수 사진">
								</div>
								<div class="info">
									<p class="name">여준형</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song21.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.23</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_12.png" alt="정배권 선수 사진">
								</div>
								<div class="info">
									<p class="name">정배권</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song23.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.25</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_13.png" alt="에피스톨라 선수 사진">
								</div>
								<div class="info">
									<p class="name">에피스톨라</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song25.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.33</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_14.png" alt="이승현 선수 사진">
								</div>
								<div class="info">
									<p class="name">이승현</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song33.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="item">
							<div class="bl_card box">
								<span class="num">No.55</span>
								<div class="photo el_img">
									<img src="/resources/common/images/img/cheer/player_song_15_1.png" alt="송교창 선수 사진">
								</div>
								<div class="info">
									<p class="name">송교창</p>
									<div class="btn_area">
										<a href="/resources/common/download/cheer_song/theme2324_song55.wav" class="el_btn" download>
											<span class="el_ico donwload w"></span>
											<span class="blind">(다운로드)</span>
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>

				</div>
			</section>
			<!-- //선수 응원가 -->
			</c:if>
			<script>
					$(function() {
						const $cicleGuide = $('.cicleGuide');

						$cicleGuide.each((_, item) => {
							const svgText = $(item).data('text');

							const $svg = $('<svg width="232" height="232" viewBox="0 0 232 232" class="guide">'
									+'<text x="50%" y="50%">'
										+'<textPath href="#circlePath" startOffset="4.5%">'
											+svgText
										+'</textPath>'
									+'</text>'
								+'</svg>');

							$(item).replaceWith($svg);
						});
						
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
</body>
</html>