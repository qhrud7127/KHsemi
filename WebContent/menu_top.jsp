<%@page import="kr.or.kh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String id = (String)session.getAttribute("ID"); 
    String name = (String)session.getAttribute("NAME");%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
/* 헤더 */
    .header {height: 100px; }
    .header .logo-icon{height: 80%; width: 25%; padding-top: 1%; position: absolute; left: 0%;}
    .header .header_menu {width: 100%; text-align: right; font-weight: bold;}
    .header .header_menu a {color: #58ACFA ; padding: 8px 0 6px 10px; display: inline-block; transition: color 0.3s ease; font-family: 'Abel', sans-serif;}
    .header .header_menu a:hover {color: #F2F2F2;}
    .header-icon{height: 260%; width: 100%; padding-top: 0%; position: absolute;}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="wrap">
	<header id="header">
	    <div class="container">
			<div class="header">
				<div class="header_menu">
					<img src="img/logo_black.png" title="logo" class="logo-icon"/>
					<a href="index.jsp">홈</a> 
					<% MemberDTO memberDTO = new MemberDTO();
					if(id!=null){
                        	out.print("<a href='memberLogout.mb'>로그아웃</a>");
                        	%>
        					<a href='checkInfo.mb?MBNO=<%=memberDTO.getMbno()%>'>마이페이지</a><br>
        					<%
                        	out.print(name+"님 환영합니다.");
						if(id.equals("system")){
                         	out.print("<a href='memberList.mb'>회원관리</a>");
						}
                        } else {
                        	out.print("<a href='LoginForm.jsp'>로그인</a>");
                        	 out.print("<a href='memberForm.jsp'>회원가입</a>");
                        }
                        	%>
				</div>
				<img src="img/main1.png" title="name" class="header-icon" />
			</div>
			<!-- //header_menu-->
		</div>
	</header>
</div>
</body>
</html>