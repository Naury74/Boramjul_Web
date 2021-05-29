<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세 페이지</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<body>
<div class=wrap>
	<%@ include file="../include/header.jsp" %>
    <div class="dividing_line">
        <h1 id="BP-h1">공지사항</h1>
    </div>
    <form name="form" method="post" >
    <div class="review-view-wrapper">
        <h3 id="review-h3">${dto.name}</h3>
        <input type="hidden" name="qnanum" value="${dto.qnanum }">
        <div class="clearBoth"></div>
        <div class="review-header">
            <div id="review_data_left">
	            <span class="member_id">관리자</span>
	            <span class="divi"> | </span>   
	            <span class="member_id">${dto.kind } </span>
	            <span class="divi"> | </span>
	            <span class="review_date"><fmt:formatDate value="${dto.qnadate }" pattern="yyyy.MM.dd"/> </span>
            </div>
        </div>
        <div class="clearBoth"></div>
        
        <div class="reviewed_books_margin">   
               
		<div id="comment-write-box" maxlength="2000" style="display: block; height: 150px;">${ dto.content}</div>
			
		<button style="position: absolute; width: 100px; height: 50px; left:85%; top: 1%; border-radius:5%; background-color: #434CA5; " type="button">
			<a style="color: white;
					font-family: gmarket;
					font-style: normal;
					font-weight: bold;
					font-size: 18px;
					line-height: 21px;
					font-family: mainfont;
					text-decoration:none;"
					href="${path }/etc/QnA.do">목록
			</a>
		</button>
		<c:if test="${sessionScope.name == '보람관리자'}">
		<button style="position: absolute; width: 100px; height: 50px; left:65%; top: 1%; border-radius:5%; background-color: green; " type="button">
			<a style="color: white;
					font-family: gmarket;
					font-style: normal;
					font-weight: bold;
					font-size: 18px;
					line-height: 21px;
					font-family: mainfont;
					text-decoration:none;"
					href="${path }/admin/QnA_edit.do/${dto.qnanum}">수정
			</a>
		</button>
		
		<button style="position: absolute; width: 100px; height: 50px; left:75%; top: 1%; border-radius:5%; background-color: red; " type="button" onclick="delete()">
			<a style="color: white;
					font-family: gmarket;
					font-style: normal;
					font-weight: bold;
					font-size: 18px;
					line-height: 21px;
					font-family: mainfont;
					text-decoration:none;"
					href="${path }/admin/QnA_delete.do?qnanum=${dto.qnanum}">삭제
			</a>
		</button>
		</c:if>
		</div>
	</div>
	</form>
</div>   
</body>
</html>