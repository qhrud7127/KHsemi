<%@page import="kr.or.kh.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>회원목록</title>
</head>
<body>
     
      <div class="container" style="padding-top: 30px;">
   		<div class="row">
   		<h1>회원목록</h1><br>
           <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<th style="background-color: #eeeee; text-align: center;">번호 </th>
				<th style="background-color: #eeeee; text-align: center;">아이디</th>
				<th style="background-color: #eeeee; text-align: center;">비밀번호</th>
				<th style="background-color: #eeeee; text-align: center;">이름</th>
				<th style="background-color: #eeeee; text-align: center;">주소</th>
				<th style="background-color: #eeeee; text-align: center;">핸드폰번호</th>
				<th style="background-color: #eeeee; text-align: center;">직업</th>
			</tr>
			<%
				ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>) request.getAttribute("memberList");
				for (int i = 0; i < memberList.size(); i++) {
					MemberDTO memberDTO = memberList.get(i);
			%>
			<tr>
				<td id="firstrow"><%=memberDTO.getMbno()%></td>
				<td><a href="checkInfo.mb?MBNO=<%=memberDTO.getMbno()%>"><%=memberDTO.getId()%></a></td>
				<td><%=memberDTO.getPw()%></td>
				<td><%=memberDTO.getName()%></td>
				<td><%=memberDTO.getAddr()%></td>
				<td><%=memberDTO.getTel()%></td>
				<td><%=memberDTO.getStype()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<form name='frm' method='GET' action='memberSearch.mb'>
		<select name="STYPE">
			<option value="all">전체</option>
			<option value="1">학생</option>
			<option value="2">학부모</option>
			<option value="3">교사</option>
		</select>
			<input type='text' name='nameSearch' placeholder="이름입력">
			<button type='submit'>검색</button>
		</form>		
	</div>
	</div>
</body>
</html>