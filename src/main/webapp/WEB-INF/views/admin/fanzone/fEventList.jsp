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
			<aside id="aside" class="ly_aside">
				<div class="aside_inner custom_scroll">
					<h3 class="aside_title">FANZONE</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="fNoticeList" class="snb_link">공지사항</a></li> 
							<li><a href="fFreeList" class="snb_link">팬게시판</a></li>
							<li><a href="fEventList" class="snb_link current">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							<li><a href="fWallpaperList" class="snb_link">월페이퍼</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">이벤트</h3>
					<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>

					<!-- search -->
					<form action="fEventList" class="forms frm_group">
						<input type="text" class="frm_input sm m240" aria-label="검색어 입력" placeholder="검색어를 입력하세요." name="keyWord" value="${keyWord }">
						<button class="el_btn frm_btn deep sm w100">검색</button>
					</form>
					<!-- //search -->
				</div>
				<!-- tabs -->
				<div class="page_tabs mt20" id="tabs">
					<a href="fEventList?keyWord=${keyWord}" class="tab active" id="all">전체</a> <!-- 활성화탭 active -->
					<a href="fEventList?state=ing&keyWord=${keyWord}" class="tab" id="ing">진행중</a>
					<a href="fEventList?state=end&keyWord=${keyWord}" class="tab" id="end">종료</a>
				</div>
				<!-- // tabs -->
				<!-- board list -->
				<ul class="board_list type3 mt20">
					<c:if test="${empty eventList}">
						<li>검색된 결과가 없습니다.</li>
					</c:if>
					<c:forEach items="${eventList}" var="eventList">
					<li class="item">
						<div class="bbs_box">
							<span class="num">${eventList.rownum}</span>
							<div class="thumb">
								<c:if test="${eventList.img1 != null && eventList.img1 != ''}">
										<a href="fEventWrite?num=${eventList.num}"><img src="/resources/common/images/upload/event/${eventList.img1 }" alt="" ></a>
									</c:if>
									<c:if test="${eventList.img1 == null || eventList.img1 == ''}">
										<a href="fEventWrite?num=${eventList.num}"><img src="/resources/common/admin/images/common/no_img.jpg" alt="" class="no_img"></a> <!-- 대체이미지 -->
									</c:if>
							</div>
							<div class="cont">
								<p class="tit">
									<a href="fEventWrite?num=${eventList.num}">${eventList.subject }</a>
								</p>
								<div class="info">
									<span class="date2">${eventList.sdateFormat } ~ ${eventList.edateFormat}</span>
									<span class="view">${eventList.visited}</span>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				<!-- //board list -->
				<c:if test="${not empty eventList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="fEventList?page=1&keyWord=${keyWord}&state=${state}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="fEventList?page=${startPage-1}&keyWord=${keyWord}&state=${state}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="fEventList" value="fEventList?&keyWord=${keyWord}&state=${state}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${fEventList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="fEventList?page=${endPage+1}&keyWord=${keyWord}&state=${state}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="fEventList?page=${maxPage}&keyWord=${keyWord}&state=${state}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="fEventWrite" class="el_btn md line">등록</a>
				</div>
			
			</main>
		</div>
		<!-- //container -->

	</div>
	<script>
	var state = "${state}"
	if(state != ""){
		$("#tabs").find("a").removeClass('active');
		$("#"+state).addClass('active');
	}
</script>
</body>
</html>