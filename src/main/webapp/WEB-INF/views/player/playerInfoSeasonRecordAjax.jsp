<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="tables tbl type4">
								<table summary="득점, 리바운드, 어시스트, 스틸, 블록 정보 제공">
									<caption>시즌별 기록</caption>
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">득점</th>
											<td>${playerRecordMap.score }</td>
										</tr>
										<tr>
											<th scope="row">리바운드</th>
											<td>${playerRecordMap.r_tot }</td>
										</tr>
										<tr>
											<th scope="row">어시스트</th>
											<td>${playerRecordMap.a_s }</td>
										</tr>
										<tr>
											<th scope="row">스틸</th>
											<td>${playerRecordMap.s_t }</td>
										</tr>
										<tr>
											<th scope="row">블록</th>
											<td>${playerRecordMap.b_s }</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tables tbl type4">
								<table summary="득점, 리바운드, 어시스트, 스틸, 블록 정보 제공">
									<caption>시즌별 기록</caption>
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">2점슛</th>
											<td>${playerRecordMap.fg }</td>
										</tr>
										<tr>
											<th scope="row">3점슛</th>
											<td>${playerRecordMap.threep }</td>
										</tr>
										<tr>
											<th scope="row">자유투</th>
											<td>${playerRecordMap.ft }</td>
										</tr>
										<tr>
											<th scope="row">자유투 성공률</th>
											<c:if test="${playerRecordMap.ftp != null }">
											<td>${playerRecordMap.ftp }</td>
											</c:if>
											<c:if test="${playerRecordMap.ftp == null }">
											<td>-</td>
											</c:if>
										</tr>
										<tr>
											<th scope="row">필드골 성공률</th>
											<td>${playerRecordMap.ygp}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<article class="chart">
								<div class="el_cart_radar chart-radar" data-scollOn="once" data-chart="[${playerRecordMap.fgp }, ${playerRecordMap.threepp }, ${playerRecordMap.ygp}, ${playerRecordMap.ftp }]"></div> <!-- 데이터 반시계 방향 -->
							</article>
							<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->