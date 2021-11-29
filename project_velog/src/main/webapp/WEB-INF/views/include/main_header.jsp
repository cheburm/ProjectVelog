<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div class="fixed_header">
		<div class="hd_wrap">
			<!-- 로고 -->
			<div class="hd_logo">
				<a href="index"><span class="hd_logo_txt">velog</span></a>
			</div>
			<!-- 왼쪽상단 -->
			<div class="hd_btns">
				<!-- 검색 버튼 -->
				<a href="search" class="search_btn"><i
					class="fas fa-search search_icon"></i></a>
				<c:choose>
					<c:when test="${empty principal.user }">
						<button class="login_btn header_btn" type="button">로그인</button>
					</c:when>
					<c:otherwise>
						<button class="go_posting_btn header_btn" type="button">새 글 작성</button>
						<div class="user_nav_wrap">
							<button type="button"><img src="/img/user_icon.png" alt=""></button> 
								<i class="fas fa-caret-down"></i>
							</a>
							<div class="user_nav nav_box">
								<ul>
									<li class="mypage"><a href="#">내 벨로그</a></li>
									<li class="temp_post"><a href="#">임시 글</a></li>
									<li class="read_list"><a href="#">읽기 목록</a></li>
<<<<<<< HEAD
									<li class="setting"><a href="/mypage/${principal.id }">설정</a></li>
=======
									<li class="setting"><a href="/mypage">설정</a></li>
>>>>>>> a2162d9058bd90175a7ca0c40091d992387b8fb9
									<li class="logout"><a href="#">로그아웃</a></li>
								</ul>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="sign_in.jsp"></jsp:include>
</header>
