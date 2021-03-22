<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KHJSP</title>
</head>
<body>
	<article id="title">
		<div class="container">
			<div class="title">
				<h2>MENU</h2>
				<a href="#" class="btn"> <i class="fa fa-angle-down"
					aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</article>
	<!-- //title -->
	<nav id="nav">
		<div class="container">
			<div class="nav">
				<div class="last">
					<h3>학교안내</h3>
					<ul>
						<li><a href="left.jsp?page=principal">인삿말</a></li>
						<li><a href="left.jsp?page=eduGoal">교육목표</a></li>
						<li><a href="left.jsp?page=schoolReport">학교현황</a></li>
						<li><a href="left.jsp?page=teachers">교직원소개</a></li>
						<li><a href="left.jsp?page=song">교가</a></li>
						<li><a href="left.jsp?page=schoolView">학교둘러보기</a></li>
						<li><a href="left.jsp?page=howToGet">오시는길</a></li>
					</ul>
				</div>
				<div class="last">
					<h3>학생마당</h3>
					<ul>
						<li><a href="left.jsp?bbs.jsp&boardID=1&pageNumber=1">방과후교실</a></li>
						<li><a href="left.jsp?bbs.jsp&boardID=2&pageNumber=1">시험자료</a></li>
					</ul>
				</div>
				<div class="last">
					<h3>학부모마당</h3>
					<ul>
						<li><a href="left.jsp?bbs.jsp&boardID=3&pageNumber=1">민원신청</a></li>
						<li><a href="left.jsp?bbs.jsp&boardID=4&pageNumber=1">학부모회</a></li>
					</ul>
				</div>
				<div class="last">
					<h3>선생님마당</h3>
					<ul>
						<li><a href="left.jsp?bbs.jsp&boardID=5&pageNumber=1">연구자료</a></li>
						<li><a href="left.jsp?bbs.jsp&boardID=6&pageNumber=1">업무자료실</a></li>
					</ul>
				</div>

				<div class="last">
					<h3>열림마당</h3>
					<ul>
						<li><a href="left.jsp?bbs.jsp&boardID=7&pageNumber=1">공지사항</a></li>
						<li><a href="left.jsp?bbs.jsp&boardID=8&pageNumber=1">가정통신문</a></li>
						<li class="active"><a href="left.jsp?page=event">이달의행사</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- nav -->



	<section id="contents">
		<div class="container">
			<section id="cont_center">
				<div>
					<article>
						<!-- 게시판 -->
						<div class="notice1">
							<h1>
								공지사항 <a href="#" class="plus"></a>
							</h1>
							<jsp:include page="miniNotice.jsp" flush="false"/>
						</div>
						<!-- //게시판 -->
					</article>
				</div>
				<div>
					<article>
						<!-- 게시판 -->
						<div class="notice1">
							<h1> 가정통신문 <a href="#" class="plus1"></a></h1>
							<jsp:include page="miniHome.jsp" flush="false"/>
						</div>
						<!-- //게시판 -->
					</article>
				</div>
				<div>
					<article>
						<div class="notice1">
							<h1>학교둘러보기</h1>
							<div class="slider">
								<div>
									<figure>
										<img src="img/gil.jpg" alt="둘러보기" id="gil">
									</figure>
								</div>
								<div>
									<figure>
										<img src="img/gil1.jpg" alt="둘러보기" id="gil">
									</figure>
								</div>
								<div>
									<figure>
										<img src="img/gil2.jpg" alt="둘러보기" id="gil">
									</figure>
								</div>
							</div>
							<!-- //이미지 슬라이드 -->
						</div>
						<!-- //게시판 -->
					</article>
				</div>
				<div>
					<article>
						<!-- 오시는길 -->
						<div class="notice1">
							<h1>오시는길</h1>
							
							<div style=" width: 80%; margin: 0 auto;">
						<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3783800920005!2d127.0307203155943!3d37.49899297981058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1610883903396!5m2!1sko!2skr"
						frameborder="0" style="border: 0;" width="100%" height="240px"
						allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</div>
							
						</div>
						<!-- //오시는길 -->
					</article>
				</div>
			</section>
			<section id="quick">
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=1&pageNumber=1"><img src="img/pallete.png" title="방과후"
						class="quick-icon" /><br>방과후교실</a>
				</div>
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=2&pageNumber=1"><img src="img/board.png" title="시험"
						class="quick-icon" /><br>시험자료</a>
				</div>
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=3&pageNumber=1"><img src="img/plane.png" title="민원"
						class="quick-icon" /><br>민원신청</a>
				</div>
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=4&pageNumber=1"><img src="img/note.png" title="학부모"
						class="quick-icon" /><br>학부모회</a>
				</div>
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=5&pageNumber=1"><img src="img/graduation.png" title="연구"
						class="quick-icon" /><br>연구자료</a>
				</div>
				<div class="quick-box">
					<a href="left.jsp?bbs.jsp&boardID=6&pageNumber=1"><img src="img/book.png" title="업무"
						class="quick-icon" /><br>업무자료실</a>
				</div>
			</section>
			<section id="banner">
					<div class="slider1">
						<div class="banner-box">
							<figure>
								<img src="img/banner1.jpg" alt="이미지1">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner2.png" alt="이미지2">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner3.jpg" alt="이미지3">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner4.jpg" alt="이미지1">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner5.png" alt="이미지1">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner6.png" alt="이미지1">
							</figure>
						</div>
						<div>
							<figure>
								<img src="img/banner7.jpg" alt="이미지1">
							</figure>
						</div>
						<div class="banner-box">
							<figure>
								<img src="img/banner8.png" alt="이미지1">
							</figure>
						</div>
					</div>
					<!-- //이미지 슬라이드 -->
			</section>
		</div>
	</section>
</body>
</html>