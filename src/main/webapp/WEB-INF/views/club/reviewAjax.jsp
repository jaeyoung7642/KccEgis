<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<select class="frm_select group_input mdm" id="changeSeason" aria-label="시즌 선택">
	<c:forEach items="${seasonList}" var="seasonList" varStatus="status">
	<option value="${seasonList.seasonCode}" <c:if test="${seasonList.seasonCode eq season_code}">selected</c:if>>${seasonList.seasonCodeNm}</option>
	</c:forEach>
</select>