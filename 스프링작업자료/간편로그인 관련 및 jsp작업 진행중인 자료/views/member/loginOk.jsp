<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보람줄 로그인 완료</title>
    <link rel="stylesheet" href="../css/joinok.css">
</head>
<body>

    <div id="box1">
    
    <img id="logohead1" src="../images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">로그인 완료</a>
    <img id="chk" src="../images/checkmark 2.png"><br><br>
    <a id="name">${dto.id }님 로그인을 축하드립니다<br><br>보람줄과 함께 즐거운 쇼핑 되세요!<br><br>:-D</a><br>
     <button id="btn" type="submit"><a style="color: white;
        font-family: btn;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;"
        href="/">메인으로</a></button><br><br> 
        </div>

</body>
</html>