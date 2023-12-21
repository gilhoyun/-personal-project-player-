<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="ARTICLE DETAIL" />
	
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/toastUiEditorLib.jsp" %>
	
	<script>
		$(document).ready(function(){
			getRecommendPoint();
			
			$('#recommendBtn').click(function(){
				let recommendBtn = $('#recommendBtn').hasClass('btn-active');
				
				$.ajax({
					url: "../recommendPoint/doRecommendPoint",
					method: "get",
					data: {
							"relTypeCode" : "article",
							"relId" : ${article.id },
							"recommendBtn" : recommendBtn
						},
					dataType: "text",
					success: function(data) {
						
					},
					error: function(xhr, status, error) {
						console.error("ERROR : " + status + " - " + error);
					}
				})
				
				location.reload();
			})
		})
		
		
		const getRecommendPoint = function(){
				$.ajax({
					url: "../recommendPoint/getRecommendPoint",
					method: "get",
					data: {
							"relTypeCode" : "article",
							"relId" : ${article.id }
						},
					dataType: "json",
					success: function(data) {
						if (data.success) {
							$('#recommendBtn').addClass('btn-active');
						}
					},
					error: function(xhr, status, error) {
						console.error("ERROR : " + status + " - " + error);
					}
				})
			}
	</script>
	
	<section class="mt-8-detail text-xl">
		<div class="container mx-auto px-3 pb-8 border-bottom-line">
			<div class="image-info-wrapper">
				<div class="detail-img">
					<img class="detail-img-1" src="data:image/jpeg;base64,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" alt="">
				</div>
				<div>
					<p class="name-regdate-name">${article.writerName }</p>
					<p class="name-regdate">${article.regDate.substring(2, 16) }</p>
				</div>
			</div>
				<table class="table-container">
					<tr class="detail-id">
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr class="detail-id">
						<th>수정일</th>
						<td>${article.updateDate.substring(2, 16) }</td>
					</tr>
					<tr>
						<td>${article.title }</td>
					</tr>
					<tr>
						<td>
							<div class="toast-ui-viewer">
								<script type="text/x-template">${article.body }</script>
							</div>
						</td>
					</tr>
					<tr class="hit">
						<th>조회수</th>
						<td>${article.hitCount }</td>
					</tr>
					<tr  class="hit">
						<th>추천</th>
						<td>
							<c:if test="${rq.getLoginedMemberId() == 0 }">
								<span>${article.point }</span>
							</c:if>
							<c:if test="${rq.getLoginedMemberId() != 0 }">
								<button id="recommendBtn" class="mr-8 btn-text-color btn btn-outline btn-xs">좋아요❤️</button>
								<span>좋아요 : ${article.point }개</span>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="btns mt-2">				
				<c:if test="${rq.getLoginedMemberId() != null && rq.getLoginedMemberId() == article.memberId }">
					<a class="search" href="modify?id=${article.id }">수정</a>
					<a class="search" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
	
	<script>
		const replyWriteForm_onSubmit = function(form) {
			form.body.value = form.body.value.trim();
			
			if (form.body.value.length < 2) {
				alert('2글자 이상 입력해주세요');
				form.body.focus();
				return;
			}
			
			form.submit();
		}
		
		let originalForm = null;
		let originalId = null;
		
		const replyModify_getForm = function(replyId, i){
			
			if (originalForm != null) {
				replyModify_cancle(originalId);
			}
			
			$.ajax({
				url: "../reply/getReplyContent",
				method: "get",
				data: {
						"id" : replyId
					},
				dataType: "json",
				success: function(data) {
					
					let replyContent = $('#' + i);
					
					originalId = i;
					originalForm = replyContent.html();
					
					let addHtml = `
						<form action="../reply/doModify" method="post" onsubmit="replyWriteForm_onSubmit(this); return false;">
							<input name="id" type="hidden" value="\${data.data.id}" />
							<div class="mt-6 border border-gray-400 rounded-lg p-4">
								<div class="mb-2"><span class="font-semibold">\${data.data.writerName}</span></div>
								<textarea class="textarea textarea-bordered w-full" name="body" placeholder="댓글을 입력해보세요">\${data.data.body}</textarea>
								<div class="flex justify-end mt-1">
									<button onclick="replyModify_cancle(\${i});" class="btn-text-color btn btn-outline btn-xs mr-2">취소</button>
									<button class="btn-text-color btn btn-outline btn-xs">작성</button>
								</div>
							</div>
						</form>
					`;
					
					replyContent.empty().html("");
					replyContent.append(addHtml);
				},
				error: function(xhr, status, error) {
					console.error("ERROR : " + status + " - " + error);
				}
			})
		}
		
		const replyModify_cancle = function(i){
			let replyContent = $('#' + i);
			
			replyContent.html(originalForm);
			
			originalId = null;
			originalForm = null;
		}
	</script>
	
	<section class="my-5 text-base">
		<div class="container mx-auto px-3">
			<h2 class="text-lg">댓글</h2>
			<c:forEach var="reply" items="${replies }" varStatus="status">
				<div id="${status.count }" class="py-2 pl-16 border-bottom-line">
					<div class="flex justify-between items-end">
						<div class="font-semibold">${reply.writerName }</div>
						<c:if test="${rq.getLoginedMemberId() == reply.memberId }">
							<div class="dropdown dropdown-end">
								<button class="btn btn-circle btn-ghost btn-sm">
						    		<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-5 h-5 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path></svg>
						    	</button>
								<ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-20">
									<li><a onclick="replyModify_getForm(${reply.id}, ${status.count });">수정</a></li>
									<li><a href="../reply/doDelete?id=${reply.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a></li>
								</ul>
							</div>
						</c:if>
					</div>
					<div class="my-1 text-lg ml-2">${reply.getForPrintBody() }</div>
					<div class="text-xs text-gray-400">${reply.updateDate }</div>
				</div>
			</c:forEach>
			
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<form action="../reply/doWrite" method="post" onsubmit="replyWriteForm_onSubmit(this); return false;">
					<input name="relTypeCode" type="hidden" value="article" />
					<input name="relId" type="hidden" value="${article.id }" />
					<div class="mt-6 border border-gray-400 rounded-lg p-4">
						<div class="mb-2"><span class="font-semibold">${member.getNickname() }</span></div>
						<textarea class="textarea textarea-bordered w-full" name="body" placeholder="댓글을 입력해보세요"></textarea>
						<div class="flex justify-end mt-1"><button class="btn-text-color btn btn-outline btn-sm">작성</button></div>
					</div>
				</form>
			</c:if>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>