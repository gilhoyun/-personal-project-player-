<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="MEMBER LOGIN" />

		<%@ include file="../common/head.jsp" %>

			<script>
				const loginForm_onSubmit = function (form) {
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

			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('270de61b9c8eee41278bf87b073a9ae3'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // sdk초기화여부판단
				//카카오로그인
				function kakaoLogin() {
					Kakao.Auth.login({
						success: function (response) {
							Kakao.API.request({
								url: '/v2/user/me',
								success: function (response) {
									console.log(response)
								},
								fail: function (error) {
									console.log(error)
								},
							})
						},
						fail: function (error) {
							console.log(error)
						},
					})
				}
				//카카오로그아웃  
				function kakaoLogout() {
					if (Kakao.Auth.getAccessToken()) {
						Kakao.API.request({
							url: '/v1/user/unlink',
							success: function (response) {
								console.log(response)
							},
							fail: function (error) {
								console.log(error)
							},
						})
						Kakao.Auth.setAccessToken(undefined)
					}
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
									<td><input class="input wh" name="loginId" type="text" placeholder="아이디를 입력해주세요" />
									</td>
								</tr>
								<tr>
									<td><input class="input wh" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요" />
									</td>
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

			<ul>
				<li onclick="kakaoLogin();">
					<a href="javascript:void(0)">
						<span>카카오 로그인</span>
					</a>
				</li>
				<li onclick="kakaoLogout();">
					<a href="javascript:void(0)">
						<span>카카오 로그아웃</span>
					</a>
				</li>
			</ul>


			<%@ include file="../common/foot.jsp" %>