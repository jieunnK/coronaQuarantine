<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
	<link rel="stylesheet" href="./css/mystyle.css">
	<link rel="stylesheet" href="./css/gps.css">
		<!-- 제이쿼리 자바스크립트 추가하기 -->
		<script src="./js/jquery.min.js"></script>
		<!-- 제이쿼리 자바스크립트 추가하기 -->
		<script src="./js/poopoer.js"></script>
		<!-- 제이쿼리 자바스크립트 추가하기 -->
		<script src="./js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">안심방역지도</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"> 
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						관리페이지
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="Management.jsp">전체 목록</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	