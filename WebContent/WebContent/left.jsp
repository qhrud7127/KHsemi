<%@ page language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
    String pagefile=request.getParameter("page");
   if(pagefile==null){
   pagefile="bbs";
   }   
%>
<%String id = (String)session.getAttribute("ID"); 
    String name = (String)session.getAttribute("NAME");%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<title>삼부초등학교</title>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="css/Left-style.css">

</head>
<body>
<script src="js/listscript.js"></script>
   <div id="wrap">
   <header>
         <jsp:include page="menu_top.jsp"  flush="false" />
         </header>
      	
	         <jsp:include page="menu_left.jsp"  flush="false" />
	         <section class="se">
	            <jsp:include page='<%= pagefile+".jsp" %>' />
	         </section>
		      <footer>
				<jsp:include page="menu_bottom.jsp"></jsp:include>
			</footer>
		
   </div>
</body>
</html>