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
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
	<script>
	function teamScheduleApi(){
		var season_code = $("#season_code").val();
		$("body").append('<div class="loading"><span class="loading_box"></span></div>');
        	 $.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/teamScheduleApi",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "season_code":season_code
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
					alert("서버 오류!!");
				}
		   }); 
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

				<h3 class="heading">일정/결과</h3>

				<!-- search -->
				<div class="board_search">
					<form action="" class="search_group">
						<div class="forms frm_field">
							<dl class="row">
								<dt>일정불러오기</dt>
								<dd>
									<div class="frm_group">
										<select class="frm_select" aria-label="시즌 선택" id="season_code">
											<option value="43">24-25시즌</option>
										</select>
										<button type="button" class="el_btn frm_btn line gray" onclick="teamScheduleApi()">불러오기</button>
										* KBL DB에서 해당 데이터를 불러옵니다.
									</div>
								</dd>
							</dl>
						</div>
					</form>
				</div>

				<!-- search -->
				<div class="board_search mt27">
					<form action="gScheduleList" class="search_group" method="get">
						<div class="forms frm_field">
							<div class="row">
								<div class="frm_group">
									<select class="frm_select sm full" aria-label="시즌 선택" name="season" id="season">
										<option value="01" <c:if test="${season eq 01}">selected</c:if>>24-25시즌 정규</option>
										<option value="03" <c:if test="${season eq 03}">selected</c:if>>24-25시즌 플레이오프</option>
										<option value="04" <c:if test="${season eq 04}">selected</c:if>>24-25시즌 챔피온결정전</option>
									</select>
									<select class="frm_select sm full" aria-label="월 별" name = "yyyymm" id="yyyymm">
										<option value="202410" <c:if test="${yyyymm eq 202410}">selected</c:if>>2024년 10월</option>
										<option value="202411" <c:if test="${yyyymm eq 202411}">selected</c:if>>2024년 11월</option>
										<option value="202412" <c:if test="${yyyymm eq 202412}">selected</c:if>>2024년 12월</option>
										<option value="202501" <c:if test="${yyyymm eq 202501}">selected</c:if>>2025년 01월</option>
										<option value="202502" <c:if test="${yyyymm eq 202502}">selected</c:if>>2025년 02월</option>
										<option value="202503" <c:if test="${yyyymm eq 202503}">selected</c:if>>2025년 03월</option>
										<option value="202504" <c:if test="${yyyymm eq 202504}">selected</c:if>>2025년 04월</option>
										<option value="202505" <c:if test="${yyyymm eq 202505}">selected</c:if>>2025년 05월</option>
										<option value="202310" <c:if test="${yyyymm eq 202310}">selected</c:if>>2023년 10월</option>
										<option value="202311" <c:if test="${yyyymm eq 202311}">selected</c:if>>2023년 11월</option>
										<option value="202312" <c:if test="${yyyymm eq 202312}">selected</c:if>>2023년 12월</option>
										<option value="202401" <c:if test="${yyyymm eq 202401}">selected</c:if>>2024년 01월</option>
										<option value="202402" <c:if test="${yyyymm eq 202402}">selected</c:if>>2024년 02월</option>
										<option value="202403" <c:if test="${yyyymm eq 202403}">selected</c:if>>2024년 03월</option>
										<option value="202404" <c:if test="${yyyymm eq 202404}">selected</c:if>>2024년 04월</option>
										<option value="202405" <c:if test="${yyyymm eq 202405}">selected</c:if>>2024년 05월</option>
									</select>
									<select class="frm_select sm full" aria-label="라운드 별" name="round" id="round">
										<option value="0" <c:if test="${round eq 0}">selected</c:if>>전체라운드</option>
										<option value="1" <c:if test="${round eq 1}">selected</c:if>>1라운드</option>
										<option value="2" <c:if test="${round eq 2}">selected</c:if>>2라운드</option>
										<option value="3" <c:if test="${round eq 3}">selected</c:if>>3라운드</option>
										<option value="4" <c:if test="${round eq 4}">selected</c:if>>4라운드</option>
										<option value="5" <c:if test="${round eq 5}">selected</c:if>>5라운드</option>
										<option value="6" <c:if test="${round eq 6}">selected</c:if>>6라운드</option>
									</select>
									<select class="frm_select sm full" aria-label="예정/종료 경기 선택" name="state" id="state">
										<option value="1" <c:if test="${state eq 1}">selected</c:if>>전체경기</option>
										<option value="2" <c:if test="${state eq 2}">selected</c:if>>예정경기</option>
										<option value="3" <c:if test="${state eq 3}">selected</c:if>>종료경기</option> 
									</select>
									<select class="frm_select sm full" aria-label="홈/원정 선택" name="ha" id="ha">
										<option value="1" <c:if test="${ha eq 1}">selected</c:if>>전체경기</option>
										<option value="2" <c:if test="${ha eq 2}">selected</c:if>>홈경기</option>
										<option value="3" <c:if test="${ha eq 3}">selected</c:if>>원정경기</option> 
									</select>
									<button class="el_btn frm_btn deep sm w100">검색</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- //search -->

				<!-- board list -->
				<ul class="board_list type2 mt30">
				 <c:forEach var="list" items="${gScheduleList}">
					<li class="item">
						<div class="col sch">
						  <div class="group">
							<c:if test="${list.home_team =='60'}">
								<span class="el_ico ccl home">H</span> <!-- 홈경기일 경우 home 추가 -->
                            </c:if>
							<c:if test="${list.away_team =='60'}">
								<span class="el_ico ccl away">A</span>
                            </c:if>
							<p class="date h">${list.game_date} / ${list.week_day}요일 / ${list.game_start } / ${list.stadium_name_2 }</p>
						  </div>
						</div>
						<div class="col game">
						  <div class="group">
						  <c:if test="${list.home_team =='60'}">
							<span class="team">${list.home_team_name }</span>
							<c:choose>
			                	<c:when test="${list.home_score =='0' && list.away_score =='0'}">
			                		<span class="score">vs</span>
			                	</c:when>
			                	<c:otherwise>
			                		<span class="score"><em>${list.home_score}</em> : ${list.away_score }</span>
			                	</c:otherwise>
			                </c:choose>
							<span class="team">${list.away_team_name }</span>
						  </c:if>
						  <c:if test="${list.away_team =='60'}">
							<span class="team">${list.away_team_name }</span>
							<c:choose>
			                	<c:when test="${list.home_score =='0' && list.away_score =='0'}">
			                		<span class="score">vs</span>
			                	</c:when>
			                	<c:otherwise>
			                		<span class="score"><em>${list.away_score}</em> : ${list.home_score }</span>
			                	</c:otherwise>
			                </c:choose>
							<span class="team">${list.home_team_name }</span>
						  </c:if>
						  </div>
						</div>
						<div class="col btns">
							<a href="gScheduleDetail?season_code=${list.season_code}&game_code=${list.game_code}&game_no=${list.game_no}" class="el_btn line md2">수정</a>
						</div>
					</li>
				 </c:forEach>
				</ul>
				<!-- //board list -->
				<c:if test="${not empty gScheduleList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="gScheduleList?page=1&season=${season}&yyyymm=${yyyymm}&round=${round}&state=${state}&ha=${ha}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="gScheduleList?page=${startPage-1}&season=${season}&yyyymm=${yyyymm}&round=${round}&state=${state}&ha=${ha}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="gScheduleList" value="gScheduleList?season=${season}&yyyymm=${yyyymm}&round=${round}&state=${state}&ha=${ha}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${gScheduleList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="gScheduleList?page=${endPage+1}&season=${season}&yyyymm=${yyyymm}&round=${round}&state=${state}&ha=${ha}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="gScheduleList?page=${maxPage}&season=${season}&yyyymm=${yyyymm}&round=${round}&state=${state}&ha=${ha}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->
	</div>
</body>
</html>