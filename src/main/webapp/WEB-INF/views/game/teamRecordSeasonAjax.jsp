<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed">
<input type="hidden" id="row_count" value="${row_count }">
	<table summary="시즌 정보 제공">
		<caption>시즌별 기록 고정영역</caption>
		<colgroup>
			<col class="season">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">시즌</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${seasonResultList}" var="seasonResultList" varStatus="status">
			<tr>
				<td>${seasonResultList.season}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="swipearea">
	<div class="inner">
		<table summary="PTS, 2P, 2PA, 2P%, 3P, 3PA, 3P%, PP, PPA, PP%, OFF REB, DEF REB, TOT, FT, FTA, FT%, TO, BS, PF 정보 제공" style="--pmin: 1700px; --mmin: 1400px;" class="sort_group">
			<caption>시즌별 기록</caption>
			<thead>
				<tr>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="0">PTS</a>
					</th> 
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="1">2P</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="2">2PA</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="3">2P%</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="4">3P</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="5">3PA</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="6">3P%</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="7">PP</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="8">PPA</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="9">PP%</a>
					</th>
					<th scope="col" style="width: 6.5em;">
						<a href="#" class="el_btn" data-pickcol="10">OFF REB</a>
					</th>
					<th scope="col" style="width: 6.5em;">
						<a href="#" class="el_btn" data-pickcol="11">DEF REB</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="12">TOT</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="13">FT</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="14">FTA</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="15">FT%</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="16">TO</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="17">BS</a>
					</th>
					<th scope="col">
						<a href="#" class="el_btn" data-pickcol="18">PF</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${seasonResultList}" var="seasonResultList" varStatus="status">
				<tr>
					<td>${seasonResultList.pts}</td>
					<td>${seasonResultList.fg }</td>
					<td>${seasonResultList.fg_a }</td>
					<td>${seasonResultList.fgp }</td>
					<td>${seasonResultList.threep }</td>
					<td>${seasonResultList.threep_a }</td>
					<td>${seasonResultList.threepp }</td>
					<td>${seasonResultList.pp }</td>
					<td>${seasonResultList.pp_a }</td>
					<td>${seasonResultList.ppp }</td>
					<td>${seasonResultList.o_r }</td>
					<td>${seasonResultList.d_r }</td>
					<td>${seasonResultList.r_tot }</td>
					<td>${seasonResultList.ft }</td>
					<td>${seasonResultList.ft_a }</td>
					<td>${seasonResultList.ftp }</td>
					<td>${seasonResultList.t_o }</td>
					<td>${seasonResultList.b_s }</td>
					<td>${seasonResultList.foul_tot }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>