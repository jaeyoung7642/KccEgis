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
<script>
function showYn(num,show){
	$.ajax({
   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
        url : "/changeShow",      // 컨트롤러에서 대기중인 URL 주소이다.
        data : {
       	 "plNo":num,
       	 "show" : show
        },            // Json 형식의 데이터이다.
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
          console.log(res);
	        if(res==1){
	       	 location.reload();
	        }else{
	       	 alert("변경에 실패했습니다.");
	        }
        },
        error: function() {
			alert("서버에 문제가 있습니다.");
		}
   });
}
</script>
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
					<h3 class="aside_title">PLAYER</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="pCoachProfileList" class="snb_link">코칭스탭</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="pSupportstaffProfileList" class="snb_link current">지원스탭</a></li>
							<li><a href="pPlayerProfileList" class="snb_link">선수</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">코칭스탭</h3>

				<!-- board list -->
				<table class="tbl type2">
					<caption>코칭스탭 목록</caption>
					<colgroup>
						<col>
						<col width="287">
						<col width="287">
						<col width="287">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">출력순서</th>
							<th scope="col">이름</th>
							<th scope="col">역할</th>
							<th scope="col">출력여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pSupportstaffProfileList}" var="support">
						<tr>
							<td>${support.pl_order}</td>
							<td><a href="pSupportstaffProfileWrite?num=${support.num }">${support.pl_name}</a></td>
							<td>${support.pl_postion}</td>
							<c:if test="${support.pl_show == 'Y' }"><td><button type="button" class="toggle" onclick="showYn('${support.pl_no}','${support.pl_show }')">출력</button></td></c:if>
							<c:if test="${support.pl_show == 'N' }"><td><button type="button" class="toggle" onclick="showYn('${support.pl_no}','${support.pl_show }')">미출력</button></td></c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty pSupportstaffProfileList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="pSupportstaffProfileList?page=1" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="pSupportstaffProfileList?page=${startPage-1}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="pSupportstaffProfileList" value="pSupportstaffProfileList">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${pSupportstaffProfileList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="pSupportstaffProfileList?page=${endPage+1}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="pSupportstaffProfileList?page=${maxPage}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="pSupportstaffProfileWrite" class="el_btn md line">추가</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>