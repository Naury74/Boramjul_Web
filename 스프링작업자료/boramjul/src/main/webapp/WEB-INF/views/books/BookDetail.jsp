<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
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
		<h1 id="BP-h1">도서 정보</h1>
    </div>
  
	<div class=wrap>
		<div class="BP-wrapper">
			
				<div class="BP-top_left">
    				<img src="${booksdto.image }" alt="책 이미지" class="bookimg">
				</div><!-- BP-top_left -->

				<div class="BP-top_right">
					<h2 id="BP-h2">${booksdto.prodname }</h2>
    
					<form name="form" id="form1" method="post">
					<div class="book_details">
						<div class="price">판매가: 
							<span class="price-of-book"><fmt:formatNumber value="${booksdto.price }" pattern="#,###,###"/>원</span>
						</div>
						
						<div class="shipping">배송비: 
							<span class="price-of-shipping">2,500원</span>
						</div>
						
						<div class="num">
							<button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
							<input class="num_input" type="text" name="quantity" value="1" readonly="readonly" size="1"/>
							<button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
						</div>

						<div>
							<input type="hidden" name="prodname" value="${booksdto.prodname}">
							<input type="hidden" name="content" value="${booksdto.content}">
							<input type="hidden" name="price" value="${booksdto.price}">
							<input type="hidden" name="image" value="${booksdto.image}">
							
							<button class="cart_btn" type="submit" formaction="${path}/mypage/cart_insert.do?email=${sessionScope.email}">장바구니 추가</button>
						</div>
						<div>
							<button class="buy_btn" type="submit" formaction="${path}/mypage/order_now.do?email=${sessionScope.email}">바로 구매</button>
						</div>  
					</div><!-- book_details -->
					</form>
				</div><!-- BP-top_right -->
				
		</div><!-- BP-wrapper -->
  
		<!-- 리뷰 -->	
		<div id="dividing_line">
			<h4 id="BP-h4">회원 리뷰</h4>
		</div>
  
  		<div class="book_review">
    		<ul>
     			<div class="book_review_wrapper">         
        			<div class="review_total">
          				<span>현재 등록된 리뷰가 없습니다.<br>
          					책을 구매하시고 리뷰를 작성해보세요!</span>
     				</div><!-- review_total -->
				</div><!-- book_review_wrapper -->
   			</ul>
		</div><!-- book_review -->
	</div><!-- wrap -->
	
    <%@ include file="../include/footer.jsp" %>
</body>

</html>