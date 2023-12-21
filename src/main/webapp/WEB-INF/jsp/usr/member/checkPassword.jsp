<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="PASSWORD CHECK" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const checkPasswordForm_onSubmit = function(form) {
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8-chkPw text-xl">
		<div class="container mx-auto px-3">
			<form action="doCheckPassword" method="post" onsubmit="checkPasswordForm_onSubmit(this); return false;">
				<div class="table-box-type">
					<table class="table table-lg">
						<tr>
							<th>아이디</th>
							<td>${loginId }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="input wh" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide-checkPw">확인</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>