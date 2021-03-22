<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery-1.10.2.js"></script>
<title>커뮤니티</title>
</head>
<body>
	<%
		String userID = null;
		String file_id = request.getParameter("file_id");
		String file_name = request.getParameter("file_name");
		String boardID = request.getParameter("boardID");
		if(session.getAttribute("ID") != null){
			userID = (String) session.getAttribute("ID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('로그인을 하세요')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('권한이 없습니다.')");
	 		script.println("location href = 'bbs.jsp'");
	 		script.println("</script>");
		}
	%>
	
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="bbs.jsp?boardID=2&pageNumber=1">자유 게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 게시판 --> 
	<div class="container">
      <div class="row">
         <form method="post" action="uploadtest/uploadUpdate.jsp" enctype="multipart/form-data">
         <input type="hidden" name="bbsID" value="<%=bbsID %>">
         <input type="hidden" name="boardID" value="<%=boardID %>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="2" style="background-color: #eeeeee; text-align: center;">글수정 </th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" ></td>
                  </tr>
                  <tr>
                  <%if(!file_id.equals("null")){%>
                     <td style="text-align: left">
                     <a href='uploadtest/download.jsp?file_id=<%=file_id%>&file_name=<%=file_name%>' id='filedelete'><%=file_name %></a>
                     <a href="#" onclick="xbox()" id='xdelete'> X</a>
                     <input type="file" name="file_name" style="display:none;" id="fileup">
                     <input type="hidden" name="file_curname" value="<%=file_name %>">
                     <input type="hidden" name="file_curid" value="<%=file_id %>">
                     </td>
                  </tr>
                  <%} else{%>
                     <tr><td><input type="file" name="file_name"></td></tr>
                  <%} %>
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" ><%= bbs.getBbsContent() %></textarea></td>
                  </tr>
               </tbody>
            </table>   
            <button type="submit" class="btn btn-primary pull-right" >글수정</button>
         </form>
      </div>
   </div>
	<script>
	function Request(){
	    var requestParam ="";	 
		this.getParameter = function(param){
	        var url = unescape(location.href); 
	        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
	        
	        for(var i = 0 ; i < paramArr.length ; i++){
	           var temp = paramArr[i].split("=");
	        
	           if(temp[0].toUpperCase() == param.toUpperCase()){
	             requestParam = paramArr[i].split("=")[1]; 
	             break;
	           }
	        }
	        return requestParam;
	    }
	}
	function xbox(){
		var request = new Request();
		var file_id = request.getParameter("file_id");
		document.getElementById("filedelete").style.display="none";
		document.getElementById("xdelete").style.display="none";
		document.getElementById("fileup").style.display="";
	}
	</script>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>