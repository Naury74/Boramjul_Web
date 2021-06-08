<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 리뷰포함</title>
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

$(function(){
	
	$('.book_review_wrapper > #review_list').each(function(){

		var div = $(this);
		var grade = div.find('#grade').val();
		
		console.log('index: '+div.index()+' / grade: '+grade);
		
		if(grade == 1){
			$(div.find("#gradeimg")).attr("src", "${path}/images/star1.svg");
		}
		if(grade == 2){
			$(div.find("#gradeimg")).attr("src", "${path}/images/star2.svg");
		}
		if(grade == 3){
			$(div.find("#gradeimg")).attr("src", "${path}/images/star3.svg");
		}
		if(grade == 4){
			$(div.find("#gradeimg")).attr("src", "${path}/images/star4.svg");
		}
		if(grade == 5){
			$(div.find("#gradeimg")).attr("src", "${path}/images/star5.svg");
		}
	})
	
	var review = '${dto.review }';
	console.log('review: '+review);
	
	if(review == 1){
		$("#review_img").attr("src", "${path}/images/star1.svg");
		$("#total_star").attr("src", "${path}/images/star1.svg");
	}
	if(review == 2){
		$("#review_img").attr("src", "${path}/images/star2.svg");
		$("#total_star").attr("src", "${path}/images/star2.svg");
	}
	if(review == 3){
		$("#review_img").attr("src", "${path}/images/star3.svg");
		$("#total_star").attr("src", "${path}/images/star3.svg");
	}
	if(review == 4){
		$("#review_img").attr("src", "${path}/images/star4.svg");
		$("#total_star").attr("src", "${path}/images/star4.svg");
	}
	if(review == 5){
		$("#review_img").attr("src", "${path}/images/star5.svg");
		$("#total_star").attr("src", "${path}/images/star5.svg");
	}
	
	
})

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
   				<img src="${dto.image }" alt="책 이미지" class="bookimg">
			</div><!-- BP-top_left -->

			<div class="BP-top_right">
				<h2 id="BP-h2">${dto.prodname }</h2>
				
				<div class="book_info">
					<span class="book_author">${dto.content }</span>
				</div>
   
				<div class="book_reviews">
					<span class="book_scores"><img src="" alt="별점" class="star" id="review_img"></span>
					<span class="divi">|</span>
					<img src="${path}/images/리뷰.svg" alt="리뷰" class="review-img">
					<span class="number_of_reviews">회원리뷰: ${score }건</span>
				</div><!-- book_reviews -->
				<form name="form" id="form1" method="post">
				<div class="book_details">
					<div class="price">판매가: 
						<span class="price-of-book"><fmt:formatNumber value="${dto.price }" pattern="#,###,###"/>원</span>
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
						<input type="hidden" name="prodname" value="${dto.prodname}">
						<input type="hidden" name="content" value="${dto.content}">
						<input type="hidden" name="price" value="${dto.price}">
						<input type="hidden" name="image" value="${dto.image}">
						
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
    				<span>${score }명의 보람줄 회원이 평가한 평균별점</span>
	    				
 					<div class="total_book_scores">
 						<img src="" alt="별점" id="total_star">
 						<span style="font-size: 60px;"> ${dto.review }</span> / 5
  					</div><!-- total_book_scores -->
				</div><!-- review_total -->
	
	  			<c:forEach var="row" items="${map.list }">
				<li id="review_list">
    				<div class="searched_books_margin">
    					<div class="searched_books_review">
      						<div class="searched_books_review_title">${row.rename }</div>
      						
	      					<div class="searched_reviewer_info">
        						<span class="member_id">${row.email } </span>
     							<span class="divi"> | </span>
       							<span class="review_date"> <fmt:formatDate value="${row.redate }" pattern="yyyy.MM.dd"/> </span>
        						<span class="divi">|</span>
        						<img src="" alt="별점" class="star" id="gradeimg">
        						<input type="hidden" value="${row.grade }" name="grade" id="grade">
        						<span class="divi">|</span>          
        						<img src="${path }/images/comment.svg" alt="댓글" class="comment-img">
        						<span>${row.comscore }</span>
        						<span class="divi">|</span>
        						<img src="${path }/images/heart.svg" alt="좋아요" class="heart-img">
        						<span>${row.recom }</span>              
	      					</div><!-- searched_reviewer_info -->  
	      					        
	           				<p class="preview" style="display: block;">
	           					${row.recontent }
	           				</p>  
    					</div><!-- searched_books_review -->
	      
	       				<div class="clearBoth"></div>
					</div><!-- searched_books_margin -->      
				</li>
				</c:forEach>
			</div><!-- book_review_wrapper -->
		</ul>
	</div><!-- book_review -->
</div><!-- wrap -->

   <%@ include file="../include/footer.jsp" %>
</body>
</html>