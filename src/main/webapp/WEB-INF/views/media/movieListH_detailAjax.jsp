<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="inputs">
	<c:if test="${loginUserMap != null}">
	<textarea class="frm_input" id="content" placeholder="공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
	<button type="button" onclick="contentWrite()" class="el_btn frm_btn black">댓글 작성</button>
	</c:if>
	<c:if test="${loginUserMap == null}">
	<textarea class="frm_input" placeholder="로그인 후 댓글 입력이 가능합니다.&#13;공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
	<button type="button" data-target="#loginForm" class="el_btn frm_btn black openModal">댓글 작성</button>
	</c:if>
</div>
<c:if test="${not empty tailList}">
<div class="anchor_wrap">
	<span class="anchor type2" id="tailfocus"></span>
</div>
<h5 class="tit">댓글</h5>
<div class="comments" id="tailfocus">
	<c:forEach items="${tailList}" var="tailList">
	<!-- row -->
	<div class="row">
		<div class="cont">${tailList.content}</div>  <!-- 줄바꿈 없이 데이터 넣기 -->
		<div class="info">
			<span class="name"><strong>${tailList.writer2 }</strong>(${tailList.id2 })</span>
			<span class="date">${tailList.formatted_date }</span>
			<span class="time">${tailList.formatted_time }</span>
		</div>
		<c:if test="${loginUserMap.id == tailList.id}">
		<div class="btns"> <!-- 본인 댓글에만 삭제버튼 노출 -->
			<button type="button" class="el_btn delete" aria-label="삭제" onclick="contentDelete(${tailList.num})"></button>
		</div>
		</c:if>
	</div>
	</c:forEach>
	<!-- //row -->
	</div>
</div>
<!-- pagination -->
<div class="pagination">
	<!-- 맨처음 -->
	<c:if test="${maxPage eq 0}">
		<a href="#" class="page_link ico first" disabled><span
			class="blind">처음</span></a>
		<!-- 비활성화시 disabled 추가 -->
	</c:if>
	<c:if test="${maxPage > 0}">
		<a href="#" onclick="contentPage(1)" class="page_link ico first"><span
			class="blind">처음</span></a>
		<!-- 비활성화시 disabled 추가 -->
	</c:if>

	<!-- 이전 블럭으로 이동 -->
	<c:if test="${startPage gt 1 }">
		<a href="#" onclick="contentPage(${startPage-1})"
			class="page_link ico prev"><span class="blind">이전</span></a>
		<!-- 비활성화시 disabled 추가 -->
	</c:if>
	<c:if test="${startPage eq 1 }">
		<a href="#" class="page_link ico prev" disabled><span
			class="blind">이전</span></a>
		<!-- 비활성화시 disabled 추가 -->
	</c:if>

	<!-- 페이지 번호 -->
	<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
		<c:if test="${p eq currentPage }">
			<a href="#" class="page_link current">${p}</a>
		</c:if>
		<c:if test="${p ne currentPage }">
			<a href="#" onclick="contentPage(${p})" class="page_link">${p}</a>
		</c:if>
	</c:forEach>

	<!-- 다음 블럭으로 이동 -->
	<c:if test="${endPage ne maxPage && maxPage > 1}">
		<a href="#" onclick="contentPage(${endPage+1})"
			class="page_link ico next"><span class="blind">다음</span></a>
	</c:if>
	<c:if test="${endPage ge maxPage}">
		<a href="#" class="page_link ico next" disabled><span
			class="blind">다음</span></a>
	</c:if>

	<!-- 맨끝 -->
	<c:if test="${maxPage eq 0}">
		<a href="#" class="page_link ico last" disabled><span
			class="blind">마지막</span></a>
	</c:if>
	<c:if test="${maxPage > 0}">
		<a href="#" onclick="contentPage(${maxPage})"
			class="page_link ico last"><span class="blind">마지막</span></a>
	</c:if>
</div>
<!-- // pagination -->
</c:if>