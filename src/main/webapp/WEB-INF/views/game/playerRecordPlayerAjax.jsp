<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section class="section">
				<div class="ly_inner md">
					<div class="page_header g_header">
						<h4 class="el_heading lv1">개인별 시즌 기록</h4> 
					</div>

					<div class="p_record_content">
						<!-- 주요 부문별 선수 순위  -->
						<article class="ranking">
							<div class="profile p_profile type1">
								<c:if test="${playerMap.pl_pos_code =='g'}">							
									<div class="pos">GUARD</div>
								</c:if>
								<c:if test="${playerMap.pl_pos_code =='c'}">							
									<div class="pos">CENTER</div>
								</c:if>
								<c:if test="${playerMap.pl_pos_code =='f'}">							
									<div class="pos">FORWARD</div>
								</c:if>
								<!-- <div class="pos long">FORWARD</div> --> <!-- 'FORWARD'일 경우 .long 클래스 추가 -->
								<div class="inner">
									<div class="photo">
										<img src="/resources/common/images/upload/player/${playerMap.pl_webmain }" alt="">
									</div>
								</div>
							</div>
							<div class="player">
								<span class="num">No.${playerMap.pl_back}</span>
								<span class="name">${playerMap.pl_name}</span>
							</div>
							<div class="btns">
								<a href="playerInfo?pl_no=${playerMap.pl_no }" class="el_btn md blue full gap4">
									선수 프로필 <span class="el_ico sm more_w"></span>
								</a> <!-- 선수 프로필 페이지로 이동 -->
							</div>
							<div class="tables">
								<div class="tbl_rank">
									<table>
										<caption>주요 부문별 선수 순위</caption>
										<colgroup>
											<col width="53%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th>득점</th>
												<td>${playerRank.pointRk}위</td>
											</tr>
											<tr>
												<th>리바운드</th>
												<td>${playerRank.reboundRk}위</td>
											</tr>
											<tr>
												<th>어시스트</th>
												<td>${playerRank.assistRk}위</td>
											</tr>
											<tr>
												<th>스틸</th>
												<td>${playerRank.stealRk}위</td>
											</tr>
											<tr>
												<th>블록</th>
												<td>${playerRank.blockRk}위</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="forms">
								<select class="frm_select sm" aria-label="다른 선수 선택" onchange="selectPlayer(this.value)" id="playerSelect">
									<c:forEach items="${playerList}" var="playerList" varStatus="status">
										<option value="${playerList.playerCode}" <c:if test="${playerList.playerCode eq player_no}">selected</c:if>>${playerList.playerCodeNm}</option>
									</c:forEach>
								</select>
							</div>
						</article>
						<!-- //주요 부문별 선수 순위  -->

						<!-- 지난 시즌 주요 부문 기록 비교  -->
						<article class="record">
							<div class="staple_record season">
								<!-- header -->  
								<div class="header">
									<div class="row">
										<span class="col lt">24-25</span> <!-- 지난시즌 -->
										<span class="col"></span>
										<span class="col rt">25-26</span> <!-- 이번시즌 -->
									</div>
								</div> 
								<!-- //header -->
								<div class="content type1" data-scollOn="once">
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.pts}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.pts }</p>
										</div>
										<div class="col ct">
											<span class="part">득점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.pts}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.pts }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.r_tot}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.r_tot }</p>
										</div>
										<div class="col ct">
											<span class="part">리바운드</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.r_tot}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.r_tot }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.a_s}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.a_s }</p>
										</div>
										<div class="col ct">
											<span class="part">어시스트</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.a_s}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.a_s }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.s_t}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.s_t }</p>
										</div>
										<div class="col ct">
											<span class="part">스틸</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.s_t}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.s_t }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.b_s}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.b_s }</p>
										</div>
										<div class="col ct">
											<span class="part">블록</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.b_s}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.b_s }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.fg}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.fg }</p>
										</div>
										<div class="col ct">
											<span class="part">2점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.fg}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.fg }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.threep}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.threep }</p>
										</div>
										<div class="col ct">
											<span class="part">3점</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.threep}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.threep }</p>
										</div>
									</div>
									<!-- //row -->
									<!-- row -->
									<div class="row">
										<div class="col lt">
											<div class="el_graph type3 horiz lt">
												<span class="bar gray" data-value="${prevSeason.ft}" data-max="10"></span>
											</div>
											<p class="score">${prevSeason.ft }</p>
										</div>
										<div class="col ct">
											<span class="part">자유투</span>
										</div>
										<div class="col rt">
											<div class="el_graph type3 horiz rt">
												<span class="bar black" data-value="${currentSeason.ft}" data-max="10"></span>
											</div>
											<p class="score">${currentSeason.ft }</p>
										</div>
									</div>
									<!-- //row -->
								</div>
							</div>
						</article>
						<!-- //지난 시즌 주요 부문 기록 비교  -->

						<!-- 당해년도 주요 부문 성공율 그래프 출력  -->
						<article class="chart">
							<div class="el_cart_radar chart-radar" data-scollOn="once" data-chart="[${currentSeason.fgp }, ${currentSeason.threepp }, ${currentSeason.ygp }, ${currentSeason.ftp }]"></div> <!-- 데이터 반시계 방향 -->
						</article>
						<!-- //당해년도 주요 부문 성공율 그래프 출력  -->

						<script src="/resources/common/assets/js/echarts.min.js" defer></script> <!-- 차트있을 때 추가 -->
					</div>
				</div>
			</section>
			<!-- //개인별 시즌 기록 -->

			<!-- 경기별 기록 비교 -->
			<section class="section mt30">
				<div class="ly_inner md">
					<article class="grid_header_type1">
						<div class="page_header g_header">
							<h5 class="el_heading lv2">경기별 기록 비교</h5> 
							<form action="" class="forms">
								<div class="frm_group">
									<select class="frm_select max240 m155" aria-label="라운드 선택" onchange="selectRound(this.value)" id="selectRound2">
										<option value="1" <c:if test="${game_round eq '1'}">selected</c:if>>1라운드</option>
										<option value="2" <c:if test="${game_round eq '2'}">selected</c:if>>2라운드</option>
										<option value="3" <c:if test="${game_round eq '3'}">selected</c:if>>3라운드</option>
										<option value="4" <c:if test="${game_round eq '4'}">selected</c:if>>4라운드</option>
										<option value="5" <c:if test="${game_round eq '5'}">selected</c:if>>5라운드</option>
										<option value="6" <c:if test="${game_round eq '6'}">selected</c:if>>6라운드</option>
									</select>
								</div>
							</form>
						</div>

						<p class="el_desc g_desc">* 경기 일자 클릭 시 해당 경기 결과 페이지로 이동합니다.</p>

						<!-- 비교 테이블 -->
						<div class="tbl type2 tblSwipe g_content" id="roundArea">
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
						<!-- //비교 테이블 -->
					</article>
				</div>
			</section>