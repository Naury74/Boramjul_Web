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
    
					<div class="book_reviews">
						<span class="book_scores"><img src="../images/별점5.svg" alt="별점" class="star"> 9.9</span>
						<span class="divi">|</span>
						<img src="${path}/images/리뷰.svg" alt="리뷰" class="review-img">
						<span class="number_of_reviews">회원리뷰: 1000건</span>
					</div><!-- book_reviews -->
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
          				<span class="number_of_reviews">1000</span>
          				<span>명의 보람줄 회원이 평가한 평균별점</span>
          				
       					<div class="total_book_scores">
       						<img src="../images/별점5.svg" alt="별점" id="total_star">
       						<span style="font-size: 60px;"> 9.9</span> / 10
        				</div><!-- total_book_scores -->
     				</div><!-- review_total -->
				    <div class="please_write">책에 대한 고객님의 생각을 들려주세요 
				    	<button id="review_btn" type="button" onclick=>리뷰 작성</button>
				    </div>
				    
      				<li>
          				<div class="searched_books_margin">
          					<div class="searched_books_review">
            					<div class="searched_books_review_title">리뷰 제목</div>
            					<div class="searched_reviewer_info">
              						<span class="member_id">아이디 </span>
           							<span class="divi"> | </span>
             						<span class="review_date"> 2021.04.26 </span>
              						<span class="divi">|</span>
              						<img src="../images/별점1.svg" alt="별점" class="star">
              						<span class="divi">|</span>          
              						<img src="../images/comment.svg" alt="댓글" class="comment-img">
              						<span>500</span>
              						<span class="divi">|</span>
              						<img src="../images/heart.svg" alt="좋아요" class="heart-img">
              						<span>4444</span>              
            					</div><!-- searched_reviewer_info -->          
					            <p class="preview" style="display: block;">
					              그녀는 세계의 상황이 전반적으로 한심하다고 목소리를 높였다. 인간의 활동이 환경에 악영향을 끼쳤고 그로 인해 곧 재앙이 닥칠 거라고 주장했다. 물론 요즘 같은 시대에 지구 환경에 대한 걱정을 표현하는 게 잘못은 아니다. 하지만 삶에 긍정적인 일은 하나도 없고 침대에서 일어나는 것조차 힘들어하는 20대 초반의 젊은이가 그런 문제에 관한 자신의 지식을 과대평가하는 것은 잘못이다. 그런 상황에서는 우선순위를 명확히 할 필요가 있다.
					            </p>  
          					</div><!-- searched_books_review -->
            
             				<div class="clearBoth"></div>
   						</div><!-- searched_books_margin -->      
   					</li>
				</div><!-- book_review_wrapper -->
   			</ul>
		</div><!-- book_review -->
	</div><!-- wrap -->
	
    <%@ include file="../include/footer.jsp" %>
</body>

</html>