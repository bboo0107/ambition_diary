<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
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
		.content{
		border: 1px solid red;
		width: 100%;
		height: 100%;
		position: fixed;
		left: 200px;
		}
		.content .longplan{
		border: 1px solid blue;
		width: 100%;
		height: 200px;
		position: relative;
		}
		.content .todoplan{
		border: 1px solid green;
		width: 100%;
		height: 400px;
		position: relative;
		}
		.content .riview{
		border: 1px solid yellow;
		width: 100%;
		height: 130px;
		position: relative;
		}
	/*팝업 모달*/
	.modal_wrap{
	        display: none;
	        width: 500px;
	        height: 250px;
	        position: absolute;
	        top:50%;
	        left: 50%;
	        margin: -250px 0 0 -250px;
	        background:#eee;
	        z-index: 2;
	        border-radius: 7px;
	    }
	    .black_bg{
	        display: none;
	        position: absolute;
	        content: "";
	        width: 100%;
	        height: 100%;
	        background-color:rgba(0, 0,0, 0.5);
	        top:0;
	        left: 0;
	        z-index: 1;
	    }
	    .modal_close{
	        width: 26px;
	        height: 26px;
	        position: absolute;
	        top: -30px;
	        right: 0;
	    }
	    .modal_close> a{
	        display: block;
	        width: 100%;
	        height: 100%;
	        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	        text-indent: -9999px;
	    }
	    .modal_wrap button{
			border: 1px solid #ff7867;
			color: gray;
			background-color: white;
			font-size: 17px;
		    border-radius: 7px;
		    cursor: pointer;
		    margin-top: 30px;
		    width: 390px;
		    height: 40px;
	    }
	    .modal_wrap button:hover {
  	       opacity: 0.8;
	       background-color:#ff7867;
	       color: white; 
		        }
		.modal_wrap .container{
			position: absolute;
			top: 18%;
			margin-left: 50px;
			width: 500px;
			height: 200px;
		}        
	    .modal_wrap .container span{
	    	display: inline-block;
	    	width: 75px;
	    	height: 20px;
	    }
	    .modal_wrap .container input{
	    	display: inline-block;
		    width: 300px;
		    height: 40px;
		    margin-top: 7px;
		    font-size: 15px;
		    border: 0;
		    border-bottom:1px solid lightgray;
		    border-radius: 7px;
		    
	    }
	    .modal_wrap .container input:focus{
		    border-bottom:1px solid #ff7867;
		    outline: none;
		}
	    
	    
	</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>	
<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	
		<div class="content">
			<div class="longplan">
			</div>
			<div class="todoplan">
			</div>
			<div class="riview">
			</div>
		</div>
	
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a href="#">close</a></div>
       <div id="idform">
		<form class="modal-content" action="login" method="post">		
		    <div class="container">
		      <div id="login_id">
			      <span><b>아이디</b></span>
			      <input type="text" name="id">
			  </div>
		      <div id="login_pw">
			      <span><b>비밀번호</b></span>
			      <input type="password" name="pw">
		      </div> 		      
		      <button type="submit">로그인</button>
		    </div>
		</form>
	</div>
</div>

</body>
	<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		}
	
		/* /*드롭다운 메뉴
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
		} */
		
		/*로그인 팝업 */
		window.onload = function() {

	     function onClick() {
	        document.querySelector('.modal_wrap').style.display ='block';
	        document.querySelector('.black_bg').style.display ='block';
	    }   
	    function offClick() {
	        document.querySelector('.modal_wrap').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
	 
	    document.getElementById('login-btn').addEventListener('click', onClick);
	    document.querySelector('.modal_close').addEventListener('click', offClick); 
	    
	   /*  $('#login-btn').on('click',function(){
	    	$('.modal_wrap').css('display','block');
	    	$('.black_bg').css('display','block');
	    });
	    $('.modal_close').off('click',function(){
	    	$('.modal_wrap').css('display','none');
	    	$('.black_bg').css('display','none');
	    }); */
	 
	};


</script>

</html>