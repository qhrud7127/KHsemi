<%@page import="java.util.ArrayList"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
   <%
      int pageNumber = 1; //페이지 첫번쨰부터
      if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }

      BbsDAO bbsDAO = new BbsDAO();
      bbsDAO.setting(bbsDAO.getAllCount());
      ArrayList<Bbs> list = bbsDAO.getList(pageNumber, 8);
      %>   
      <div class="notice_text"> 
      <ul>
   <%    for (int i = 0; i < list.size(); i++) {%>
      <li><span class="text"><a target='_parent' href="left.jsp?page=view&boardID=8&bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></span>
      <span class="date"><%=list.get(i).getBbsDate().substring(0, 11)%></span></li>
      <%
         }
      %>
   </ul>
   </div>
</body>
</html>