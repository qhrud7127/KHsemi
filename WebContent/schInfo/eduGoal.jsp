<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
	.wrap {width: 60%; margin: 0 auto;}
	section {float: left; width: 80%; background: white;}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/Left-style.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../menu_top.jsp" flush="false"/>
    <div class="gruop">
    <jsp:include page="../menu_left.jsp" flush="false"/>
	<section>
    <div style="width:80%; margin-left: 10%; margin-top: 5%;">
    <h1 style="color:#424242">교육목표</h1>
    <hr>
        <img src ="../img/main2.png" style="height:100%; width: 100%;">
    </div>
    </section>
    </div>
    </div>
   
</body>
</html>