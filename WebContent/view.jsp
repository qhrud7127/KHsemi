<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/Left-style.css">
       
<title>커뮤니티</title>
</head>
<body>

	<%
		String userID = "";
		String name = "";
		if(session.getAttribute("ID") != null){
			userID = (String) session.getAttribute("ID");
			name = (String) session.getAttribute("NAME");
		}
	
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		int readcount = 0;
		if (request.getParameter("readcount") != null){
			readcount = Integer.parseInt(request.getParameter("readcount"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location href = 'login.jsp'");
	 		script.println("</script>");
		}
		String boardID = "";
		boardID = request.getParameter("boardID");
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		BbsDAO bdao = new BbsDAO();
		bdao.readcountUpdate(bbsID);
		Comment comment = new CommentDAO().getComment(bbsID);
	%>
	
	
	<div class="view_lay">
	<div class="container_v">
		<div class="col-lg-5">
		<div class="container_b">
			<table class="table table-haver" style="border: 1px solid #dddddd">			
					
					<tr>
						<td colspan="6" align="left" bgcolor="beige">&nbsp;&nbsp;[제목]&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
						<tr>
						<td colspan="3" align="left">&nbsp;&nbsp;[작성자]&nbsp;&nbsp;<%= bbs.getAuthor() %></td>
						<td colspan="3" align="right"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" +  bbs.getBbsDate().substring(14,16) + "분"  %>&nbsp;&nbsp; 조회수 <%=bdao.readcount(bbsID) %></td>
						
					</tr>
					<%if(!bbs.getFile_id().equals("null")){%>
                  <tr>
                     <td colspan="6" align="right"><a href="uploadtest/download.jsp?file_id=<%=bbs.getFile_id()%>&file_name=<%=bbs.getFile_name()%>"><%=bbs.getFile_name()%></a></td>
                  </tr>
                  <%}%>
					
					<tr>
						<td colspan="6"><br><br>
					<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%><br><br></td>
					</tr>
					<tr>
					
					<td colspan="6" align="center">	<a href="left.jsp?page=bbs&boardID=<%=boardID %>" class="btn-primary" >목록</a>
					<%
						if(userID != null && userID.equals(bbs.getUserID()) || userID.equals("system")){
					%>
							<a href = "left.jsp?page=update&boardID=<%=boardID%>&bbsID=<%= bbsID %>&file_id=<%=bbs.getFile_id()%>&file_name=<%=bbs.getFile_name()%>" class="btn-primary">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.bo?bbsID=<%= bbsID %>&file_id=<%=bbs.getFile_id() %>&boardID=<%=boardID %>" class="btn-primary">삭제</a>
					</td>
					
					</tr>
					<% } %>
					
					
			</table>		
		</div>
		
		<div class="container_b">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr>
						<%
							CommentDAO commentDAO = new CommentDAO();
							commentDAO.setting(commentDAO.getAllCount());
							ArrayList<Comment> list = commentDAO.getList(bbsID);
							for(int i=0; i<list.size(); i++){
						%>
							<div class="container_b">
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>						
										<td align="left"><%= list.get(i).getAuthor() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
										<td colspan="2"></td>
										<td align="right"><%
													if((list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)) || userID.equals("system")){
												%>
														
													
														<a href="commup.jsp?commitid=<%= list.get(i).getCommentID()%>&bbsID=<%= list.get(i).getBbsID()%> "> 수정</a>
														<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.co?bbsID=<%=bbsID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>
																	
												<%
													}
												%>	
										</td>
										</tr>
										<tr>
										<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
										</tr>
										
									</tbody>
								</table>			
							</div>
						</div>
						
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
					
		<div class="container_v">
			<div class="form-group">
			<form method="post"action="commentAction.co?bbsID=<%= bbsID %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom:none;" valign="middle"><br><br><%=name %></td>
							<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
							<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr>
					</table>
			</form>
			</div>
		</div>
		</div>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>