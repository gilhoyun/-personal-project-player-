<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="FIND LOGINID" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const findLoginIdForm_onSubmit = function(form) {
			form.name.value = form.name.value.trim();
			form.email.value = form.email.value.trim();
			form.cellphoneNum.value = form.cellphoneNum.value.trim();
			
			if (form.name.value.length == 0) {
				alert('이름을 입력해주세요');
				form.name.focus();
				return;
			}
			
			if (form.email.value.length == 0) {
				alert('이메일을 입력해주세요');
				form.email.focus();
				return;
			}
			
			if (form.cellphoneNum.value.length == 0) {
				alert('전화번호를 입력해주세요');
				form.cellphoneNum.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8-findId text-xl">
		<div class="container mx-auto px-3">
			<form action="doFindLoginId" method="post" onsubmit="findLoginIdForm_onSubmit(this); return false;">
				<div class="table-box-type">
					<table>
						<tr>
							<td>
								<div>이름</div>
								<input class="input wh" name="name" type="text" placeholder="이름을 입력해주세요"/>
							</td>
						</tr>
						<tr>
							<td>
								<div>이메일</div>
								<input class="input wh" name="email" type="text" placeholder="이메일을 입력해주세요" />
							</td>
						</tr>
						<tr>
							<td>
								<div>전화번호</div>
								<input class="input wh" name="cellphoneNum" type="text" placeholder="전화번호를 입력해주세요" />
							</td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide">아이디 찾기</button></td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="btns mt-2-findId-bar flex">
				<div class="findId-btn">
					<a class="btn-text-color " href="findLoginPw">비밀번호 찾기</a> 
					<a class="btn-text-color find-login" href="login">로그인</a>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>