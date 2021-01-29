<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<style>
	body{
			margin: 0;
			padding: 0;
		}
		#header_wrapper{
			width: 100%;
			height: 120px;
			text-align: center;
			background-color: #303841; 
		}
		#header_wrapper header{
			width: 100%;
			height: 120px;
			margin: 0 auto;
		}
		#header_wrapper header img{
			width: 150px;
			height: 150px;
			text-align: center;
			margin-top: -15px;
			position: absolute;
		}
		#header_wrapper header #userbox{
			width: 180px;
			height: 50px;
			float: right;
			/* border: 1px solid red; */
			position: relative;
    		top: 50px;
		}		
		#header_wrapper header #userbox #login-btn{
			width: 60px;
			height: 30px;
			border: 1px solid #dbdbdb;
			border-radius: 4px;
			background-color: transparent;
			font-size: 15px;
			color: #dbdbdb;
			cursor: pointer;
			position: relative;
			top: 20%;
			margin-right: 8px;
		}
		#header_wrapper header #userbox #join-btn{
			width: 75px;
			height: 30px;
			border: 1px solid #dbdbdb;
			border-radius: 4px;
			background-color: #ff7867;
			color: #dbdbdb;
			font-size: 15px;
			cursor: pointer;
			position: relative;
			top: 20%;
			margin-right: 8px;
		}
		/* Fixed sidenav, full height */
		.sidenav {
		  height: 100%;
		  width: 200px;
		  position: fixed;
		  z-index: 1;
		  /* top: 0; */
		  left: 0;
		  background-color: #111;
		  overflow-x: hidden;
		  padding-top: 50px;
		}
		
		/* Style the sidenav links and the dropdown button */
		.sidenav a, .dropdown-btn {
		  padding: 15px 8px 15px 16px;
		  text-decoration: none;
		  font-size: 15px;
		  color: #818181;
		  display: block;
		  border: none;
		  background: none;
		  width: 100%;
		  text-align: left;
		  cursor: pointer;
		  outline: none;
		}
		
		/* On mouse-over */
		.sidenav a:hover, .dropdown-btn:hover {
		  color: #f1f1f1;
		}
		
		/* Main content */
		.main {
		  margin-left: 200px; /* Same as the width of the sidenav */
		  font-size: 20px; /* Increased text to enable scrolling */
		  padding: 0px 10px;
		}
		
		/* Add an active class to the active dropdown button */
		.active {
		  background-color: green;
		  color: white;
		}
		
		/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
		.dropdown-container {
		  display: none;
		  background-color: #262626;
		  padding-left: 8px;
		}
		
		/* Optional: Style the caret down icon */
		.fa-caret-down {
		  float: right;
		  padding-right: 8px;
		}
		
		/* Some media queries for responsiveness */
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
		.sidenav #logout-btn{
			width: 170px;
		    height: 35px;
		    background-color: transparent;
		    border: 1px solid gray;
		    color: gray;
		    border-radius: 7px;
		    position: fixed;
		    left: 15px;
		    top: 870px;
		    cursor: pointer;
		}
		.sidenav #logout-btn:hover{
			border: 1px solid #ff7867;
			color: #ff7867;
		}
</style>
</head>
<body>
	<c:choose>
	    <c:when test="${sessionScope.loginid eq  null}">
			<div id="header_wrapper">
				<header>
					<a href = "#">
						<img src="resources/img/logo.png" alt=" ">
					</a>
					<div id="userbox">
						<button id="login-btn">로그인</button>
						<button id="join-btn" onclick="location.href='joinForm'">회원가입</button>
					</div>
				</header>
			</div>
 		</c:when>
 		
		<c:otherwise>
			<div id="header_wrapper">
				<header>
					<a href = "#">
						<img src="resources/img/logo.png" alt=" ">
					</a>
				</header>
			</div>
		</c:otherwise>
	</c:choose> 

	<div>	
		<c:choose>
			<c:when test="${sessionScope.loginid eq  null}">
				<div class="sidenav">
					<div>
						<a href="#">나의 일년 계획</a>
						<button class="dropdown-btn">나의 분기별 계획
					    	<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
						    <a href="#">1분기</a>
						    <a href="#">2분기</a>
						    <a href="#">3분기</a>
						    <a href="#">4분기</a>
						  </div>
						<a href="#">나의 야망 만다라트</a>
						<a href="#">2021년 총 평가</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="sidenav">
					${sessionScope.loginid}의 야망일기
					<div>
						<a href="#">나의 일년 계획</a>
						<button class="dropdown-btn">나의 분기별 계획
					    	<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
						    <a href="quarter?type=1">1분기</a>
						    <a href="quarter?type=2">2분기</a>
						    <a href="quarter?type=3">3분기</a>
						    <a href="quarter?type=4">4분기</a>
						  </div>
						<a href="#">나의 야망 만다라트</a>
						<a href="#">2021년 총 평가</a>
					</div>
				<button id="logout-btn" onclick="location.href='logout'">로그아웃</button>
				</div>
			</c:otherwise>				
		</c:choose>				
		<!-- <div class="content">
			<div class="longplan">
			</div>
			<div class="todoplan">
			</div>
			<div class="riview">
			</div>
		</div> -->
	</div>	
</body>
	<script>
	/*드롭다운 메뉴*/
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	  this.classList.toggle("active");
	  var dropdownContent = this.nextElementSibling;
	  if (dropdownContent.style.display === "block") {
	  dropdownContent.style.display = "none";
	  } else {
	  dropdownContent.style.display = "block";
	  }
	  });
	}
	</script>
</html>