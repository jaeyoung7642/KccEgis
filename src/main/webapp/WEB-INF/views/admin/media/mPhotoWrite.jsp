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
	<link rel="stylesheet" href="/resources/common/admin/assets/css/jquery-ui.min.css"> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
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
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">MEDIA</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="mNewsList" class="snb_link">뉴스</a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="mMovieList" class="snb_link">영상</a></li>
						<li><a href="mPhotoList" class="snb_link current">사진</a></li>
						<li><a href="mGalleryList" class="snb_link">23-24시즌 이전 사진</a></li>
						<li><a href="mSearchWrite" class="snb_link">검색어 관리</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">사진</h3>

				<form action="mergeMediaPhoto" enctype="multipart/form-data" method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<input type="hidden" name="part" id="part" value="photo">
					<input type="hidden" name="flag" id="flag" value="N">
					<input type="hidden" name="visited" id="visited" value="${result.visited }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>사진 등록 테이블</caption>
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
										<select class="frm_select m400" aria-label="구분" name="etc1" id="etc1">
											<option value="H" <c:if test="${result.etc1 eq 'H'}">selected</c:if>>경기</option>
											<option value="E" <c:if test="${result.etc1 eq 'E'}">selected</c:if>>이벤트</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="n_date">경기일</label></th>
									<td>
										<div class="frm_group">
											<input type="text" class="frm_input w400" id="game_date_nm" name="game_date_nm" placeholder="경기일을 입력하세요." value="${result.game_date_nm }">
											<input type="hidden" id="game_date" name="game_date" value="${result.game_date }">
											<button type="button" class="el_btn btn frm_btn line2 openModal" data-target="#matchDayPopup">경기 선택</button>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="tags">키워드 태그</label></th>
									<td>
										<div class="frm_group">
											<input type="text" class="frm_input w400" name="keyword_tag" id="keyword_tag" placeholder="태그를 입력하세요." readonly value="${result.keyword_tag}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">사진등록</th>
									<td class="addInputArea">
									<c:if test="${result.photoList ==null}">
									<div class="frm_group gap20">
										<div class="frm_group">
											<div class="frm_file">
												<label> <input type="file" aria-label="파일등록"id="p_file_0" name="files">
												 <span class="frm_input gray w268">사진등록을 첨부하세요.</span>
												</label> <a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
										</div>
										<div class="frm_group">
											<input type="hidden" name="photo_num" value="${result.photo_num }">
											 <input type="text" class="frm_input w268" name="tags_nm" placeholder="태그를 입력하세요." value="${result.tags_nm}">
											<input type="hidden" name="tags" value="${result.tags}">
											<button type="button" class="el_btn btn frm_btn line2 openModal tagPop" data-target="#tagPopup">태그 선택</button>
											<button type="button" class="el_btn ccl add addInput" aria-label="추가"></button>
										</div>
									</div>
										</c:if>
									<c:forEach items="${result.photoList}" var="photoList" varStatus="status">
										<c:choose>
										  <c:when test="${status.first}">
										     <div class="frm_group gap20">
										  </c:when>
										<c:otherwise>
										   <div class="frm_group gap20 mt10">
										</c:otherwise>
										</c:choose>
											<div class="frm_group">
												<div class="frm_file">
													<label>
														<input type="file" aria-label="파일등록" id="p_file_${status.index }" name="files">
														<input type="hidden" name="photofile_bf" value="${photoList.photofile}">
														<c:if test="${photoList.photofile != null && photoList.photofile != ''}">
															<span class="frm_input gray w268">${photoList.photofile }</span>
														</c:if>
														<c:if test="${photoList.photofile == null || photoList.photofile == ''}">
															<span class="frm_input gray w268">사진을 첨부하세요.</span>
														</c:if>
													</label>
													<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
												</div>
											</div>
											<div class="frm_group">
												<input type="hidden" name="photo_num" value="${photoList.num }">
												<input type="text" class="frm_input w268" name="tags_nm" placeholder="태그를 입력하세요." id="p_tag_${status.index }" value="${photoList.tags_nm}" readonly>
												<input type="hidden" name="tags" value="${photoList.tagcode}">
												<button type="button" class="el_btn btn frm_btn line2 openModal tagPop" data-target="#tagPopup">태그 선택</button>
												<c:choose>
												  <c:when test="${status.first}">
												     <button type="button" class="el_btn ccl add addInput" aria-label="추가"></button>
												  </c:when>
												<c:otherwise>
												   <button type='button' class='el_btn ccl remove removeInput' aria-label='추가'></button>
												</c:otherwise>
												</c:choose>
											</div>
										</div>
									</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">썸네일</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img1" id="img1">
													<span class="frm_input gray m400">
													<c:if test="${result.img1 != null && result.img1 != '' }">
														${result.img1 }
													</c:if>
													<c:if test="${result.img1 == null || result.img1 == ''}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [410X273]</span>
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">메인용썸네일</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img2" id="img2">
													<span class="frm_input gray m400">
													<c:if test="${result.img2 != null && result.img2 != '' }">
														${result.img2 }
													</c:if>
													<c:if test="${result.img2 == null || result.img2 == ''}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 가로 사이즈 [410X273] 세로 사이즈 [410X616]</span>
											<input type="hidden" name="img2_bf" id="img2_bf" value="${result.img2}">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteNews(${result.num },'${result.part}')">삭제</button>
					</div>
				</form>
				<!-- 경기일 선택 팝업 -->
				<div id="matchDayPopup" tabindex="-1" class="matchDayPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">경기일 선택</h4>
							</div>

							<div class="modal_body">
								<!-- tabs -->
								<div class="page_tabs type2 col4">
									<button type="button" class="tab round active">1R</button>
									<button type="button" class="tab round">2R</button>
									<button type="button" class="tab round">3R</button>
									<button type="button" class="tab round">4R</button>
									<button type="button" class="tab round">5R</button>
									<button type="button" class="tab round">6R</button>
									<button type="button" class="tab round">PO</button>
									<button type="button" class="tab round">CH</button>
								</div>
								<!-- // tabs -->

								<!-- 경기일 -->
								<div class="result_box mt15 custom_scroll" id="gameListView">
									<c:forEach items="${gameList}" var="gameList">
										<input type="hidden"  value="${gameList.gameCd}">
										<a href="#" class="gameCds">${gameList.gameNm}</a>
									</c:forEach>
								</div>
								<!-- // 경기일 -->

								<div class="btn_area mt40">
									<button type="button" class="el_btn md line closeModal conform">확인</button>
									<button type="button" class="el_btn md line closeModal">취소</button>
								</div>
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 경기일 선택 팝업 -->
				<!-- 태그선택 팝업 -->
				<div id="tagPopup" tabindex="-1" class="tagPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">태그선택</h4>
							</div>

							<div class="modal_body custom_scroll">
				
								<!-- 태그 -->
								<div class="tags">
									<c:forEach items="${selectPlayer}" var="selectPlayer">
									<div class="tag">
										<label class="frm_checkbox type2">
											<input type="checkbox" name="check_tags" value="${selectPlayer.playerCd}">
											${selectPlayer.playerNm}
										</label>
									</div>
									</c:forEach>
								</div>
								<!-- // 태그 -->

								<div class="btn_area mt40">
									<button type="button" class="el_btn md line closeModal conform">확인</button>
									<button type="button" class="el_btn md line closeModal">취소</button>
								</div>
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 태그선택 팝업 -->
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->
		<script>
		let gameCd;
		let gameNm;
		let playerCd;
		let playerNm;
		var tagNmInput;
		var tagCdInput;
		// 사진등록 추가
		const $addFormArea = $('.addInputArea');
		let formIndex = $('.gap20').length;

		const addForm = (idx) => {
			const inputElm = "<div class='frm_group gap20 mt10'><div class='frm_group'><div class='frm_file'><label>"
							+"<input type='file' aria-label='파일등록' id='p_file_"+idx+"' name='files'>"
							+"<span class='frm_input gray w268'>사진등록을 첨부하세요.</span></label>"
							+"<a href='#' class='el_btn btn frm_btn line2'>파일찾기</a></div></div>"
							+"<div class='frm_group'><input type='hidden' name='photo_num' value='${result.photo_num }'>"
							+"<input type='text' class='frm_input w268' name='tags_nm' readonly placeholder='태그를 입력하세요.' id='p_tag_"+idx+"'>"
							+"<input type='hidden' name='tags' value='${result.tags}'>"
							+"<button type='button' class='el_btn btn frm_btn line2 openModal tagPop' data-target='#tagPopup'>태그 선택</button>"
							+"<button type='button' class='el_btn ccl remove removeInput' aria-label='추가'></button></div></div>";
			$addFormArea.append(inputElm);
		}

		$(document).on('click', '.addInput', function(e) {
			formIndex++;
			addForm(formIndex)
		});

		$(document).on('click', '.removeInput', function() {
			formIndex--;
			$(this).parents('.frm_group').remove();
		});
		// 경기일 선택
		$(document).on('click', '.matchDayPopup .result_box a', function() {
			$(this).toggleClass('selected');
			$(this).siblings('a').removeClass('selected');
			gameNm = $(this).text();
			gameCd = $(this).prev('input').val();
			console.log(gameNm);		
			console.log(gameCd);
			console.log($('.gameCds.selected').length);
		});

		$(document).on('click', '#matchDayPopup .conform', function() {
			if($('.gameCds.selected').length>0){
				$('#game_date').val(gameCd);
				$('#game_date_nm').val(gameNm);
			}else{
				$('#game_date').val('');
				$('#game_date_nm').val('');
			}
		});

		$(document).on('click', '.tagPop', function() {
			tagNmInput = $(this).prev().prev();
			tagCdInput = $(this).prev();
			$('input[name=check_tags]').prop('checked',false);
		});
		$(document).on('click', '#tagPopup .conform', function() {
			var checkedCds = [];
			var checkedNms = [];
			_.forEach($(".frm_checkbox input:checked"), function(obj) {
				checkedNms.push($(obj).parent().text().trim());  
				checkedCds.push(obj.value);  
	    	});
			tagNmInput.val(checkedNms);
			tagCdInput.val(checkedCds);
		});
		$(document).on('click', '.round', function() {
			$(this).toggleClass('active');
			$(this).siblings('button').removeClass('active');
			var text = $(this).text();
			var type = "";
			var game_round = "";
			switch (text) {
			  case '1R':
			    type = "01";
			    game_round = "1";
			    break;
			  case '2R':
				type = "01";
				game_round = "2";
			    break;
			  case '3R':
			  	type = "01";
			    game_round = "3";
			    break;
			  case '4R':
		  		type = "01";
			    game_round = "4";
			    break;
			  case '5R':
			  	type = "01";
			    game_round = "5";
			    break;
			  case '6R':
			  	type = "01";
			    game_round = "6";
			    break;
			  case 'PO':
			  	type = "03";
			    game_round = "1";
			    break;
			  case 'CH':
			  	type = "04";
			    game_round = "1";
			    break;
			}
			$.ajax({
			   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
			        url : "/kccadm/gameList",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "game_round":game_round,
			       	 "type":type
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        	$("#gameListView").empty();
				        if(res.length>0){
				        	res.forEach(function(item) {
				                $("#gameListView").append("<input type='hidden' value='"+item.gameCd+"'>"
				                		+"<a href='#' class='gameCds'>"+item.gameNm+"</a>");
				            });
				        }else{
				        	alert('데이터가 없습니다.');
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