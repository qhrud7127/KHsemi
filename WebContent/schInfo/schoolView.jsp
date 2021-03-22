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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<body>
<div class="wrap">
    <jsp:include page="../menu_top.jsp" flush="false"/>
    <div class="gruop">
    <jsp:include page="../menu_left.jsp" flush="false"/>
	<section>
    <div style="width:80%; margin-left: 10%; margin-top: 5%;">
        <h1 style="color:#424242">학교 둘러보기</h1>
        <hr>
        <br>
        <br>
        <div class="fotorama" >
            <img src="../img/s1.jpg">
            <img src="..img/s2.jpg">
            <img src="../img/s3.jpg">
            <img src="../img/s4.jpg">
            <img src="../img/s5.jpg">
            <img src="../img/s6.jpg">
            <img src="../img/s7.jpg">
        </div>
    </div>
            </section>
    </div>
    </div>
</body>
</html>