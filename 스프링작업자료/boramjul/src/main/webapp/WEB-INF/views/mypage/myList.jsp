<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 주문 내역</title>
    <link rel="stylesheet" href="${path}/css/mypage.css">
    <%@ include file="../include/include.jsp" %>
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

        <div class="menu_name">
            <p>SHOPPING LIST</p>
        </div>

        <div class="table">
            <table>
                <tr style="height: 40px;">
                    <td></td>
                    <td>책 제목</td>
                    <td>구매 금액/수량</td>
                    <td>주문번호</td>
                    <td>구매날짜</td>
                    <td>배송상태</td>
                    <td>후기</td>
                </tr>
                <c:choose>
                	<c:when test="${map.count == 0 }">
		            	<tr>
		               		<td colspan="7">주문 내역이 아직 없습니다</td>
		               	</tr>
	               	</c:when>

	                <c:otherwise>
	                	<c:forEach var="row" items="${map.list }">
			                <tr>
			                    <td><img src="${row.image}" alt="책 이미지" class="bookimg"></td>
			                    <td>${row.name }</td>
			                    <td><fmt:formatNumber value="${row.price }" pattern="#,###,###"/>원<br>
			                    	<fmt:formatNumber value="${row.quantity }"/>권</td>
			                    <td><fmt:formatNumber value="${row.ordernum }"/></td>
			                    <td><fmt:formatDate value="${row.regdate }" pattern="yyyy.MM.dd"/></td>
			                    <td>상품 준비중</td>
			                    <td><img src="${path}/images/별점4h.svg" alt="별점" class="star"></td>
			                </tr>
		                </c:forEach>
					</c:otherwise>
				</c:choose>
            </table>
            
        </div> <!--table-->

    </div> <!--box-->


    <%@ include file="../include/footer.jsp" %>
 
</div><!--wrap-->

</body>
</html>