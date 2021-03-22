<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>회원탈퇴</title>
</head>
<body>
    <div class="container">
      <div class="col-lg-4"></div>      
         <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px; margin-top: 250px;">
            <form action="memberDelete.mb" method="get">
            <h3 style="text-align: center;">회원탈퇴하기</h3>
              <div class="form-group" style="padding-top: 20px;">
                <input type="password" class="form-control" name="pw" required="required" autofocus="autofocus" placeholder="비밀번호입력">
              </div>
                <input type="submit" class="btn btn-primary form-control" value="확인">
            </form>
            </div>
        </div>
      <div class="col-lg-4"></div>
   </div>
</body>
</html>