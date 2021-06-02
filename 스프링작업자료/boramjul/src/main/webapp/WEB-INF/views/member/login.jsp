<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="${path}/css/login.css">
	<%@ include file="../include/include.jsp" %>
</head>
<script type="text/javascript">
	
	$(function(){
		$('#btn').click(function(){
			
			var email = $('#email').val();
			var passwd = $('#passwd').val();
			var sns = 1;
			
			if (email == ""){
				alert('이메일을 입력하세요.');
				$('#email').focus();
				return false;
			}
			if (passwd == ""){
				alert('비밀번호를 입력하세요.');
				$('#passwd').focus();
				return false;
			}

			document.login.action = "/member/login_check.do";
			document.login.submit();
			
		});
	});

</script>

<body>

<div id="box1">
    <form name="login" method="post">
    <img id="logohead1" src="${path}/images/logo.png" alt="보람줄 로고" ><a id="logohead2">Login</a><br><br>
    <a id=id>이메일</a><br><br>
    <input type="text" name="email" id="email" style="width:500px;
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
                                
    <input type="checkbox" name="loging" style="position: absolute;
                                            width: 15px;
                                            height: 15px;
                                             left: 120px; top:450px;"><a style="position: absolute; left: 150px; top: 452px; font-family: detailfont;
                                                                                font-style: normal; font-weight: bold;
                                                                                ">로그인유지</a><br><br>
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
     
     <a href="${path}/member/findemail.do" id="findid" style="text-decoration:none;">이메일찾기</a>
     <a href="${path}/member/findpwd.do" id="findpwd"style="text-decoration:none;">비밀번호찾기</a>
     <a href="${path}/member/join1.do" id="join" style="text-decoration:none;">회원가입</a>
     <a href="${path}/admin/login.do" id="admin" style="text-decoration:none;">관리자 로그인</a>
     
    </div>
    

	<c:if test="${message == 'error' }">
		<div style="color:red">email 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
	
</body>
</html>