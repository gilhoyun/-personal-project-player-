<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="viewTeam" />


		<%@ include file="../common/head.jsp" %>
		<section class="mt-8-myTeams text-xl">
			<div class="container mx-auto px-3 pb-8">
				<h1>3부리그</h1>
				<div class="table-box-type">
					<table class="table table-lg">
						<thead>
							<tr>
								<th>번호</th>
								<th>팀 이름</th>
								<th>연령대</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${thirdLeagueTeams}" var="team">
								<tr class="hover">
									<td>${team.id}</td>
									<td>${team.teamName}</td>
									<td>${team.age}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
			<%@ include file="../common/foot.jsp" %>