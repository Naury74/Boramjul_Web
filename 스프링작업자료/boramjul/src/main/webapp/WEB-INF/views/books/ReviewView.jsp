<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 페이지</title>
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
	
		var grade = $('input[name="grade"]').val();
		console.log(grade);
		
		if(grade == 1){
			$("#gradeimg").attr("src", "${path}/images/star1.svg");
		}
		if(grade == 2){
			$("#gradeimg").attr("src", "${path}/images/star2.svg");
		}
		if(grade == 3){
			$("#gradeimg").attr("src", "${path}/images/star3.svg");
		}
		if(grade == 4){
			$("#gradeimg").attr("src", "${path}/images/star4.svg");
		}
		if(grade == 5){
			$("#gradeimg").attr("src", "${path}/images/star5.svg");
		}
	
	})
	
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="dividing_line">
	<h1 id="BP-h1">리뷰 뷰 페이지</h1>
</div>

<div class=wrap>
	<div class="review-view-wrapper">
		<h3 id="review-h3">${dto.rename }</h3>
		
		<div class="clearBoth"></div>
		
		<div class="review-header">
			<div id="review_data_left">
				<span class="member_id">${dto.email }</span>
				<span class="divi"> | </span>   
				<span class="member_id">조회수 ${dto.lookup } </span>
				<span class="divi"> | </span>
				<img src="${path }/images/comment.svg" alt="댓글" class="comment-img"><span> ${dto.comscore }</span>
				<span class="divi"> | </span>
				<span class="review_date"><fmt:formatDate value="${dto.redate }" pattern="yyyy.MM.dd"/></span>
			</div><!-- review_data_left -->
			
			<div id="review_data_right">URL:http://www.boramjul.co.kr/review/146982731</div>
		</div><!-- review-header -->
		
		<div class="clearBoth"></div>

		<div class="reviewed_books_margin">   
			<div><img src="${dto.image }" alt="책 이미지" class="searched_bookimg"></div> 
			<div class="searched_books_info">
				<div class="searched_books_title">${dto.prodname }</div>
				
				<div class="searched_books_info_d">
					<span class="book_author">${dto.content }</span>
				</div><!-- searched_books_info_d -->
				
				<div class="searched_books_price">판매가:
					<span class="price-of-searched-books"><fmt:formatNumber value="${dto.price }" pattern="#,###,###"/>원</span>
				</div><!-- searched_books_price -->
				
				<div class="searched_book_reviews">
					<div class="searched_book_scores">
						<input type="hidden" name="grade" value="${dto.grade }">
						<img src="" alt="평점 이미지" id="gradeimg">
					</div>
					<img src="${path }/images/리뷰.svg" alt="리뷰" class="review-img">
					<span class="number_of_reviews"><a href="${path }/books/BookDetail_review.do?prodnum=${dto.prodnum}">회원리뷰: ${score }건</a></span>
				</div><!-- searched_book_reviews -->
			</div><!-- searched_books_info -->  
			<form name="form" id="form1" method="post">	 
			<div class="btn_searched"> 
				<div class="num">
					<button  class="num_btn" type="button" onclick="Count('m', this);">-</button>
					<input class="num_input" type="text" name="quantity" value="1" readonly="readonly" size="1"/>
					<button class="num_btn" type ="button" onclick="Count('p',this);">+</button> 
				</div>
	
				<div>
					<input type="hidden" name="prodname" value="${dto.prodname }">
					<input type="hidden" name="content" value="${dto.content }">
					<input type="hidden" name="price" value="${dto.price }">
					<input type="hidden" name="image" value="${dto.image }">
					
					<button class="cart_btn" type="submit" formaction="${path}/mypage/cart_insert.do?email=${sessionScope.email}">장바구니 추가</button>
				</div>
				
				<div>
					<button class="buy_btn" type="submit" formaction="${path}/mypage/order_now.do?email=${sessionScope.email}">바로 구매</button>
				</div>
			</form>
			</div><!-- btn_searched -->
			
			<div class="clearBoth"></div>
		</div><!-- reviewed_books_margin -->   
		
		<div class="clearBoth"></div>
		
		<div class="post-content">
			${dto.recontent }
			<div id="like_btn_wrap">
				<button id="like_btn" onClick="location.href='${path}/books/recom_update.do/${dto.renum }/${dto.prodnum }'"><img src="${path }/images/heart.svg" alt="좋아요" class="like-img"><span class="btn__txt">${dto.recom }</span></button>
			</div><!-- like_btn_wrap -->
		</div><!-- post-content -->
		
		<div class="clearBoth"></div>
		
		<div class="post-comment-wrap">
			<div class="comment-group">
				<div id="cmt_1" class="comment-item depth0  head_1" data-depth="0" data-head="1" data-arrange="1">
					<div class="comment-box">
						<div class="comment-top-box">
							<span class="">아이디1</span>
							<span class="divi"> | </span>
							<span class="date-line">2021.04.28 17:13:19</span>
							<span class="divi"></span>    
							<span class="btnset_for_comment">
								<span class="divi"></span>
								<button class="reply-comment_btn" onclick=""><img src="${path }/images/reply.svg" alt="댓글달기" class="reply-img"></button>
							</span><!-- btnset_for_comment -->
						</div><!-- comment-top-box -->	
									
						<div class="comment-content">
							<span class="comment-box">
								<span class="cmt" style="word-break: break-word;">댓글 내용 주르륵</span>
							</span><!-- comment-box -->		
						</div><!-- comment-content -->
					</div><!-- comment-box -->
				</div><!-- comment-item depth0  head_1 -->
				
				<div id="cmt_2" class="comment-item reply-item depth1  head_2" data-depth="1" data-head="2" data-arrange="2">
					<div class="comment-box" style="margin-left:15px">
						<div class="comment-top-box">
							<img src="${path }/images/replyed.svg" alt="댓글달기" class="reply-img">
							<span class="">아이디2</span>
							<span class="divi"> | </span>
							<span class="date-line">2021.04.28 17:13:19</span>
							<span class="divi"></span>    
							<span class="btnset_for_comment">
								<span class="divi"></span>
								<button class="reply-comment_btn" onclick=""><img src="${path }/images/reply.svg" alt="댓글달기" class="reply-img"></button>
							</span><!-- btnset_for_comment -->
						</div><!-- comment-top-box -->

						<div class="reply-comment-content">
							<span class="comment-box">
							<span style="color: rgb(150, 170, 102); margin-right: 5px;">@아이디1</span>
							<span class="cmt" style="word-break: break-word;"> 대댓글</span>
							</span>
						</div><!-- reply-comment-content -->
					</div><!-- comment-box -->
				</div><!-- comment-item reply-item depth1  head_2 -->

				<!-- 댓글 작성 -->
				<div id="comment_write_wrap">
					<textarea name="comment" id="comment-write-box" maxlength="2000" placeholder="Enter your reply" style="display: block; height: 150px;"></textarea>
					<div id="btn-comment-wrap">
						<button id="list-btn" type="button" onClick="location.href='${path}/books/ReviewsList.do'">목록</button>
						<button id="list-btn" type="button" onClick="location.href='${path}/books/Review_update.do?renum=${dto.renum }&prodnum=${dto.prodnum }'">수정</button>
						<button id="list-btn" type="button" onClick="location.href='${path}/books/Review_delete.do?renum=${dto.renum }&prodnum=${dto.prodnum }'">삭제</button>
						<button id="comment-btn" type="submit" accesskey="s" onfocus="$(this).find('span')" onfocusout="$(this).find('span')">댓글 등록</button>
					</div><!-- btn-comment-wrap -->
				</div><!-- comment_write_wrap -->
				
				<div class="clearBoth"></div>
			</div><!-- comment-group -->
		</div><!-- post-comment-wrap -->
	</div><!-- review-view-wrapper -->
</div><!-- wrap -->
</body>
</html>