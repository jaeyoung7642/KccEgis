<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/member.css"> <!-- 디렉토리  member only -->
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
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
        	alertPop(msg);
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
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<div class="mypage_header">
						<div class="member">
							<span class="el_ico"><img src="/resources/common/images/img/mypage_top_img.svg" alt=""></span>
							<p class="name"><strong>${loginUserMap.name }</strong>님 안녕하세요!</p>
						</div>
						<!-- 가장 최근 예정 홈경기 일정 출력 -->
						<div class="info">
							<p>다가오는 홈 경기는 <strong>2024년 10월 19일(토) 14:00</strong> 입니다.</p>
						</div>
						<div class="btns">
							<a href="ticket" class="el_btn btn_mb2">
								<span class="el_ico ico_ticket_line_w"></span> 티켓팅
							</a> <!-- 티켓 안내 페이지로 연결 -->
							<a href="scheduleList?ha=2" class="el_btn btn_mb2">
								<span class="el_ico ico_calendar2_w"></span> 전체 홈 경기일정
							</a> <!-- 경기 일정 목록 페이지 (기획서 확인) -->
						</div>
					</div>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="mypage" class="swiper-slide snb_link current"><span>마이페이지</span></a> 
								<a href="memberUpdateForm" class="swiper-slide snb_link"><span>회원정보수정</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 선호 선수 정보 영역 -->
			<c:if test="${playerMap == null }"> 
			<section class="section mypage_content">
				<h4 class="blind">선호 선수 정보</h4> 

				<div class="ly_inner md">
					<div class="bl_card m_full bg_logo2 no_player">
						<p class="txt_md">우리 구단에서 관심가는 선수가 있으신가요?<br>
							선호선수로 등록하고 빠르게 정보를 받아보세요!</p>
		
						<div class="btn_area mo_full">
							<button type="button" class="el_btn btn2 blue pmax170 openModal"  data-target="#playerPopup">선호선수 등록하기</button>
						</div>	
					</div>
				</div>
			</section>
			</c:if>
			<c:if test="${playerMap != null }">
			<section class="section mypage_content">
				<h4 class="blind">선호 선수 정보</h4> 

				<div class="ly_inner md">
					<div class="bl_card m_full bg_logo2">
						<!-- player -->
						<article class="mypage_player">
							<div class="photo">
								<c:if test="${likePlayerMap != null }">
									<img src="/resources/common/images/upload/player/${likePlayerMap.img}">
								</c:if>
								<c:if test="${likePlayerMap == null }">
									<img src="/resources/common/images/upload/player/${playerMap.pl_actioncut_1}">		
								</c:if>
							</div>
						</article>
						<!-- //player -->
						<!-- info -->
						<article class="mypage_info">
							<div class="info">
								<p class="pos">No.${playerMap.pl_back} ${playerMap.pl_pos_nm}</p>
								<p class="name">${playerMap.pl_name}</p>
							</div>
							<div class="btns">
								<a href="playerInfo?pl_no=${playerMap.pl_no}" class="el_btn sm blue">
									선수 프로필 <span class="el_ico arr_right_w rt"></span>
								</a>
								<button type="button" class="el_btn sm line2 openModal" data-target="#playerPopup">
									선호선수 변경 <span class="el_ico arr_right rt"></span>
								</button>
							</div>
						</article>
						<!-- //info -->
						<!-- record -->
						<article class="mypage_record">
							<p class="season">
								<span class="year">2024-2025</span><span class="txt">SEASON</span>
							</p>
							<div class="ranking">
								<ul class="bl_card_list type2">
									<li class="item">
										<div class="box box1">
											<p class="tit">득점</p>
											<c:if test="${playerSumMap.score != null}">
											<p class="score">${playerSumMap.score}</p>
											</c:if>
											<c:if test="${playerSumMap.score == null}">
											<p class="score">-</p>
											</c:if>
										</div>
									</li>
									<li class="item">
										<div class="box box2">
											<p class="tit">리바운드</p>
											<c:if test="${playerSumMap.r_tot != null}">
											<p class="score">${playerSumMap.r_tot}</p>
											</c:if>
											<c:if test="${playerSumMap.r_tot == null}">
											<p class="score">-</p>
											</c:if>
										</div>
									</li>
									<li class="item">
										<div class="box box3">
											<p class="tit">어시스트</p>
											<c:if test="${playerSumMap.a_s != null}">
											<p class="score">${playerSumMap.a_s}</p>
											</c:if>
											<c:if test="${playerSumMap.a_s == null}">
											<p class="score">-</p>
											</c:if>
										</div>
									</li>
								</ul>
							</div>
						</article>
						<!-- //record -->
						<!-- media -->
						<article class="mypage_media">
							<ul class="bl_grid_list pcol3 mcol2 media_list">
								<c:forEach items="${playerMediaList}" var="playerMediaList" varStatus="status">
									<c:if test="${playerMediaList.part == 'news'}">
										<li class="item">
											<a href="${playerMediaList.linkurl}" class="el_thumb rds el_img media" target="_blank" rel="noreferrer" aria-label="기사 보러 가기(새창열림)">
												<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
													<img src="/resources/common/images/upload/news/${playerMediaList.img1 }" alt="" >
												</c:if>
												<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
													<span class="no_img md"></span><!-- 대체이미지 -->
												</c:if>
											</a>
										</li>  
									</c:if>
									<c:if test="${playerMediaList.part == 'photo'}">  
										<li class="item">
										<c:if test="${playerMediaList.etc1 == 'H'}">  
											<a href="photoListHDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media">
												<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
													<img src="/resources/common/images/upload/gallery/${playerMediaList.img1 }" alt="" >
												</c:if>
												<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
													<span class="no_img md"></span> <!-- 대체이미지 -->
												</c:if>
											</a>
										</c:if>
										<c:if test="${playerMediaList.etc1 == 'E'}">  
											<a href="photoListEDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media">
												<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
													<img src="/resources/common/images/upload/gallery/${playerMediaList.img1 }" alt="" >
												</c:if>
												<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
													<span class="no_img md"></span> <!-- 대체이미지 -->
												</c:if>
											</a>
										</c:if>
										</li>
									</c:if>
									<c:if test="${playerMediaList.part == 'movie'}">  
										<li class="item">
										<c:if test="${playerMediaList.etc1 == 'H'}">  
											<c:if test="${playerMediaList.wtype == 'U'}">
												<a href="movieListHDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media youtube">
											</c:if>
											<c:if test="${playerMediaList.wtype == 'S'}">
												<a href="movieListHDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media shorts">
											</c:if>
												<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
													<img src="/resources/common/images/upload/movie/${playerMediaList.img1 }" alt="" >
												</c:if>
												<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
													<span class="no_img md"></span> <!-- 대체이미지 -->
												</c:if>
											</a>
										</c:if>
										<c:if test="${playerMediaList.etc1 == 'E'}">  
											<c:if test="${playerMediaList.wtype == 'U'}">
												<a href="movieListEDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media youtube">
											</c:if>
											<c:if test="${playerMediaList.wtype == 'S'}">
												<a href="movieListEDetail?num=${playerMediaList.num}" class="el_thumb rds el_img media shorts">
											</c:if>
												<c:if test="${playerMediaList.img1 != null && playerMediaList.img1 != ''}">
													<img src="/resources/common/images/upload/movie/${playerMediaList.img1 }" alt="" >
												</c:if>
												<c:if test="${playerMediaList.img1 == null || playerMediaList.img1 == ''}">
													<span class="no_img md"></span> <!-- 대체이미지 -->
												</c:if>
											</a>
										</c:if>
										</li>
									</c:if>
								</c:forEach>
								<c:if test="${playerMediaList.size() <= 0 }">
									<li class="item no_data">
										<p>해당 선수의 관련 자료가 없습니다.</p>
									</li>
								</c:if>
								
							</ul>
						</article>
						<!-- //media area -->
					</div>
				</div>
			</section>
			</c:if>
			<!-- //선호 선수 정보 영역 -->

			<!-- 선호선수 선택 팝업 -->
			<div id="playerPopup" tabindex="-1" class="modal type2 md playerPopup" data-focus="modal3">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_header">
							<nav class="modal_tabs">
								<a href="#" class="tab_link active"><span>가드</span></a>
								<a href="#" class="tab_link"><span>포워드</span></a>
								<a href="#" class="tab_link"><span>센터</span></a>
							</nav>

							<button type="button" class="el_btn close closeModal"></button>
						</div>
						
						<div class="modal_body" data-lenis-prevent>
							<ul class="player_list cols3">
								<c:forEach items="${playerList}" var="playerList" varStatus="status">
								<li class="item ${playerList.pl_pos_code}" <c:if test="${playerList.pl_pos_code != 'g'}">style="display: none;"</c:if>>
									<a href="#" class="p_profile type2" data-player="${playerList.num}">
										<div class="photo el_img">
											<img src="/resources/common/images/upload/player/${playerList.pl_webdetail}" alt="">
										</div>
										<p class="name">${playerList.pl_name}</p>
										<p class="player_text" style="display: none;">NO.${playerList.pl_back} ${playerList.pl_pos_nm} ${playerList.pl_name}</p>
										<p class="player_no_text" style="display: none;">${playerList.pl_no}</p>
									</a>
								</li>
								</c:forEach>
								
								<li class="item no_player" style="display: none;">
									<span class="no_post hmd">등록된 선수가 없습니다.</span>
								</li> 
							</ul>
						</div>

						<div class="modal_footer"> 
							<div class="btn_area gap10">
								<button type="button" class="el_btn frm_btn blue closeModal" data-focus-next="modal3" onclick="playerSelect()">확인</button> 
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 선호선수 선택 팝업 -->

			<script>
				let plaerVal = null;

				$(document).on('click', '.p_profile', function() {
					const value = $(this).data('player');

					plaerVal = value;
					selectPlayer();
				});

				$(document).on('click', '.p_reset', function() {
					plaerVal = null;
					selectPlayer();
				});


				function selectPlayer() {
					$('.p_profile').each((_, item) => {
						const val = $(item).data('player');

						$(item).toggleClass('active', plaerVal === val);
					});
				}
				$(document).on('click', '.modal_tabs a', function() {
					$(this).siblings('a').removeClass('active');
				    $(this).addClass('active');
				    $(".no_player").hide();
				    var posText = $(this).find('span').text();
				    if(posText == '가드'){
				    	$(".g").show();
				    	$(".f").hide();
				    	$(".c").hide();
				    	if($(".g").length <1){
				    		$(".no_player").show();
				    	}
				    }
				    if(posText == '포워드'){
				    	$(".f").show();
				    	$(".g").hide();
				    	$(".c").hide();
				    	if($(".f").length <1){
				    		$(".no_player").show();
				    	}
				    }
				    if(posText == '센터'){
				    	$(".c").show();
				    	$(".g").hide();
				    	$(".f").hide();
				    	if($(".c").length <1){
				    		$(".no_player").show();
				    	}
				    }
				});
				function playerSelect(){
					var player_no = $(".p_profile.type2.active").find(".player_no_text").text();
					if(player_no != ''){
						$.ajax({
						   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
						        url : "/updatePlayerNo",      // 컨트롤러에서 대기중인 URL 주소이다.
						        data : {
						       	 "player_no":player_no
						        },            // Json 형식의 데이터이다.
						        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
							        if(res==1){
							        	location.reload();
							        }else{
							        	alertPop("변경에 실패했습니다.");
							        }
						        },
						        error: function() {
									alert("서버에 문제가 있습니다.");
								}
						   });
					}else{
						alertPop('선택된선수가 없습니다.');
					}
				}
			</script>


			<!-- 최근 영상 -->
			<section class="section mypage_video mt50">
				<div class="ly_inner md">
					<div class="page_header float_btn">
						<h4 class="el_heading lv1">최근 영상</h4> 
					</div>

					<div class="swiper slider video_list type2 visible pcol4" data-view="[4,3,2,1]" data-space="[20,16,13,10]" data-delay="400">
						<div class="swiper-wrapper">
							<c:forEach items="${movieList}" var="movieList" varStatus="status">
							<!-- slide -->
							<div class="swiper-slide item">
								<a href="movieListHDetail?num=${movieList.num}" class="el_thumb rds el_img media video">
									<c:if test="${movieList.img1 != null && movieList.img1 != ''}">
										<img src="/resources/common/images/upload/movie/${movieList.img1 }" alt="">
									</c:if>
									<c:if test="${movieList.img1 == null || movieList.img1 == ''}">
										<img src="/resources/common/images/common/no_img.png" alt="">
									</c:if>
								</a>
							</div>
							<!-- //slide -->
							</c:forEach>
						</div>
					</div>

					<a href="movieListH" class="el_btn ccl add float"><span class="blind">더보기</span></a>
				</div>
			</section>
			<!-- 최근 영상 -->


			<!-- 최근 게시물 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="bl_grid col2">

						<!-- 공지사항 -->
						<article class="bl_col bl_card m_full latest_bbs">
							<div class="latest_header float_btn">
								<h4 class="el_heading lv1">공지사항</h4> 
							</div>
							<div class="latest_content">
								<ul class="latest_list">
								<c:forEach items="${noticeList}" var="noticeList" varStatus="status">
									<c:choose>
									  <c:when test="${status.first}">
									     <li class="row li_notice">
											<a href="noticeListDetail?num=${noticeList.num}">
												<div class="tit_area">
													<div class="tit txt_line1">
														${noticeList.subject}
													</div>
													<c:if test="${noticeList.tail_count != '0' }">
													<span class="count">[${noticeList.tail_count}]</span>
													</c:if>
												</div>
												<div class="cont txt_line2">
													${noticeList.content2}
												</div>
												<span class="date">${noticeList.reg_date}</span>
											</a>
										</li>
									  </c:when>
										<c:otherwise>
										   <li class="row">
												<div class="tit">
													<a href="noticeListDetail?num=${noticeList.num}" class="tit_link">${noticeList.subject}</a>
													<c:if test="${noticeList.tail_count != '0' }">
													<span class="count">[${noticeList.tail_count}]</span>
													</c:if>
												</div>
												<span class="date">${noticeList.reg_date}</span>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</ul>
							</div>

							<a href="noticeList" class="el_btn ccl add float"><span class="blind">더보기</span></a>
						</article>
						<!-- //공지사항 -->

						<!-- 최근 내 게시물 댓글 -->
						<article class="bl_col bl_card m_full latest_bbs">
							<div class="latest_header">
								<h4 class="el_heading lv1">최근 내 게시물</h4> 
							</div>
							<div class="latest_content">
								<ul class="latest_list">
									<c:forEach items="${freeList}" var="freeList" varStatus="status">
									<li class="row">
										<div class="tit">
											<a href="freeListDetail?num=${freeList.num}" class="tit_link">${freeList.subject }</a>
											<c:if test="${freeList.tail_count != '0' }">
											<span class="count">[${freeList.tail_count }]</span>
											</c:if>
										</div>
										<span class="date">${freeList.reg_date }</span>
									</li>
									</c:forEach>

									<!-- (게시물 없을 경우) -->
									<c:if test="${empty freeList}">
									<li class="row no_post">
										<div class="inner">
											<p>등록된 게시물이 없습니다.</p>
											<a href="freeWriteForm" class="el_btn sm line2">게시물 작성하기 <span class="el_ico arr_right rt"></span></a>
										</div>
									</li> 
									</c:if>
								</ul>
							</div>

							<a href="freeList" class="el_btn ccl add float"><span class="blind">더보기</span></a>
						</article>
						<!-- //최근 내 게시물 댓글 -->
					</div>
				</div>
			</section>
			<!-- //최근 게시물 -->

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