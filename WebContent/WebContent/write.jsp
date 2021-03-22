<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/Left-style.css">
<style>
#file{
width: 700px;
    margin: 0px auto;
    background: #FFF;
    padding: 20px;
}
.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #4F4E4E;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #D4D0D0;
   cursor: pointer;
   border: 1px solid #BDBBBB;
   border-bottom-color: #BDBBBB;
   border-radius: .25em;
} /* named upload */
.filebox .upload-name {
   display: inline-block;
   padding: .5em .75em; /* label의 패딩값과 일치 */
   font-size: inherit;
   font-family: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}
</style>
<title>커뮤니티</title>
</head>
<body>
	<%
		String userID = null;
// 		String boardID = request.getParameter("boardID");
		if(session.getAttribute("ID") != null){
			userID = (String) session.getAttribute("ID");
		}

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'LoginForm.jsp'");
			script.println("</script>");
		} 
		 int boardID = 0;
			if (request.getParameter("boardID") != null){
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
	%>
	
	<div class="container">
		<div class="row">
		<form method="post"  action="uploadtest/upload.jsp" enctype="multipart/form-data">
         <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="5" style="background-color: #eeeee; text-align: center;">커뮤니티 글쓰기</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td colspan="5" ><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
                  </tr>
                  <tr>
                     <td colspan="5" ><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
                  </tr>
               </tbody>
            </table>
         <div class="filebox">
            <input class="upload-name" value="파일선택" disabled="disabled">
            <label for="ex_filename">업로드</label> 
            <input type="file" id="ex_filename" name="file1" class="upload-hidden">
         </div>
         <input type="hidden" name="boardID" value="<%=boardID%>">
         <input type="submit" class="btn-primary pull-right" value="글쓰기">
      </form>
		</div>
	</div>
   <script>
      $(document).ready(
            
            function() {
               var fileTarget = $('.filebox .upload-hidden');
               fileTarget.on('change', function() { // 값이 변경되면 
                  if (window.FileReader) { // modern browser 
                     var filename = $(this)[0].files[0].name;
                  } else { // old IE 
                     var filename = $(this).val().split('/').pop()
                           .split('\\').pop(); // 파일명만 추출 
                  }
                  // 추출한 파일명 삽입
                  $(this).siblings('.upload-name').val(filename);
               });
            });
   </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>