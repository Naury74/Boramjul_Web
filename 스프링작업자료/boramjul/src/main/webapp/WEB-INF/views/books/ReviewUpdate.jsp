<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
<script type="text/javascript">

$(function(){
	$('#post_btn').click(function(){
		var confirm_val = confirm('수정하시겠습니까?');
		
		if(confirm_val){
			var rename = $('input[name="rename"]').val();
			var recontent = $('textarea[name="recontent"]').val();
			var grade = $('input[name="grade"]').val();
			
			if(rename == ""){
				alert('제목을 입력하세요.');
				$('.write-review-boxT').focus();
				return false;
			}
			if(recontent == ""){
				alert('내용을 입력하세요.');
				$('.write-review-boxC').focus();
				return false;
			}
			if(grade == ""){
				alert('별점을 선택하세요.');
				return false;
			}
			document.form.action = "/books/Review_update_end.do?renum=${dto.renum}&prodnum=${dto.prodnum}";
		}else {
			return false;
		}

	})
	
	$('#star1').click(function(){
		$('input[name="grade"]').val(1);
	})
	$('#star2').click(function(){
		$('input[name="grade"]').val(2);
	})
	$('#star3').click(function(){
		$('input[name="grade"]').val(3);
	})
	$('#star4').click(function(){
		$('input[name="grade"]').val(4);
	})
	$('#star5').click(function(){
		$('input[name="grade"]').val(5);
	})
	
	
	
})


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
					<div class="searched_books_title">${dto.prodname }</div>
					
					<div class="searched_books_info_d">
						<span class="book_author">${dto.content }</span>
					</div><!-- searched_books_info_d -->
					
					<div class="searched_books_price">판매가:
						<span class="price-of-searched-books"><fmt:formatNumber value="${dto.price }" pattern="#,###,###"/>원</span>
					</div><!-- searched_books_price -->
					
					<div class="searched_book_reviews">
						<img src="${dto.image }" alt="책 이미지" class="review-img">
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
					<img class="star"  src="${path }/images/star1.svg" style="cursor: pointer;" id="star1" >
					<img class="star"  src="${path }/images/star1.svg" style="cursor: pointer;" id="star2">
					<img class="star"  src="${path }/images/star1.svg" style="cursor: pointer;" id="star3">
					<img class="star"  src="${path }/images/star1.svg" style="cursor: pointer;" id="star4">
					<img class="star"  src="${path }/images/star1.svg" style="cursor: pointer;" id="star5">
					/ <input type="text" value="" name="grade" style="border:none; readonly">점
				</td>
			</tr>
		</table><!-- myrating -->
        
		<tbody>
			<tr>
				<td><input type="text" class="write-review-boxT" placeholder="Enter your review title" name="rename" maxlength="50" style="display: block; height: 20px;" value="${dto.rename }"></td>
			</tr>
			<tr>
				<td><textarea class="write-review-boxC" placeholder="Enter your review" name="recontent" maxlength="10000" style="display: block; height: 800px;">${dto.recontent }</textarea></td>            
			</tr>
		</tbody>
		
	<div class="clearBoth"></div>
	
	<input type="hidden" name="email" value="${sessionScope.email}">
	
	<div><input type="submit" id="post_btn" value="리뷰 수정"></div>
	<div class="clearBoth"></div>
	
	</div><!-- write-review-wrapper -->
</div><!-- wrap --> 
</form>
<%@ include file="../include/footer.jsp" %>     
</body>
</html>