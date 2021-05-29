<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 도서 목록</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
<script type="text/javascript">
//넘버박스 함수
function Count(type, ths){
    var $quantity = $(ths).parents("div").find("input[name='quantity']");
    var count = Number($quantity.val());

    if(type=='p'){
        if(count >=0) $quantity.val(Number(count)+1);
    }else{
        if(count >1) $quantity.val(Number(count)-1);    
    }
}
</script>
</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="dividing_line">
  <h1 id="BP-h1">카테고리별 도서 목록</h1>
</div>  

<div class=wrap>
	<div class="List-wrapper"> 
	<%@ include file="../include/booksmenu.jsp" %>
	
		<div class="List-right">
			<div id="related_books">
				<c:forEach var="row" items="${list}" varStatus="status"> 
					<div id="searched_books_margin">   
						<div>
							<a href="${path}/books/BookDetail.do?prodnum=${row.prodnum }">
								<img src=${row.image } alt="책 이미지" class="searched_bookimg">
							</a>
						</div> 
						
						<div id="searched_books_info">
							<div class="searched_books_title">
								<a href="${path}/books/BookDetail.do?prodnum=${row.prodnum }">${row.name }</a>
							</div><!-- searched_books_title -->
							
							<div class="searched_books_info_d">
								<span class="book_author">${row.content }</span>
							</div><!-- searched_books_info_d -->
							
							<div class="searched_books_price">
								<span class="price-of-searched-books">${row.price }</span>
							</div>
							
							<div class="searched_book_reviews">
								<div class="searched_book_scores">
									<img src="${path }/images/별점4h.svg" alt="별점" class="star"> 9.1
								</div><!-- searched_book_scores -->
								
								<img src="${path }/images/review.svg" alt="리뷰" class="review-img">
								<span class="number_of_reviews">회원리뷰: 5555건</span>
							</div><!-- searched_book_reviews -->
						</div><!-- searched_books_info -->
						
						<div class="btn_searched"> 
							<div class="num">
								<button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
								<input class="num_input" type="text" name="quantity" value="1" readonly="readonly" size="1"/>
								<button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
							</div>
							
							<div>
								<button class="cart_btn" type="button" onclick=>장바구니 추가</button>
							</div>
							
							<div>
								<button class="buy_btn" type="button" onclick=>바로 구매</button>
							</div>
						</div><!-- btn_searched -->
						
						<div class="clearBoth"></div>     
					</div><!-- searched_books_margin -->
				</c:forEach>
			</div><!-- related_books -->
		</div><!-- List-right -->
	</div><!-- List-wrapper -->
</div><!-- wrap -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>