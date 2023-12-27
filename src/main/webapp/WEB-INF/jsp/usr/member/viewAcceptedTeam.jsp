<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="acceptedTeams" />
		<%@ include file="../common/head.jsp" %>

			<script>
				function showAlert(message) {
					alert(message);
					window.location.href = "/usr/home/main";
				}
			</script>

			<c:if test="${not empty noTeamsMessage}">
				<script>
					showAlert("${noTeamsMessage}");
				</script>
			</c:if>

			<c:forEach var="team" items="${acceptedTeams}">
			</c:forEach>

			<section class="mt-8-myTeams text-xl">
				<div class="container mx-auto px-3 pb-8">
					<div class="table-box-type">
						<table class="table table-lg">
							<tr>
								<th>팀 이름</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.teamName}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>연령대</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.age}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>전화번호(팀장)</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.cellphoneNum}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>지역</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.region}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>주 경기장</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.stadium}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>등록일</th>
								<c:forEach var="team" items="${acceptedTeams}">
									<td>${team.regDate.substring(2, 16)}</td>
								</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</section>
			<c:forEach var="team" items="${acceptedTeams}">
				<td>
					<form action="/usr/member/teams/doLeaveTeam" method="post">
						<input type="hidden" name="teamId" value="${team.id}" />
						<button type="" class="btn btn-wide-viewAcceptTeam">탈퇴하기</button>
					</form>
				</td>
			</c:forEach>




			<%@ include file="../common/foot.jsp" %>