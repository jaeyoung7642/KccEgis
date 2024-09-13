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
	<script>
	function fileDownload(element) {
	    var fileName = $(element).data('file');
	    var fileNameOrg = $(element).data('file-org');
	    
	    if (fileName === "" || fileName === null) {
	        alert('파일이 없습니다.');
	        return false;
	    }
	    
	    location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=kccad";
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
		<main id="container" class="ly_container club bg_dark">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>CLUB</li>
						<li>KCC광고</li>
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
								<a href="chistory" class="swiper-slide snb_link"><span>역사관</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="sponsor" class="swiper-slide snb_link"><span>스폰서</span></a>
								<a href="kccadList" class="swiper-slide snb_link current"><span>KCC 광고</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area p_show">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="kccadList?adgroup=기업PR" class="swiper-slide snb_link <c:if test="${adgroup == '기업PR'}"> current </c:if>"><span>기업PR</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="kccadList?adgroup=KCC창호" class="swiper-slide snb_link <c:if test="${adgroup == 'KCC창호'}"> current </c:if>"><span>KCC창호</span></a>
						<a href="kccadList?adgroup=숲으로" class="swiper-slide snb_link <c:if test="${adgroup == '숲으로'}"> current </c:if>"><span>숲으로</span></a> 
						<a href="kccadList?adgroup=HOMECC" class="swiper-slide snb_link <c:if test="${adgroup == 'HOMECC'}"> current </c:if>"><span>HOMECC</span></a> 
						<a href="kccadList?adgroup=KCC건설 스위첸" class="swiper-slide snb_link <c:if test="${adgroup == 'KCC건설 스위첸'}"> current </c:if>"><span>KCC건설 스위첸</span></a> 
					</div>
				</nav>
			</div>

			<!-- 검색 -->
			<section class="section mt70 kccad_content">
				<div class="ly_inner md inner">
					<!-- 광고 카테고리 (3차 메뉴도 동일하게 적용) -->
					<aside class="kccad_cate_area">
						<div class="bl_sticky_wrap">
						<nav class="kccad_cate p_hide bl_sticky">
							<a href="kccadList?adgroup=기업PR" class="cate_link <c:if test="${adgroup == '기업PR'}"> current </c:if>">
								<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_01.svg"></span> 기업PR
							</a> <!-- 해당페이지에 current 추가 -->
							<a href="kccadList?adgroup=KCC창호" class="cate_link <c:if test="${adgroup == 'KCC창호'}"> current </c:if>">
								<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_02.svg"></span> KCC창호
							</a>
							<a href="kccadList?adgroup=숲으로" class="cate_link <c:if test="${adgroup == '숲으로'}"> current </c:if>">
								<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_03.svg"></span> 숲으로
							</a>
							<a href="kccadList?adgroup=HOMECC" class="cate_link <c:if test="${adgroup == 'HOMECC'}"> current </c:if>">
								<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_04.svg"></span> HOMECC
							</a>
							<a href="kccadList?adgroup=KCC건설 스위첸" class="cate_link <c:if test="${adgroup == 'KCC건설 스위첸'}"> current </c:if>">
								<span class="el_ico"><img src="/resources/common/images/img/kccad_cate_05.svg"></span> KCC건설 스위첸
							</a>
						</nav>
						</div>
					</aside>
					<!-- //광고 카테고리 -->
			
					<!-- 광고 영상 리스트 -->
					<ul class="kccad_list">
					<c:forEach items="${kccadList}" var="kccadList">
						<!-- item -->
						<li class="item">
							<div class="el_thumb thumb_hover hov_type2">
								<div class="el_img">
									<c:if test="${kccadList.thumbnail != null && kccadList.thumbnail != ''}">
										<img src="/resources/common/images/upload/kccad/${kccadList.thumbnail }" alt="" >
									</c:if>
									<c:if test="${kccadList.thumbnail == null || kccadList.thumbnail == ''}">
										<span class="no_img md"></span><!-- 대체이미지 -->
									</c:if>
								</div>
								<div class="info">
									<p>${kccadList.title }</p>
								</div>
								<!-- overlay -->
								<div class="overlay">
									<div class="cont">
										<p class="tit">${kccadList.title }</p>
										<div class="btns">
											<button type="button" aria-label="영상보기" class="el_btn video openModal videoOpen" data-target="#kccadPopup" data-video="${kccadList.addr }"></button>
											<a href="#" class="el_btn download_lg"  onclick="fileDownload(this);" data-file="${kccadList.downfile}" data-file-org="${kccadList.downfile_original}"><span class="blind">영상 다운로드</span></a>
										</div>
									</div>
								</div>
								<!-- //overlay -->
							</div>
						</li>
						<!-- //item -->
						</c:forEach>
					</ul>
					<!-- //광고 영상 리스트 -->
				</div>
			</section>
			<!-- 검색 -->

			<script src="https://www.youtube.com/iframe_api"></script>

			<script>
				// 유튜브 id 추출
				function youtubeId(url) {
					let match = url.match(/(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/);
					if (match) {
							return match[1];
					} else {
							return null;
					}
				}

				let player = null;

				$(document).on('click', '.videoOpen', function() {
					const videoId = youtubeId($(this).data('video'));

					player = new YT.Player('player', {
							height: '315',
							width: '560',
							videoId: videoId,
							playerVars: {
								'rel': 0 
							},
							events: {
									'onReady': () => {
										player.playVideo();
									}
							}
					});
				});

				// modal close
				$(document).on('click', '.videoClose, .dim', function() {
					if (player && $('.kccadPopup').hasClass('open')) {
						player.stopVideo();
						player.destroy();
						player = null;
					}
				});

				$(document).on('keydown', (e) => { 
					if (player && $('.kccadPopup.open').length > 0 && e.keyCode == 27){
						player.stopVideo();
						player.destroy();
						player = null;
					}
				});

			</script>

			<!-- 월페이퍼 미리보기 팝업 -->
			<div id="kccadPopup" tabindex="-1" class="modal type3 kccadPopup" data-focus="modal" style="--pmax: 1140px">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<div class="video el_video">
								<div id="player"></div>
							</div>
						</div>
						<button type="button" class="el_btn close w closeModal videoClose" data-focus-next="modal"></button>
					</div>
				</div>
			</div>
			<!-- 월페이퍼 미리보기 팝업 -->


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