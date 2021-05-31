<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
	
<script type="text/javascript">

function QnA_write() {
	console.log('등록 click');
	var name = document.form.name.value;
	var content = document.form.content.value;

	if (name.length == 0) {
		alert("제목을 입력하세요.");
		document.form.name.focus();
		return false;	
	}

	document.form.action = "${path}/books/ReivewWrite.do";
}

</script>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="dividing_line">
	<h1 id="BP-h1">리뷰 작성</h1>
</div>

<form name="form" method="post"  accept-charset="UTF-8">
<div class=wrap>
	<div class="write-review-wrapper">
		<div id="searched_reviewing_book">
			<div class="searched-reviewing-book">   
				<div class="searched_books_info">
					<div class="searched_books_title">질서 너머</div>
					
					<div class="searched_books_info_d">
						<span class="book_author">조던 B. 피터슨</span>
					</div><!-- searched_books_info_d -->
					
					<div class="searched_books_price">판매가:
						<span class="price-of-searched-books">14,400원</span>
					</div><!-- searched_books_price -->
					
					<div class="searched_book_reviews">
						<div class="searched_book_scores">
							<img src="${path }/images/별점3.svg" alt="별점" class="star"> 6.0
						</div>         
						 
						<img src="${path }/images/리뷰.svg" alt="리뷰" class="review-img">
						<span class="number_of_reviews">회원리뷰: 2222건</span>
					</div><!-- searched_book_reviews -->
				</div><!-- searched_books_info -->
			</div><!-- searched-reviewing-book -->
			
			<div class="clearBoth"></div>
		</div><!-- searched_reviewing_book --> 
		
		<table class="myrating" cellpadding="0" cellspacing="0">
			<tr>
				<th>
					<span style="padding-right: 5px;">별점:</span> 
				</th>
				<td>
					<img class="star"  src="${path }/images/별점1.svg" style="cursor: pointer;" score="1">
					<img class="star"  src="${path }/images/별점1.svg" style="cursor: pointer;" score="2">
					<img class="star"  src="${path }/images/별점1.svg" style="cursor: pointer;" score="3">
					<img class="star"  src="${path }/images/별점1.svg" style="cursor: pointer;" score="4">
					<img class="star"  src="${path }/images/별점1.svg" style="cursor: pointer;" score="5">
				</td>
			</tr>
		</table><!-- myrating -->
        
		<tbody>
			<tr>
				<td><input type="text" class="write-review-boxT" placeholder="Enter your review title" name="write-review-title" maxlength="50" style="display: block; height: 20px;"></td>
			</tr>
			<tr>
				<td><textarea class="write-review-boxC" placeholder="Enter your review" name="write-review-content" maxlength="10000" style="display: block; height: 800px;"></textarea></td>            
			</tr>
		</tbody>
		
	<div class="clearBoth"></div>
	
	<div><input type="submit" id="post_btn" value="리뷰 등록"></div>
	<div class="clearBoth"></div>
	
	</div><!-- write-review-wrapper -->
</div><!-- wrap --> 
</form>
<%@ include file="../include/footer.jsp" %>     
</body>
</html>