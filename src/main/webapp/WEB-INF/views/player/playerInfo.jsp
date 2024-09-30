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
	<title>선수 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/player.css"> <!-- 디렉토리 player only -->
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
	function selectSeason(str){
		var season_code = $("#season_code").val();
		var player_no = $("#player_no").val();
		$.ajax({
   			type:'Get',
   			data : {"season_code" : season_code,
					"category" : str,
					"player_no" : player_no},
   			url: 'playerSeasonReacordAjax',
   			success:function(result){
   	            $('#seasonRecordArea').html(result);
   	         	swipeEvent();
   	         chartScrollMotion();
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
	}
	function selectTotal(str){
		var player_no = $("#player_no").val();
		$.ajax({
   			type:'Get',
   			data : {
					"category" : str,
					"player_no" : player_no
					},
   			url: 'playerTotalReacordAjax',
   			success:function(result){
   	            $('#seasonRecordArea').html(result);
   	         	swipeEvent();
   	         chartScrollMotion();
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
	}
	function changeSeason(str){
		var player_no = $("#player_no").val();
		var category = $('input[name="category"]:checked').val();
		 $.ajax({
   			type:'Get',
   			data : {"season_code" : str,
					"category" : category,
					"player_no" : player_no},
   			url: 'playerSeasonReacordAjax',
   			success:function(result){
   	            $('#seasonRecordArea').html(result);
   	         	swipeEvent();
   	         chartScrollMotion();
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax 
	}
	function changeYearMonth(str){
		var player_no = $("#player_no").val();
		 $.ajax({
   			type:'Get',
   			data : {"year_month" : str,
					"player_no" : player_no},
   			url: 'playerYearMonthReacordAjax',
   			success:function(result){
   	            $('#yearMonthRecordArea').html(result);
   	         	swipeEvent();
   	         chartScrollMotion();
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax 
	}
	$(document).on('click', '.tab_season', function() {
		$(this).siblings().removeClass("active"); 
		$(this).addClass("active"); 
		let tab = $(this).data('pickcol');
		var player_no = $("#player_no").val();
		$.ajax({
   			type:'Get',
   			data : {"tab" : tab,
					"player_no" : player_no},
   			url: 'playerTabReacordAjax',
   			success:function(result){
   	            $('#tabArea').html(result);
   	         	swipeEvent();
   	         	chartScrollMotion();
   	      		customSelect();
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax 
	});
	function loginForm(){
		if(confirm("로그인 후 선호 사진 설정이 가능합니다. 로그인 하시겠습니까?")){
			location.href = "/loginForm";
		}
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

			<!-- 선수 상세 상단 -->
			<section class="section player_view_top mt80-30">
				<div class="ly_inner md">
					<div class="bl_card m_full">
						<!-- player -->
						<article class="player">
							<div class="el_photo">
								<c:if test="${likePlayerMap != null }">
									<img src="/resources/common/images/upload/player/${likePlayerMap.img}"class="fav_target">
								</c:if>
								<c:if test="${likePlayerMap == null }">
									<img src="/resources/common/images/upload/player/${playerMap.pl_actioncut_1}"class="fav_target">		
								</c:if>
							</div>

							<!-- info -->
							<div class="info">
							<input type="hidden" id="player_no" value="${playerMap.pl_no}">
								<p class="el_pos type2">${playerMap.pl_pos_code_ename}<span class="num">${playerMap.pl_back}</span></p>
								<p class="el_name">
									<span class="kor">${playerMap.pl_name}</span>
									<span class="eng type2">${playerMap.pl_ename}</span>
								</p>
							</div>
							<!-- //info -->
						</article>
						<!-- //player -->
						<!-- profile -->
						<article class="profile profile_box type2">
							<div class="row">
								<dl>
									<dt>생년월일</dt>
									<dd>${playerMap.format_birthday }</dd>
								</dl>
								<dl>
									<dt>신장/체중</dt>
									<dd>${playerMap.pl_height}cm <span class="dash">/</span>${playerMap.pl_weight}kg</dd>
								</dl>
								<dl>
									<dt>발사이즈</dt>
									<dd>${playerMap.pl_foot }mm</dd>
								</dl> 
							</div>
							<div class="row">
								<dl>
									<dt>출신학교</dt>
									<dd>${playerMap.pl_school }</dd>
								</dl>
								<dl>
									<dt>프로입단</dt>
									<dd>${playerMap.pl_rank }</dd>
								</dl>
								<dl>
									<dt>SNS</dt>
									<dd>
										<a href="#" class="el_btn gap6" target="_blank" rel="noreferrer">
											인스타그램 <span class="blind">(새창열림)</span> 
											<span class="el_ico link md"></span>
										</a>
									</dd>
								</dl>
							</div>
						</article>
						<!-- //profile -->
						<!-- favorite -->
						<article class="favorite">
							<form class="favorite_form">
								<div class="item">
									<label class="frm_radio frm_radio_box">
										<input type="radio" class="fav_input" name="p_favorite" aria-label="상세사진1" data-img="/resources/common/images/upload/player/${playerMap.pl_actioncut_1}" <c:if test="${likePlayerMap.img == playerMap.pl_actioncut_1}">checked</c:if>>
										<span class="box">
											<span class="el_photo">
												<img src="/resources/common/images/upload/player/${playerMap.pl_actioncut_1}" alt="">
											</span>
										</span>
									</label>
									<c:if test="${loginUserMap == null}">
									<a href="#" class="fav_choice" onclick="loginForm()">
									</c:if>
									<c:if test="${loginUserMap != null}">
										<c:if test="${likePlayerMap.img == playerMap.pl_actioncut_1}">
											<a href="#" class="fav_choice choice_player active" data-fav="0">
										</c:if>
										<c:if test="${likePlayerMap.img != playerMap.pl_actioncut_1}">
											<a href="#" class="fav_choice choice_player" data-fav="0">
										</c:if>
									</c:if>
										<span class="el_ico">
											<svg width="24" width="24" viewBox="0 0 24 24"><use href="#icoHeart"></use></svg>
											<span class="blind">상세사진1 즐겨찾기</span>
										</span>
									</a>
								</div>

								<div class="item">
									<label class="frm_radio frm_radio_box">
										<input type="radio" class="fav_input" name="p_favorite" aria-label="상세사진2" data-img="/resources/common/images/upload/player/${playerMap.pl_actioncut_2}" <c:if test="${likePlayerMap.img == playerMap.pl_actioncut_2}">checked</c:if>>
										<span class="box">
											<span class="el_photo">
												<img src="/resources/common/images/upload/player/${playerMap.pl_actioncut_2}" alt="">
											</span>
										</span>
									</label>
									<c:if test="${loginUserMap == null}">
									<a href="#" class="fav_choice" onclick="loginForm()">
									</c:if>
									<c:if test="${loginUserMap != null}">
										<c:if test="${likePlayerMap.img == playerMap.pl_actioncut_2}">
											<a href="#" class="fav_choice choice_player active" data-fav="1">
										</c:if>
										<c:if test="${likePlayerMap.img != playerMap.pl_actioncut_2}">
											<a href="#" class="fav_choice choice_player" data-fav="1">
										</c:if>
									</c:if>
										<span class="el_ico">
											<svg width="24" width="24" viewBox="0 0 24 24"><use href="#icoHeart"></use></svg>
											<span class="blind">상세사진2 즐겨찾기</span>
										</span>
									</a>
								</div>

								<div class="item">
									<label class="frm_radio frm_radio_box">
										<input type="radio" class="fav_input" name="p_favorite" aria-label="상세사진3" data-img="/resources/common/images/upload/player/${playerMap.pl_actioncut_3}" <c:if test="${likePlayerMap.img == playerMap.pl_actioncut_3}">checked</c:if>>
										<span class="box">
											<span class="el_photo">
												<img src="/resources/common/images/upload/player/${playerMap.pl_actioncut_3}" alt="">
											</span>
										</span>
									</label>
									<c:if test="${loginUserMap == null}">
									<a href="#" class="fav_choice" onclick="loginForm()">
									</c:if>
									<c:if test="${loginUserMap != null}">
										<c:if test="${likePlayerMap.img == playerMap.pl_actioncut_3}">
											<a href="#" class="fav_choice choice_player active" data-fav="2">
										</c:if>
										<c:if test="${likePlayerMap.img != playerMap.pl_actioncut_3}">
											<a href="#" class="fav_choice choice_player" data-fav="2">
										</c:if>
									</c:if>
										<span class="el_ico">
											<svg width="24" width="24" viewBox="0 0 24 24"><use href="#icoHeart"></use></svg>
											<span class="blind">상세사진3 즐겨찾기</span>
										</span>
									</a>
								</div>
							</form>
						</article>
						<!-- //favorite -->
					</div>
				</div>

				<script>
					// 프로필 사진 변경
					$(document).on('change', '.fav_input', function() {
						const $target = $('.fav_input').filter(':checked');
						$('.fav_target').attr('src', $target.data('img'));
					});

					// 프로필 사진 즐겨찾기
					let favVal = $('.fav_choice.active').data('fav');

					$(document).on('click', '.choice_player', function() {
						const val = $(this).data('fav');

						$(this).toggleClass('active');
						var player_no = $("#player_no").val();
						if($(this).hasClass('active')){
							$.ajax({
							   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
							        url : "/updateLikePlayer",      // 컨트롤러에서 대기중인 URL 주소이다.
							        data : {
							       	 "player_no":player_no,
							       	 "img_order" : val
							        },            // Json 형식의 데이터이다.
							        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
								        if(res==1){
									        
								        }else{
								        	alertPop("변경에 실패했습니다.");
								        }
							        },
							        error: function() {
										alert("서버에 문제가 있습니다.");
									}
							   });
						}else{
							$.ajax({
							   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
							        url : "/deleteLikePlayer",      // 컨트롤러에서 대기중인 URL 주소이다.
							        data : {
							       	 "player_no":player_no
							        },            // Json 형식의 데이터이다.
							        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
								        if(res==1){
									        
								        }else{
								        	alertPop("변경에 실패했습니다.");
								        }
							        },
							        error: function() {
										alert("서버에 문제가 있습니다.");
									}
							   });
						}
						

						if (favVal !== val) {
							favVal = val;
							selectPlayer();
						}
					});

					function selectPlayer() {
						$('.fav_choice').each((_, item) => {
							const val = $(item).data('fav');

							$(item).toggleClass('active', favVal === val);
						});
					}
	
				</script>
	
				<svg class="blind">
					<symbol id="icoHeart">
						<path d="M17.197 3C14.953 3 12.937 4.556 12 6.722 11.062 4.556 9.047 3 6.803 3 3.598 3 1 5.994 1 9.688c0 6.805 9.815 11.555 11 12.103 1.185-.548 11-5.298 11-12.103C23 5.994 20.402 3 17.197 3Z"/>
					</symbol>
				</svg>
			</section>
			<!-- //선수 상세 상단  -->

			<!-- 최근 소식 -->
			<section class="section mt80">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">최근 소식</h4>
					</div>

					<div class="player_news_wrap">
						<div class="slider group player_news_slider p_overflow_hidden" data-view="[3,3]" data-space="[22,16]" data-delay="400">
							<div class="swiper-wrapper">
							<c:forEach items="${playerMediaList}" var="playerMediaList">
							<c:choose>
			                    <c:when test="${playerMediaList.part == 'movie' }">
		                    	<!-- slide -->
								<div class="swiper-slide">
									<c:if test="${playerMediaList.etc1 == 'H' }">
									<a href="movieListHDetail?num=${playerMediaList.num}" class="nav_link thumb_hover type2">
									</c:if>
									<c:if test="${playerMediaList.etc1 == 'E' }">
									<a href="movieListEDetail?num=${playerMediaList.num}" class="nav_link thumb_hover type2">
									</c:if>
										<c:choose>
						                	<c:when test="${playerMediaList.wtype =='U'}">
						                		<figure class="el_thumb rds el_img media youtube w34">
						                	</c:when>
						                	<c:when test="${playerMediaList.wtype =='S'}">
						                		<figure class="el_thumb rds el_img media shorts w34">
						                	</c:when>
						                	<c:otherwise>
						                		<figure class="el_thumb rds el_img media w34">
						                	</c:otherwise>
				                		</c:choose>
											<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
												<img src="/resources/common/images/upload/movie/${playerMediaList.img1 }" alt="" >
											</c:if>
											<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
												<span class="no_img md"></span><!-- 대체이미지 -->
											</c:if>
										</figure>
										<div class="overlay">
											<div class="cont">
												<p class="tit txt_line2">${playerMediaList.subject }</p>
											</div>
										</div>  
									</a>
								</div>
								<!-- //slide -->
			                    </c:when>
			                    <c:otherwise>
			                    	<div class="swiper-slide">
									<a href="${playerMediaList.linkurl}" target="_blank" rel="noreferrer" class="nav_link thumb_hover type2">
										<figure class="el_thumb rds el_img media outlink">
											<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
												<img src="/resources/common/images/upload/news/${playerMediaList.img1 }" alt="" >
											</c:if>
											<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
												<span class="no_img md"></span><!-- 대체이미지 -->
											</c:if>
										</figure>
										<div class="overlay">
											<div class="cont">
												<p class="tit txt_line2">${playerMediaList.subject }</p>
											</div>
										</div> 
									</a>
								</div>
			                    </c:otherwise>
			                </c:choose>
							</c:forEach>
							<c:if test="${empty playerMediaList}">
								<div class="no_post hmd">해당 선수의 기록이 없습니다.</div>
							</c:if>
							</div>
							<div class="swiper-button-next type1 p_hide"></div>
							<div class="swiper-button-prev type1 p_hide"></div>
						</div>
					</div>

				</div>
			</section>
			<!-- //최근 소식 -->

			<!-- 시즌 팀 내 순위 -->
			<section class="section mt50">
				<div class="ly_inner md grid_header_type1">

					<div class="page_header g_header">
						<h4 class="el_heading lv1">시즌 팀 내 순위</h4>
					</div>

					<div class="g_desc btns"> 
						<a href="playerRank" class="el_btn goto dark">선수 순위 더보기</a>
					</div>

					<div class="bl_card player_view_ranking g_content">
						<div class="info">
							<p class="el_role">No.${playerMap.pl_back} ${playerMap.pl_pos_code_ename}</p>
							<p class="el_name">
								<span class="kor">${playerMap.pl_name}</span>
							</p>
						</div>
						<div class="photo">
							<div class="el_photo">
								<img src="/resources/common/images/upload/player/${playerMap.pl_webmain}" alt="유병훈 선수 사진">
							</div>
						</div>
						<c:if test="${playerRankMap != null }">
						<dl class="col">
							<dt class="tit">득점</dt>
							<dd class="rank">${playerRankMap.pointRk }위</dd>
							<dd class="score">${playerRankMap.score }점</dd>
						</dl>
						<dl class="col">
							<dt class="tit">리바운드</dt>
							<dd class="rank">${playerRankMap.reboundRk }위</dd>
							<dd class="score">${playerRankMap.r_tot }개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">어시스트</dt>
							<dd class="rank">${playerRankMap.assistRk }위</dd>
							<dd class="score">${playerRankMap.a_s }개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">스틸</dt>
							<dd class="rank">${playerRankMap.stealRk }위</dd>
							<dd class="score">${playerRankMap.s_t }개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">블록</dt>
							<dd class="rank">${playerRankMap.blockRk }위</dd>
							<dd class="score">${playerRankMap.b_s }개</dd>
						</dl>
						</c:if>
						<c:if test="${playerRankMap == null }">
						<dl class="col">
							<dt class="tit">득점</dt>
							<dd class="rank">-위</dd>
							<dd class="score">-점</dd>
						</dl>
						<dl class="col">
							<dt class="tit">리바운드</dt>
							<dd class="rank">-위</dd>
							<dd class="score">-개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">어시스트</dt>
							<dd class="rank">-위</dd>
							<dd class="score">-개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">스틸</dt>
							<dd class="rank">-위</dd>
							<dd class="score">-개</dd>
						</dl>
						<dl class="col">
							<dt class="tit">블록</dt>
							<dd class="rank">-위</dd>
							<dd class="score">-개</dd>
						</dl>
						</c:if>
					</div>

				</div>
			</section>
			<!-- //시즌 팀 내 순위 -->

			<!-- 경기 기록 -->
			<section class="section mt50 player_view_content">
				<span class="anchor type2" id="PLAERRECORD"></span>

				<div class="ly_inner md">
					<h4 class="blind">경기 기록</h4>

					<nav class="tab_list type1 line">
						<a href="#" class="tab_link active tab_season" data-pickcol="season">출전 시즌 기록</a>
						<a href="#" class="tab_link tab_season" data-pickcol="total">통산 기록</a>
					</nav>

					<!-- 시즌 기록 -->
					<article class="grid_header_type1 mt30-15" id="tabArea">
					<c:if test="${not empty selectSeason}">
						<div class="page_header g_header">
							<form action="" class="forms">
								<div class="frm_group gap12b">
									<select class="frm_select max240 m155" aria-label="시즌 선택" id="season_code" onchange="changeSeason(this.value)">
										<c:forEach items="${selectSeason}" var="selectSeason" varStatus="status">
											<option value="${selectSeason.seasonCode}" <c:if test="${selectSeason.seasonCode eq season_code}">selected</c:if>>${selectSeason.seasonCodeNm}</option>
										</c:forEach>
									</select>

									<label class="frm_radio type1">
										<input type="radio" name="category" value="avg" checked onchange="selectSeason(this.value)">
										<span>평균</span>
									</label>
									<label class="frm_radio type1">
										<input type="radio" name="category" value="total" onchange="selectSeason(this.value)">
										<span>누적</span>
									</label>
								</div>
							</form>
						</div>

						<div class="g_desc v_ct btns"> 
							<a href="playerRecord?player_no=${playerMap.pl_no}" class="el_btn goto dark">선수 기록 더보기</a>
						</div>

						<div class="g_content player_view_record mt14" id="seasonRecordArea">
							<div class="tables tbl type4">
								<table summary="득점, 리바운드, 어시스트, 스틸, 블록 정보 제공">
									<caption>시즌별 기록</caption>
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">득점</th>
											<td>${playerRecordMap.score }</td>
										</tr>
										<tr>
											<th scope="row">리바운드</th>
											<td>${playerRecordMap.r_tot }</td>
										</tr>
										<tr>
											<th scope="row">어시스트</th>
											<td>${playerRecordMap.a_s }</td>
										</tr>
										<tr>
											<th scope="row">스틸</th>
											<td>${playerRecordMap.s_t }</td>
										</tr>
										<tr>
											<th scope="row">블록</th>
											<td>${playerRecordMap.b_s }</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tables tbl type4">
								<table summary="득점, 리바운드, 어시스트, 스틸, 블록 정보 제공">
									<caption>시즌별 기록</caption>
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">2점슛</th>
											<td>${playerRecordMap.fg }</td>
										</tr>
										<tr>
											<th scope="row">3점슛</th>
											<td>${playerRecordMap.threep }</td>
										</tr>
										<tr>
											<th scope="row">자유투</th>
											<td>${playerRecordMap.ft }</td>
										</tr>
										<tr>
											<th scope="row">자유투 성공률</th>
											<c:if test="${playerRecordMap.ftp != null }">
											<td>${playerRecordMap.ftp }</td>
											</c:if>
											<c:if test="${playerRecordMap.ftp == null }">
											<td>-</td>
											</c:if>
										</tr>
										<tr>
											<th scope="row">필드골 성공률</th>
											<td>${playerRecordMap.ygp}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<article class="chart">
								<div class="el_cart_radar chart-radar" data-scollOn="once" data-chart="[${playerRecordMap.fgp }, ${playerRecordMap.threepp }, ${playerRecordMap.ygp}, ${playerRecordMap.ftp }]"></div> <!-- 데이터 반시계 방향 -->
							</article>
						</div>
						<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->
						</c:if>
						<c:if test="${empty selectSeason}">
							<div class="mt30-15 no_data white hmd no_data">해당 선수의 기록이 없습니다.</div>
						</c:if>
					</article>
					<!-- //시즌 기록 -->

					<!-- 최근 경기 기록 -->
					<article class="grid_header_type1 mt30b">
						<div class="page_header g_header">
							<h5 class="el_heading lv2">최근 경기 기록</h5> 
							<form action="" class="forms">
								<div class="frm_group">
									<!-- (게시물 없을 경우) -->
									<c:if test="${not empty selectYearMonth}">
									<select class="frm_select max240 m155" aria-label="월 선택" onchange="changeYearMonth(this.value)">
										<c:forEach items="${selectYearMonth}" var="selectYearMonth" varStatus="status">
											<option value="${selectYearMonth.dateCode}">${selectYearMonth.dateCodeNm}</option>
										</c:forEach>
									</select>
									</c:if>
								</div>
							</form>
						</div>

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type2 tblSwipe g_content" id="yearMonthRecordArea">
							<div class="fixed">
								<table summary="월별 정보 제공">
									<caption>최근 경기 기록 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기일자</th>
										</tr> 
									</thead>
									<tbody>
									<c:forEach items="${playerYearMonthList}" var="playerYearMonthList" varStatus="status">
										<tr>
											<td>
												<a href="scheduleResult?season_code=${playerYearMonthList.season_code }&game_code=${playerYearMonthList.game_code}&game_no=${playerYearMonthList.game_no}" class="el_btn goto">${playerYearMonthList.game_date}</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="min, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버, 파울 정보 제공공" style="--pmin: 1100px; --mmin: 970px;">
										<caption>최근 경기 기록 스크롤영역</caption>
										<colgroup>
											<col>
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
										</colgroup>
										<thead>
											<tr>
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
										<c:forEach items="${playerYearMonthList}" var="playerYearMonthList" varStatus="status">
											<tr>
												<td>${playerYearMonthList.play_min }’${playerYearMonthList.play_sec }’’</td>
												<td>${playerYearMonthList.score }</td>
												<td>${playerYearMonthList.fg }</td>
												<td>${playerYearMonthList.threep }</td>
												<td>${playerYearMonthList.ft }</td>
												<td>${playerYearMonthList.r_tot }</td>
												<td>${playerYearMonthList.a_s }</td>
												<td>${playerYearMonthList.s_t }</td>
												<td>${playerYearMonthList.b_s }</td>
												<td>${playerYearMonthList.t_o }</td>
												<td>${playerYearMonthList.foul_tot }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- (게시물 없을 경우) -->
							<c:if test="${empty playerYearMonthList}">
							<div class="no_post">첫 경기 이후 데이터가 출력됩니다.</div>
							</c:if>
						</div>
						<!-- //비교 테이블 -->
					</article>
					<!-- //최근 경기 기록 -->


				</div>
			</section>
			<!-- //경기 기록 -->

			<!-- 선수 리스트 (본 페이지의 해당 선수를 제외한 나머지 전체 선수 리스트 출력) -->
			<section class="season mt40b">
				<div class="ly_inner md">
					<div class="player_view_nav">
						<div class="slider group player_nav_slider" data-view="[4,4]" data-space="[20,14]" data-delay="400">
							<div class="swiper-wrapper">
								<c:forEach items="${footPlayerList}" var="footPlayerList">
								<!-- slide -->
								<div class="swiper-slide">
									<a href="playerInfo?pl_no=${footPlayerList.pl_no}" class="nav_link">
										<div class="el_photo">
											<img src="/resources/common/images/upload/player/${footPlayerList.pl_webmain}">
										</div> 
										<span class="el_pos">${footPlayerList.pl_pos_code_ename}</span>
										<p class="info">
											<span class="num">${footPlayerList.pl_back}</span>
											<span class="name">${footPlayerList.pl_name}</span>
										</p>
									</a>
								</div>
								<!-- //slide -->
								</c:forEach>
							</div>
							<div class="swiper-button-next type1 p_hide"></div>
							<div class="swiper-button-prev type1 p_hide"></div>
						</div>
					</div>
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