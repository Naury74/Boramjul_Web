<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 주문 내역</title>
    <link rel="stylesheet" href="${path}/css/mypage.css">
    <%@ include file="../include/include.jsp" %>
<script type="text/javascript">
$(function(){
	var delivery = document.getElementById("delivery").value;
	console.log('배송상태: '+delivery);
	
	if(delivery == '1'){
		delivery = '배송전';
		$('input[name="delivery"]').val(delivery);
	}
	if(delivery == '2'){
		delivery = '배송중';
		$('input[name="delivery"]').val(delivery);
	}
	if(delivery == '3'){
		delivery = '배송 완료';
		$('input[name="delivery"]').val(delivery);
	}
	
	
	
})
</script>
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

        <div class="list_table">
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
			                    <td>${row.prodname }</td>
			                    <td><fmt:formatNumber value="${row.price }" pattern="#,###,###"/>원<br>
			                    	<fmt:formatNumber value="${row.quantity }"/>권</td>
			                    <td><fmt:formatNumber value="${row.detailnum }"/></td>
			                    <td><fmt:formatDate value="${row.indate }" pattern="yyyy.MM.dd"/></td>
			                    <td><input name="delivery" id="delivery" value="<fmt:formatNumber value="${row.delivery }"/>"
			                    	style="border:none;" readonly></td>
			                    <td><fmt:formatNumber value="${row.review }"/>개</td>
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