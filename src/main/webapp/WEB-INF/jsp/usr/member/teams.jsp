<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="teams" />

	<script>
		function validateForm() {
			var teamName = document.getElementById('teamName').value;
			var cellphoneNum = document.getElementById('cellphoneNum').value;
			var age = age.getElementById('age').value;
			var age = age.getElementById('age').value;
			var age = age.getElementById('age').value;
	
			teamName = teamName.trim();
			cellphoneNum = cellphoneNum.trim();
			age = age.trim();
	
			if (teamName === '' || cellphoneNum === '' || age === '') {
				alert('빈칸을 모두 입력해주세요.');
				return false;
			}
	
			return true;
		};
	</script>
	
	<%@ include file="../common/head.jsp" %>
	<section class="mt-8-Teams text-xl">
		<form action="/usr/member/teams/doRegisterTeam" method="post" onsubmit="return validateForm()">
			<label class="temas-label" for="teamName">팀 이름</label>
			<input class="input input-bordered input-primary wh" name="teamName" type="text" placeholder="아이디를 입력해주세요"/><br><br>
		
			<label class="temas-label" for="cellphoneNum">전화번호</label>
			<input class="input input-bordered input-primary wh" name="cellphoneNum" type="text" placeholder="아이디를 입력해주세요"/><br><br>

			<label class="temas-label" for="cellphoneNum">나이</label>
			<input class="input input-bordered input-primary wh" name="age" type="text" placeholder="나이를 입력해주세요"/><br><br>

			<label class="temas-label" for="cellphoneNum">주 경기장</label>
			<input class="input input-bordered input-primary wh" name="stadium" type="text" placeholder="나이를 입력해주세요"/><br><br>

			<label class="temas-label" for="cellphoneNum">지역</label>
			<input class="input input-bordered input-primary wh" name="region" type="text" placeholder="나이를 입력해주세요"/><br><br>
		
			<button class="btn-wide-teams" type="">등록</button> <!-- 안돼면 type=submit 붙히기 -->	
		</form>
    </section>
	
	
	
	<%@ include file="../common/foot.jsp" %>

	