<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="teams" />

		<%@ include file="../common/head.jsp" %>

			<script>
				function confirmDelete() {
					if (confirm("정말 팀을 삭제하시겠습니까?")) {
						if (confirm("진짜로 삭제하시겠습니까?")) {
							return true;
						} else {
							return false;
						}
					} else {
						return false;
					}
				}
			</script>

			<section class="mt-8-myTeams text-xl">
				<div class="container mx-auto px-3 pb-8">
					<div class="table-box-type">
						<table class="table table-lg">
							<tr>
								<th>팀 이름</th>
								<td>${rq.hasTeamRegistered.teamName }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${rq.hasTeamRegistered.cellphoneNum }</td>
							</tr>
							<tr>
								<th>나이</th>
								<td>${rq.hasTeamRegistered.age }</td>
							</tr>
							<tr>
								<th>주 경기장</th>
								<td>${rq.hasTeamRegistered.stadium }</td>
							</tr>
							<tr>
								<th>지역</th>
								<td>${rq.hasTeamRegistered.region }</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td>${rq.hasTeamRegistered.regDate.substring(2, 16) }</td>
							</tr>
							<tr>
								<th>수정일</th>
								<td>${rq.hasTeamRegistered.updateDate.substring(2, 16) }</td>
							</tr>
						</table>
						<div class="button-container">
							<form id="deleteTeamForm" action="/usr/member/teams/doDeleteTeam" method="post"
								onsubmit="return confirmDelete()">
								<button class="btn btn-wide-myTeams-delete">팀 삭제</button>
							</form>
							<form id="updateTeamForm" action="/usr/member/teams/showUpdateForm" method="get">
								<button class="btn btn-wide-myTeams-update">팀 수정</button>
							</form>
						</div>
					</div>
				</div>
			</section>


			<section class="my-3 text-2xl">
				<div class="container mx-auto px-3">
					<h2>My Team Members</h2>
					<table class="table table-lg">
						<thead>
							<tr>
								<th>Nickname</th>
								<!-- Add more columns based on your Member model attributes -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${teamMembers}">
								<tr>
									<td>${member.nickname}</td>
									<!-- Add more columns based on your Member model attributes -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
			<%@ include file="../common/foot.jsp" %>