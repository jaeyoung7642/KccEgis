<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
<table summary="라운드 정보 제공">
	<caption>라운드별 기록 고정영역</caption>
	<colgroup>
		<col class="season">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">라운드</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${roundList}" var="roundList" varStatus="status">
		<tr>
			<td>${roundList.game_round}R</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="swipearea">
	<div class="inner">
		<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;" class="sort_group">
		<caption>라운드별 기록</caption>
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
					<a href="#" class="el_btn sort roundSort" data-pickcol="13">FT</a>
				</th>
				<th scope="col">
					<a href="#" class="el_btn sort roundSort" data-pickcol="14">FTA</a>
				</th>
				<th scope="col">
					<a href="#" class="el_btn sort roundSort" data-pickcol="15">FT%</a>
				</th>
				<th scope="col">
					<a href="#" class="el_btn sort roundSort" data-pickcol="16">TO</a>
				</th>
				<th scope="col">
					<a href="#" class="el_btn sort roundSort" data-pickcol="17">BS</a>
				</th>
				<th scope="col">
					<a href="#" class="el_btn sort roundSort" data-pickcol="18">PF</a>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${roundList}" var="roundList" varStatus="status">
			<tr>
				<td>${roundList.pts}</td>
				<td>${roundList.fg }</td>
				<td>${roundList.fg_a }</td>
				<td>${roundList.fgp }</td>
				<td>${roundList.threep }</td>
				<td>${roundList.threep_a }</td>
				<td>${roundList.threepp }</td>
				<td>${roundList.pp }</td>
				<td>${roundList.pp_a }</td>
				<td>${roundList.ppp }</td>
				<td>${roundList.o_r }</td>
				<td>${roundList.d_r }</td>
				<td>${roundList.r_tot }</td>
				<td>${roundList.ft }</td>
				<td>${roundList.ft_a }</td>
				<td>${roundList.ftp }</td>
				<td>${roundList.t_o }</td>
				<td>${roundList.b_s }</td>
				<td>${roundList.foul_tot }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<c:if test="${empty roundList}">
<div class="no_post">첫 경기 이후 데이터가 출력됩니다.</div>
</c:if>