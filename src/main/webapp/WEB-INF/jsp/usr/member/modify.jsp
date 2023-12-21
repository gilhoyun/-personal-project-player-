<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="MEMBER MODIFY" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const memberModifyForm_onSubmit = function(form) {
			form.name.value = form.name.value.trim();
			form.nickname.value = form.nickname.value.trim();
			form.cellphoneNum.value = form.cellphoneNum.value.trim();
			form.email.value = form.email.value.trim();
			
			if (form.name.value.length == 0) {
				alert('이름을 입력해주세요');
				form.name.focus();
				return;
			}
			
			if (form.nickname.value.length == 0) {
				alert('닉네임을 입력해주세요');
				form.nickname.focus();
				return;
			}
			
			if (form.cellphoneNum.value.length == 0) {
				alert('전화번호를 입력해주세요');
				form.cellphoneNum.focus();
				return;
			}
			
			if (form.email.value.length == 0) {
				alert('이메일을 입력해주세요');
				form.email.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8-mypage text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="post" onsubmit="memberModifyForm_onSubmit(this); return false;">
				<div class="table-box-type">
					<table class="table table-lg">
						<tr class="detail-id">
							<th>번호</th>
							<td>${member.id }</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.regDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>정보 수정일</th>
							<td>${member.updateDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${member.loginId }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="input wh" name="name" type="text" value="${member.name }" placeholder="이름을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input class="input wh" name="nickname" type="text" value="${member.nickname }" placeholder="닉네임을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="input wh" name="cellphoneNum" type="text" value="${member.cellphoneNum }" placeholder="전화번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input class="input wh" name="email" type="text" value="${member.email }" placeholder="이메일을 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide-modify">수정</button></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<div class="flex justify-between">
					<a class="btn btn-wide" href="passwordModify">비밀번호변경</a>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>