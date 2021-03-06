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
	.content{
		border: 1px solid red;
		width: 100%;
		height: 100%;
		position: fixed;
		left: 200px;
	}
	.content-allplan{
		width: 100%;
		height: 80%;
		border: 1px solid green;
		display: grid; 
		padding-top:16px;
		padding-bottom:4px;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: repeat(3, minmax(280px, auto));
		grid-template-columns: repeat(auto-fill, minmax(25%, auto));
		gap: 20px;
		align-items: stretch;
		justify-items: stretch;
	}
	..planlistwrap{
		width: 280px;
		height: 335px;
		border: 1px solid black;
		margin: 50px 50px 30px 50px;
	}
	.planlist{
		width: 280px;
		height: 335px;
		border: 1px solid black;
		margin: 50px 50px 30px 50px;
	}
	#checkbox{
		width: 17px;
		height: 17px;
		cursor: pointer;
		border: 1px solid black;
		display: inline-block;
		margin: 11px 5px 0px 0px;
	}
	.checkbox_title{
		width: 97%;
		height: 25px;
		border: none;
		font-size: 25px;
		text-align: center;
	}
	.checkbox_title:focus{
		outline: none;
	}
	#checkbox_title{
		width: 100%;
		height: 30px;
		border-bottom: 1px solid red; 
	}
	.checkbox_content{
		margin: 0px 5px 0px 5px;
		text-align: center;
		padding: 0;
		
	}
	.content_chk{
		list-style: none;
	}
	.checkbox_content input{
		width: 200px;
    	height: 20px;
    	position: relative;
    	top: -6px;
    	border: 0;
    	border-bottom: 1px solid gray;
    	outline: none;
    	font-size: 15px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<c:if test="${type==1}">
		<div class="content">
			<div class="content-allplan">
			<form action="quarter_plan" method="post">
			<div class="planlist_wrap">
				<section class="planlist">
					<div id="checkbox_title"><input type="text" class="checkbox_title"/></div>
					<ul class="checkbox_content">
						<li class = "content_chk" id="content_chk">
							<div>
								<div id="checkbox"></div>
								<span><input type="text" id="todo"/></span>
							</div>
						</li>
					</ul>
				</section>
			</div>	
			</form>
			</div>
			</div>	
	</c:if>
</body>
<script>
	var maxAppend=1;
	$("#todo").keydown(function(key){
		if(key.keyCode == 13){
			if (maxAppend >= 8) return;
			$(".checkbox_content").append("<li class = 'content_chk' id='content_chk'><div><div id='checkbox'></div><span><input type='text' id='todo'/></span></div></li>");
			maxAppend++;
		}
	});
	

</script>
</html>