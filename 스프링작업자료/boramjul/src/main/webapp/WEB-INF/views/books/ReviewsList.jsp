<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
	<link rel="stylesheet" href="${path}/css/PagesForBooks.css">
	<%@ include file="../include/include.jsp" %>
<script type="text/javascript">


$(function(){
	
	var grade = $('input[name="grade"]').val();
	var sel_index = 0;
	$('input[name="grade"]').click(function() {
		alert($(this).parent().parent().parent().parent().index()  );
		sel_index = $(this).parent().parent().parent().parent().index();
		
		console.log('index... : '+ sel_index);
		console.log('item... : '+ $('#related_books>div').eq(sel_index).attr('id')  );
		sel_item =  $('#related_books>div').eq(sel_index).attr('id');
		
	});
	
	console.log('index: '+sel_index);
	//console.log('name: '+  $('#searched_review_margin').eq(sel_index).attr('id').index()  );
	
	//var grade = '';
	console.log('grade: '+grade);
	
	if(grade == 1){
		$("#grade").attr("src", "${path}/images/star1.svg");
	}
	if(grade == 2){
		$("#grade").attr("src", "${path}/images/star2.svg");
	}
	if(grade == 3){
		$("#grade").attr("src", "${path}/images/star3.svg");
	}
	if(grade == 4){
		$("#grade").attr("src", "${path}/images/star4.svg");
	}
	if(grade == 5){
		$("#grade").attr("src","${path}/images/star5.svg");
	}
	
	
	
	
	
	
	
	
})

</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="dividing_line">
	<h1 id="BP-h1">리뷰</h1>
</div><!-- dividing_line -->

<div class=wrap>
	<div class="List-wrapper"> 
		<%@ include file="../include/booksmenu.jsp" %>
		
		<div class="List-right">
			<div id="related_books">
				<!-- 리뷰 1 -->
				<c:forEach var="row" items="${map.review }">
				
				<div id="searched_review_margin">   
					<div><img src="${row.image }" alt="책 이미지" class="searched_bookimg"></div>
					
					<div id="searched_books_review">
						<div id="searched_books_review_title">
							<a href="${path }/books/review_detail.do/${row.renum}/${row.prodnum}">${row.rename }</a>
						</div><!-- searched_books_review_title -->
						<div class="searched_reviewer_info">
							<div id="searched_books_title_for_review">${row.content }</div>
							<span class="member_id">${row.email } </span>
							<span class="divi"> | </span>
							<span class="review_date"><fmt:formatDate value="${row.redate }" pattern="yyyy.MM.dd"/></span>
							<span class="divi">|</span>
							<span>
								<img src="" alt="평점 이미지" id="grade">
								<input type="text" name="grade" id='grade' value="${row.grade }">
							</span>
							<span class="divi">|</span>          
							<img src="../images/comment.svg" alt="댓글" class="comment-img">
							<span>${row.comscore }</span>
							<span class="divi">|</span>
							<img src="../images/heart.svg" alt="좋아요" class="heart-img">
							<span>${row.recom }</span>
						</div><!-- searched_reviewer_info -->
						     
						<p class="preview" style="display: block;">
							${row.recontent }
						</p>  
					</div><!-- searched_books_review -->
					
					<div class="clearBoth"></div>
					<div class="clearBoth"></div>
				</div><!-- searched_review_margin -->
				</c:forEach>
			</div><!-- related_books -->
		<div class="clearBoth"></div>
		</div><!-- List-right -->
	</div><!-- List-wrapper -->
</div><!-- wrap -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>