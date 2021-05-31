<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
	<%@ include file="../include/include.jsp" %>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="dividing_line">
	<h1 id="BP-h1">리뷰</h1>
</div><!-- dividing_line -->

<div class=wrap>
	<div class="List-wrapper"> 
		<%@ include file="../include/booksmenu.jsp" %>
		
		<div class="List-right">
			<div id="related_books">
				<!-- 리뷰 1 -->
				<c:forEach var="row" items="${map.list }">
				<div id="searched_review_margin">   
					<div><img src="${row.image } alt="책 이미지" class="searched_bookimg"></div>
					
					<div id="searched_books_review">
						<div id="searched_books_review_title">
							<a href="${path }/books/review_detail.do/${row.renum}">${row.rename }</a>
						</div><!-- searched_books_review_title -->
						<div class="searched_reviewer_info">
							<div id="searched_books_title_for_review">작가</div>
							<span class="member_id">${row.email } </span>
							<span class="divi"> | </span>
							<span class="review_date"><fmt:formatDate value="${row.redate }" pattern="yyyy.MM.dd"/></span>
							<span class="divi">|</span>
							<span>${row.grade }</span>
							<span class="divi">|</span>          
							<img src="../images/comment.svg" alt="댓글" class="comment-img">
							<span>${row.comscore }</span>
							<span class="divi">|</span>
							<img src="../images/heart.svg" alt="좋아요" class="heart-img">
							<span>${row.recom } / ${row.prodnum }</span>
						</div><!-- searched_reviewer_info -->
						     
						<p class="preview" style="display: block;">
							${row.content }
						</p>  
					</div><!-- searched_books_review -->
					
					<div class="clearBoth"></div>
					<div class="clearBoth"></div>
				</div><!-- searched_review_margin -->
				</c:forEach>
			</div><!-- related_books -->
		<div class="clearBoth"></div>
		</div><!-- List-right -->
	</div><!-- List-wrapper -->
</div><!-- wrap -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>