<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FNQ</title>
     <link rel="stylesheet" href="../css/mypage2.css">
     <%@ include file="../include/include.jsp" %>
</head>
<body>
<div class="wrap">

<%@ include file="../include/header.jsp" %>

    <div class="box">

        <div class="my_line">
            <span id="mypage">고객센터</span>
        </div>
		 <%@ include file="../include/myMenu2.jsp" %>
   
        <div class="menu_name">
            <p>FNQ</p>
        </div>
        <button style="position: absolute; width: 100px; height: 50px; left:1600px; top: 820px; background-color: #664B8E; " type="submit"><a style="color: white;
            font-family: gmarket;
            font-style: normal;
            font-weight: bold;
            font-size: 18px;
            line-height: 21px;
            font-family: mainfont;
            text-decoration:none;"
            href="${path }/faqbutton.do">문의하기</a></button><br><br> 
            <div class="table">
                <table>
                    <tr style="height: 40px; font-family: nanum;">
                        <td colspan="2"></td>
                        <td>제목</td>
                        <td>분류</td>
                        <td>날짜</td>
                        <td>작성자</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td>가입하고싶어요</td>
                        <td>회원가입</td>
                        <td>2021.04.30</td>
                        <td>황동주1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td></td>
                        <td>탈퇴하고싶어요</td>
                        <td>회원가입</td>
                        <td>2021.05.01</td>
                        <td>황동주2</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td></td>
                        <td>구입하고싶어요</td>
                        <td>결제</td>
                        <td>2021.05.02</td>
                        <td>황동주3</td>
                    </tr>
            </table>
            
        </div> <!--table-->

    </div> <!--box-->
   <%@ include file="../include/footer.jsp" %>
</div><!--wrap-->
</body>
</html>