<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="ARTICLE PLAYER" />
	
	<%@ include file="../common/head.jsp" %>
	
	<section class="text-xl">
		<div class="container mx-auto px-3">
			<div class="content_body flex">
				<div class="content-body__wrap" style="background-color: transparent;">
					<section class="section--wide">
						<div class="magazine-article__cover">
							<img class="player-img" src="data:image/png;base64,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" alt="">
						</div>
						<div class="magazine-article__title">
							<h1>player 제대로 즐기기</h1>
						</div>
					</section>
					<section class="section">
						<div class="section__body">
							<div class="magazine-article__content">
								<h3>player는 어떤 곳인가요?</h3>
								<pre>
									player란 다른 풋살예약 사이트와 달리 무료로 이용할 수 있는 곳만을 선정해 즐길 수 있는 곳입니다.

									대부분의 매치는 1시간씩 두번 즉, 2시간동안 진행되며, 중간중간 휴식시간이 존재합니다
									
									풋살을 하기 위해서 사람을 힘들게 모을 필요 없이 혼자 와도 즐길 수 있는 매치서비스도 존재합니다.
								</pre>
							</div>
						</div>
					</section>
					<section class="section">
						<div class="section__body">
							<div class="magazine-article__content">
								<h3>어떤걸 준비해가야 하나요?</h3>
								<pre>
									풋살화와 개인 옷 등은 준비해오세요.

									풋살화가 없다면 운동화도 착용이 가능하지만, 운동화는 미끄러워 부상의 위험이 있기 때문에 풋살화를 준비해주시면 좋습니다.
									그리고 부상의 위험 때문에 축구화는 착할 수 없습니다.
									
								</pre>
							</div>
						</div>
					</section>
					<section class="section">
						<div class="section__body">
							<div class="magazine-article__content">
								<h3>레벨 시스템</h3>
								<pre>
									다 같이 재미있는 경기를 위해서 시합이 끝나면 기록을 남기고, 기록따라 1부리그, 2부리그, 3부리그, 비기너로 나누게 됩니다.
									player에 가입하게 되면 비기너리그에서 뛰게 되며 최소 10경기의 승리가 있어야만 다음 리그로 진출이 가능합니다. 경기에 대한 결과는
									경기가 끝난 후 업데이트가 되고, 리그가 언제든 오르거나 떨어질 수 있으니 너무 속상해하지말고 재미있게 즐겨주세요!
									
								</pre>
							</div>
						</div>
					</section>
					<section class="section">
						<div class="section__body">
							<div class="magazine-article__content">
								<h3>누구나 참여가 가능하나요?</h3>
								<pre>
									물론입니다. 성별, 나이, 지역에 상관없이 풋살을 하고 싶다는 의지만 있어도 누구나 즐길 수 있습니다.그리고 본인이 원한다면
									성별과 나이에 맞는 경기를 본이 만들거나 찾아서 경기도 할 수 있습니다.	
								</pre>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>
	
	
	<%@ include file="../common/foot.jsp" %>