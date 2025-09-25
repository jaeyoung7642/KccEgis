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
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
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
					<h3 class="aside_title">ADMIN</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="aAdminList" class="snb_link current">관리자관리</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="aAdminLogList" class="snb_link">관리자 접속로그</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="aAdminAuthLogList" class="snb_link">관리자 권한설정로그</a></li> <!-- 현재 페이지 메뉴 current -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">관리자관리</h3>
					<p class="txt_md">총 관리자수: <span class="total">${totalListCount}</span></p>
					<!-- search -->
					<form action="aAdminList" class="forms frm_group">
						<select class="frm_select sm m140" aria-label="검색 조건" name="select" id="searchOption">
							<option value="adminName" <c:if test="${select eq 'adminName'}">selected</c:if>>관리자명</option>
							<option value="adminId" <c:if test="${select eq 'adminId'}">selected</c:if>>아이디</option>
						</select>
						<input type="text" class="frm_input sm m240" name="keyWord" id="keyWord" value="${keyWord}" aria-label="검색어 입력" placeholder="검색어를 입력하세요.">
						<button class="el_btn frm_btn deep sm w100">검색</button>
					</form>
					<!-- //search -->
				</div>

				<!-- board list -->
				<table class="tbl type2">
					<caption>선수 목록</caption>
					<colgroup>
						<col width="88">
						<col width="194">
						<col width="194">
						<col width="194">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">관리자명</th>
							<th scope="col">아이디</th>
							<th scope="col">이메일</th>
							<th scope="col">권한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${adminList}" var="admin">
						<tr>
							<td>${admin.rownum}</td>
							<td><a href="aAdminDetail?num=${admin.num }">${admin.name}</a></td>
							<td><a href="aAdminDetail?num=${admin.num }">${admin.id}</a></td>
							<td>${admin.email}</td>
							<td>${admin.chk_grade}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty adminList}">
							<tr><td colspan="5">검색된 결과가 없습니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty adminList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="aAdminList?page=1&keyWord=${keyWord}&select=${select}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="aAdminList?page=${startPage-1}&keyWord=${keyWord}&select=${select}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="aAdminList" value="aAdminList?&keyWord=${keyWord}&select=${select}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${aAdminList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="aAdminList?page=${endPage+1}&keyWord=${keyWord}&select=${select}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="aAdminList?page=${maxPage}&keyWord=${keyWord}&select=${select}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="aAdminWrite" class="el_btn md line">등록</a>
				</div>
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

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