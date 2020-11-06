<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Board</title>

<script src="/webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="/js/common.js" ></script>
<style>
	html,
	body {
	   margin:0;
	   padding:0;
	   height:100%;
	}
	.container {
	   min-height:100%;
	   position:relative;
	   padding-bottom:100px;/* footer height */
	}
	.footer {
	   width:100%;
	   height:100px;
	   position:absolute;
	   bottom:0;
	   background:#5eaeff;
	  text-align: center;
	  color: white;
	}
	nav {
		position: relative;
		z-index: 2;
		top: 0;
		left: 0;
		right: 0;
		margin-bottom : 20px;
		padding: 0;
		position: fixed;
	}
	ul {
		background-color: #FFDAB9;
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;

	}
	li.nav_ul_li { float: left; }
	li.user_Info { float: right; }

	li a {
		display: block;
		background-color: #FFDAB9;
		color: #000000;
		padding: 8px;
		text-decoration: none;
		text-align: center;
		font-weight: bold;
	}
	li a.current {
		background-color: #FF6347;
		color: white;
	}

	li a:hover:not(.current) {
		background-color: #CD853F;
		color: white;
	}

</style>
</head>
<body>
		<div class="big_door" style="height:150px; background-color:#FFDAB9; text-align: center; font-size:100px; margin-bottom:20px;" >
			<a class="door_title" style="position: relative; z-index: 3;">${bbsTitle}</a>
		</div>
		<nav class="board header">
			<div class = "header nav">
				<ul class ="header nav_ul">
					<li class="header nav_ul_li home "><a href="" class="current">Home</a></li>
					<li class="header nav_ul_li notice"><a href="">공지사항</a></li>
					<li class="header nav_ul_li archive"><a href="/board">자료실</a></li>
					<li class="header nav_ul_li menual"><a href="">대응매뉴얼</a></li>
					<li class="header nav_ul_li menual"><a href="/mailPage">메일</a></li>
					<li class="header nav_ul_li menual"><a href="/mapPage">지도</a></li>
					<li class="header nav_ul_li menual"><a href="">개톡</a></li>

					<li class="header user_Info user_logout"><a href="/logout" style="color:gray;">로그아웃</a></li>
					<li class="header user_Info user_info"><a href="" style="color:gray;">회원정보</a></li>
					<li class="header user_Info user_name"><a href="" style="color:white;">${name} 님</a></li>
				</ul>
			</div>
		</nav>
