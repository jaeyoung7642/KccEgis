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
$(document).ready(function(){
	$("#60").parents('tr').addClass("point");
});
function teamDailyRankApi(){
	$("body").append('<div class="loading"><span class="loading_box"></span></div>');
    	 $.ajax({
	   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
	        url : "/teamDailyRankApi",      // 컨트롤러에서 대기중인 URL 주소이다.
	        data : {
	        },            // Json 형식의 데이터이다.
	        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	        	loaderClose();
	        	if(res=='true'){
	        		 alert("데이터를 불러왔습니다.");		        		
			       	 location.reload();
			        }else{
			       	 alert("불러오기 실패했습니다.");
			        }
	        },
	        error: function() {
	        	loaderClose();
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
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">GAME</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="gScheduleList" class="snb_link">경기일정/결과</a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="gDailyRank" class="snb_link current">팀순위</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
			<h2 id="con" class="blind">본문</h2>
			<div class="page_header">
				<h3 class="heading">팀순위</h3>
				
				<div class="btns">
					* KBL DB에서 해당 데이터를 불러옵니다.
					<button type="button" class="el_btn btn frm_btn line2" onclick="teamDailyRankApi()">불러오기</button>
				</div>
			</div>



				<!-- board list -->
				<table class="tbl type2">
					<caption>코칭스탭 목록</caption>
					<colgroup>
						<col width="88">
						<col width="">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순위</th>
							<th scope="col">팀명</th>
							<th scope="col">경기수</th>
							<th scope="col">승</th>
							<th scope="col">패</th>
							<th scope="col">연승</th>
							<th scope="col">연패</th>
							<th scope="col">승률</th>
							<th scope="col">승차</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${DailyRankList}" var="rank">
						<tr>
							<input type="hidden" id="${rank.team_code}">
							<td>${rank.rank}</td>
							<td>${rank.team_name_1}</td>
							<td>${rank.game_count}</td>
							<td>${rank.t_win}</td>
							<td>${rank.t_loss}</td>
							<td>${rank.conti_win}</td>
							<td>${rank.conti_loss}</td>
							<td>${rank.win_rate}</td>
							<td>${rank.win_diff}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty DailyRankList}">
							<tr><td colspan="9">첫 경기 이후 데이터가 출력됩니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

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