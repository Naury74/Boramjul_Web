<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
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
            <p>PERSONAL INFORMATION</p>
        </div>

        <div class="menu_line"></div>
		
		<form action="/member/update.do" method="post" accept-charset="UTF-8">
        <div id="info_box">
            <table id="info_table">
                <tr>
                    <td>이메일</td>
                </tr>
                <tr>
                    <td><input type="email" name="email" value="${dto.email}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                </tr>
                <tr>
                    <td><input type="password" name="passwd" ${dto.passwd}></td>
                </tr>
                <tr>
                    <td>이름</td>
                </tr>
                <tr>
                    <td><input type="text" name="name" value="${dto.name}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                </tr>
                <tr>
                    <td><input type="date" name="birth" value="${dto.birth}"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                </tr>
                <tr>
                    <td><input type="tel" name="phone" value="${dto.phone}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                </tr>
                <tr>
                    <td><input type="text" name="address" value="${dto.address}"></td>
                </tr>
                <tr>
                    <td><button id="infoBtn" name="infoBtn" type="submit">수정하기</button></td>
                </tr>
            </table>
        </div><!--info_box-->
        </form>

    </div><!--box-->
    
    <%@ include file="../include/footer.jsp" %>
</div><!--wrap-->

</body>
</html>