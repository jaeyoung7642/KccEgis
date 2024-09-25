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
	<script src="/ckeditor/ckeditor.js"></script>
	<script>
	$(function() {
	var useYn = $("input[name='main_chk']:checked").val();
		if(useYn=='Y'){
			$('#popOrder').show();
		}else{
			$('#popOrder').hide();
		}
	});
	function orderShow(val){
		if(val=='Y'){
			$('#popOrder').show();
		}else{
			$('#popOrder').hide();
		}
	}
	function mainChkCount(){
		var mainChk = $("input[name='main_chk']:checked").val();
		var form = $("#popForm");
		var num = $("#num").val();
	 	if(mainChk=='Y'){
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "mainChkCount",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	"num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res>4){
				       	 	alert("최대 출력 슬라이드 5개를 초과했습니다.기존 출력 게시물을 변경 후 진행해주시기 바랍니다.");
				        }else{
				        	 form.submit();
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
		}else{
			form.submit();
		} 
	}
	</script>
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
					<h3 class="aside_title">ETC</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="ePopupList" class="snb_link current">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList" class="snb_link">메인슬라이드 관리</a></li>
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

				<h3 class="heading">팝업</h3>

				<form action="/kccadm/mergePopup" enctype="multipart/form-data" method="post" id="popForm">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>팝업 등록 테이블</caption>
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
									<th scope="row">기간</th>
									<td>
										<div class="frm_group gap8">
											<div class="col">
												<input type="text" class="frm_input w163 date" aria-label="시작 일" name="sDay" value="${result.s_day}">
												<input type="text" class="frm_input w50" aria-label="시작 시간" name="sTime" value="${result.s_time}"> 시
											</div>
											<div class="col">
												<input type="text" class="frm_input w50" aria-label="시작 분"  name="sMinute" value="${result.s_minute}"> 분
											</div>
											<span class="dash">~</span>
											<div class="col">
												<input type="text" class="frm_input w163 date" aria-label="종료 일" name="eDay" value="${result.e_day}">
												<input type="text" class="frm_input w50" aria-label="종료 시간"  name="eTime" value="${result.e_time}"> 시
											</div>
											<div class="col">
												<input type="text" class="frm_input w50" aria-label="종료 분"  name="eMinute" value="${result.e_minute}"> 분
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">PC 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="pop_img" id="pop_img">
													<span class="frm_input gray m400">
													<c:if test="${result.pop_img != null }">
														${result.pop_img }
													</c:if>
													<c:if test="${result.pop_img == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [400X500]</span>
											<input type="hidden" name="pop_img_bf" id="pop_img_bf" value="${result.pop_img}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">Mobile 이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="pop_img2" id="pop_img2">
													<span class="frm_input gray m400">
													<c:if test="${result.pop_img2 != null }">
														${result.pop_img2 }
													</c:if>
													<c:if test="${result.pop_img2 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [800X1000]</span>
											<input type="hidden" name="pop_img2_bf" id="pop_img2_bf" value="${result.pop_img2}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">링크 사용여부</th>
									<td>
									<c:if test="${result.map_chk != null }">
										<div class="frm_group gap14">
											<label class="frm_radio type1">
												<input type="radio" name="map_chk" value="0" <c:if test="${result.map_chk == '0'}">checked</c:if>>
												미사용
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="map_chk" value="1"<c:if test="${result.map_chk == '1'}">checked</c:if>>
												사용
											</label>
										</div>
									</c:if>
									<c:if test="${result.map_chk == null }">
										<div class="frm_group gap14">
											<label class="frm_radio type1">
												<input type="radio" name="map_chk" value="0" checked>
												미사용
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="map_chk" value="1">
												사용
											</label>
										</div>
									</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">링크 Target</th>
									<td>
									<c:if test="${result.map_target != null }">
										<div class="frm_group gap14">
											<label class="frm_radio type1">
												<input type="radio" name="map_target" value="0" <c:if test="${result.map_target == '0'}">checked</c:if>>
												사이트내부
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="map_target" value="1" <c:if test="${result.map_target == '1'}">checked</c:if>>
												외부새창
											</label>
										</div>
									</c:if>
									<c:if test="${result.map_target == null }">
										<div class="frm_group gap14">
											<label class="frm_radio type1">
												<input type="radio" name="map_target" value="0" checked>
												사이트내부
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="map_target" value="1">
												외부새창
											</label>
										</div>
									</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="map_url">링크</label></th>
									<td>
										<input type="text" class="frm_input" id="map_url" name="map_url" value="${result.map_url}">
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.main_chk != null }">
											<label class="frm_radio type1">
												<input type="radio" name="main_chk" value="Y" <c:if test="${result.main_chk == 'Y'}">checked</c:if> onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="main_chk" value="N" <c:if test="${result.main_chk == 'N'}">checked</c:if> onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										<c:if test="${result.main_chk == null }">
											<label class="frm_radio type1">
												<input type="radio" name="main_chk" value="Y" onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="main_chk" value="N" checked onchange="orderShow(this.value)"> 
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr id="popOrder">
									<th scope="row"><label for="order">출력순서</label></th>
									<td>
										<select class="frm_select" id="order" name="order" aria-label="출력순서 선택">
											<option value="1" <c:if test="${result.order eq '1'}">selected</c:if>>1</option>
											<option value="2" <c:if test="${result.order eq '2'}">selected</c:if>>2</option>
											<option value="3" <c:if test="${result.order eq '3'}">selected</c:if>>3</option>
											<option value="4" <c:if test="${result.order eq '4'}">selected</c:if>>4</option>
											<option value="5" <c:if test="${result.order eq '5'}">selected</c:if>>5</option>
										</select>
										<span class="el_info">※ 숫자가 작을수록 우선순위 입니다.</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="mainChkCount()">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deletePopup(${result.num })">삭제</button>
					</div>
				</form>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>