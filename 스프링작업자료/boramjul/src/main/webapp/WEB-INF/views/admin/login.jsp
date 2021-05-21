<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="${path}/css/login.css">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<%@ include file="../include/include.jsp" %>
</head>

<body>

<div id="box1">
    <form name="login" method="post">
    <img id="logohead1" src="${path}/images/logo.png" alt="보람줄 로고" ><a id="logohead2">Login</a><br><br>
    <a id=id>아이디</a><br><br>
    <input type="text" name="id" id="email" style="width:500px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 122px; 
                                top: 280px;"><br><br>
                                
    <a id="pwd">비밀번호</a><br><br>
    <input type="password" name="passwd" id="passwd" style="width:500px;
                                font-size: 20px;
                                border:none;
                                outline:none;
                                border-bottom:3px solid #664B8E;
                                position: absolute;
                                left: 122px; 
                                top: 400px;"><br><br>
                                
   
    <button id="btn" type="submit"><a style="color: white;
                                            font-family: Roboto;
                                            font-style: normal;
                                            font-weight: bold;
                                            font-size: 18px;
                                            line-height: 21px;
                                            font-family: mainfont;
                                            text-decoration:none;"
     								>로그인</a></button><br><br> 
    </form>
        

    

	<c:if test="${message == 'error' }">
		<div style="color:red">email 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>


	<script type="text/javascript">
	
	$(function(){
		$('#btn').click(function(){
			
			var id = $('#email').val();
			var passwd = $('#passwd').val();
			
			if (id == ""){
				alert('아이디를 입력하세요.');
				$('#email').focus();
				return ;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return ;
			}

			document.login.action = "/admin/login_check.do";
			document.login.submit();
			
		});
	});


	</script>
	
</body>
</html>