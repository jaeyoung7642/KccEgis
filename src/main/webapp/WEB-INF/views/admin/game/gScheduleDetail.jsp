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
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
		<script>
	function playerDailyListApi(){
		$("body").append('<div class="loading"><span class="loading_box"></span></div>');
		var season_code = $("#season_code").val();
		var game_code = $("#game_code").val();
		var game_no = $("#game_no").val();
       	  $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/playerDailyListApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code,
		       	 "game_code":game_code,
		       	 "game_no":game_no
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	if(res=='true'){
		        		playerSumApi();
				        }else{
			        	 loaderClose();
				       	 alert("불러오기 실패했습니다.");
				        }
		        },
		        error: function() {
		        	loaderClose();
					alert("서버에 문제가 있습니다.");
				}
		   });  
		}
	function playerSumApi(){
		var season_code = $("#season_code").val();
		var game_code = $("#game_code").val();
       	   $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/playerSumApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code,
		       	 "game_code":game_code
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	if(res=='true'){
	        			 loaderClose();
		        		 alert("데이터를 불러왔습니다.");		        		
				       	 location.reload();
				        }else{
			        	 loaderClose();	
				       	 alert("불러오기 실패했습니다.");
				        }
		        },
		        error: function() {
		        	loaderClose();
					alert("서버에 문제가 있습니다.");
				}
		   });   
		}
	function teamQuarterListApi(){
		var season_code = $("#season_code").val();
		var game_code = $("#game_code").val();
		var game_no = $("#game_no").val();
		$("body").append('<div class="loading"><span class="loading_box"></span></div>');
       	  $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/teamQuarterListApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code,
		       	 "game_code":game_code,
		       	 "game_no":game_no
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	if(res=='true'){
		        		 teamDailyListApi();
				        }else{
			        	 loaderClose();	
				       	 alert("불러오기 실패했습니다.");
				        }
		        },
		        error: function() {
		        	loaderClose();
		        	alert("서버에 문제가 있습니다.");
				}
		   });  
		}
	function teamDailyListApi(){
		var season_code = $("#season_code").val();
		var game_code = $("#game_code").val();
		var game_no = $("#game_no").val();
       	   $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/teamDailyListApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code,
		       	 "game_code":game_code,
		       	 "game_no":game_no
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	if(res=='true'){
		        		teamSumApi();
				        }else{
				        	loaderClose();				       	 
				        	alert("불러오기 실패했습니다.");
				        }
		        },
		        error: function() {
		        	loaderClose();
		        	alert("서버에 문제가 있습니다.");
				}
		   });   
		}
	function teamSumApi(){
		var season_code = $("#season_code").val();
		var game_code = $("#game_code").val();
       	   $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/teamSumApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code,
		       	 "game_code":game_code
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	if(res=='true'){
		        		loaderClose(); 
		        		alert("데이터를 불러왔습니다.");		        		
				       	 location.reload();
				        }else{
				        	loaderClose();				       	 
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
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">GAME</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="gScheduleList" class="snb_link current">경기일정/결과</a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="gDailyRank" class="snb_link">팀순위</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">경기정보</h3>
				<form action="updateTeamSchedule" enctype="multipart/form-data" method="post" id="scheduleForm">
				<input type="hidden" id="season_code" name="season_code" value="${season_code }">
				<input type="hidden" id="game_code" name="game_code" value="${game_code }">
				<input type="hidden" id="game_no" name="game_no" value="${game_no }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>경기정보 입력 테이블</caption>
							<colgroup>
								<col style="width: 150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">경기일시/장소</th>
									<td>
										<div class="frm_group">
											<input type="text" class="frm_input w163" id="inputDate" placeholder="2024-00-00" name="game_date" aria-label="경기 일시" value="${result.game_date }" oninput="onInputDateHandler(this)" maxlength="10">
											<input type="text" class="frm_input w163" id="inputTime" placeholder="00:00" name="game_start" aria-label="경기 장소" value="${ result.game_start}" oninput="onInputTimeHandler(this)">
											<select class="frm_select m115" aria-label="장소 선택" name="stadium_code">
												<option value="">장소 선택</option>
												<c:forEach items="${stadiumList}" var="stadium">
			                                        <option value="${stadium.stadium_code}" ${stadium.selected}>${stadium.stadium_name_1}</option>
			                                    </c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<%-- <tr>
									<th scope="row"><label for="g_broad">중계방송</label></th>
									<td>
										<input type="text" class="frm_input w400" id="g_broad" name="tv_play"placeholder="SPOTV, SPOTV" value="${result.tv_play }">
									</td>
								</tr> --%>
								<tr>
									<th scope="row">경기정보/기록</th>
									<td>
										<!-- table -->
										<table class="tbl type2">
											<colgroup>
												<col width="175">
												<col>
												<col>
												<col>
												<col>
												<col>
												<col width="103">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">팀이름</th>
													<th scope="col">1Q</th>
													<th scope="col">2Q</th>
													<th scope="col">3Q</th>
													<th scope="col">4Q</th>
													<th scope="col">EQ</th>
													<th scope="col">합계</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="frm_group inline">
															<span>H</span>
															<input type="hidden" name="hteam" value="${result.home_team}" readonly>
															<input type="text" class="frm_input sm m115"  value="${result.home_team_nm }" readonly>
														</div>
													</td>
													<td>
														<input type="text" class="frm_input sm" name="hQ1" value="${result.homeTeam.Q1 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="hQ2" value="${result.homeTeam.Q2 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="hQ3" value="${result.homeTeam.Q3 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="hQ4" value="${result.homeTeam.Q4 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="hEQ" value="${result.homeTeam.EQ }">
													</td>
													<td>${result.homeTeam.home_total }</td>
												</tr>
												<tr>
													<td>
														<div class="frm_group inline">
															<span>A</span>
															<input type="hidden" name="ateam" value="${result.away_team}" readonly>
															<input type="text" class="frm_input sm m115"  value="${result.away_team_nm }" readonly>
														</div>
													</td>
													<td>
														<input type="text" class="frm_input sm" name="aQ1" value="${result.awayTeam.Q1 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="aQ2" value="${result.awayTeam.Q2 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="aQ3" value="${result.awayTeam.Q3 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="aQ4" value="${result.awayTeam.Q4 }">
													</td>
													<td>
														<input type="text" class="frm_input sm" name="aEQ" value="${result.awayTeam.EQ }">
													</td>
													<td>${result.awayTeam.away_total }</td>
												</tr>
											</tbody>
										</table>
										<!-- //table -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40 rt">
						<button type="button" class="el_btn md line" onclick="teamQuarterListApi()">기록불러오기</button>
						<button  class="el_btn md line" >수정</button>
						<a href="gScheduleList" class="el_btn md line">목록</a>
					</div>
				</form>

				<!-- 선수기록(KCC) -->
				<article class="article mt94">
					<div class="page_header">
						<h4 class="heading lv2">선수기록(KCC)</h4>
						
						<div class="btns">
							<button type="button" class="el_btn btn frm_btn line2" onclick="playerDailyListApi()">불러오기</button>
						</div>
					</div>

					<div class="record_content">
						<table class="tbl type2">
							<caption>선수기록(KCC) 테이블</caption>
							<colgroup>
								<col width="62">
								<col>
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">배번</th>
									<th scope="col">선수명</th>
									<th scope="col">출전시간</th>
									<th scope="col">득점</th>
									<th scope="col">2점슛</th>
									<th scope="col">자유투</th>
									<th scope="col">3점슛</th>
									<th scope="col">리바운드</th>
									<th scope="col">어시스트</th>
									<th scope="col">스틸</th>
									<th scope="col">블록슛</th>
									<th scope="col">파울</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${kccTeamList}" var="kcc">
								<tr>
									<td>${kcc.back_num}</td>
									<td>${kcc.kname }</td>
									<td>${kcc.play_min}분 ${kcc.play_sec}초</td>
									<td>${kcc.score }</td>
									<td>${kcc.fg }/${kcc.fg_a }</td>
									<td>${kcc.ft }/${kcc.ft_a }</td>
									<td>${kcc.threep }/${kcc.threep_a }</td>
									<td>${kcc.r_tot}</td>
									<td>${kcc.a_s }</td>
									<td>${kcc.s_t }</td>
									<td>${kcc.b_s }</td>
									<td>${kcc.foul_tot }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</article>
				<!-- // 선수기록(KCC) -->

				<!-- 선수기록(상대팀) -->
				<article class="article mt60">
					<div class="page_header">
						<h4 class="heading lv2">선수기록(상대팀)</h4>
						
					</div>
					
					<div class="record_content">
						<table class="tbl type2">
							<caption>선수기록(상대팀) 테이블</caption>
							<colgroup>
								<col width="62">
								<col>
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
								<col width="84">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">배번</th>
									<th scope="col">선수명</th>
									<th scope="col">출전시간</th>
									<th scope="col">득점</th>
									<th scope="col">2점슛</th>
									<th scope="col">자유투</th>
									<th scope="col">3점슛</th>
									<th scope="col">리바운드</th>
									<th scope="col">어시스트</th>
									<th scope="col">스틸</th>
									<th scope="col">블록슛</th>
									<th scope="col">파울</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${otherTeamList}" var="other">
								<tr>
									<td>${other.back_num}</td>
									<td>${other.kname }</td>
									<td>${other.play_min}분 ${other.play_sec}초</td>
									<td>${other.score }</td>
									<td>${other.fg }/${other.fg_a }</td>
									<td>${other.ft }/${other.ft_a }</td>
									<td>${other.threep }/${other.threep_a }</td>
									<td>${other.r_tot}</td>
									<td>${other.a_s }</td>
									<td>${other.s_t }</td>
									<td>${other.b_s }</td>
									<td>${other.foul_tot }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>

				</article>
				<!-- // 선수기록(상대팀) -->
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>