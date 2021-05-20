<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
	<%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="../css/mypage2.css">
</head>
<body>
<div class="wrap">
<%@ include file="../include/header.jsp" %>
    <div class="box">

        <div class="my_line">
            <span id="mypage">고객센터</span>
        </div>
<%@ include file="../include/myMenu2.jsp" %>
        <div id="myMenu"></div>

        <div class="menu_name">
            <p>공지사항</p>
        </div>
        <div class="table">
            <table>
                <tr style="height: 40px; font-family: nanum;">
                    <td colspan="2"></td>
                    <td>제목</td>
                    <td>날짜</td>
                    <td>작성자</td>
                    <td>조회</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td></td>
                    <td>가입관련</td>
                    <td>2021.04.30</td>
                    <td>보람줄</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td>탈퇴관련</td>
                    <td>2021.05.01</td>
                    <td>보람줄</td>
                    <td>34</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td></td>
                    <td>구입관련</td>
                    <td>2021.05.02</td>
                    <td>보람줄</td>
                    <td>56</td>
                </tr>
                
            </table>
            
        </div> <!--table-->

    </div> <!--box-->
    <%@ include file="../include/footer.jsp" %>
</div><!--wrap-->
    
</body>
</html>