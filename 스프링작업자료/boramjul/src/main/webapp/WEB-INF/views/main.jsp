<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
	<link rel="stylesheet" href="${path}/css/main.css">
	<%@ include file="include/include.jsp" %>
	<script type="text/javascript" src="${path}/include/packed.js"></script>
</head>
<body>


<div class="wrap">

	<%@ include file="include/header.jsp" %>

    <div class="box">
        <div id="wrapper">
            <div>
                <div id="slider">
                    <ul>
                        <li><img src="${path}/images/today1.svg" alt="첫번쨰" /></li>
                        <li><img src="${path}/images/today2.svg" alt="두번째" /></li>
                        <li><img src="${path}/images/today3.svg" alt="세번째" /></li>
                    </ul>
                </div><!--slider-->
                
                <div class="sliderbutton" id="sliderBtn1">
                    <img src="${path}/images/prev.svg" alt="Previous" onclick="slideshow.move(-1)" />
                </div>

                <div class="sliderbutton" id="sliderBtn2">
                    <img src="${path}/images/next.svg" alt="Next" onclick="slideshow.move(1)" />
                </div>
            </div>
    
            <ul id="pagination" class="pagination">
                <li onclick="slideshow.pos(0)"></li>
                <li onclick="slideshow.pos(1)"></li>
                <li onclick="slideshow.pos(2)"></li>
            </ul>
        </div><!--wrapper-->

        <div id="best-container">
            <p>베스트 셀러</p>
            <p style="font-family:gilroy; font-size: 20px; font-weight: bold;">BEST SELLER</p>

            <div id="best-back">
            	<c:forEach var="row" items="${mainbslist}" varStatus="status">               
                <span id="bookImg"> <!-- 크롤링 돌려야 하는 부분 -->
                    <img src=${row.image } alt="베스트셀러이미지">
                </span>
                </c:forEach>
                <div>
                	<a class="more" href="/books/BestSellers.do">MORE+</a>
                </div>
            </div>
        </div><!--best-container-->

        <div id="new-container">
            <p>신간 도서</p>
            <p style="font-family:gilroy; font-size: 20px; font-weight: bold;">NEW BOOKS</p>

            <div id="new-back">               
                <c:forEach var="row" items="${mainnblist}" varStatus="status">               
                <span id="bookImg"> <!-- 크롤링 돌려야 하는 부분 -->
                    <img src=${row.image } alt="베스트셀러이미지">
                </span>
                </c:forEach>
                <div>
                    <a class="more" href="/books/NewBooks.do">MORE+</a>
                </div>
            </div>
        </div><!--new-container-->

        </div><!--box-->
        
        <%@ include file="include/footer.jsp" %>
    </div><!--wrap-->
    
    <script type="text/javascript">
        var slideshow=new TINY.slider.slide('slideshow',{
            id:'slider',
            auto:3,
            resume:true,
            vertical:false,
            navid:'pagination',
            activeclass:'current',
            position:0
        });
    </script>

</body>
</html>