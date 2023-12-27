<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="teams" />
		<%@ include file="../common/head.jsp" %>

			<div class="table-box-type-allTeams">
				<table class="table table-lg">
					<thead class="text-lg">
						<tr>
							<th>번호</th>
							<th>팀 이름</th>
							<th>연령대</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allTeams}" var="team">
							<tr class="hover">
								<td>${team.id}</td>
								<td onclick="location.href='/usr/member/teams/viewTeam?teamId=${team.id}'" class="allTeams-name">${team.teamName}</td>
								<td>${team.age}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			


<%@ include file="../common/foot.jsp" %>