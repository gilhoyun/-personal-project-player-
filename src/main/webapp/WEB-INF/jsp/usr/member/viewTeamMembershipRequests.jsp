<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="viewTeam" />


		<%@ include file="../common/head.jsp" %>

			<section class="mt-8-myTeams text-xl">
				<div class="container mx-auto px-3 pb-8">
					<h2 class="text-2xl font-bold mb-4">팀 가입 요청</h2>
					<div class="table-box-type">
						<table class="table table-lg">
							<tr>
								<th>신청 회원</th>
								<th>신청 일시</th>
								<th>상태</th>
								<th>처리</th>
							</tr>
							<c:forEach var="request" items="${membershipRequests}">
								<tr>
									<td>${request.nickname}</td>
									<td>${request.regDate}</td>
									<td>${request.status}</td>
									<td>
										<form action="/usr/member/myTeams/doUpdateMembershipRequestStatus"
											method="post">
											<input type="hidden" name="requestId" value="${request.id}" />
											<input type="hidden" name="status" value="ACCEPT" />
											<button type="" class="btn btn-wide-viewTeamMembership-accpet">수락</button>
										</form>
										<form action="/usr/member/myTeams/doUpdateMembershipRequestStatus"
											method="post">
											<input type="hidden" name="requestId" value="${request.id}" />
											<input type="hidden" name="status" value="REJECT" />
											<button type="" class="btn btn-wide-viewTeamMembership-refuse">거절</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</section>

			<%@ include file="../common/foot.jsp" %>