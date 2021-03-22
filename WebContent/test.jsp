<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
     
       <style type="text/css">
         * {margin: 0; padding: 0;}
        a{color: black; text-decoration: none; font-size: 1.1em;}
        body {background: white;}
        #footer {border-top: 1px solid #dbdbdb;}  
        #wrap {width: 900px; margin: 0 auto; border: 1px solid red;}
        header {width: 100%; height: 300px;}
        aside {float: left; width: 20%; height: auto; }
        
        section {overflow: hidden; padding: 1%; width: 98%; height:auto; #fff; text-align: center; border: 1px solid blue;}
        footer {width: 100%; height: 150px; background-color: #FAFAFA;}
      
        
         /* 컨테이너 */
        .container {position: absolute; margin: 0 auto; }
        
        
         /* 헤더 */
        .row{height: 100px; width:auto; }
        .header {height: 100px; width:100%;}
        .header .logo-icon{height: 80%; width: 25%; padding-top: 1%; position: absolute; left: 0%;}
        .header .header_menu {width: 100%; text-align: right; font-weight: bold;right: 10%;}
        .header .header_menu a {color: #58ACFA ; padding: 8px 0 6px 10px; display: inline-block; transition: color 0.3s ease; font-family: 'Abel', sans-serif;}
        .header .header_menu a:hover {color: #F2F2F2;}
         .nav > div h3 {font-size: 18px; color: #58ACFA; font-weight: bold; margin-bottom: 4px;}
        .header-icon{height: 260%; width: 109%; padding-top: 0%; position: absolute; }
        
        
        
   
        
        /* 화면 너비 0 ~ 1200px */
        @media (max-width: 2220px){
            #wrap {width: 95%;}
             .container {width: 100%;}
            #contents .container {border: 0;}
            aside {float: left; width: 20%; height: auto;}
         section {float: left; width: 80%; height: 700px;} 
            footer {clear: both; width: 100%; height: 150px;}
            
        }

        /* 화면 너비 0 ~ 768px */
        @media (max-width: 768px){
            #wrap {width: 100%;}
            .header .logo-icon{height: 80%; width: 40%;}
           .header-icon{width: 100%; height: 260%}
           aside {float: left; width: 100%; height: auto;}
        }

        /* 화면 너비 0 ~ 480px */
        @media (max-width: 480px){
            #wrap {width: 100%;}
            header {height: 400px;}
            .header .logo-icon{height: 80%; width: 50%;}
            .header-icon{width: 100%; height: 260%}
             aside {float: none; width: 100%; height: auto;}
          section {float: none; width: 100%; height: auto;}
            .menu{width: 100%;}
        }
        
        
        
         /* 레프트 스타일  */
     /** 배경 지정 */
    body {
        background: white;
}

    /** 목록 스타일 초기화 및 중앙 배치, 가로 폭 지정 */
    ul {
        padding: 0;
        margin: 50px auto;
        list-style: none;
        width: 200px;
}
      .menu{
      width: 80%;
      
      }

    /** 제목 영역의 초기화 처리 */
    .title1 {
        padding: 0;
        margin: 0;
        
}

    /** 링크의 클릭 영역 확대 및 배경 및 폰트 처리 */
    .title1 > a {
        display: block;
        padding: 2px;
        font-size: 14px;
        font-weight: bold;
        text-indent: 12px;
        text-decoration: none;
        color: white;
        height: 32px;
        line-height: 32px;
        background: red;
        border-radius: 5px;
        -webkit-border-radius: 5px;
        
        /*그라디언트 지정*/
        background: linear-gradient(top, #cecece 0%, #8f8f8f 100%);
        background: -moz-linear-gradient(top, #cecece, #8f8f8f);
        background: -webkit-gradient(linear, left top, left bottom, from(#cecece), to(#8f8f8f));
    }

    /** 현재 활성화된 요소에 적용할 배경이미지 지정 */
    .selected {
        background: #2288dd !important;
        color: #fff !important;
        
        /*그라디언트 지정*/
        background: linear-gradient(top, #6bb2ff 0%, #2288dd 100%) !important;
        background: -moz-linear-gradient(top, #6bb2ff, #2288dd) !important; 
        background: -webkit-gradient(linear, left top, left bottom, from(#6bb2ff), to(#2288dd)) !important;       
    }
    
    /** 내용 영역 */
    .content {
        margin: 0;
        background: white;
        padding: 10px;
        height: auto;
        overflow-y: auto;
        border-radius: 5px;
        -webkit-border-radius: 5px;
   }
   .content li{
      background: #FFF; 
       position:relative;
        width: 100%;
        float:left;
       list-style-type:none;
        overflow: hidden;
        text-align: center;    
        line-height: 45px;
   }
   .content li a{
         color: black;
          text-align: center;
          font-size: 15px;
         
   }
    
        
        
       
         /* 푸터 */
        .footer {text-align: center; padding: 30px 50px; border: 2px solid red; height: 150px; width: auto;} 
        .footer li {position: relative; display: inline; padding: 0 7px 0 10px; white-space: nowrap; float: none; border: 2px solid black;}
        .footer li:before {content: ''; width: 1px; height: 12px; background-color: #dbdbdb; position: absolute; left: 0; top: 2px;}
        .footer li:first-child:before {width: 0;}
        .footer address {padding-top: 15px;}
       
        

    
 
 </style>
   
</head>
<body>
   
    <script>

 $(document).ready(function(){
        
        /** 초기화 처리*/

       
       $(".collapsible").find(".content").hide(); //content를 숨김
        
        /** 링크에 대한 클릭 이벤트 처리 */
        $(".collapsible .title1 a").click(function() {            
            $(this).toggleClass("selected");
            //클릭된 나 자신을 제외한 나머리 링크들은 slected 클래스를 무조건 제거
            $(".collapsible .title1 a").not(this).removeClass("selected"); 

            // 펼칠 내용 영역 선택
            var target = $(this).parents(".collapsible").find(".content");

            // 나머지 내용 영역을 선택
            var other = $(".collapsible .title1 a").not(this)
                                                  .parents(".collapsible").find(".content");

            // 애니메이션으로 열고 닫기 처리
            target.slideToggle(300);
            other.slideUp(300);
            
            // 링크 페이지 이동 중지
            return false;
        });
    });
  </script>
    
    
    
    <div  id="wrap">
       
       <header id="header">
        <div class="container">
            <div class="row">
                <div class="header">
                   <div class="header_menu">
                    <div class="banner">
                     <img src="img/logo_black.png" title="logo" class="logo-icon"/>
               <a href="index.jsp">홈</a> 
               <%if(id!=null){
                           out.print("<a href='memberLogout.mb'>로그아웃</a>");
                            out.print("<a href='memberList.mb'>회원목록</a>");
                            out.print("<a href='left.jsp?page=mypage'>마이페이지</a>");
                        } else {
                           out.print("<a href='left.jsp?page=LoginForm'>로그인</a>");
                            out.print("<a href='left.jsp?page=memberForm'>회원가입</a>");
                        }
                           %>
                    </div>
                    </div> 
                       <img src="img/main1.png" title="name" class="header-icon"/>  
                     </div>
                    <!-- //header_menu-->
            </div>
            
        </div>
    </header>


        <aside>
          <ul class="menu">
        <li class="collapsible">
            <h2 class="title1"><a href="#">학교안내</a></h2>
            <ul class="content">
            <li><a href="left.jsp?page=schInfo/principal">인삿말</a></li>
            <li><a href="left.jsp?page=schInfo/eduGoal">교육목표</a></li>
            <li><a href="left.jsp?page=schInfo/schoolReport">학교현황</a></li>
            <li><a href="left.jsp?page=schInfo/teachers">교직원소개</a></li>
            <li><a href="left.jsp?page=schInfo/song">교가</a></li>
            <li><a href="left.jsp?page=schInfo/schoolView">학교둘러보기</a></li>
            <li><a href="left.jsp?page=schInfo/howToGet">오시는길</a></li>        
            </ul>
        </li>
        <li class="collapsible">
            <h2 class="title1"><a href="#">학생마당</a></h2>
            <ul class="content">
         <li><a href="left.jsp?page=bbs&boardID=1&pageNumber=1">방과후교실</a></li>
         <li><a href="left.jsp?boardID=2&pageNumber=1">시험자료</a></li>
         </ul>
             </li>
        <li class="collapsible">
            <h2 class="title1"><a href="#">학부모마당</a></h2>
            <ul class="content">
         <li><a href="left.jsp?boardID=3&pageNumber=1">민원신청</a></li>
         <li><a href="left.jsp?boardID=4&pageNumber=1">학부모회</a></li>
         </ul>
        </li>
        <li class="collapsible">
            <h2 class="title1"><a href="#">선생님마당</a></h2>
            <ul class="content">
         <li><a href="left.jsp?boardID=5&pageNumber=1">연구자료</a></li>
         <li><a href="left.jsp?boardID=6&pageNumber=1">업무자료실</a></li>
         </ul>
        </li>
        <li class="collapsible">
            <h2 class="title1"><a href="#">알림마당</a></h2>
            <ul class="content">
         <li><a href="left.jsp?boardID=7&pageNumber=1">공지사항</a></li>
         <li><a href="left.jsp?boardID=8&pageNumber=1">가정통신문</a></li>
         </ul>
        </li>
    
       </ul>
       
        </aside>
        
        
        <section id="mid">
         
        <jsp:include page='<%= pagefile+".jsp" %>'/>
        
        </section>
        
        <footer id="footer">
   <div class="container">
        <div class="footer">
            <ul >
                <li><a href="#">사이트 도움말</a></li>
                <li><a href="#">사이트 이용약관</a></li>
                <li><a href="#">사이트 운영원칙</a></li>
                <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                <li><a href="#">책임의 한계와 법적고지</a></li>
                <li><a href="#">게시중단요청서비스</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
            <address>
                Copyright ©<strong>상부삼조</strong>
                All Rights Reserved.
            </address>
        </div>
   </div>
</footer>
    

 </div>
</body>
</html>