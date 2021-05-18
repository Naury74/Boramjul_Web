<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BORAMJUL-JOINOK</title>
    <%@ include file="../include/include.jsp" %>
    <link rel="stylesheet" href="../css/joinok.css">
</head>
<body>
<div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">회원가입 완료</a>
    <img id="chk" src="../images/checkmark 2.png"></a><br><br>
    <a id="name">회원가입을 축하드립니다<br><br>보람줄과 함께 즐거운 쇼핑 되세요!<br><br>:-D</a><br>
     <button id="btn" type="submit"><a style="color: white;
        font-family: btn;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;"
        href="${path }/member/login.do">로그인하기</a></button><br><br> 
        </div>
</body>
</html>