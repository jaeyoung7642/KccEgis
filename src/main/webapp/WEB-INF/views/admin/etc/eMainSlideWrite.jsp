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
	$(function() {
	var useYn = $("input[name='use_yn']:checked").val();
		if(useYn=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	});
	function orderShow(val){
		if(val=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	}
	function useYnCount(){
		var useYn = $("input[name='use_yn']:checked").val();
		var form = $("#mainSlideForm");
		var num = $("#num").val();
	 	if(useYn=='Y'){
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "useYnCount",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	"num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res>2){
				       	 	alert("최대 출력 슬라이드 3개를 초과했습니다.기존 출력 게시물을 변경 후 진행해주시기 바랍니다.");
				        }else{
				        	form.submit();
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
		}else{
			form.submit();
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
					<h3 class="aside_title">ETC</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="ePopupList" class="snb_link">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList" class="snb_link current">메인슬라이드 관리</a></li>
							<li><a href="eMainGoodsList" class="snb_link">메인굿즈 관리</a></li>
							<!-- <li><a href="eProposalList" class="snb_link">건의하기</a></li> -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">메인슬라이드관리</h3>

				<form action="mergeMainSlide" enctype="multipart/form-data" method="post" id="mainSlideForm">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>메인슬라이드 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="title">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="title" name="title" placeholder="제목을 입력하세요." value="${result.title}" required>
									</td>
								</tr>
								<tr>
									<th scope="row">pc 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img1" id="img1">
													<span class="frm_input gray m400">
													<c:if test="${result.img1 != null }">
														${result.img1 }
													</c:if>
													<c:if test="${result.img1 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [1920X951]</span>
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">mobile 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img2" id="img2">
													<span class="frm_input gray m400">
													<c:if test="${result.img2 != null }">
														${result.img2 }
													</c:if>
													<c:if test="${result.img2 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [1125X1380]</span>
											<input type="hidden" name="img2_bf" id="img2_bf" value="${result.img2}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="links">링크</label></th>
									<td>
										<input type="text" class="frm_input" id="links" name="links" value="${result.links}">
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.use_yn != null }">
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="Y" <c:if test="${result.use_yn == 'Y'}">checked</c:if> onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="N" <c:if test="${result.use_yn == 'N'}">checked</c:if> onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										<c:if test="${result.use_yn == null }">
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="Y" onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="use_yn" value="N" checked onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr id="order">
									<th scope="row"><label for="banner_order">출력순서</label></th>
									<td>
										<select class="frm_select" id="banner_order" name="banner_order" aria-label="출력순서 선택">
											<option value="1" <c:if test="${result.banner_order eq '1'}">selected</c:if>>1</option>
											<option value="2" <c:if test="${result.banner_order eq '2'}">selected</c:if>>2</option>
											<option value="3" <c:if test="${result.banner_order eq '3'}">selected</c:if>>3</option>
										</select>
										<span class="el_info">※ 숫자가 작을수록 우선순위 입니다.</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="useYnCount()">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteMainSlide(${result.num })">삭제</button>
					</div>
				</form>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>