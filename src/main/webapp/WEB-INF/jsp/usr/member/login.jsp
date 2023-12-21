<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="MEMBER LOGIN" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const loginForm_onSubmit = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8-login text-xl">
		<div class="container mx-auto px-3">
			<div class="headMessage-login">
				<h2>무료로 풋살하고 싶을땐</h2>
				<h2 class="hlt">player</h2>
			</div>
			<form action="doLogin" method="post" onsubmit="loginForm_onSubmit(this); return false;">
				<div class="table-box-type">
					<table>
						<tr>
							<td><input class="input wh" name="loginId" type="text" placeholder="아이디를 입력해주세요"/></td>
						</tr>
						<tr>	
							<td><input class="input wh" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide ">로그인</button></td>
						</tr>
					</table>
					<div class="find-btn">
						<a class="btn-text-color " href="findLoginId">아이디 찾기</a> /
						<a class="btn-text-color " href="findLoginPw">비밀번호 찾기</a>
						<a class="h-full join-btn" href="/usr/member/join">회원가입</a>
					</div>
				</div>
			</form>
		</div>
	</section>
	
	
	<%@ include file="../common/foot.jsp" %>