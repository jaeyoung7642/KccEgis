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
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<script>
	function tailSave(num){
		var content = $("#tailWrite").val();
		 $.ajax({
		   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "insertFreeTail",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "content":content,
		       	 "num": num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
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
	function freeTailDelete(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "deleteFreeTail",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
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
	            
	        } else {
	            return;
	        }
		}
	function deleteFree(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "deleteFree",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.href = 'fFreeList';
				        }else{
				       	 alert("변경에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
	            
	        } else {
	            return;
	        }
		}
	</script>
</head>
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

				<h3 class="heading">팬게시판</h3>

				<form action="mergeFree" enctype="multipart/form-data" method="post">
				<input type="hidden" name="num" id="num" value="${result.num }">
				<input type="hidden" name="id" id="id" value="${result.id }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>팬게시판 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="subject">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="subject" name="subject" placeholder="제목을 입력하세요." value="${result.subject}">
									</td>
								</tr>
								<tr>
									<th scope="row">구분</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.flag != null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" <c:if test="${result.flag == 'Y'}">checked</c:if>>
												공지
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N" <c:if test="${result.flag != 'Y'}">checked</c:if>>
												일반글
											</label>
										</c:if>
										<c:if test="${result.flag == null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" >
												공지
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N" checked>
												일반글
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="writer">작성자</label></th>
									<td>
										<input type="text" class="frm_input" name="writer" id="writer" value="${result.writer}" readonly>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>
										<!-- 편집기 영역 -->
										<textarea name="content" id="ckeditor" cols="30" rows="10" class="frm_input">${result.content }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button  class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteFree(${result.num});">삭제</button>
					</div>
				</form>
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
	<script>
	$(function() {
		CKEDITOR.replace('ckeditor',{
			uploadUrl: "/fileupload.do/drag",
			filebrowserUploadUrl:  "/fileupload.do",
			toolbar: [
			    { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
			    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
			    { name: 'paragraph', items: [ 'Blockquote','Indent','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
			    { name: 'insert', items: [ 'Image', 'Table', 'SpecialChar' ] },
			    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
			    { name: 'Styles', items: [ 'Font', 'FontSize' ] },
			    { name: 'Links', items: [ 'Link'] },
			],
			font_names: '맑은 고딕/Malgun Gothic;' +
            '돋움/Dotum;' +
            '굴림/Gulim;' +
            '바탕/Batang;' +
            '궁서/Gungsuh;' +
            'HY견고딕/HY견고딕;' +
            'HY견명조/HY견명조'
		});
	});
    </script>
</body>
</html>