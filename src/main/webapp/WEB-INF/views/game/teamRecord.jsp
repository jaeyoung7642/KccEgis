<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="시즌 기록실 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>시즌 기록실 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/game.css"> <!-- 디렉토리  game only -->
	<script src="/resources/common/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/common/assets/js/jquery.scrollDetector.min.js" defer></script>
	<script src="/resources/common/assets/js/lenis.min.js" defer></script>
	<script src="/resources/common/assets/js/swiper-bundle.min.js" defer></script>
	<script src="/resources/common/assets/js/jquery.kinetic.min.js" defer></script>
	<script src="/resources/common/assets/js/common.js" defer></script> 
	<script src="/resources/common/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/sub.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/link.js" defer></script>
	<script src="/resources/common/assets/js/script.js" defer></script> <!-- 개발용 -->
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	let roundIdx = null;
	let roundSort = null;
	$(document).on('click', '.roundSort,.refresh', function() {
		if($(this).hasClass('refresh')){
			$("input[name='round_gu'][value='avg']").prop('checked', true);
			 $.ajax({
		   			type:'Get',
		   			data : {
		   				"round_gu" : "avg",
						"str" : "game_round",
						"sort" : "ASC"
		   			},
		   			url: 'selectRoundGu',
		   			success:function(result){
		   				$('#roundRecord').html(result);
		   	         	swipeEvent();
		   	         },
		   	         error:function(){
		   	            alert('서버에 문제가 있습니다.');
		   	         }
		   		});//ajax
		}else{
			let idx = $(this).data('pickcol');
		     $(this).parent().siblings().find('a').removeClass("active"); 
		     $(this).toggleClass("active"); 
		    var str = $(this).text();
		 // sort
			if (roundIdx === idx) {
				roundSort = roundSort === 'DESC' ? 'ASC' : 'DESC';
			} else {
				roundSort = 'DESC';	
			}	    
		    /*  if ($(this).hasClass('active')) {
		    	sort = "DESC";
		    }else{
		    	sort = "ASC";
		    } */ 
		    roundIdx = idx;
		    /* sort = (sort === null ? "DESC" : null); */
		    console.log(roundSort);
		    var round_gu = $("input[name='round_gu']:checked").val();
		    $.ajax({
	   			type:'Get',
	   			data : {
	   					"round_gu" : round_gu,
						"str" : str,
						"sort" : roundSort
						},
	   			url: 'selectRoundGu',
	   			success:function(result){
	   				$('#roundRecord').html(result);
	   	         	swipeEvent();
		   	          $('.roundSort').each(function() {
	                 if ($(this).text().trim() === str.trim()) {
	                	 selectCol($(this), roundIdx);
		             	}; 
		   	          });
	   	         },
	   	         error:function(){
	   	            alert('서버에 문제가 있습니다.');
	   	         }
	   		});//ajax
		}
	});
	function selectSeason(str){
		$.ajax({
   			type:'Get',
   			data : 'season_gu=' + str,
   			url: 'selectSeasonGu',
   			success:function(result){
   				var row_count_val = $('#row_count', result).val(); // 예시로 input 요소의 값을 가져오는 경우
   				if(row_count_val>3){
   					$(".remove").removeAttr("disabled");
				}else{
					$(".remove").attr("disabled", true);
				}
   	            $('#seasonRecord').html(result);
   	         	swipeEvent();
   	         	fillEmptyCellsWithZero();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	function selectRound(str){
		$.ajax({
   			type:'Get',
   			data : 'round_gu=' + str,
   			url: 'selectRoundGu',
   			success:function(result){
   	            $('#roundRecord').html(result);
   	         	swipeEvent();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	function teamSelect(str){
		if(str==''){
			$("#teamSelectBody").find('tbody').remove();
			$("#teamSelectTop").find('tbody').remove();
			$("#teamSelectImg").find('img').remove();
			$("#teamSelectArea").find('.no_post').remove();
			$("#teamSelectImg").append('<img src="/resources/common/images/game/logo_kbl.png" alt="">');
			$("#teamSelectArea").append('<div class="no_post sm">상태팀을 먼저 선택하세요.</div>');
			$(".selectTeamShow").css("display","none");
		}else{
			$.ajax({
	   			type:'Get',
	   			data : 'team_code=' + str,
	   			url: 'selectTeam',
	   			success:function(result){
	   	            $('#teamSelectInner').html(result);
	   	            
	   	         	swipeEvent();
		   	        customSelect();
		   	     	chartScrollMotion();
		   	     var selectedText = $("#teamSelect option:selected").text();
		   	  	 var selectedVal = $("#teamSelect").val();
			   	  switch(selectedVal) {
			   	  case "06":
			   		$(".otherTeamNm2").text("KT");
			   	    break;
			   	  case "10":
			   		$(".otherTeamNm2").text("현대모비스");
			   	    break;
			   	  case "16":
			   		$(".otherTeamNm2").text("DB");
			   	    break;
			   	  case "35":
			   		$(".otherTeamNm2").text("삼성");
			   	    break;
			   	  case "50":
			   		$(".otherTeamNm2").text("LG");
			   	    break;
			   	  case "55":
			   		$(".otherTeamNm2").text("SK");
			   	    break;
			   	  case "64":
			   		$(".otherTeamNm2").text("한국가스공사");
			   	    break;
			   	  case "66":
			   		$(".otherTeamNm2").text("소노");
			   	    break;
			   	  case "70":
			   		$(".otherTeamNm2").text("정관장");
			   	    break;
			   	}
					$(".otherTeamNm").text(selectedText);
	   	         },
	   	         error:function(){
	   	            alert('서버에 문제가 있습니다.');
	   	         }
	   		});//ajax
		}
	}
	function addRow(){
		var season_gu = $("input[name='season_gu']:checked").val();
		var row_count = parseInt($("#row_count").val()) + 10;
		$.ajax({
   			type:'Get',
   			data : {"season_gu" : season_gu,
   					"row_count" : row_count},
   			url: 'selectSeasonGu',
   			success:function(result){
   				var row_count_val = $('#row_count', result).val(); // 예시로 input 요소의 값을 가져오는 경우
   				if(row_count_val>3){
   					$(".remove").removeAttr("disabled");
   				}
   	            $('#seasonRecord').html(result);
   	         	swipeEvent();
   	         	fillEmptyCellsWithZero();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	function removeRow(){
		var season_gu = $("input[name='season_gu']:checked").val();
		var row_count = parseInt($("#row_count").val()) - 10;
		$.ajax({
   			type:'Get',
   			data : {"season_gu" : season_gu,
   					"row_count" : row_count},
   			url: 'selectSeasonGu',
   			success:function(result){
   				var row_count_val = $('#row_count', result).val(); // 예시로 input 요소의 값을 가져오는 경우
   				if(row_count_val<=3){
   					$(".remove").attr("disabled", true);
   				}
   	            $('#seasonRecord').html(result);
   	         	swipeEvent();
   	         	fillEmptyCellsWithZero();
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	function fillEmptyCellsWithZero() {
	    // seasonRecord ID를 가진 요소를 찾음
	    const seasonRecord = document.getElementById('seasonRecord');
	    
	    // seasonRecord 내의 tbody에서 모든 td 요소를 찾음
	    const tds = seasonRecord.querySelectorAll('tbody td');

	    // 각 td를 반복하여 비어 있는 경우 0으로 설정
	    tds.forEach(td => {
	        if (!td.textContent.trim()) { // 텍스트가 비어 있거나 공백일 경우
	            td.textContent = '0'; // 0으로 설정
	        }
	    });
	}
	</script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
<%
    // teamAndteamList 변수는 서버에서 생성한 데이터 리스트라고 가정합니다.
    List<Map> teamAndteamList = (List<Map>) request.getAttribute("teamAndteamList");
	String jsonTeamAndteamList = new Gson().toJson(teamAndteamList);
%>
<script>
window.onload = function() {
	// JSP에서 생성한 JSON 데이터를 JavaScript 객체로 파싱
    var teamAndteamList = JSON.parse('<%= jsonTeamAndteamList %>'); // jsonTeamAndteamList는 JSP에서 생성한 JSON 문자열입니다.
    for(var i=0;i<teamAndteamList.length;i++){
    	$('.changeTeam').each(function() {
    		if($(this).data('target')==teamAndteamList[i].away_team){
    			var thIndex = $(this).closest('th').index(); // 현재 요소가 포함된 th의 인덱스를 가져옵니다.
    			var $txt14 = $('tbody tr td.txt14').eq(thIndex); // 해당 인덱스에 해당하는 td.txt14 요소를 선택합니다.
                $txt14.text(teamAndteamList[i].win+'승'+teamAndteamList[i].loss+'패');
    		}
    	});
    }
    if($("#teamSelect").val()==''){
	    $(".selectTeamShow").css("display","none");
    }
    fillEmptyCellsWithZero();
};
</script>
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<p class="blind">콘텐츠 바로가기</p>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->

		<!-- container -->
		<main id="container" class="ly_container game">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>GAME</li>
						<li>시즌 기록실</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList" class="swiper-slide snb_link"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link current"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="teamRecord" class="swiper-slide snb_link current"><span>팀 기록</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRecord" class="swiper-slide snb_link"><span>선수 기록 </span></a>
					</div>
				</nav>
			</div>

			<!-- 시즌별 기록 -->
			<section class="section">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">시즌별 기록</h4> 
						<form action="" class="forms">
							<div class="frm_group gap16m">
								<label class="frm_radio type1">
									<input type="radio" name="season_gu" value="avg" checked onchange="selectSeason(this.value)">
									평균
								</label>
								<label class="frm_radio type1">
									<input type="radio" name="season_gu" value="total" onchange="selectSeason(this.value)">
									누적
								</label>
							</div>
						</form>
						<div class="btns rt">
							<button type="button" class="el_btn btn_txt openModal" data-target="#termsInfoPopup">
								<span class="el_ico info"></span> 용어정리
							</button>
						</div> 
					</div>

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe" id="seasonRecord">
					<input type="hidden" id="row_count" value="${row_count }">
						<div class="fixed">
							<table summary="시즌 정보 제공">
								<caption>시즌별 기록 고정영역</caption>
								<colgroup>
									<col class="season">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">시즌</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${seasonResultList}" var="seasonResultList" varStatus="status">
									<tr>
										<td>${seasonResultList.season}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;" class="sort_group">
									<caption>시즌별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="13">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="14">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="15">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="16">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="17">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn" data-pickcol="18">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${seasonResultList}" var="seasonResultList" varStatus="status">
										<tr>
											<td>${seasonResultList.pts}</td>
											<td>${seasonResultList.fg }</td>
											<td>${seasonResultList.fg_a }</td>
											<td>${seasonResultList.fgp }</td>
											<td>${seasonResultList.threep }</td>
											<td>${seasonResultList.threep_a }</td>
											<td>${seasonResultList.threepp }</td>
											<td>${seasonResultList.pp }</td>
											<td>${seasonResultList.pp_a }</td>
											<td>${seasonResultList.ppp }</td>
											<td>${seasonResultList.o_r }</td>
											<td>${seasonResultList.d_r }</td>
											<td>${seasonResultList.r_tot }</td>
											<td>${seasonResultList.ft }</td>
											<td>${seasonResultList.ft_a }</td>
											<td>${seasonResultList.ftp }</td>
											<td>${seasonResultList.t_o }</td>
											<td>${seasonResultList.b_s }</td>
											<td>${seasonResultList.foul_tot }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 기록 테이블 -->

					<div class="btn_area gap12 mt18">
						<a href="#" class="el_btn ccl add"  onclick="addRow();"><span class="blind">더보기</span></a>
						<a href="#" class="el_btn ccl remove" disabled onclick="removeRow();"><span class="blind">닫기</span></a>
					</div>

				</div>
			</section>
			<!-- //시즌별 기록 -->
			<!-- 용어정리 팝업 -->
			<div id="termsInfoPopup" tabindex="-1" class="modal type2 spc_md termsInfoPopup" data-focus="tmodal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_header no_line">
							<h4 class="heading md">용어정리</h4>
						</div>

						<div class="modal_body" data-lenis-prevent>

							<div class="content">
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
										</colgroup>
										<thead>
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>PTS</td>
												<td>총 득점</td>
											</tr>
											<tr>
												<td>2P</td>
												<td>2점슛</td>
											</tr>
											<tr>
												<td>2PA</td>
												<td>2점슛 시도</td>
											</tr>
											<tr>
												<td>2P%</td>
												<td>2점슛 성공률</td>
											</tr>
											<tr>
												<td>3P</td>
												<td>3점슛</td>
											</tr>
											<tr>
												<td>3PA</td>
												<td>3점슛 시도</td>
											</tr>
											<tr>
												<td>3P%</td>
												<td>3점슛 성공률</td>
											</tr>
											<tr>
												<td>PP</td>
												<td>페인트존 득점 성공</td>
											</tr>
											<tr>
												<td>PPA</td>
												<td>페인트존 득점 시도</td>
											</tr>
											<tr>
												<td>PP%</td>
												<td>페이트존 득점 성공률</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
								<!-- tbl -->
								<div class="tbl type2 td_xsm td_line">
									<table summary="명칭, 설명 정보 제공">
										<colgroup>
											<col class="col1">
											<col class="col2">
											<col>
										</colgroup>
										<thead class="xm_hide">
											<tr> 
												<th scope="col">명칭</th>
												<th scope="col">설명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>OFF REB</td>
												<td>공격 리바운드</td>
											</tr>
											<tr>
												<td>DEF REB</td>
												<td>수비 리바운드</td>
											</tr>
											<tr>
												<td>TOT</td>
												<td>공/수 리바운드 총합</td>
											</tr>
											<tr>
												<td>FT</td>
												<td>자유투</td>
											</tr>
											<tr>
												<td>FTA</td>
												<td>자유투 시도</td>
											</tr>
											<tr>
												<td>FT%</td>
												<td>자유투 성공률</td>
											</tr>
											<tr>
												<td>TO</td>
												<td>턴오버</td>
											</tr>
											<tr>
												<td>BS</td>
												<td>블록</td>
											</tr>
											<tr>
												<td>PF</td>
												<td>개인파울</td>
											</tr>
											<tr class="xm_hide">
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //tbl -->
							</div>

						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="tmodal"></button>
					</div>
				</div>
			</div>
			<!-- 용어정리 팝업 -->
			<!-- 라운드별 기록 -->
			<section class="section mt50">
				<div class="ly_inner md">

					<div class="page_header">
						<h4 class="el_heading lv1">라운드별 기록</h4> 
						<form action="" class="forms">
							<div class="frm_group gap16m">
								<label class="frm_radio type1">
									<input type="radio" name="round_gu" checked value="avg" onchange="selectRound(this.value)">
									평균
								</label>
								<label class="frm_radio type1">
									<input type="radio" name="round_gu" value="total" onchange="selectRound(this.value)">
									누적
								</label>
							</div>
						</form>
						<div class="btns rt">
							<a href="#" class="el_btn refresh" aria-label="새로고침"><span class="p_hide">새로고침</span></a>
						</div> 
					</div>

					<!-- 기록 테이블 -->
					<div class="tbl type2 tblSwipe" id="roundRecord">
						<div class="fixed">
							<table summary="라운드 정보 제공">
								<caption>라운드별 기록 고정영역</caption>
								<colgroup>
									<col class="season">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">라운드</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${roundList}" var="roundList" varStatus="status">
									<tr>
										<td>${roundList.game_round}R</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;" class="sort_group">
									<caption>라운드별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="13">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="14">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="15">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="16">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="17">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="18">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${roundList}" var="roundList" varStatus="status">
										<tr>
											<td>${roundList.pts}</td>
											<td>${roundList.fg }</td>
											<td>${roundList.fg_a }</td>
											<td>${roundList.fgp }</td>
											<td>${roundList.threep }</td>
											<td>${roundList.threep_a }</td>
											<td>${roundList.threepp }</td>
											<td>${roundList.pp }</td>
											<td>${roundList.pp_a }</td>
											<td>${roundList.ppp }</td>
											<td>${roundList.o_r }</td>
											<td>${roundList.d_r }</td>
											<td>${roundList.r_tot }</td>
											<td>${roundList.ft }</td>
											<td>${roundList.ft_a }</td>
											<td>${roundList.ftp }</td>
											<td>${roundList.t_o }</td>
											<td>${roundList.b_s }</td>
											<td>${roundList.foul_tot }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${empty roundList}">
							<div class="no_post">첫 경기 이후 데이터가 출력됩니다.</div>
						</c:if>
					</div>
					<!-- 기록 테이블 -->
				</div>
			</section>
			<!-- //라운드별 기록 -->
			
			<!-- 팀&팀 기록 비교 -->
			<section class="section t_record_teams mt50">
			<span class="anchor" id="TEAMRECORD"></span>
				<div class="ly_inner md">

					<!-- 팀&팀 기록 -->
					<article class="grid_header_type1">
						<div class="page_header g_header">
							<h4 class="el_heading lv1">팀&팀 기록 비교</h4> 
						</div>

						<p class="el_desc g_desc">* 표에서 팀명을 클릭하셔도 상대팀 등록이 가능합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type3 tblSwipe g_content">
							<div class="fixed">
								<table summary="팀명 정보 제공">
									<caption>팀&팀 기록 비교 고정영역</caption>
									<colgroup>
										<col class="season">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">팀명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>시즌 전적</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="상대팀 시즌 전적 및 선택버튼 제공" style="--mwth: 100vw; --mmin: 900px;" class="cols9">
										<caption>팀&팀 기록 비교 스크롤영역</caption>
										<thead>
											<tr>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="16">원주 DB</a> <!-- 버튼 클릭 시 아래표 셀렉트 박스 변경 -->
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="50">창원 LG</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="06">수원 KT</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="55">서울 SK</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="10">울산<br> 현대모비스</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="64">대구<br> 한국가스공사</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="66">고양 소노</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="70">안양 정관장</a>
												</th>
												<th scope="col">
													<a href="#" class="el_btn goto changeTeam" data-target="35">서울 삼성</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
												<td class="txt14">0승 0패</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- //비교 테이블 -->
					</article>
					<!-- //팀&팀 기록 -->
					</div>
			</section>
			<!-- //팀&팀 기록 비교 -->
			<section class="change_teams_record mt30">
			<div class="ly_inner md" id="teamSelectInner">
					<!-- 선택팀 기록 (선택팀 없을 때) -->
					<article class="t_record_content bl_card">
						<!-- KCC 이지스 -->
						<div class="team lt p_hide">
							<div class="el_logo md">
								<img src="/resources/common/images/game/logo_60.svg" alt="">
							</div>
							<p class="name">KCC 이지스</p>
						</div>
						<!-- 비교 테이블  -->
						<div class="record">
							<div class="tbl type1  tblSwipe" id="teamSelectArea">
								<div class="fixed">
									<table summary="현재 시즌 순 정보 제공" id="teamSelectTop">
										<caption>선택팀과의 주요 부문 기록 비교 고정영역</caption>
										<colgroup>
											<col class="team2">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">현재 시즌 순위</th>
											</tr>
										</thead>
										<c:if test="${team_code != null && team_code != ''}">
										 <tbody>
											 <tr>
												<td>${result.kccRank.rank }위 : ${result.otherRank.rank }위</td>
											</tr>
										</tbody>
										</c:if>
									</table>
								</div>
								<div class="swipearea">
									<div class="inner">
										<table summary="최근 경기, 현재 시즌 전적, 지난 시즌 전적, 누적 전적 정보 제공" style="--pmin: 480px;--mmin: 510px" id="teamSelectBody">
											<caption>선택팀과의 주요 부문 기록 비교 스크롤영역</caption>
											<colgroup>
												<col width="23.97%">
												<col width="27.94%">
												<col width="27.94%">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col">최근 경기</th>
													<th scope="col">현재 시즌 전적</th>
													<th scope="col">지난 시즌 전적</th>
													<th scope="col">누적 전적</th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${team_code != null && team_code != ''}">
												<tr>
													<td>${result.wl_three }</td>
													<c:if test="${result.currentSeason != null }">
													<td>${result.currentSeason.win }승${result.currentSeason.loss }패</td>
													</c:if>
													<c:if test="${result.currentSeason == null }">
													<td>0승0패</td>
													</c:if>
													<c:if test="${result.prevSeason != null }">
													<td>${result.prevSeason.win }승${result.prevSeason.loss }패</td>
													</c:if>
													<c:if test="${result.prevSeason == null }">
													<td>0승0패</td>
													</c:if>
													<c:if test="${result.totalSeason != null }">
													<td>${result.totalSeason.win }승${result.totalSeason.loss }패</td>
													</c:if>
													<c:if test="${result.totalSeason == null }">
													<td>0승0패</td>
													</c:if>
												</tr>
											</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<c:if test="${team_code == null || team_code == ''}">
								<div class="no_post sm">상태팀을 먼저 선택하세요.</div>
								</c:if>
							</div>
						</div>
						<!-- 상대팀 -->
						<div class="team rt">
							<div class="el_logo md" id="teamSelectImg">
								<c:if test="${team_code != null && team_code != '' }">
								<img src="/resources/common/images/game/logo_${team_code}.svg" alt=""> 
								</c:if>
								<c:if test="${team_code == null || team_code == '' }">
								<img src="/resources/common/images/game/logo_kbl.png" alt="">
								</c:if> 
							</div>
							<select class="frm_select sm" aria-label="상대팀 선택" id="teamSelect" onchange="teamSelect(this.value)">
								<option value="" <c:if test="${team_code eq ''}">selected</c:if>>상대팀</option>
								<option value="16" <c:if test="${team_code eq '16'}">selected</c:if>>원주 DB</option>
								<option value="50" <c:if test="${team_code eq '50'}">selected</c:if>>창원 LG</option>
								<option value="06" <c:if test="${team_code eq '06'}">selected</c:if>>수원 KT</option>
								<option value="55" <c:if test="${team_code eq '55'}">selected</c:if>>서울 SK</option>
								<option value="10" <c:if test="${team_code eq '10'}">selected</c:if>>울산 현대모비스</option>
								<option value="64" <c:if test="${team_code eq '64'}">selected</c:if>>대구 한국가스공사</option>
								<option value="66" <c:if test="${team_code eq '66'}">selected</c:if>>고양 소노</option>
								<option value="70" <c:if test="${team_code eq '70'}">selected</c:if>>안양 정관장</option>
								<option value="35" <c:if test="${team_code eq '35'}">selected</c:if>>서울 삼성</option>
							</select>
						</div>
						<!--   -->
						<div class="btns">
							<a href="scheduleList" class="el_btn ccl ccl2">
								경기일정 <span class="el_ico ico_calendar"></span>
							</a>
						</div>
					</article>
					<!-- 선택팀 기록 -->
			<!-- //팀&팀 기록 비교 -->



			<!-- 주요 기록 비교 -->
					<article class="mt30 selectTeamShow">
						<div class="page_header">
							<h5 class="el_heading lv2">주요 기록 비교</h5> 
						</div>

						<div class="bl_grid col2 gap0m" data-scollOn="once"> 
							<!-- col -->
							<div class="bl_col">
								<div class="game_result staple_record">
									<!-- header -->  
									<div class="header type1">
										<div class="row">
											<span class="col lt">부산 KCC</span>
											<span class="col gray">VS</span>
											<span class="col rt otherTeamNm">${otherTeamNm}</span>
										</div>
									</div> 
									<!-- //header -->
									<div class="content type1">
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.pts}"></span>
												</div>
												<p class="score <c:if test="${kccData.pts >= otherData.pts}">win</c:if>">${kccData.pts }</p>
											</div>
											<div class="col ct">
												<span class="part">득점</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.pts}"></span>
												</div>
												<p class="score <c:if test="${kccData.pts <= otherData.pts}">win</c:if>">${otherData.pts }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.r_tot}"></span>
												</div>
												<p class="score <c:if test="${kccData.r_tot >= otherData.r_tot}">win</c:if>">${kccData.r_tot }</p>
											</div>
											<div class="col ct">
												<span class="part">리바운드</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.r_tot}"></span>
												</div>
												<p class="score <c:if test="${kccData.r_tot <= otherData.r_tot}">win</c:if>">${otherData.r_tot }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.a_s}"></span>
												</div>
												<p class="score <c:if test="${kccData.a_s >= otherData.a_s}">win</c:if>">${kccData.a_s }</p>
											</div>
											<div class="col ct">
												<span class="part">어시스트</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.a_s}"></span>
												</div>
												<p class="score <c:if test="${kccData.a_s <= otherData.a_s}">win</c:if>">${otherData.a_s }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.s_t }"></span>
												</div>
												<p class="score <c:if test="${kccData.s_t >= otherData.s_t}">win</c:if>">${kccData.s_t }</p>
											</div>
											<div class="col ct">
												<span class="part">스틸</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.s_t}"></span>
												</div>
												<p class="score <c:if test="${kccData.s_t <= otherData.s_t}">win</c:if>">${otherData.s_t }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.b_s}"></span>
												</div>
												<p class="score <c:if test="${kccData.b_s >= otherData.b_s}">win</c:if>">${kccData.b_s }</p>
											</div>
											<div class="col ct">
												<span class="part">블록</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.b_s}"></span>
												</div>
												<p class="score <c:if test="${kccData.b_s <= otherData.b_s}">win</c:if>">${otherData.b_s }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.fg}"></span>
												</div>
												<p class="score <c:if test="${kccData.fg >= otherData.fg}">win</c:if>">${kccData.fg }</p>
											</div>
											<div class="col ct">
												<span class="part">2점슛</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.fg}"></span>
												</div>
												<p class="score <c:if test="${kccData.fg <= otherData.fg}">win</c:if>">${otherData.fg }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.threep}"></span>
												</div>
												<p class="score <c:if test="${kccData.threep >= otherData.threep}">win</c:if>">${kccData.threep }</p>
											</div>
											<div class="col ct">
												<span class="part">3점슛</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.threep}"></span>
												</div>
												<p class="score <c:if test="${kccData.threep <= otherData.threep}">win</c:if>">${otherData.threep }</p>
											</div>
										</div>
										<!-- //row -->
									</div>
								</div>
							</div>
							<!-- //col -->
							<!-- col -->
							<div class="bl_col">
								<div class="game_result staple_record">
									<!-- header -->  
									<div class="header type1 p_hide">
										<div class="row">
											<span class="col lt">부산 KCC</span>
											<span class="col gray">VS</span>
											<span class="col rt otherTeamNm">${otherTeamNm}</span>
										</div>
									</div> 
									<!-- //header -->
									<div class="content type1">
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.ft}"></span>
												</div>
												<p class="score <c:if test="${kccData.ft >= otherData.ft}">win</c:if>">${kccData.ft }</p>
											</div>
											<div class="col ct">
												<span class="part">자유투</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.ft }"></span>
												</div>
												<p class="score <c:if test="${kccData.ft <= otherData.ft}">win</c:if>">${otherData.ft }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.t_o}"></span>
												</div>
												<p class="score <c:if test="${kccData.t_o >= otherData.t_o}">win</c:if>">${kccData.t_o }</p>
											</div>
											<div class="col ct">
												<span class="part">턴오버</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.t_o}"></span>
												</div>
												<p class="score <c:if test="${kccData.t_o <= otherData.t_o}">win</c:if>">${otherData.t_o }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.fgp}"></span>
												</div>
												<p class="score <c:if test="${kccData.fgp >= otherData.fgp}">win</c:if>">${kccData.fgp }</p>
											</div>
											<div class="col ct">
												<span class="part">2점슛<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.fgp}"></span>
												</div>
												<p class="score <c:if test="${kccData.fgp <= otherData.fgp}">win</c:if>">${otherData.fgp }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.threepp}"></span>
												</div>
												<p class="score <c:if test="${kccData.threepp >= otherData.threepp}">win</c:if>">${kccData.threepp }</p>
											</div>
											<div class="col ct">
												<span class="part">3점슛<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.threepp}"></span>
												</div>
												<p class="score <c:if test="${kccData.threepp <= otherData.threepp}">win</c:if>">${otherData.threepp }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.ftp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ftp >= otherData.ftp}">win</c:if>">${kccData.ftp }</p>
											</div>
											<div class="col ct">
												<span class="part">자유투<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.ftp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ftp <= otherData.ftp}">win</c:if>">${otherData.ftp }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.ygp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ygp >= otherData.ygp}">win</c:if>">${kccData.ygp }</p>
											</div>
											<div class="col ct">
												<span class="part">야투<br> 성공률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.ygp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ygp <= otherData.ygp}">win</c:if>">${otherData.ygp }</p>
											</div>
										</div>
										<!-- //row -->
										<!-- row -->
										<div class="row">
											<div class="col lt">
												<div class="el_graph type2 horiz lt">
													<span class="bar black" data-value="${kccData.ppp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ppp >= otherData.ppp}">win</c:if>">${kccData.ppp }</p>
											</div>
											<div class="col ct">
												<span class="part">페인트존<br> 득점률(%)</span>
											</div>
											<div class="col rt">
												<div class="el_graph type2 horiz rt">
													<span class="bar gray" data-value="${otherData.ppp}"></span>
												</div>
												<p class="score <c:if test="${kccData.ppp <= otherData.ppp}">win</c:if>">${otherData.ppp }</p>
											</div>
										</div>
										<!-- //row -->
									</div>
								</div>
							</div>
							<!-- //col -->
						</div>
					</article>
					<!-- //주요 기록 비교 -->

					<!-- 경기별 기록 비교 -->
					<article class="grid_header_type1 mt30 selectTeamShow">
						<div class="page_header g_header">
							<h5 class="el_heading lv2">경기별 기록 비교</h5> 
						</div>

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.  </p>

						<!-- 비교 테이블 -->
						<div class="tbl type3 td_sm td_line tblSwipe g_content">
							<div class="fixed">
								<table summary="라운드 정보 제공">
									<caption>경기별 기록 비교 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2" style="height: calc(var(--tblH) * 2);">구분</th>
										</tr> 
									</thead>
									<c:forEach items="${teamAndteamRecordList}" var="teamAndteamRecordList" varStatus="status">
										<tr>
											<td>
												<a href="scheduleResult?season_code=${teamAndteamRecordList.season_code }&game_code=${teamAndteamRecordList.game_code}&game_no=${teamAndteamRecordList.game_no }" class="el_btn goto">${teamAndteamRecordList.game_date }</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="상대팀 시즌 전적 및 선택버튼 제공" style="--pmin: 2100px; --mmin: 1570px;" class="cols28">
										<caption>경기별 기록 비교 스크롤영역</caption>
										<thead>
											<tr>
												<th scope="col" colspan="2">득점</th>
												<th scope="col" colspan="2">리바운드</th>
												<th scope="col" colspan="2">어시스트</th>
												<th scope="col" colspan="2">스틸</th>
												<th scope="col" colspan="2">블록</th>
												<th scope="col" colspan="2">2점슛</th>
												<th scope="col" colspan="2">3점슛</th>
												<th scope="col" colspan="2">자유투</th>
												<th scope="col" colspan="2">턴오버</th>
												<th scope="col" colspan="2">2점슛 성공률(%)</th>
												<th scope="col" colspan="2">3점슛 성공률(%)</th>
												<th scope="col" colspan="2">자유투 성공률(%)</th>
												<th scope="col" colspan="2">야투 성공률(%)</th>
												<th scope="col" colspan="2">페인트존 득점률(%)</th>
											</tr>
											<tr class="lv2 col_group_2">
												<th scope="col">득점</th>
												<th scope="col" class="no_bl">실점</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">${otherTeamNm2}</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${teamAndteamRecordList}" var="teamAndteamRecordList" varStatus="status">
											<tr class="col_group_2">
												<td>${teamAndteamRecordList.kcc_score}</td>
												<td class="no_bl">${teamAndteamRecordList.other_score}</td>
												<td>${teamAndteamRecordList.kcc_r_tot}</td>
												<td class="no_bl">${teamAndteamRecordList.other_r_tot}</td>
												<td>${teamAndteamRecordList.kcc_a_s}</td>
												<td class="no_bl">${teamAndteamRecordList.other_a_s}</td>
												<td>${teamAndteamRecordList.kcc_s_t}</td>
												<td class="no_bl">${teamAndteamRecordList.other_s_t}</td>
												<td>${teamAndteamRecordList.kcc_b_s}</td>
												<td class="no_bl">${teamAndteamRecordList.other_b_s}</td>
												<td>${teamAndteamRecordList.kcc_fg}</td>
												<td class="no_bl">${teamAndteamRecordList.other_fg}</td>
												<td>${teamAndteamRecordList.kcc_threep}</td>
												<td class="no_bl">${teamAndteamRecordList.other_threep}</td>
												<td>${teamAndteamRecordList.kcc_ft}</td>
												<td class="no_bl">${teamAndteamRecordList.other_ft}</td>
												<td>${teamAndteamRecordList.kcc_t_o}</td>
												<td class="no_bl">${teamAndteamRecordList.other_t_o}</td>
												<td>${teamAndteamRecordList.kcc_fgp}</td>
												<td class="no_bl">${teamAndteamRecordList.other_fgp}</td>
												<td>${teamAndteamRecordList.kcc_threepp}</td>
												<td class="no_bl">${teamAndteamRecordList.other_threepp}</td>
												<td>${teamAndteamRecordList.kcc_ftp}</td>
												<td class="no_bl">${teamAndteamRecordList.other_ftp}</td>
												<td>${teamAndteamRecordList.kcc_ygp}</td>
												<td class="no_bl">${teamAndteamRecordList.other_ygp}</td>
												<td>${teamAndteamRecordList.kcc_ppp}</td>
												<td class="no_bl">${teamAndteamRecordList.other_ppp}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${empty teamAndteamRecordList}">
							<div class="no_post">첫 경기 이후 데이터가 출력됩니다.</div>
						</c:if>
						</div>
						<!-- //비교 테이블 -->
					</article>
					<!-- 경기별 기록 비교 -->
			<script>
				// 팀선택 이벤트
				const $teamBtn = $('.changeTeam');
				const $select = $('#teamSelect');

				$teamBtn.on('click', function() {
					const target = $(this).data('target');
					$select.val(target);

					selectUpdate($select);
					teamSelect(target);
				});
			</script>
			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

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