<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="PASSWORD MODIFY" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const doPasswordModifyForm_onSubmit = function(form) {
			form.loginPw.value = form.loginPw.value.trim();
			form.loginPwChk.value = form.loginPwChk.value.trim();
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			if (form.loginPwChk.value.length == 0) {
				alert('비밀번호확인을 입력해주세요');
				form.loginPwChk.focus();
				return;
			}
			
			if (form.loginPw.value != form.loginPwChk.value) {
				alert('비밀번호가 일치하지 않습니다');
				form.loginPw.focus();
				form.loginPw.value = '';
				form.loginPwChk.value = '';
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8-mypage text-xl">
		<div class="container mx-auto px-3">
			<form action="doPasswordModify" method="post" onsubmit="doPasswordModifyForm_onSubmit(this); return false;">
				<div class="table-box-type">
					<table class="table table-lg">
						<tr>
							<th>새 비밀번호</th>
							<td><input class="input wh" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<td><input class="input wh" name="loginPwChk" type="text" placeholder="비밀번호 확인을 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide-checkPw">변경</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>