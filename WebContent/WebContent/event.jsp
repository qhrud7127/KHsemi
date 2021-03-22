<%@page import="kr.or.kh.member.MemberDAO"%>
<%@page import="kr.or.kh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid' ],
			defaultDate : '2021-01-12',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				title : '겨울방학',
				start : '2021-01-11',
				end : '2021-01-21'
			}, {
				title : '개학',
				start : '2021-03-02'
			}, {
				title : '설날',
				start : '2021-02-11',
				end : '2021-02-14'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2019-08-28'
			} ]
		});

		calendar.render();
	});
</script>
<style>
#calendar {
	max-width: 800px;
	margin: 0 auto;
}
</style>
<title>커뮤니티</title>
</head>
<body>
	<%
      MemberDTO memberdto =new MemberDTO();
      MemberDAO memberdao =new MemberDAO();
      PrintWriter script = response.getWriter();
      int count = 0;
   
      String userID = null;
      if(session.getAttribute("ID") != null){
         userID = (String) session.getAttribute("ID");
      }

   %>
	<div class="container">
		
		<h1>
			이달의행사<br>
		</h1>
		<p>
			삼부초등학교 이달의 행사 안내입니다.<br>
			<br>
		</p>

		<div class=container style="text-align:center">
			<div id='calendar'></div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>