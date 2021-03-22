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
<body>
	<div class="wrap">
		<jsp:include page="../menu_top.jsp" flush="false" />
		<div class="gruop">
		<jsp:include page="../menu_left.jsp" flush="false" />
		<section>
    <div style="width:80%; margin-left: 10%; margin-top: 5%;">
				<h1 style="color: #424242">오시는 길</h1>
				<hr>
				<div
					style="margin-top: 10%">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3783800920005!2d127.0307203155943!3d37.49899297981058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1610883903396!5m2!1sko!2skr"
						frameborder="0" style="border: 0;" width="100%" height="500px"
						allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
			</div>
		</section>
		</div>
		
	</div>
</body>
</html>