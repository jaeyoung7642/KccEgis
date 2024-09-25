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
	<title>월페이퍼 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/board.css"> <!-- 디렉토리 media/fan only -->
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
	function fileDownload(element){
		var fileName = $(element).data('file');
	    var fileNameOrg = $(element).data('file-org');
		if(fileName=="" || fileName ==null){
			alertPop('파일이 없습니다.');
			return false;
		}
		location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=wallpaper";
	}
	function fileDownload2(element){
		var fileName = $(element).data('file');
	    var fileNameOrg = $(element).data('file-org');
		if(fileName=="" || fileName ==null){
			alertPop('파일이 없습니다.');
			return false;
		}
		location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=wallpaper";
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
		<main id="container" class="ly_container fanzone">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>FANZONE</li>
						<li>월페이퍼</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">FANZONE</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="noticeList" class="swiper-slide snb_link"><span>공지사항</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="freeList" class="swiper-slide snb_link"><span>팬게시판</span></a> 
								<a href="eventList" class="swiper-slide snb_link"><span>이벤트</span></a>
								<a href="wallpaperList" class="swiper-slide snb_link current"><span>월페이퍼</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<section class="section">
				<div class="ly_inner md">

					<!-- 게시판 리스트 -->
					<article class="mt40-30">
						<!-- board list -->
						<ul class="board_list type1 cols3-1 wallpaper">
						<c:forEach items="${wallpaperList}" var="wallpaperList">
							<li class="item">
								<a href="#" class="bbs_box openModal previewOpen" data-target="#previewPopup" data-imgUrl="/resources/common/images/upload/wallpaper/${wallpaperList.img1}">
									<div class="el_thumb rds el_img">
										<img src="/resources/common/images/upload/wallpaper/${wallpaperList.img1}" alt="">
									</div>
									<span class="blind p_hide">월페이퍼 미리보기</span>
								</a>
								<div class="bbs_info_wrap">
									<p class="bbs_tit">${wallpaperList.subject}</p>
									<div class="btns">
										<c:if test="${loginUserMap == null}">
											<a href="#" class="el_btn download blue openModal" data-target="#loginForm">1280x960</a>
											<a href="#" class="el_btn download gray openModal" data-target="#loginForm">1600x1200</a>
										</c:if>
										<c:if test="${loginUserMap != null}">
											<a href="#" class="el_btn download blue" onclick="fileDownload(this);" data-file="${wallpaperList.img1}" data-file-org="${wallpaperList.img1_org}">1280x960</a>
											<a href="#" class="el_btn download gray" onclick="fileDownload(this);" data-file="${wallpaperList.img2}" data-file-org="${wallpaperList.img2_org}">1600x1200</a>
										</c:if>
									</div>
								</div>
							</li>
						</c:forEach>
							<!-- (게시물 없을 경우) -->
							<c:if test="${empty wallpaperList}">
							<li class="item no_post hmd">
								등록된 게시물이 없습니다.
							</li> 
							</c:if>
						</ul>
						<!-- board list -->
						<c:if test="${not empty wallpaperList}">
						<!-- pagination -->
						<div class="pagination">
							<!-- 맨처음 -->
							<c:if test="${maxPage eq 0}">
							<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							<c:if test="${maxPage > 0}">
							<a href="wallpaperList?page=1" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${startPage gt 1 }">
		                       	<a href="wallpaperList?page=${startPage-1}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
		                      	<c:url var="wallpaperList" value="wallpaperList">
			 					<c:param name="page" value="${p}" />
			 					</c:url>
			 					<a href="${wallpaperList}" class="page_link">${p}</a>
		                      </c:if>
		                    </c:forEach>
		                    
		                    <!-- 다음 블럭으로 이동 -->
		                    <c:if test="${endPage ne maxPage && maxPage > 1}">
							<a href="wallpaperList?page=${endPage+1}" class="page_link ico next"><span class="blind">다음</span></a>
		                    </c:if>
		                    <c:if test="${endPage ge maxPage}">
							<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
		                    </c:if>
		                    
		                    <!-- 맨끝 -->
		                    <c:if test="${maxPage eq 0}">
		                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
		                    </c:if>
		                    <c:if test="${maxPage > 0}">
							<a href="wallpaperList?page=${maxPage}" class="page_link ico last"><span class="blind">마지막</span></a>
							</c:if>
						</div>
						<!-- // pagination -->
						</c:if>
						
					</article>
					<!-- //게시판 리스트 -->

				</div>
			</section>

			<!-- 월페이퍼 미리보기 팝업 -->
			<div id="previewPopup" tabindex="-1" class="modal previewPopup" data-focus="modal" style="--pmax: 900px">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<img src="" alt="월페이퍼 미리보기" class="previewImg">
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="modal"></button>
					</div>
				</div>
			</div>
			<!-- 월페이퍼 미리보기 팝업 -->

			
			<script>
				// 월페이퍼 미리보기 
				$(document).on('click', '.previewOpen', function() {
					const imgUrl = $(this).data('imgurl');
					$('.previewImg').attr('src', imgUrl);
				});


				// 모바일에서 팝업 닫기
				const match = window.matchMedia('(max-width: 1025px)');

				const breakpoint = (e) => {
					if (e.currentTarget.matches) { // mobile
						if ($('.previewPopup').hasClass('open')) {
							$('.previewPopup').find('.closeModal').trigger('click');
						}
					} 
				};
	
				$(match).on('change', breakpoint).change();

			</script>

			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->
		<!-- 알럿 -->
			<div id="loginForm" tabindex="-1" class="alert alertPopup modal" data-focus="alert">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">로그인 후 다운로드 가능합니다.<br> 로그인 하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<a href="#" class="el_btn frm_btn gray2 closeModal">취소</a>
								<a href="loginForm" class="el_btn frm_btn blue">확인</a>
							</div>
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="alert"></button>
					</div>
				</div>
			</div>
			<!--  알럿 -->
		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
</body>
</html>