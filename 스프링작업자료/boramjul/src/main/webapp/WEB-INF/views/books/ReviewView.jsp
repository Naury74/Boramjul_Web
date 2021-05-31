<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 페이지</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
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
			<div><img src="${path }/images/rules.jpg" alt="책 이미지" class="searched_bookimg"></div> 
			<div class="searched_books_info">
				<div class="searched_books_title">질서 너머</div>
				
				<div class="searched_books_info_d">
					<span class="book_author">조던 B. 피터슨</span>
				</div><!-- searched_books_info_d -->
				
				<div class="searched_books_price">판매가:
					<span class="price-of-searched-books">14,400원</span>
				</div><!-- searched_books_price -->
				
				<div class="searched_book_reviews">
					<div class="searched_book_scores"><img src="${path }/images/별점4h.svg" alt="별점" class="star"> 9.1</div>          
					<img src="${path }/images/리뷰.svg" alt="리뷰" class="review-img">
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
		</div><!-- reviewed_books_margin -->   
		
		<div class="clearBoth"></div>
		
		<div class="post-content">
			리뷰내용 주르륵
			<div id="like_btn_wrap">
				<button id="like_btn"><img src="${path }/images/heart.svg" alt="좋아요" class="like-img"><span class="btn__txt"> 좋아요 606</span></button>
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
								<button class="thumbs-up_btn"><img src="${path }/images/thumbs-up.svg" alt="추천" class="thumbs-up-img"></button>
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
								<button class="thumbs-up_btn"><img src="${path }/images/thumbs-up.svg" alt="추천" class="thumbs-up-img"></button>
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
						<button id="list-btn" type="submit" accesskey="s" onfocus="$(this).find('span')" onfocusout="$(this).find('span')">목록</button>
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