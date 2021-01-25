<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body{
			margin: 0;
			padding: 0;
		}
		#header_wrapper{
			width: 100%;
			height: 200px;
			text-align: center;
			background-color: #303841; 
		}
		#header_wrapper header{
			width: 100%;
			height: 200px;
			margin: 0 auto;
		}
		#header_wrapper header img{
			width: 250px;
			height: 250px;
			text-align: center;
			margin-top: -25px;
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
	</style>
</head>
<body>	
	<div id="header_wrapper">
		<header>
			<a href = "">
				<img src="resources/img/logo.png" alt=" ">
			</a>
		</header>
	</div>
	<div>	
		<div class="sidenav">
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
			<a href="#">나의 야망</a>
			<a href="#">2021년 총 평가</a>
		</div>
	</div>	
	<script>
		/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
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
</body>

</html>