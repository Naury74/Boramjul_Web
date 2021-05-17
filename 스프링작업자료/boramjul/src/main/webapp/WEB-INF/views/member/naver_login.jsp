<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 완료</title>
	<%@ include file="../include/include.jsp" %>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${path}/css/joinok.css">
</head>
<body>

<script type="text/javascript"> //네이버

	var naver_id_login = new naver_id_login("f9pjKfnJGVQBMYEtjztF", "http://localhost:8090/webtest/naver_request.do");

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	var token = naver_id_login.oauthParams.access_token;

	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	
		var email = naver_id_login.getProfileData('email');
		var name = naver_id_login.getProfileData('name');
		var sns = 4;

		$.ajax({
			type: "get",
			data: {name,email,sns},
			url : "/member/login_result.do",
			success : function(data) {
				console.log("naver token :"+token);
			}
		});// ajax()
	}
	
</script> 

<div id="box1">
    
    <img id="logohead1" src="${path}/images/logo.png" alt="보람줄 로고" ><a id="logohead2">Boramjul</a><br><br>
    <a id="main">로그인 완료</a>
    <img id="chk" src="${path}/images/checkmark 2.png"><br><br>
    <a id="name">${dto.name }님 로그인을 축하드립니다<br><br>보람줄과 함께 즐거운 쇼핑 되세요!<br><br>:-D</a><br>
     <button id="btn" type="submit"><a style="color: white;
        font-family: btn;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 21px;
        text-decoration:none;"
        href="/">메인으로</a></button><br><br> 
        </div>

<!-- 네이버 삭제 토큰: 내 도메인주소, 클라이언트아이디, 클라이언트비번, 토큰주소를 url창에 넣고 엔터를 치면 로그인 정보가 삭제됨
https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER -->

</body>
</html>