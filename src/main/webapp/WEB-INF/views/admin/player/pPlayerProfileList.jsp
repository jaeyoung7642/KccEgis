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
</head>
<script>
function showYn(num,show){
	$.ajax({
   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
        url : "/kccadm/changeShow",      // 컨트롤러에서 대기중인 URL 주소이다.
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
			alert("서버 오류!!");
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
							<li><a href="pSupportstaffProfileList" class="snb_link">지원스탭</a></li>
							<li><a href="pPlayerProfileList" class="snb_link current">선수</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">선수</h3>

					<!-- search -->
					<form action="pPlayerProfileList" class="forms frm_group">
						<select class="frm_select sm m140" aria-label="포지션 구분" name="select" id="searchOption">
							<option value="all" <c:if test="${select eq 'all'}">selected</c:if>>포지션</option>
							<option value="g" <c:if test="${select eq 'g'}">selected</c:if>>가드</option>
							<option value="c" <c:if test="${select eq 'c'}">selected</c:if>>센터</option>
							<option value="f" <c:if test="${select eq 'f'}">selected</c:if>>포워드</option>
							<option value="s" <c:if test="${select eq 's'}">selected</c:if>>군입대</option>
						</select>
						<select class="frm_select sm m140" aria-label="출력 구분" name="show_yn">
							<option value="Y" <c:if test="${show_yn eq 'Y'}">selected</c:if>>출력</option>
							<option value="N" <c:if test="${show_yn eq 'N'}">selected</c:if>>미출력</option>
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
						<col width="88">
						<col width="194">
						<col width="194">
						<col width="194">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">출력순서</th>
							<th scope="col">배번</th>
							<th scope="col">선수명</th>
							<th scope="col">선수코드</th>
							<th scope="col">포지션</th>
							<th scope="col">출력여부</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty pPlayerProfileList}">
							<tr><td colspan="6">검색된 결과가 없습니다.</td></tr>
						</c:if>
						<c:forEach items="${pPlayerProfileList}" var="player">
						<tr>
							<td>${player.pl_order}</td>
							<td>${player.pl_back}</td>
							<td><a href="pPlayerProfileWrite?num=${player.num }">${player.pl_name}</a></td>
							<td>${player.pl_no}</td>
							<td>${player.pl_postion}</td>
							<c:if test="${player.pl_show == 'Y' }"><td><button type="button" class="toggle" onclick="showYn('${player.pl_no}','${player.pl_show }')">출력</button></td></c:if>
							<c:if test="${player.pl_show == 'N' }"><td><button type="button" class="toggle" onclick="showYn('${player.pl_no}','${player.pl_show }')">미출력</button></td></c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty pPlayerProfileList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="pPlayerProfileList?page=1&keyWord=${keyWord}&select=${select}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="pPlayerProfileList?page=${startPage-1}&keyWord=${keyWord}&select=${select}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="pPlayerProfileList" value="pPlayerProfileList?&keyWord=${keyWord}&select=${select}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${pPlayerProfileList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="pPlayerProfileList?page=${endPage+1}&keyWord=${keyWord}&select=${select}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="pPlayerProfileList?page=${maxPage}&keyWord=${keyWord}&select=${select}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="pPlayerProfileWrite" class="el_btn md line">추가</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>