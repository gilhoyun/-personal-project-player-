<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="viewTeam" />


		<%@ include file="../common/head.jsp" %>

			<section class="mt-8-myTeams text-xl">
				<div class="container mx-auto px-3 pb-8">
					<div class="table-box-type">
						<table class="table table-lg">
							<tr class="detail-id">
								<th>팀 번호</th>
								<td>${team.id}</td>
							</tr>
							<tr>
								<th>팀 이름</th>
								<td>${team.teamName}</td>
							</tr>
							<tr>
								<th>연령대</th>
								<td>${team.age}대</td>
							</tr>
							<tr>
								<th>주 경기장</th>
								<td>${team.stadium}</td>
							</tr>
							<tr>
								<th>지역</th>
								<td>${team.region}</td>
							</tr>
						</table>
					</div>
				</div>
			</section>

				<c:if test="${empty rq.hasTeamRegistered && membershipStatus != 'ACCEPT'}">
					<form action="/usr/member/teams/requestToJoinTeam" method="post">
						<input type="hidden" name="teamId" value="${team.id}" />
						<button type="" class="btn btn-wide-viewTeam">팀 가입 신청</button>
					</form>
				</c:if>

			<%@ include file="../common/foot.jsp" %>