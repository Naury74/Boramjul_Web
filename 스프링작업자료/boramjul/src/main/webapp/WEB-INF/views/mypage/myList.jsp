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
                    <td colspan="2"></td>
                    <td>책 제목</td>
                    <td>판매가/수량</td>
                    <td>구매날짜</td>
                    <td>배송상태</td>
                    <td>후기</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                    <td>아몽드</td>
                    <td>12000원<br>1권</td>
                    <td>2021.04.23</td>
                    <td>상품 준비중</td>
                    <td><img src="${path}/images/별점4h.svg" alt="별점" class="star"></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                    <td>아몬드</td>
                    <td>12000원<br>1권</td>
                    <td>1992.12.29</td>
                    <td>배송중</td>
                    <td><img src="${path}/images/별점1.svg" alt="별점" class="star"></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                    <td>아몬드봉봉</td>
                    <td>12000원<br>1권</td>
                    <td>2021.04.22</td>
                    <td>배송완료</td>
                    <td><button class="reviewBtn" name="reviewBtn" type="submit">후기작성</button></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><img src="${path}/images/아몬드.jpg" alt="책 이미지" class="bookimg"></td>
                    <td>아몬드봉봉</td>
                    <td>12000원<br>1권</td>
                    <td>2021.04.22</td>
                    <td>배송중</td>
                    <td><button class="reviewBtn">후기작성</button></td>
                </tr>

            </table>
            
        </div> <!--table-->

    </div> <!--box-->


    <%@ include file="../include/footer.jsp" %>
 
</div><!--wrap-->

</body>
</html>