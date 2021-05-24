<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books</title>
<%@ include file="../include/include.jsp" %>
<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
</head>
<body>
<div class=wrap>
	<%@ include file="../include/header.jsp" %>
  <div class="dividing_line">
    <h1 id="BP-h1">신간 도서</h1>
  </div>  
  <div class="List-wrapper"> 
    <%@ include file="../include/booksmenu.jsp" %>
    <div class="List-right">
      <div id="related_books">
        <c:forEach var="row" items="${nblist}" varStatus="status"> 
        <!-- 책1 -->
        <div id="searched_books_margin">   
          <div><img src=${row.image } alt="책 이미지" class="searched_bookimg"></div> 
          <div id="searched_books_info">
            <div class="searched_books_title">${row.name }</div>
            <div class="searched_books_info_d">
              <span class="book_author">${row.content }</span>
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${row.price }</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="/resources/images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="resources/images/review.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>
          <div class="btn_searched"> 
          <div class="num">
            <button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
            <input class="num_input" type="text" name="num" value="0" readonly="readonly" size="1"/>
            <button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
          </div>
          <div>
            <button class="cart_btn" type="button" onclick=>장바구니 추가</button>
          </div>
          <div>
            <button class="buy_btn" type="button" onclick=>바로 구매</button>
          </div>
          </div>
          <div class="clearBoth"></div>     
 		</div>  
        </c:forEach>
        <div class="clearBoth"></div>
        <div class="page-move">
          <a href="javascript:;" onclick="searchList(1)" class="prev"><span></span>이전</a>
          <a href="javascript:;" onclick="searchList(1)" class="page-on">1</a>
          <a href="javascript:;" onclick="searchList(2)">2</a>
          <a href="javascript:;" onclick="searchList(3)">3</a>
          <a href="javascript:;" onclick="searchList(4)">4</a>
          <a href="javascript:;" onclick="searchList(5)">5</a>
          <a href="javascript:;" onclick="searchList(6)">6</a>
          <a href="javascript:;" onclick="searchList(7)">7</a>
          <a href="javascript:;" onclick="searchList(8)">8</a>
          <a href="javascript:;" onclick="searchList(9)">9</a>
          <a href="javascript:;" onclick="searchList(10)">10</a>
          <a href="javascript:;" onclick="searchList(11)" class="next">다음<span></span></a>
          <a href="javascript:;" style="display:none;" onclick="searchList(2)" class="accesskey_118" accesskey="v"></a>
        </div>
      </div>
    
    </div>  
  </div>
      <%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>