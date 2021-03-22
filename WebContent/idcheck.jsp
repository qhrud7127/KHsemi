<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>아이디찾기</title>
</head>
<body>
    <div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; margin-top: 250px;">
              <form action="idcheckConfirm.mb" method="get">
                <h3 style="text-align: center;">아이디 찾기</h3>
                 <div class="form-group" style="padding-top: 20px;">
                   <input type="text" class="form-control" name="tel" required="required" autofocus="autofocus" placeholder="전화번호입력(숫자만입력)" maxlength="20">
                 </div>
                   <input type="submit" class="btn btn-primary form-control" value="확인">
               </form>
             </div>
         </div>
		 <div class="col-lg-4"></div>
    </div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>