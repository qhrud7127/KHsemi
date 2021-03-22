<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="css/Left-style.css">
<style type="text/css">

   .wrap {width: 900px; margin: 0 auto;}
    section {float: left; width: 80%; height: 1300px; background: white;}

      
        .gallery_content:hover .overlay.right {
            top: 0;
        }

        #gallery_layout {
        	position:absolute;
            margin: 2% auto;
            overflow: hidden;
            width : 100%;
        }

        #gallery_layout:after {
            content: "";
            display: block;
            clear: both;
        }

        .gallery_content {
            position: relative;
            float: left;
            width: 50%;
            overflow: hidden;
        }

        .gallery_content img {
            width: 100%;
            height: 300px;
            display: block;
            margin: 0 auto;
            transition: all 1s ease-in-out;
        }

        .content_tc {
            z-index: 1;
            display: none;
            color: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); 
        }
        
        .content_tc h1 {
            font-size: 1.2em;
            text-transform: uppercase;
            text-align: center;
        }
        .content_tc p {
            padding: 2px 0;
            font-size: 0.8em;
            text-align: center;
        }        
        .gallery_content:hover .content {
            display: block;
            transition: all 1s ease-in-out;
        }

        .gallery_content:hover img {
            transform: scale(1.2);
            transition: all 1s ease-in-out;
        }

        .overlay {
            display: none;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            transition: top 0.3s, right 0.3s, bottom 0.3s, left 0.3s;
        }

        /* overlay color */
        .overlay.darkBlue {
            background-color:rgba(31, 50, 99, 0.6);
        }
        .overlay.gold {
            background-color:rgba(216, 177, 126, 0.5);
        }  
        .overlay.pink {
            background-color:rgba(255, 113, 181, 0.7);
        }  
        .overlay.black {
            background-color: rgba(0, 0, 0, 0.5);
        }  
        .overlay.yellow {
            background-color: rgba(103, 58, 183, 0.5);
        }
        .overlay.red {
            background-color: rgba(244, 67, 54, 0.5);
        }      

        .gallery_content:hover .overlay {
            display: block;
            transition: all 0.5s ease-in-out;
        }
        
         @media all and (min-width: 960px) {
            #gallery_layout {
                position: absolute;
                width: 40%;
            }  
            .gallery_content {
            width: 50%;
        }
        }  

         
        @media all and (max-width: 800px) {
        .wrap {width:100%; height :150%;}
        #footer{margin-top: 2200px}
        #gallery_layout {
            width: 70%;
            margin: 0% auto;
            
        }
        .gallery_content {
            width: 90%;
             margin: 0% auto;
        }
        }
        }

</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<head>
 <meta charset="UTF-8">
 <title>앨범만들기 - 표</title>
</head>
<body>
<div class="wrap">
    <jsp:include page="../menu_top.jsp" flush="false"/>
    <div class="gruop">
    <jsp:include page="../menu_left.jsp" flush="false"/>
	<section>
    <div style="width:50%; padding:10%; padding-right: 20px;">
    <h1 style="color:#424242">교직원소개</h1>
    <hr>
  	<div id="gallery_layout">
        <div class="gallery_content">
            <img src="../img/teacher1.png" alt="teacher1">
            <div class="content_tc">
                <h1>영어</h1>
                <p>박신혜</p>
            </div>
            <div class="overlay darkBlue"></div>
        </div>
        <div class="gallery_content">
            <img src="../img/teacher2.png" alt="teacher2">
            <div class="content_tc">
                <h1>수학</h1>
                <p>이선균</p>
            </div>
            <div class="overlay red"></div>
        </div>
        <div class="gallery_content">
            <img src="../img/teacher3.png" alt="teacher3">
            <div class="content_tc">
                <h1>음악</h1>
                <p>신세경</p>
            </div>
            <div class="overlay pink"></div>
        </div>
        <div class="gallery_content">
            <img src="../img/teacher4.png" alt="teacher4">
            <div class="content_tc">
                <h1>과학</h1>
                <p>차은우</p>
            </div>
            <div class="overlay black"></div>
        </div>
        <div class="gallery_content">
            <img src="../img/teacher5.png" alt="teacher5">
            <div class="content_tc">
                <h1>문학</h1>
                <p>송혜교</p>
            </div>
            <div class="overlay yellow"></div>
        </div>
        <div class="gallery_content">
            <img src="../img/teacher6.png" alt="teacher6">
            <div class="content_tc">
                <h1>체육</h1>
                <p>현빈</p>
            </div>
            <div class="overlay gold"></div>
        </div>
    </div>
    </div>
            </section>
    </div>
    </div>
</body>
</html>