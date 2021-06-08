<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="${path}/css/mypage.css">
</head>

<body>

<div class="wrap">

    <%@ include file="../include/header.jsp" %>

    <div class="box">
        <div class="my_line">
            <span id="mypage">My page</span>
            <span id="mypage2">${sessionScope.name}님의 마이페이지 입니다.</span>
        </div>

        <%@ include file="../include/myMenu.jsp" %>

        <div class="tabs">
            
            <div class="menu_name">
                <p>MY REVIEW</p>
            </div>
            
            <section id="content1">
                <div class="table">
                    <table id="table_list">
                        <tr style="height: 40px;">
                            <td colspan="2"></td>
                            <td>책 제목</td>
                            <td>글 제목</td>
                            <td>별점</td>
                            <td>작성일시</td>
                        </tr>
                        <c:forEach var="row" items="${map.list }">
                    	<c:set var="i" value="${i+1 }"/>
                    	<div id="list">
	                        <tr>
	                            <td>${i }<input type="hidden" value="${row.renum }" name="renum"></td>
	                            <td><img src="${row.image }" alt="책 이미지" class="bookimg"></td>
	                            <td><a href="${path }/books/BookDetail_review.do?prodnum=${row.prodnum}">${row.prodname }</a></td>
	                            <td><a href="${path }/books/review_detail.do?renum=${row.renum}&prodnum=${row.prodnum}">${row.rename }</a> </td>
	                            <c:choose>
	                            <c:when test="${row.grade == '1'}">
	                            <td>
	                           		<img src="${path}/images/star1.svg" alt="별점" id="gradeimg" class="star">
	                           		<input type="hidden" value="${row.grade }" id="grade" name="grade">
	                            </td>
	                            </c:when>
	                            <c:when test="${row.grade == '2'}">
	                            <td>
	                           		<img src="${path}/images/star2.svg" alt="별점" id="gradeimg" class="star">
	                           		<input type="hidden" value="${row.grade }" id="grade" name="grade">
	                            </td>
	                            </c:when>
	                             <c:when test="${row.grade == '3'}">
	                            <td>
	                           		<img src="${path}/images/star3.svg" alt="별점" id="gradeimg" class="star">
	                           		<input type="hidden" value="${row.grade }" id="grade" name="grade">
	                            </td>
	                            </c:when>
	                            <c:when test="${row.grade == '4'}">
	                            <td>
	                           		<img src="${path}/images/star4.svg" alt="별점" id="gradeimg" class="star">
	                           		<input type="hidden" value="${row.grade }" id="grade" name="grade">
	                            </td>
	                            </c:when>
	                            <c:when test="${row.grade == '5'}">
	                            <td>
	                           		<img src="${path}/images/star5.svg" alt="별점" id="gradeimg" class="star">
	                           		<input type="hidden" value="${row.grade }" id="grade" name="grade">
	                            </td>
	                            </c:when>
	                            </c:choose>
	                            <td><fmt:formatDate value="${row.redate }" pattern="yyyy.MM.dd"/></td>
	                        </tr>
                        </div>
                        </c:forEach>
                    </table>
                </div><!--table-->
            </section>
        </div><!--tabs-->

    </div><!--box-->

    <%@ include file="../include/footer.jsp" %>

</div><!--wrap-->

</body>
</html>