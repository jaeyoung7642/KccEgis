<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
							<table summary="번호, 선수명 정보 제공">
								<caption>시즌별 기록 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="name">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">선수명</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${seasonSearchList}" var="seasonSearchList" varStatus="status">
									<tr>
											<td>${seasonSearchList.pl_back}</td>
											<td>${seasonSearchList.pl_name }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, AST, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1780px; --mmin: 1460px;" class="sort_group">
									<caption>시즌별 기록</caption>
									<thead>
										<tr>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="0">PTS</a>
											</th> 
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="1">2P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="2">2PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="3">2P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="4">3P</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="5">3PA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="6">3P%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="7">PP</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="8">PPA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="9">PP%</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="10">OFF REB</a>
											</th>
											<th scope="col" style="width: 6.5em;">
												<a href="#" class="el_btn sort roundSort" data-pickcol="11">DEF REB</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="12">TOT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="13">AST</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="14">FT</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="15">FTA</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="16">FT%</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="17">TO</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="18">BS</a>
											</th>
											<th scope="col">
												<a href="#" class="el_btn sort roundSort" data-pickcol="19">PF</a>
											</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${seasonSearchList}" var="seasonSearchList" varStatus="status">
										<tr>
											<td>${seasonSearchList.pts }</td>
											<td>${seasonSearchList.fg }</td>
											<td>${seasonSearchList.fg_a }</td>
											<td>${seasonSearchList.fgp }</td>
											<td>${seasonSearchList.threep }</td>
											<td>${seasonSearchList.threep_a }</td>
											<td>${seasonSearchList.threepp }</td>
											<td>${seasonSearchList.pp }</td>
											<td>${seasonSearchList.pp_a }</td>
											<td>${seasonSearchList.ppp }</td>
											<td>${seasonSearchList.o_r }</td>
											<td>${seasonSearchList.d_r }</td>
											<td>${seasonSearchList.r_tot }</td>
											<td>${seasonSearchList.a_s }</td>
											<td>${seasonSearchList.ft }</td>
											<td>${seasonSearchList.ft_a }</td>
											<td>${seasonSearchList.ftp }</td>
											<td>${seasonSearchList.t_o }</td>
											<td>${seasonSearchList.b_s }</td>
											<td>${seasonSearchList.foul_tot }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>