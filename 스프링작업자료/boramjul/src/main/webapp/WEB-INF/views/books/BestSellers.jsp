<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Sellers</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
<script type="text/javascript">

$(function(){
	$('.buy_btn').click(function(){
		document.form.submit();
		//location.href="${path}/mypage/order.do?email=${sessionScope.email}";
	})
	
	
	
})



</script>
</head>
<body>
<div class=wrap>
	<%@ include file="../include/header.jsp" %>
  <div class="dividing_line">
    <h1 id="BP-h1">베스트셀러</h1>
  </div>  
    <div class="List-wrapper"> 
  	<%@ include file="../include/booksmenu.jsp" %>
    <div class="List-right">
      <div id="related_books">
        <c:forEach var="row" items="${bslist}" varStatus="status"> 
        <!-- 책1 -->
        <div id="searched_books_margin">   
          <div>
          	<a href="/books/BookDetail.do?prodnum=${row.prodnum }"><img src=${row.image } alt="책 이미지" class="searched_bookimg"></a>
          </div> 
          <div id="searched_books_info">
            <a href="${row.link }"><div class="searched_books_title">${row.name }</div></a>
            <div class="searched_books_info_d">
              <span class="book_author">${row.content }</span>
            </div>
            <div class="searched_books_price">
              <span class="price-of-searched-books">${row.price }</span>
            </div>
            <div class="searched_book_reviews">
              <div class="searched_book_scores"><img src="${path }/images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
              <img src="${path }/images/review.svg" alt="리뷰" class="review-img">
              <span class="number_of_reviews">회원리뷰: 5555건</span>
            </div>
          </div>
          <div class="btn_searched"> 
          <div class="num">
            <button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
            <input class="num_input" type="text" name="num" value="0" readonly="readonly" size="1"/>
            <button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
          </div>
          
          <form name="form" id = "form" method="post" action="${path}/mypage/order_now.do?email=${sessionScope.email}">
	          <div>
	          	<input type="hidden" name="name" value="${row.name }">
	          	<input type="hidden" name="content" value="${row.content }">
	          	<input type="hidden" name="price" value="${row.price }">
	          	<input type="hidden" name="image" value="${row.image }">
	            <button class="cart_btn" >장바구니 추가</button>
	          </div>
	          <div>
	            <button class="buy_btn" >바로 구매</button>
	          </div>
          </form>
          
          </div>
          <div class="clearBoth"></div>     
 		</div>  
        </c:forEach>

      </div>
    
    </div>  
  </div>
  <%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>