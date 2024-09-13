<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
								<table summary="라운드 정보 제공">
									<caption>경기별 기록 비교 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기일자</th>
										</tr> 
									</thead>
									<tbody>
									<c:forEach items="${roundPlayerList}" var="roundPlayerList" varStatus="status">
										<tr>
											<td>
												<a href="scheduleResult?season_code=${roundPlayerList.season_code }&game_code=${roundPlayerList.game_code}&game_no=${roundPlayerList.game_no }" class="el_btn goto">${roundPlayerList.game_date}</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="대진팀, 경기결과, min, 득점, 2점슛, 3점슛, 자유투, 리운드, 어시스트, 스틸, 블록, 턴오버, 파울 정보 제공공" style="--pmin: 1100px; --mmin: 970px;">
										<caption>경기별 기록 비교 스크롤영역</caption>
										<colgroup>
											<col>
											<col width="9.05%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
											<col width="7.182%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">대진팀</th>
												<th scope="col">경기결과</th>
												<th scope="col">min</th>
												<th scope="col">득점</th>
												<th scope="col">2점슛</th>
												<th scope="col">3점슛</th>
												<th scope="col">자유투</th>
												<th scope="col">리운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
												<th scope="col">턴오버</th>
												<th scope="col">파울</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${roundPlayerList}" var="roundPlayerList" varStatus="status">
											<tr>
												<td>
												<c:if test="${roundPlayerList.away_team == '16'}">원주 DB</c:if>
												<c:if test="${roundPlayerList.away_team == '50'}">창원 LG</c:if>
												<c:if test="${roundPlayerList.away_team == '06'}">수원 KT</c:if>
												<c:if test="${roundPlayerList.away_team == '55'}">서울 SK</c:if>
												<c:if test="${roundPlayerList.away_team == '10'}">울산 현대모비스</c:if>
												<c:if test="${roundPlayerList.away_team == '64'}">대구 한국가스공사</c:if>
												<c:if test="${roundPlayerList.away_team == '66'}">고양 소노</c:if>
												<c:if test="${roundPlayerList.away_team == '70'}">안양 정관장</c:if>
												<c:if test="${roundPlayerList.away_team == '35'}">서울 삼성</c:if>
												</td>
												<td>
												${roundPlayerList.win} ${roundPlayerList.team_score}-${roundPlayerList.vsteam_score}
												</td>
												<td>${roundPlayerList.play_min}’${roundPlayerList.play_sec}’’</td>
												<td>${roundPlayerList.score}</td>
												<td>${roundPlayerList.fg}</td>
												<td>${roundPlayerList.threep}</td>
												<td>${roundPlayerList.ft}</td>
												<td>${roundPlayerList.r_tot}</td>
												<td>${roundPlayerList.a_s}</td>
												<td>${roundPlayerList.s_t}</td>
												<td>${roundPlayerList.b_s}</td>
												<td>${roundPlayerList.t_o}</td>
												<td>${roundPlayerList.foul_tot}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${roundPlayerList.size()<=0}">
							<div class="no_post">데이터가 없습니다.</div>
							</c:if>
						</div>