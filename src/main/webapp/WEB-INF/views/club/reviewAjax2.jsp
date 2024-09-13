<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
							<table summary="선수명, 경기수. 출전시간 정보 제공" style="--pwth: min(20.833vw * 1.6, 400px);">
								<caption>시즌 누적 기록 고정영역</caption>
								<colgroup>
									<col class="player">
									<col width="30%" class="p_hide">
									<col class="p_hide">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">선수명
											<div class="p_show">경기수 <span class="dash">/</span> 출전시간</div>
										</th>
										<th scope="col" class="p_hide">경기수</th>
										<th scope="col" class="p_hide">출전시간</th>
									</tr> 
								</thead>
								<tbody>
								<c:forEach items="${playerRecordList}" var="playerRecordList" varStatus="status">
									<tr>
										<td>
											<div class="td_group">
												<span class="name">NO.${playerRecordList.back_num} ${playerRecordList.kname}</span>
												<span class="p_show">${playerRecordList.game_count} <span class="dash">/</span> ${playerRecordList.play_min}’${playerRecordList.play_sec}’’</span>
											</div>
										</td>
										<td class="p_hide">${playerRecordList.game_count}</td>
										<td class="p_hide">${playerRecordList.play_min}’${playerRecordList.play_sec}’’</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록 정보 제공" style="--pmin: 850px; --mmin: 480px;">
									<caption>시즌 누적 기록 스크롤영역</caption>
									<colgroup>
										<col width="14%">
										<col width="12.3%">
										<col width="12.3%">
										<col width="12.3%">
										<col width="14%">
										<col width="14%">
										<col width="11.4%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">득점</th>
											<th scope="col">2점슛</th>
											<th scope="col">3점슛</th>
											<th scope="col">자유투</th>
											<th scope="col">리바운드</th>
											<th scope="col">어시스트</th>
											<th scope="col">스틸</th>
											<th scope="col">블록</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRecordList}" var="playerRecordList" varStatus="status">
										<tr>
											<td>${playerRecordList.score }</td>
											<td>${playerRecordList.fg }</td>
											<td>${playerRecordList.threep }</td>
											<td>${playerRecordList.ft }</td>
											<td>${playerRecordList.r_tot }</td>
											<td>${playerRecordList.a_s }</td>
											<td>${playerRecordList.s_t }</td>
											<td>${playerRecordList.b_s }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>