<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.3.1/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
</head>
<body>
	<div class="h-20 flex container mx-auto text-4xl">
		<div><a class="h-full px-3 flex items-center logo" href="/"><span class="player-text">player</span></a></div>
			<div class="canvas">
			  <svg  class="svg" width="30px" height="37px" viewBox="0 0 43 84" id="athlete_1">
				<circle id="ball" fill="#FFE100" cx="33" cy="26" r="7"></circle>
				<circle id="head" fill="#57FFFD" cx="16" cy="6" r="6"></circle>
				<path d="M9.1626983,14.8622737 C10.396496,13.7564214 12.2931571,13.8601417 13.3990093,15.0939395 C14.5048615,16.3277372 14.4011412,18.2243982 13.1673435,19.3302505 C4.82578538,26.8067846 4.4493534,41.3194559 13.1078434,48.6783711 C14.3703234,49.7513623 14.5239345,51.6446358 13.4509432,52.9071158 C12.377952,54.1695959 10.4846785,54.3232069 9.22219846,53.2502157 C-2.29431791,43.4622426 -1.80752709,24.6948809 9.1626983,14.8622737 Z" id="body" fill="#57FFFD" fill-rule="nonzero"></path>
				<path d="M22.1253143,77.4381385 C23.7821686,77.4381385 25.1253143,78.7812843 25.1253143,80.4381385 C25.1253143,82.0949928 23.7821686,83.4381385 22.1253143,83.4381385 L16,83.4381385 C14.3431458,83.4381385 13,82.0949928 13,80.4381385 L13,66 C13,64.3431458 14.3431458,63 16,63 C17.6568542,63 19,64.3431458 19,66 L19,77.4381385 L22.1253143,77.4381385 Z" id="leg_down" fill="#57FFFD" fill-rule="nonzero"></path>
				<path d="M22.1253143,77.4381385 C23.7821686,77.4381385 25.1253143,78.7812843 25.1253143,80.4381385 C25.1253143,82.0949928 23.7821686,83.4381385 22.1253143,83.4381385 L16,83.4381385 C14.3431458,83.4381385 13,82.0949928 13,80.4381385 L13,66 C13,64.3431458 14.3431458,63 16,63 C17.6568542,63 19,64.3431458 19,66 L19,77.4381385 L22.1253143,77.4381385 Z" id="leg_up" fill="#57FFFD" fill-rule="nonzero"></path>
			</svg>
		</div>
		<div class="flex-grow"></div>
		<ul class="flex">
            <c:choose>
				<c:when test="${empty rq.hasTeamRegistered}">
					<li><a class="h-full px-3 flex items-center" href="/usr/member/teams"><span>팀 등록</span></a></li>
				</c:when>
				<c:otherwise>
					<li><a class="h-full px-3 flex items-center" href="/usr/member/myTeams"><span>내 팀</span></a></li>
					<li><a class="h-full px-3 flex items-center" href="/usr/member/myTeams/viewTeamMembershipRequests"><span>팀멤버</span></a></li>
				</c:otherwise>
			</c:choose>
			<li><a class="h-full px-3 flex items-center" href="/usr/member/allTeams"><span>전체 팀</span></a></li>
			<c:if test="${rq.getLoginedMemberId() != 0 }">
            </c:if>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>자유게시판</span></a></li>
				<li><a class="h-full px-3 flex items-center" href="/usr/member/login"><span>로그인</span></a></li>
				<li><a class="h-full px-3 flex items-center" href="/usr/member/join"><span>회원가입</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0 }">				
				<li><a class="h-full px-3 flex items-center" href="/usr/member/myPage"><span>마이페이지</span></a></li>
				<li><a class="h-full px-3 flex items-center" href="/usr/member/doLogout"><span>로그아웃</span></a></li>
			</c:if>
		</ul>
	</div>
	<div class="navigation--container mx-auto">
		<div class="navigation--wrapper flex">
			<div class="navigation--item">
				<a class="flex" href="/usr/article/list?boardId=1">매칭</a>
			</div>
			<div class="navigation--item">
				<a class="flex" href="/usr/article/list?boardId=2">자유게시판</a>
			</div>
			<div class="navigation--item">
				<a class="flex" href="/usr/home/API">구장 예약</a>
			</div>
		</div>
	</div>
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
		</div>
	</section>
