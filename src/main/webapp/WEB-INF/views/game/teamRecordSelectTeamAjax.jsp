<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
										 <tbody>
											 <tr>
												<td>${result.kccRank.rank }위 : ${result.otherRank.rank }위</td>
											</tr>
										</tbody>
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
												<tr>
													<c:if test="${result.wl_three != null }">
													<td>${result.wl_three }</td>
													</c:if>
													<c:if test="${result.wl_three == null }">
													<td>-</td>
													</c:if>
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
											</tbody>
										</table>
									</div>
								</div>
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
											<span class="col rt otherTeamNm"></span>
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
											<span class="col rt otherTeamNm"></span>
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
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
												<th scope="col">KCC</th>
												<th scope="col" class="no_bl otherTeamNm2">KT</th>
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