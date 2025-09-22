<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
								<table summary="월별 정보 제공">
									<caption>최근 경기 기록 고정영역</caption>
									<colgroup>
										<col class="round">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">경기일자</th>
										</tr> 
									</thead>
									<tbody>
									<c:forEach items="${playerYearMonthList}" var="playerYearMonthList" varStatus="status">
										<tr>
											<td>
												<c:if test="${playerYearMonthList.team_code eq '60' || playerYearMonthList.away_team eq '60'}"><a href="scheduleResult?season_code=${playerYearMonthList.season_code }&game_code=${playerYearMonthList.game_code}&game_no=${playerYearMonthList.game_no}" class="el_btn goto"></c:if>
													${playerYearMonthList.game_date}
												</a> <!-- 해당 경기 결과 페이지 이동 -->
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="min, 득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록, 턴오버, 파울 정보 제공공" style="--pmin: 1100px; --mmin: 970px;">
										<caption>최근 경기 기록 스크롤영역</caption>
										<colgroup>
											<col>
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">min</th>
												<th scope="col">득점</th>
												<th scope="col">2점슛</th>
												<th scope="col">3점슛</th>
												<th scope="col">자유투</th>
												<th scope="col">리바운드</th>
												<th scope="col">어시스트</th>
												<th scope="col">스틸</th>
												<th scope="col">블록</th>
												<th scope="col">턴오버</th>
												<th scope="col">파울</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${playerYearMonthList}" var="playerYearMonthList" varStatus="status">
											<tr>
												<td>${playerYearMonthList.play_min }’${playerYearMonthList.play_sec }’’</td>
												<td>${playerYearMonthList.score }</td>
												<td>${playerYearMonthList.fg }</td>
												<td>${playerYearMonthList.threep }</td>
												<td>${playerYearMonthList.ft }</td>
												<td>${playerYearMonthList.r_tot }</td>
												<td>${playerYearMonthList.a_s }</td>
												<td>${playerYearMonthList.s_t }</td>
												<td>${playerYearMonthList.b_s }</td>
												<td>${playerYearMonthList.t_o }</td>
												<td>${playerYearMonthList.foul_tot }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>