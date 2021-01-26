<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
			body{
				background-color: #303841;
			}
		    .col{
	                width: 500px;
	                height: 700px;
	                position: absolute;
	                left: 50%;
	                top: 50%;
	                transform: translate(-50%,-50%);
	                margin: 0 auto;
	                border-radius: 7px;
	                background-color: white;
	            }
	            .col p{
	            	text-align: center;
	            	font-size: 25px;
	            	font-weight: 600;
	            }
	            .join-contentbox{
	            	width: 300px;
	            	height: 70px;
	            	margin: 30px;
	            	position: relative;
	            	left: 19%;
	            	margin-bottom: 20px;
	            }
		    h4{
		        color: #4C4C4C;
		        margin: 0;
		    }        
		    
		     input{
		        display: inline-block;
		        width: 250px;
		        height: 20px;
		        margin-top: 7px;
		        font-size: 15px;
		        border: 0;
		        border-bottom:1px solid lightgray;
		    }   
		    input:focus{
		        border-bottom:1px solid #4C4C4C;
		        outline: none;
		    }
		    .btn{
			    border: 1px solid #ff7867;
			    color: gray;
			    background-color: white;
			    font-size: 17px;
			    border-radius: 7px;
			    cursor: pointer;
			    margin-top: 30px;
			    width: 200px;
			    height: 40px;
			    position: relative;
			    left: 30%;
			    }
		            
		    button:hover {
		          opacity: 0.8;
		          background-color:#ff7867;
		          color: white; 
		        }  
	</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
		<div class="col">
			<p>야망일기 회원가입</p>
				<form action="join" method="post">
					<div class="join-contentbox">
					    <h4>아이디</h4>
					    <input type="text" name="user_id" id="user_id"/></br>
					    <span id="idchk"></span>
					</div>
					<div class="join-contentbox">
					    <h4>비밀번호</h4>
					    <input type="password" name="user_pw"/>
					</div>
					<div class="join-contentbox">
					    <h4>비밀번호 확인</h4>
					    <input type="password" name="user_pw2" onchange="pwchk()"/></br>
					    <span id="pwchk"></span>
					</div>
					<div class="join-contentbox">
					    <h4>이  름</h4>
					    <input type="text" name="user_name"/>
					</div>
					<div class="join-contentbox">
					<h4>이메일</h4>
					<input type="email" name="user_email"/>
					</div>
					<div class="btnbox">
			    		<button type="submit" class="btn">가  입</button>		
					</div>
				</form>
	</div>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		}
	
	$('#user_id').focusout(function() {
		var id = $('#user_id').val();
		console.log(id);
		$.ajax({
			url:'dbchk',
			type:'GET',
			dataType:'JSON',
			data:{"id":id},
			success:function(data){
				console.log(data.cnt)
				if(data.cnt>0){
					$('#idchk').html("아이디가 존재합니다. 다시 확인해주세요.");
					$('#idchk').css("color","red");
					$('#user_id').val() = null;
				}else if(user_id==""){
					$('#idchk').html("아이디를 입력해주세요.");
					$('#idchk').css("font-size","13px");
					$('#idchk').css("color","red");
				}else{
					$('#idchk').html("사용가능한 아이디입니다.");
					$('#idchk').css("font-size","13px");
					$('#idchk').css("color","blue");
				}
			},
			error:function(){
				
			}
		});
	});
</script>
</html>