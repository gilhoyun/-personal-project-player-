<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="pageTitle" value="Update Team Information" />
<%@ include file="../common/head.jsp" %>

<section class="mt-8-Teams text-xl">
	<form id="updateTeamForm" action="/usr/member/teams/doUpdateTeam" method="post">
		<input  type="hidden" name="teamId" value="${teams.id}" />

        <div>팀 이름</div>
		<input class="input input-bordered input-primary wh" type="text" name="teamName" value="${teams.teamName}" />

        <div>전화번호</div>
		<input class="input input-bordered input-primary wh" type="text" name="cellphoneNum" value="${teams.cellphoneNum}" />

        <div>나이</div>
		<input class="input input-bordered input-primary wh" type="text" name="age" value="${teams.age}" />

		<div>주 경기장</div>
		<input class="input input-bordered input-primary wh" type="text" name="stadium" value="${teams.stadium}" />

		<div>지역</div>
		<input class="input input-bordered input-primary wh" type="text" name="region" value="${teams.region}" />

		<button class="btn btn-wide-updateTeam">저장</button>
	</form>
</section>
	
	
<%@ include file="../common/foot.jsp" %>

	