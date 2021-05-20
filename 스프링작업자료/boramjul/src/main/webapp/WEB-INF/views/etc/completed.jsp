<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
	<%@ include file="../include/include.jsp" %>
	<link rel="stylesheet" href="${path }/css/order.css">
</head>
<body>
    <!-- container -->
    <section id="container">
    <%@ include file="../include/header.jsp" %>
        <div class="contents">
                <div class="complete_wrap">
                    <p>주문이 완료 되었습니다.</p>
                    <table>
                        <colgroup>
                            <col style="width: 20%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>주문번호</th>
                                <td>20210605</td>
                            </tr>
                            <tr>
                                <th>주문 접수일</th>
                                <td>2021년12월25일</td>
                            </tr>
                            <tr>
                                <th>수령 예정일</th>
                                <td>2021년12월31일</td>
                            </tr>
                            <tr>
                                <th>결제수단</th>
                                <td>신용카드</td>
                            </tr>                                
                        </tbody>
                    </table>   
                    <div class="btnset">
                        <button type="submit" class="order_search">메인페이지</button>
                        <button type="submit" class="order_search">주문 내역 조회 </button>
                    </div>                     
                </div>
        </div>
        <%@ include file="../include/footer.jsp" %>
    </section>
</body>
</html>