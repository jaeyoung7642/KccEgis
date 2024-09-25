<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=1">
	<title>KCC EGIS 관리자</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/admin/assets/font/font.css" />
	<link rel="stylesheet" href="/resources/common/admin/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/admin/assets/css/subpage.css"> 
	
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<h2 class="blind">컨텐츠 바로가기</h2>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->
		<!-- container -->
		<div id="container" class="ly_container"> 
			<!-- aside -->
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">FANZONE</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="fNoticeList" class="snb_link">공지사항</a></li> 
							<li><a href="fFreeList" class="snb_link">팬게시판</a></li>
							<li><a href="fEventList" class="snb_link">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							<li><a href="fWallpaperList" class="snb_link current">월페이퍼</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">월페이퍼</h3>
					<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>

					<!-- search -->
					<form action="fNoticeList" class="forms frm_group">
						<input type="text" class="frm_input sm m240" aria-label="검색어 입력" placeholder="검색어를 입력하세요." name="keyWord" id="keyWord" value="${keyWord}">
						<button class="el_btn frm_btn deep sm w100">검색</button>
					</form>
					<!-- //search -->
				</div>
				<!-- board list -->
				<ul class="board_list type1 mt30">
					<c:forEach items="${wallpaperList}" var="wallpaperList">
					<li class="item">
						<div class="bbs_box">
							<a href="fWallpaperWrite?num=${wallpaperList.num }">
								<div class="thumb">
									<c:if test="${wallpaperList.img1 != null && wallpaperList.img1 != ''}">
										<img src="/resources/common/images/upload/wallpaper/${wallpaperList.img1 }" alt="" >
									</c:if>
									<c:if test="${wallpaperList.img1 == null || wallpaperList.img1 == ''}">
										<img src="/resources/common/admin/images/common/no_img.jpg" alt="" class="no_img"> <!-- 대체이미지 -->
									</c:if>
								</div>
								<p class="tit">${wallpaperList.subject}</p>
							</a>
							<p class="info">
								<span class="date">${wallpaperList.reg_date}</span>
							</p>
						</div>
					</li>
					</c:forEach>
					<c:if test="${empty wallpaperList}">
						<li class="item">검색된 결과가 없습니다.</li>
					</c:if>
				</ul>
				<!-- //board list -->
				<c:if test="${not empty wallpaperList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="fWallpaperList?page=1&keyWord=${keyWord}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="fWallpaperList?page=${startPage-1}&keyWord=${keyWord}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="fWallpaperList" value="fWallpaperList?keyWord=${keyWord}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${fWallpaperList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="fWallpaperList?page=${endPage+1}&keyWord=${keyWord}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="fWallpaperList?page=${maxPage}&keyWord=${keyWord}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="fWallpaperWrite" class="el_btn md line">등록</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>