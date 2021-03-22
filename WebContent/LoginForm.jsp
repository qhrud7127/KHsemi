<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>로그인</title>
</head>
<body>
	<div class="container">
	<div class="col-lg-4"></div>
	   <div class="col-lg-4">		
		<div class="jumbotron" style="padding-top: 20px; margin-top: 150px;">
	 	<form action="./memberLogin.mb" method="get">
    		<div class="logo1" style="padding: 20px 0; margin-bottom: 0px; text-align: center;">
	    		<a href="index.jsp"><img src="./images/sambuLogo.png" width="160px" height="170px"></a>
	    	</div>
     		<div class="form-group">
				<input type="text" class="form-control" name="ID" maxlength="20" autofocus="autofocus" required="required" placeholder="아이디입력">
			</div>
			<div class="form-group">
			    <input type="password" class="form-control" name="PW" maxlength="20" placeholder="비밀번호입력">
			</div>	
			    <input type="submit" class="btn btn-primary form-control" value="로그인">
			<div style="font-size: 90%; padding-top: 15px; text-align: center;">
		    	<a href="memberForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    	<a href="idcheck.jsp">아이디찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    	<a href="passcheck.jsp">비밀번호찾기</a>		
		    </div>	
		</form>
		</div>
	</div>
	<div class="col-lg-4"></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
</body>
</html>