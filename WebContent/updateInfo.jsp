<%@page import="kr.or.kh.member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.min_1.12.4.js"></script>
<script>
   $(function() {
	   $("#pwdck").keyup(function(){
           var pw1 = $('#pw').val().trim();
            if(pw1==""){
                alert("패스워드를 입력하세요");
                $("#pwdck").val('');
                $("#pw").focus();
            }
            var pw2=$("#pwdck").val().trim();
            if(pw1.length!=0 && pw2.length!=0){
                if(pw1==pw2){
                    $("#out").html("패스워드가 일치합니다.");
                    $("#out").css({"color":"green","font-weight":"bold"});
                }else{
                	
                    $("#out").html("패스워드가 일치하지 않습니다..");
                    $("#out").css({"color":"red","font-weight":"bold"});
                }
            }
        });
   });
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>회원수정</title>
</head>
<body>
 <div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
	      <div class="jumbotron" style="padding-top: 20px;">
		<h3 style="text-align: center;">회원수정</h3>
		<%
			MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
		%>
		<form action="memberUpdateFinal.mb" method="post">
			<div class="form-group" style="padding-top: 5px;">
				<label for="아이디">아이디</label> 
				<input type="text" class="form-control" name="id" maxlength="20" autofocus="autofocus" required="required" value="<%=memberDTO.getId()%>">
				<input type="hidden" name="idSearch" value="<%=memberDTO.getId()%>">
            </div>		
			<div class="form-group">
				<label for="비밀번호">비밀번호</label> 
				<input type="password" class="form-control" name="pw" maxlength="20" placeholder="비밀번호입력" id="pw">
    		</div>
    		<div class="form-group">		
    		<span id="out"></span>
    		</div>
    		<div class="form-group">
				<label for="비밀번호확인">비밀번호확인</label> 
				<input type="password" class="form-control" name="pwdck" maxlength="20" placeholder="비밀번호다시입력" id="pwdck">
    		</div>	
			<div class="form-group">
				<label for="이름">이름</label> 
				<input type="text" class="form-control" name="name" maxlength="20" value="<%=memberDTO.getName()%>">
            </div>		
			<div class="form-group">
				<label for="주소">주소</label> 
				<input type="text" class="form-control" name="addr" maxlength="20"  value="<%=memberDTO.getAddr()%>">
            </div>		
			<div class="form-group">				
				<label for="전화번호">전화번호</label> 
				<input type="text" class="form-control" name="tel" maxlength="20"  value="<%=memberDTO.getTel()%>">
            </div>		
			<div class="form-group">				
				<label for="직업">직업</label>
				<select name="stype" class="form-control">
					<option value="1">학생</option>
					<option value="2">학부모</option>
					<option value="3">교사</option>
				</select> 			
			</div>	
				<input type="submit" value="수정" class="btn btn-primary form-control">
		</form>
		<a href = "memberDelete.jsp" style="float: right; margin-top: 8px;">회원탈퇴하기 ▶</a>
		</div>
	</div>
	<div class="col-lg-4"></div>
  </div>
</body>
</html>