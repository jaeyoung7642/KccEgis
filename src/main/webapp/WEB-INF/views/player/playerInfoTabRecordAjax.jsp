<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${tab == 'season' }">
<c:if test="${not empty selectSeason}">
						<div class="page_header g_header">
							<form action="" class="forms">
								<div class="frm_group gap12b">
									<select class="frm_select max240 m155" aria-label="시즌 선택" id="season_code" onchange="changeSeason(this.value)">
										<c:forEach items="${selectSeason}" var="selectSeason" varStatus="status">
											<option value="${selectSeason.seasonCode}" <c:if test="${selectSeason.seasonCode eq season_code}">selected</c:if>>${selectSeason.seasonCodeNm}</option>
										</c:forEach>
									</select>

									<label class="frm_radio type1">
										<input type="radio" name="category" value="avg" checked onchange="selectSeason(this.value)">
										<span>평균</span>
									</label>
									<label class="frm_radio type1">
										<input type="radio" name="category" value="total" onchange="selectSeason(this.value)">
										<span>누적</span>
									</label>
								</div>
							</form>
						</div>

						<div class="g_desc v_ct btns"> 
							<a href="playerRecord?player_no=${playerMap.pl_no}" class="el_btn goto dark">선수 기록 더보기</a>
						</div>

						<div class="g_content player_view_record mt14" id="seasonRecordArea">
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
						</div>
						<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->
						</c:if>
						<c:if test="${empty selectSeason}">
							<div class="mt30-15 no_data white hmd no_data">해당 선수의 기록이 없습니다.</div>
						</c:if>
</c:if>
<c:if test="${tab == 'total' }">
<c:if test="${not empty playerRecordMap}">
<div class="page_header g_header">
							<form action="" class="forms">
								<div class="frm_group gap12b">
									<c:if test="${tab == 'total' }">
									<label class="frm_radio type1">
										<input type="radio" name="category" value="avg" checked onchange="selectTotal(this.value)">
										<span>평균</span>
									</label>
									<label class="frm_radio type1">
										<input type="radio" name="category" value="total" onchange="selectTotal(this.value)">
										<span>누적</span>
									</label>
									</c:if>
									<c:if test="${tab == 'season' }">
									<select class="frm_select max240 m155" aria-label="시즌 선택" id="season_code" onchange="changeSeason(this.value)">
										<c:forEach items="${selectSeason}" var="selectSeason" varStatus="status">
											<option value="${selectSeason.seasonCode}" <c:if test="${selectSeason.seasonCode eq season_code}">selected</c:if>>${selectSeason.seasonCodeNm}</option>
										</c:forEach>
									</select>

									<label class="frm_radio type1">
										<input type="radio" name="category" value="avg" checked onchange="selectSeason(this.value)">
										<span>평균</span>
									</label>
									<label class="frm_radio type1">
										<input type="radio" name="category" value="total" onchange="selectSeason(this.value)">
										<span>누적</span>
									</label>
									</c:if>
								</div>
							</form>
						</div>

						<div class="g_desc v_ct btns"> 
							<a href="playerRecord?player_no=${playerMap.pl_no}" class="el_btn goto dark">선수 기록 더보기</a>
						</div>

						<div class="g_content player_view_record mt14" id="seasonRecordArea">
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
											<td>${playerRecordMap.ftp }</td>
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
						</div>
						<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->
				</c:if>
						<c:if test="${empty playerRecordMap}">
							<div class="mt30-15 no_data white hmd no_data">해당 선수의 기록이 없습니다.</div>
						</c:if>
				</c:if>