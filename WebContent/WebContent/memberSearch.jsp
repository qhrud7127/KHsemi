<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kh.member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardSearch" class="kr.or.kh.member.MemberDTO"
	scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>회원검색</title>
</head>
<body>
	<div class="container" style="padding-top: 30px;">
	<div class="row">
   		<h1>회원검색<br></h1>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<th style="background-color: #eeeee; text-align: center;">번호</th>
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
				<td><%=memberDTO.getMbno()%></td>
				<td><%=memberDTO.getId()%></td>
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
		<a href="memberList.mb"><input type="button" value="회원목록" style="float: right;"></a>
	</div>
	</div>
</body>
</html>