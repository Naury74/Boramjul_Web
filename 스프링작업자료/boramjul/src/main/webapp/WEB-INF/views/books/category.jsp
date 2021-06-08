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
				<form name="form" id="form1" method="post">
					<div id="searched_books_margin">   
						<div>
							<img src=${row.image } alt="책 이미지" class="searched_bookimg">
						</div> 
						
						<div id="searched_books_info">
							<div class="searched_books_title">${row.prodname }</div>
							
							<div class="searched_books_info_d">
								<span class="book_author">${row.content }</span>
							</div><!-- searched_books_info_d -->
							
							<div class="searched_books_price">
								<span class="price-of-searched-books"><fmt:formatNumber value="${row.price }" pattern="#,###,###"/>원</span>
							</div>
						
							<div class="num">
								<button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
								<input class="num_input" type="text" name="quantity" value="1" readonly="readonly" size="1"/>
								<button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
							</div>
						</div><!-- searched_books_info -->
						<div class="btn_searched"> 
							<div>
								<button class="detail_btn" type="submit" formaction="${path}/books/BookDetail.do">상세 보기</button>
							</div>

							<div>
								<input type="hidden" name="prodname" value="${row.prodname }">
								<input type="hidden" name="content" value="${row.content }">
								<input type="hidden" name="price" value="${row.price }">
								<input type="hidden" name="image" value="${row.image }">
								
								<button class="cart_btn" type="submit" formaction="${path}/mypage/cart_insert.do?email=${sessionScope.email}">장바구니 추가</button>
							</div>
							
							<div>
								<button class="buy_btn" type="submit" formaction="${path}/mypage/order_now.do?email=${sessionScope.email}">바로 구매</button>
							</div>
						</div><!-- btn_searched -->
						<div class="clearBoth"></div>     
					</div><!-- searched_books_margin -->
					</form>
				</c:forEach>
			</div><!-- related_books -->
		</div><!-- List-right -->
	</div><!-- List-wrapper -->
</div><!-- wrap -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>