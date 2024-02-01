<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="MEMBER LIST" />
	
	<%@ include file="../../usr/common/head.jsp" %>
	
	<section class="mt-8-list text-xl">
		<div class="container mx-auto px-3">
		
			<div class="mb-2 flex justify-between items-end">
				<div><span>회원수 : ${membersCnt }</span></div>
				<form>
					<select data-value="${authLevel }" class="select select-bordered select-sm" name="authLevel">
						<option value="0">전체</option>
						<option value="2">일반</option>
						<option value="1">관리자</option>
					</select>
					<select data-value="${searchKeywordType }" class="select select-bordered select-sm" name="searchKeywordType">
						<option value="loginId,name,nickname">전체</option>
						<option value="loginId">아이디</option>
						<option value="name">이름</option>
						<option value="nickname">닉네임</option>
					</select>
					<input class="ml-2 input wh-list-list" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }"/>
					<button class="search">검색</button>
				</form>
			</div>
			<c:choose>
				<c:when test="${membersCnt == 0 }">
					<div class="text-center py-2">조건에 일치하는 검색결과가 없습니다</div>
				</c:when>
				<c:otherwise>
					<form action="doDeleteMembers" method="POST">
						<div class="table-box-type">
							<table class="table table-lg">
								<thead>
									<tr>
										<th><input type="checkbox" class="checkbox-all-member-id" /></th>
										<th>번호</th>
										<th>가입날짜</th>
										<th>수정날짜</th>
										<th>아이디</th>
										<th>이름</th>
										<th>닉네임</th>
										<th>삭제여부</th>
										<th>삭제날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="member" items="${members }">
										<c:if test="${member.authLevel != 1 }">
											<tr class="hover">
												<c:choose>
													<c:when test="${member.delStatus != 1 }">
														<td><input type="checkbox" class="checkbox-member-id" name="ids" value="${member.id }" /></td>
													</c:when>
													<c:otherwise>
														<td><input type="checkbox" class="checkbox-member-id" name="ids" value="${member.id }" disabled /></td>
													</c:otherwise>
												</c:choose>
												<td>${member.id }</td>
												<td>${member.regDate.substring(2, 16) }</td>
												<td>${member.updateDate.substring(2, 16) }</td>
												<td>${member.loginId }</td>
												<td>${member.name }</td>
												<td>${member.nickname }</td>
												<td>${member.delStatusStr() }</td>
												<td>${member.delDateStr() }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="mt-2 flex justify-end">
							<button class="btn btn-outline btn-sm btn-delete-selected-members">회원 삭제</button>
						</div>
					</form>
				</c:otherwise>
			</c:choose>

			<script>
				$('.checkbox-all-member-id').change(function() {
					const allCheck = $(this);
					const allChecked = allCheck.prop('checked');
					$('.checkbox-member-id').prop('checked', allChecked);
					$('.checkbox-member-id:is(:disabled)').prop('checked', false);
				})
				
				$('.checkbox-member-id').change(function() {
					const checkboxMemberIdCount = $('.checkbox-member-id').length;
					const checkboxMemberIdCheckedCount = $('.checkbox-member-id:checked').length;
					const checkboxDisabledCount = $('.checkbox-member-id:is(:disabled)').length;
					const allChecked = (checkboxMemberIdCount - checkboxDisabledCount) == checkboxMemberIdCheckedCount;
					$('.checkbox-all-member-id').prop('checked', allChecked);
				})
			</script>
			
			<div class=" flex justify-center">
				<div class="join">
					<c:set var="pageMenuLen" value="5" />
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCnt ? page + pageMenuLen : pagesCnt }" />
					
					<c:set var="baseUri" value="searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }" />
					
					<c:if test="${page == 1 }">
						<a class="join-item btn btn-sm btn-disabled">«</a>
					</c:if>
					<c:if test="${page > 1 }">
						<a class="join-item btn btn-sm" href="?page=1&${baseUri }">«</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="join-item btn btn-sm ${page == i ? 'btn-active' : '' }" href="?page=${i }&${baseUri }">${i }</a>
					</c:forEach>
					<c:if test="${page < pagesCnt }">
						<a class="join-item btn btn-sm" href="?page=${pagesCnt }&${baseUri }">»</a>
					</c:if>
					<c:if test="${page == pagesCnt }">
						<a class="join-item btn btn-sm btn-disabled">»</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../../usr/common/foot.jsp" %>