<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<c:set var="pageTitle" value="${board.name } 게시판" />

		<%@ include file="../common/head.jsp" %>
			<script>
				document.addEventListener('DOMContentLoaded', function () {
					let currentSlide = 0;
					const slides = document.querySelectorAll('.slide-box');
					const totalSlides = slides.length;
					const indexText = document.querySelector('.index-txt');

					function showSlide(n) {
						slides.forEach((slide) => {
							slide.style.display = 'none';
						});
						slides[n].style.display = 'block';
						indexText.textContent = (n + 1) + ' / ' + totalSlides;
					}

					function nextSlide() {
						currentSlide = (currentSlide + 1) % totalSlides;
						showSlide(currentSlide);
					}

					let slideInterval = setInterval(nextSlide, 2000);

					document.querySelector('.slide-view').addEventListener('mouseover', () => {
						clearInterval(slideInterval);
					});

					document.querySelector('.slide-view').addEventListener('mouseout', () => {
						slideInterval = setInterval(nextSlide, 2500);
					});

					showSlide(currentSlide);
				});
			</script>

			<div class="slide-view">
				<div class="slide-wrap">
					<div class="slide-box">
						<p class="test_txt"></p><img
							src="https://d31wz4d3hgve8q.cloudfront.net/media/banner-manner_pc.png" alt="Slide 1" />
					</div>
					<div class="slide-box">
						<p class="test_txt"></p><img
							src="https://d31wz4d3hgve8q.cloudfront.net/media/banner-new_stadium_pc_sejongfutsalpark.jpg"
							alt="Slide 2" />
					</div>
					<div class="slide-box">
						<p class="test_txt"></p><img
							src="https://d31wz4d3hgve8q.cloudfront.net/media/banner-join-the-team_pc.png"
							alt="Slide 4" />
					</div>
				</div>
			</div>

			<section class="mt-8-list text-xl">
				<div class="container mx-auto px-3">

					<div class="mb-2 text-base flex justify-between items-end">
						<div><span>총 : ${articlesCnt }개</span></div>
						<div>
							<form>
								<input name="boardId" type="hidden" value="${board.id }" />
								<select name="searchKeywordType" data-value="${searchKeywordType }"
									class="select select-bordered select-sm">
									<option value="title">제목</option>
									<option value="body">내용</option>
									<option value="title,body">제목 + 내용</option>
								</select>

								<input name="searchKeyword" value="${searchKeyword }"
									class="ml-2 input wh-list" type="text"
									placeholder="검색어를 입력해주세요" />
								<button class="search">검색</button>
							</form>
						</div>
					</div>

					<div class="table-box-type">
						<table class="table table-lg">

							<colgroup>
								<col width="60" />
								<col width="200" />
								<col />
								<col width="120" />
								<col width="60" />
								<col width="40" />
							</colgroup>

							<thead class="text-lg">
								<tr>
									<th class="title-bar">번호</th>
									<th  class="title-bar">작성일</th>
									<th  class="title-bar">제목</th>
									<th  class="title-bar">작성자</th>
									<th  class="title-bar">조회수</th>
									<th class="title-bar"> 추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${articles }">
									<tr class="hover">
										<td>${article.id }</td>
										<td>${article.regDate.substring(2, 16) }</td>
										<td class="hover:underline"><a href="detail?id=${article.id }">${article.title
												}</a></td>
										<td>${article.writerName }</td>
										<td>${article.hitCount }</td>
										<td>${article.point }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<c:if test="${rq.getLoginedMemberId() != 0 }">
						<div class="mt-2 flex justify-end">
							<a class="btn-text-color btn btn-outline btn-sm" href="write">글쓰기</a>
						</div>
					</c:if>

					<div class="mt-2-list flex justify-center">
						<div class="join">
							<c:set var="pageMenuLen" value="5" />
							<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
							<c:set var="endPage"
								value="${page + pageMenuLen <= pagesCnt ? page + pageMenuLen : pagesCnt }" />

							<c:set var="baseUri"
								value="boardId=${board.id }&searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }" />

							<c:if test="${page == 1 }">
								<a class="join-item btn btn-sm btn-disabled">«</a>
							</c:if>
							<c:if test="${page > 1 }">
								<a class="join-item btn btn-sm" href="?page=1&${baseUri }">«</a>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" var="i">
								<a class="join-item btn btn-sm ${page == i ? 'btn-active' : '' }"
									href="?page=${i }&${baseUri }">${i }</a>
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

			<%@ include file="../common/foot.jsp" %>