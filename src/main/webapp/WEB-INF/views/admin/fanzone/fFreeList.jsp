<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=0.3">
	<title>KCC EGIS 관리자</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/admin/assets/font/font.css" />
	<link rel="stylesheet" href="/resources/common/admin/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/admin/assets/css/subpage.css"> 
	<link rel="stylesheet" href="/resources/common/admin/assets/css/jquery-ui.min.css"> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
</head>
<script>
function showYn(num,chkDel){
	if (confirm("노출여부를 변경하시겠습니까?") == true) {
		$.ajax({
	   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
	        url : "changeChkDel",      // 컨트롤러에서 대기중인 URL 주소이다.
	        data : {
	       	 "num":num,
	       	 "chkDel" : chkDel
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
	}else{
		return;
	}

}
function searchval(){
	var keyWord = $("#keyWord").val();
	var titleChecked = document.getElementById('title').checked;
    var contentChecked = document.getElementById('content').checked;
    var writerChecked = document.getElementById('writer').checked;
    var tailChecked = document.getElementById('tail').checked;
    var tailWriterChecked = document.getElementById('tailWriter').checked;
    var form = $("#freeSearchForm");
    if(keyWord !=""){
	    if(!titleChecked && !contentChecked && !writerChecked && !tailChecked && !tailWriterChecked){
	    	alert('검색항목을 한개 이상 체크해주세요.');
	    }else{
	    	form.submit();
	    }
    }else{
    	form.submit();
    }
}
function searchReset() {
	// 오늘 날짜 계산
    var today = new Date();
    var yearAgo = new Date();
    
    // 1년 전 날짜 계산
    yearAgo.setFullYear(today.getFullYear() - 1);

    // 날짜 형식 맞추기 (YYYY-MM-DD)
    var todayFormatted = today.toISOString().split('T')[0];
    var yearAgoFormatted = yearAgo.toISOString().split('T')[0];

    // sdate는 1년 전 날짜로, edate는 오늘 날짜로 설정
    document.getElementById("sdate").value = yearAgoFormatted;
    document.getElementById("edate").value = todayFormatted;
    
    
    document.getElementById("chk_del").value = "N";

    // 검색어 초기화
    document.getElementById("keyWord").value = "";

    // 체크박스 초기화
    document.getElementById("title").checked = false;
    document.getElementById("content").checked = false;
    document.getElementById("writer").checked = false;
    document.getElementById("tail").checked = false;
    document.getElementById("tailWriter").checked = false;
	customSelect();
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
					<h3 class="aside_title">FANZONE</h3>
					<nav id="snb">
						<ul class="snb_list">
							<c:if test="${user.chk_grade == '70'}">
							<li><a href="fFreeList" class="snb_link current">팬게시판</a></li>
							</c:if>
							<c:if test="${user.chk_grade != '70'}">
							<li><a href="fNoticeList" class="snb_link">공지사항</a></li> 
							<li><a href="fFreeList" class="snb_link current">팬게시판</a></li>
							<li><a href="fEventList" class="snb_link">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							<li><a href="fWallpaperList" class="snb_link">월페이퍼</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>
				<div class="page_header">
				<h3 class="heading">팬게시판</h3>
				<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>
				</div>
					<!-- search -->
					<div class="board_search mt27">
					<form action="fFreeList" class="forms search_group" id="freeSearchForm">
						<div class="forms frm_field">
							<div class="row">
								<div class="frm_group">
								<input type="text" class="frm_input sm w140 date" aria-label="시작 일" placeholder="기간 설정" id="sdate" name="sdate" value="${sdate}" readonly>
								<span class="dash">-</span>
								<input type="text" class="frm_input sm w140 date" aria-label="종료 일" placeholder="기간 설정" id="edate" name="edate" value="${edate}" readonly>
								<select class="frm_select sm m140" aria-label="출력 구분" name="chk_del" id="chk_del">
									<option value="all" <c:if test="${chk_del eq 'all'}">selected</c:if>>전체</option>
									<option value="N" <c:if test="${chk_del eq 'N'}">selected</c:if>>노출</option>
									<option value="Y" <c:if test="${chk_del eq 'Y'}">selected</c:if>>미노출</option>
								</select>
								<button type="button" class="el_btn frm_btn deep sm w100" onclick="searchReset()">검색초기화</button>
								</div>
							</div>
							<div class="row rt">
								<div class="frm_group">
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="title" name="title" value="Y" <c:if test="${title=='Y' }">checked</c:if>>
										<span>제목</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="content" name="content" value="Y" <c:if test="${content=='Y' }">checked</c:if>>
										<span>내용</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="writer" name="writer" value="Y" <c:if test="${writer=='Y' }">checked</c:if>>
										<span>작성자</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tail" name="tail" value="Y" <c:if test="${tail=='Y' }">checked</c:if>>
										<span>댓글</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tailWriter" name="tailWriter" value="Y" <c:if test="${tailWriter=='Y' }">checked</c:if>>
										<span>댓글작성자</span>
									</label>
									<input type="text" class="frm_input sm m240" name="keyWord" id="keyWord" value="${keyWord}" aria-label="검색어 입력" placeholder="검색어를 입력하세요.">
									<button type="button" class="el_btn frm_btn deep sm w100" onclick="searchval()">검색</button>
								</div>
							</div>
						</div>
					</form>
					<!-- //search -->
				</div>

				<!-- board list -->
				<table class="tbl type2 mt30">
					<caption>선수 목록</caption>
					<colgroup>
						<col width="88">
						<col width="370">
						<col width="100">
						<col width="100">
						<col width="150">
						<col width="80">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">내용미리보기</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일시</th>
							<th scope="col">조회수</th>
							<th scope="col">노출여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${topFreeList}" var="topFreeList">
						<tr>
							<td style="font-weight: bold; color: darkblue;">공지</td>
							<td style="text-align: left;"><a href="fFreeDetail?num=${topFreeList.num }&listpage=${currentPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}">${topFreeList.subject}</a>
							<c:if test="${topFreeList.tail_count != '0' }">
								<span class="count">[${topFreeList.tail_count }]</span>
							</c:if> 
							</td>
							<td>
								<input type="hidden" name="num" value="${topFreeList.num}">
								<button type="button" class="openModal freeData" data-target="#detailPopup">[미리보기]</button>
							</td>
							<td>${topFreeList.writer}</td>
							<td>${topFreeList.formatted_date}</td>
							<td>${topFreeList.visited}</td>
							<c:if test="${topFreeList.chk_del == 'N' }"><td><button type="button" class="toggle" onclick="showYn('${topFreeList.num}','${topFreeList.chk_del }')">O</button></td></c:if>
							<c:if test="${topFreeList.chk_del == 'Y' }"><td><button type="button" class="toggle" onclick="showYn('${topFreeList.num}','${topFreeList.chk_del }')">X</button></td></c:if>
						</tr>
					</c:forEach>
						<c:forEach items="${freeList}" var="freeList">
						<tr>
							<td>${freeList.rownum}</td>
							<td style="text-align: left;"><a href="fFreeDetail?num=${freeList.num }&listpage=${currentPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}">${freeList.subject}</a>
							<c:if test="${freeList.tail_count != '0' }">
								<span class="count">[${freeList.tail_count }]</span>
							</c:if> 
							</td>
							<td>
								<input type="hidden" name="num" value="${freeList.num}">
								<button type="button" class="openModal freeData" data-target="#detailPopup">[미리보기]</button>
							</td>
							<c:if test="${freeList.writer =='KCC농구단'}">
								<td>${freeList.writer}</td>
							</c:if>
							<c:if test="${freeList.writer !='KCC농구단'}">
							<td>
								<input type="hidden" name="id" value="${freeList.id}">
								<button type="button" class="writerData">${freeList.writer}</button>
								<button type="button" id="writerPop" class="openModal blind" data-target="#memberPopup"></button>
							</td>
							</c:if>
							<td>${freeList.formatted_date}</td>
							<td>${freeList.visited}</td>
							<c:if test="${freeList.chk_del == 'N' }"><td><button type="button" class="toggle" onclick="showYn('${freeList.num}','${freeList.chk_del }')">O</button></td></c:if>
							<c:if test="${freeList.chk_del == 'Y' }"><td><button type="button" class="toggle" onclick="showYn('${freeList.num}','${freeList.chk_del }')">X</button></td></c:if>
						</tr>
					</c:forEach>
					<c:if test="${empty freeList}">
							<tr><td colspan="7">검색된 결과가 없습니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty freeList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="fFreeList?page=1&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="fFreeList?page=${startPage-1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="fFreeList" value="fFreeList?&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${fFreeList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="fFreeList?page=${endPage+1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="fFreeList?page=${maxPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&chk_del=${chk_del}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="fFreeWrite" class="el_btn md line">등록</a>
				</div>
				<!-- 작성자 정보 팝업 -->
				<div id="memberPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">작성자 정보</h4>
							</div>

							<div class="modal_body">
								<!-- 작성자 정보 -->
								<div class="board_write">
									<table class="tbl type1">
										<caption>작성자 정보 테이블</caption>
										<colgroup>
										<col width="167">
										<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="md"><label for="mb_id">회원명(ID)</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_id" value="" readonly>
												</td>
											</tr>
											<tr id="joindata">
												<th scope="row" class="md"><label for="mb_join">가입일</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_join" value="" readonly>
												</td>
											</tr>
											<tr id="logindata">
												<th scope="row" class="md"><label for="mb_login">최종 로그인</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_login" value="" readonly>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 작성자 정보 팝업 -->
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">내용 미리보기</h4>
							</div>

							<div class="modal_body">
								<!-- 작성자 정보 -->
								<div class="board_write">
									<table class="tbl type1">
										<caption>내용 미리보기 테이블</caption>
										<colgroup>
										<col width="167">
										<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="md"><label for="mb_id">회원명(ID)</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_id2" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_write">등록일시</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_write" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_subject">제목</label></th>
												<td>
													<input type="text" class="frm_input" id="mb_subject" value="" readonly>
												</td>
											</tr>
											<tr>
												<th scope="row" class="md"><label for="mb_content">내용</label></th>
												<td>
													<textarea class="frm_input" id="mb_content" readonly></textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 작성자 정보 팝업 -->
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->
		<script>
		$(document).on('click', '.writerData', function() {
			var writerId = $(this).prev().val();
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "writerData",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "writerId": writerId
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	if(res != null && res != ""){
			        		$("#writerPop").trigger("click");
				        	$("#mb_id").val(res.name + " ("+res.id+")");
				        	$("#mb_join").val(res.regDate);
				        	$("#mb_login").val(res.loginDate);
				        }else{
				        	alert("탈퇴한 회원입니다.");
				        	$("#mb_id").val("탈퇴한 회원입니다.");
				        	$("#mb_join").val("");
				        	$("#mb_login").val("");
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
		});
		$(document).on('click', '.freeData', function() {
			var num = $(this).prev().val();
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "detailData",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num": num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	if(res != null && res != ""){
			        		if(res.writer =='KCC농구단'){
			        			$("#mb_id2").val(res.writer);
			        		}else{
			        			$("#mb_id2").val(res.writer+" ("+res.id+")");
			        		}
				        	$("#mb_write").val(res.formatted_date);
				        	$("#mb_subject").val(res.subject);
				        	$("#mb_content").val(res.content2);
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
		});
		</script>
	</div>
</body>
</html>