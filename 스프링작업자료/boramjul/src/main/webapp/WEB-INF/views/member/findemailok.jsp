<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BORAMJUL-FINDOK</title>
    <link rel="stylesheet" href="../css/findemailok.css">
    <%@ include file="../include/include.jsp" %>
</head>
<body>
<div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">이메일 찾기</a>
    <a id="name">찾으신 이메일은<br><br>${dto.email}<br><br>입니다.</a><br>
     <button id="btn" type="submit"><a style="color: white;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;"
        href="${path}/member/login.do">로그인하기</a></button><br><br> 
    <button id="btn2" type="submit"><a style="color: white;
            font-family: Roboto;
            font-style: normal;
            font-weight: bold;
            font-size: 18px;
            line-height: 21px;
            text-decoration:none;"
            href="${path}/member/findpwd.do">비밀번호 찾기</a></button><br><br> 
        </div>
</body>
</html>