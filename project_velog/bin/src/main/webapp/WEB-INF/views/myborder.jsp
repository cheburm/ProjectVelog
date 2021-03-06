<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>my velog</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/myborder.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <!-- border header -->
    <header>
        <div class="fixed_header">
            <div class="hd_wrap">
                <div class="hd_logo border_hd_logo">
                    <a href="/" class="border_logo_img"><img class="border_hd_icon" src="/img/black_favicon.png" alt=""></a>
                    <a href="#" class="hd_logo_a"><span class="border_logo_txt">${principal.user.username}.log</span></a>
                </div>
                <div class="hd_btns">
                    <button class="search_btn"><i class="fas fa-search search_icon"></i></button>
                    <button class="go_posting_btn header_btn" type="button">새 글 작성</button>
                    <div class="user_nav_wrap">
                        <button class="user_btn" type="button">
                            <img src="/img/user_icon.png" alt="">
                            <i class="fas fa-caret-down"></i>
                        </button>
                        <div class="user_nav">
                            <ul>
                                <li class="my_page"><a href="myborder/${principal.user.username}">내 벨로그</a></li>
                                <li class="temp_post"><a href="#">임시 글</a></li>
                                <li class="read_list"><a href="#">읽기 목록</a></li>
                                <li class="setting"><a href="mypage/${principal.user.id}">설정</a></li>
                                <li class="logout"><a href="logout">로그아웃</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- border list -->
    <div class="bl_container">
        <div class="bl_info_wrap">
            <div class="img_wrap"><img class="user_img" src="/img/user_icon.png" alt=""></div>
            <div class="user_info">
                <h2 class="user_name">${principal.user.name}</h2>
                <p class="user_comment">${principal.user.comment}</p>
            </div>
        </div>
        <div class="seper_line"></div>
        <div class="border_nav">
            <a class="list">글</a>
            <a class="series">시리즈</a>
            <a class="intro">소개</a>
        </div>
        <div class="bl_wrap">
            <div class="border_search_box">
                <div class="border_search">
                    <i class="fas fa-search search_icon"></i>
                    <input type="text" class="border_ip" placeholder="검색어를 입력하세요" autofocus>
                </div>
            </div>
            <div class="border_list">
                <!-- 공지 이미지 태그 (이미지 미첨부시에 js구현필요)-->
                <a href="#" class="to_detail"><img class="border_main_img" src="/img/Group 2.png" alt=""></a>
                <a href="#" class="to_detail"><h2 class="border_title">{border.title}</h2></a>
                <p class="border_pre_content">
                    해외의 Buy Me a Coffee와 유사한 서비스 ThankYouFor___를 소개드립니다. 
                    이 서비스는 카카오페이로 결제가 가능하며, 
                    서비스 수수료가 0% 입니다. (참고: 이 서비스는 벨로그와 관계가 없습니다.)
                    aaaaaaaasdfagsa
                    gdasgsdfsdafdsfsdfdsfdsfsfsdafa  skfaljdlsafddsjklajfklsdajfdsafksdad
                    teststeststesttetsetsetseteststeststesttetsetsetseteststeststesttetsetsetse
                <!-- 키워드 태그 foreach?? -->
                <div class="border_keyword">
                    <a href="#">도레미</a>
                    <a href="#">파솔라시</a>
                    <a href="#">도레이파솔</a>
                    <a href="#">라시도레미파</a>
                    <a href="#">솔라시도레미파</a>
                    <a href="#">솔라시도레미파솔</a>
                    <a href="#">라시도레미파솔라시</a>
                    <a href="#">도레미파솔라시도레미</a>
                </div>
                <!-- 공지 날짜 및 댓글수 태그 -->
                <div class="border_subinfo">
                    <span class="create_date">1996년 00월 00일</span>
                    ·
                    <span class="count_reply">99999개의 댓글</span>
                </div>
            </div>
        </div>
        <div class="border_control">
            <div class="tag_list">태그 목록</div>
            <ul class="items">
                <li><a href="#" class="item">전체보기</a><span>(1)</span></li>
                <li><a href="#" class="item">벨로그</a><span>(1)</span></li>
                <li><a href="#" class="item">벨로그</a><span>(1)</span></li>
            </ul>
        </div>
    </div>

</body>
<script src="https://kit.fontawesome.com/0b11c2b6d9.js" crossorigin="anonymous"></script>
<script src="/js/header.js"></script>
<script src="/js/myborder.js"></script>
</html>