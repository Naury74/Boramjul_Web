<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 뷰 페이지</title>
<%@ include file="../include/include.jsp" %>
<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<body>
<div class=wrap>
    <div class="dividing_line">
        <h1 id="BP-h1">리뷰</h1>
    </div>
    <div class="review-view-wrapper">
        <h3 id="review-h3">${dto.rename}</h3>
        <div class="clearBoth"></div>
        <div class="review-header">
            <div id="review_data_left">
            <span class="member_id">${dto.email }</span>
            <span class="divi"> | </span>   
            <span class="member_id">${dto.lookup } </span>
            <span class="divi"> | </span>
            <span class="review_date"> ${dto.redate } </span>
            </div>
        </div>
        <div class="clearBoth"></div>
        
           <div class="reviewed_books_margin">   
               
               <div name="comment" id="comment-write-box" maxlength="2000" style="display: block; height: 150px;">${ dto.content}</div>
                <button style="position: absolute; width: 100px; height: 50px; left:85%; top: 1%; border-radius:5%; background-color: #434CA5; " type="button"><a style="color: white;
		            font-family: gmarket;
		            font-style: normal;
		            font-weight: bold;
		            font-size: 18px;
		            line-height: 21px;
		            font-family: mainfont;
		            text-decoration:none;"
		            href="${path }/books/reviewtest.do">목록</a></button>
                </div>
	</div>
</div>   
</body>
</html>