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
	var useYn = $("input[name='show_yn']:checked").val();
		if(useYn=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	var category = $("input[name='category']:checked").val();
		if(category=='C'){
			$("#view_order").empty();
			for(var i=1;i<6;i++){
				if(orderVal ==i){
					$("#view_order").append("<option value='"+i+"' selected>"+i+"</option>");
				}else{
					$("#view_order").append("<option value='"+i+"'>"+i+"</option>");					
				}
			}
			$('.frm_select').niceSelect('update');
		}else{
			$("#view_order").empty();
			for(var i=1;i<4;i++){
				if(orderVal ==i){
					$("#view_order").append("<option value='"+i+"' selected>"+i+"</option>");
				}else{
					$("#view_order").append("<option value='"+i+"'>"+i+"</option>");					
				}
			}
			$('.frm_select').niceSelect('update');
		}
	});
	function orderShow(val){
		if(val=='Y'){
			$('#order').show();
		}else{
			$('#order').hide();
		}
	}
	function orderAppend(val){
		var orderVal = $("#orderVal").val();
		if(val=='C'){
			$("#view_order").empty();
			for(var i=1;i<6;i++){
				if(orderVal ==i){
					$("#view_order").append("<option value='"+i+"' selected>"+i+"</option>");
				}else{
					$("#view_order").append("<option value='"+i+"'>"+i+"</option>");					
				}
			}
			$('.frm_select').niceSelect('update');
		}else{
			$("#view_order").empty();
			for(var i=1;i<4;i++){
				if(orderVal ==i){
					$("#view_order").append("<option value='"+i+"' selected>"+i+"</option>");
				}else{
					$("#view_order").append("<option value='"+i+"'>"+i+"</option>");					
				}
			}
			$('.frm_select').niceSelect('update');
		}
	}
	function mainGoodsCount(){
		var useYn = $("input[name='show_yn']:checked").val();
		var category = $("input[name='category']:checked").val();
		var form = $("#mainGoodsForm");
		var num = $("#num").val();
	 	if(useYn=='Y'){
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "mainGoodsCount",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			        	"num":num,
			        	"category":category
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	if(category=='C'){
				       	 	if(res>4){
				        		alert("굿즈 출력 게시물 5개를 초과되었습니다. 출력 설정한 게시물을 수정 후 다시 진행해 주세요");
				       	 	}else{
				    	   	 	form.submit();
				       	 	}
			        	}else{
				       	 	if(res>2){
				        		alert("BEST 출력 게시물 3개를 초과되었습니다. 출력 설정한 게시물을 수정 후 다시 진행해 주세요");
				       	 	}else{
				   	    	 	form.submit();
				       	 	}
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
	function openPhoto(){
		if($('#img1Txt').text().trim() === '' || $('#img1Txt')[0].innerText =='사진을 첨부하세요.'){
			alert("선택된 파일이 없습니다.");
		}else{
			$('#img1Pop').trigger('click');
		}
	}
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = '';
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
							<li><a href="ePopupList" class="snb_link">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList" class="snb_link">메인슬라이드 관리</a></li>
							<li><a href="eMainGoodsList" class="snb_link current">메인굿즈 관리</a></li>
							<!-- <li><a href="eProposalList" class="snb_link">건의하기</a></li> -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">메인굿즈관리</h3>

				<form action="mergeMainGoods" enctype="multipart/form-data" method="post" id="mainGoodsForm">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>메인굿즈 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="goods_nm">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="goods_nm" name="goods_nm" placeholder="제목을 입력하세요." value="${result.goods_nm}" required>
									</td>
								</tr>
								<tr>
									<th scope="row">이미지</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="goods_img" id="goods_img" required onchange="readURL(this);">
													<span class="frm_input gray m400" id="img1Txt">
													<c:if test="${result.goods_img != null }">
														${result.goods_img }
													</c:if>
													<c:if test="${result.goods_img == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto()">사진보기</button>
											<button class="openModal" id="img1Pop" data-target="#detailPopup"></button>
											<input type="hidden" name="goods_img_bf" id="goods_img_bf" value="${result.goods_img}">
										</div>
										<span class="el_info">※ 일반 이미지 사이즈 [540X540]  &nbsp;&nbsp;&nbsp;&nbsp;※ 베스트 이미지 사이즈 [270X230]</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="goods_price">상품가격</label></th>
									<td>
										<input type="number" class="frm_input" id="goods_price" name="goods_price" value="${result.goods_price}" required>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="goods_link">링크</label></th>
									<td>
										<input type="text" class="frm_input" id="goods_link" name="goods_link" value="${result.goods_link}">
									</td>
								</tr>
								<tr>
									<th scope="row">굿즈 설정</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.category != null }">
											<label class="frm_radio type1">
												<input type="radio" name="category" value="C" <c:if test="${result.category == 'C'}">checked</c:if> onchange="orderAppend(this.value)">
												일반
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="category" value="B" <c:if test="${result.category == 'B'}">checked</c:if> onchange="orderAppend(this.value)">
												BEST
											</label>
										</c:if>
										<c:if test="${result.category == null }">
											<label class="frm_radio type1">
												<input type="radio" name="category" value="C" checked onchange="orderAppend(this.value)">
												일반
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="category" value="B" onchange="orderAppend(this.value)">
												BEST
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.show_yn != null }">
											<label class="frm_radio type1">
												<input type="radio" name="show_yn" value="Y" <c:if test="${result.show_yn == 'Y'}">checked</c:if> onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="show_yn" value="N" <c:if test="${result.show_yn == 'N'}">checked</c:if> onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										<c:if test="${result.show_yn == null }">
											<label class="frm_radio type1">
												<input type="radio" name="show_yn" value="Y" onchange="orderShow(this.value)">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="show_yn" value="N" checked onchange="orderShow(this.value)">
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr id="order">
									<th scope="row"><label for="view_order">출력순서</label></th>
									<td>
									<input type="hidden" id="orderVal" value="${result.view_order }">
										<select class="frm_select w100" id="view_order" name="view_order" aria-label="출력순서 선택">
											<option value="1" <c:if test="${result.view_order eq '1'}">selected</c:if>>1</option>
											<option value="2" <c:if test="${result.view_order eq '2'}">selected</c:if>>2</option>
											<option value="3" <c:if test="${result.view_order eq '3'}">selected</c:if>>3</option>
										</select>
										<span class="el_info">※ 숫자가 작을수록 우선순위 입니다.</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="mainGoodsCount()">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteMainGoods(${result.num })">삭제</button>
					</div>
				</form>
			<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">사진보기</h4>
							</div>

							<div class="modal_body custom_scroll" style="text-align:center;">
								<!-- 작성자 정보 -->
								<img src="/resources/common/images/upload/main_goods/${result.goods_img}" id="preview" alt="">
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 미리보기 팝업 -->
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>